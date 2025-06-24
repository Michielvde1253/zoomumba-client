package com.bigpoint.zoomumba.model.net2
{
   import com.adobe.serialization.json.JSON;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.controller.net2.NetCommand;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.net2.vo.CallBackStack;
   import com.bigpoint.zoomumba.model.net2.vo.CallstackVO;
   import com.bigpoint.zoomumba.model.net2.vo.JSONRequestVO;
   import com.bigpoint.zoomumba.model.net2.vo.NetCONFIG;
   import com.bigpoint.zoomumba.model.net2.vo.NetCallBackVO;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.FileHashmap;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class NetProxy extends Proxy
   {
      public static const NAME:String = "NetProxy";
      
      private var appConfigProxy:AppConfigProxy;
      
      private var userProxy:UserProxy;
      
      private var config:NetCONFIG;
      
      private var stack:CallstackVO;
      
      private var inProgressStack:CallstackVO;
      
      private var _pushInterval:int;
      
      private var _fiaMaxTime:int;
      
      private var _fiaMaxActions:int;
      
      private var lastPush:int = 0;
      
      private var _lastParsedResponse:int = 0;
      
      private var _currentRequestId:int = 0;
      
      private var pushEnabled:Boolean = false;
      
      private var cvCall:Boolean = true;
      
      private var configCall:Boolean = false;
      
      private var callBackStack:CallBackStack;
      
      private var callbackHistory:Dictionary = new Dictionary();
      
      public function NetProxy()
      {
         super(NAME);
      }
      
      public function enablePush() : void
      {
         this.pushEnabled = true;
      }
      
      override public function onRegister() : void
      {
         this.config = new NetCONFIG();
         this.appConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.init();
      }
      
      private function init() : void
      {
         var name:String = null;
         var xml:XML = describeType(NET);
         for each(name in xml.constant.(@type == "String").@name)
         {
            facade.registerCommand(NET[name],NetCommand);
         }
         this.lastPush = TimeManager.currentTime - 10;
         TimeManager.registerTickFunction(this.flushStack);
      }
      
      private function flushStack() : void
      {
         if(TimeManager.currentTime >= this.lastPush + this.pushInterval && this.pushEnabled)
         {
            this.lastPush = TimeManager.currentTime;
            sendNotification(NET.PUSH);
         }
         if(this.stack)
         {
            if(TimeManager.currentTime >= this.stack.createdAt + this.fiaMaxTime)
            {
               this.flush();
            }
         }
      }
      
      public function debugPush() : void
      {
         if(Settings.DEBUG_MODE || this.userProxy.userMode == MainConstants.ACCOUNT_MODE_ADMIMN)
         {
            this.lastPush = TimeManager.currentTime;
            sendNotification(NET.SHOP_ITEMS_GET);
            sendNotification(NET.PUSH);
         }
      }
      
      public function callConfigAndStoreDataPush() : void
      {
         this.lastPush = TimeManager.currentTime;
         sendNotification(NET.SHOP_ITEMS_GET);
         sendNotification(NET.PUSH);
      }
      
      public function callConfigStoreDataPush() : void
      {
         sendNotification(NET.SHOP_ITEMS_GET);
      }
      
      public function addRequest(param1:JSONRequestVO) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(!this.stack)
         {
            this.stack = new CallstackVO();
            _loc3_ = Settings.USER_ID;
            _loc4_ = Settings.TOKEN;
            _loc5_ = TempGetterProxy.getSessionID();
            if(_loc4_)
            {
               _loc2_ = "uId=" + _loc3_ + "&tok=" + _loc4_;
            }
            else
            {
               _loc2_ = "uId=" + _loc3_;
            }
            if(_loc5_)
            {
               _loc2_ += "&sid=" + _loc5_;
            }
            if(Settings.SECOND_TOKEN)
            {
               _loc2_ += "&secTok=" + Settings.SECOND_TOKEN;
            }
            if(Settings.isLocal)
            {
               _loc2_ += "&locale=" + Settings.LANGUAGE;
            }
            _loc6_ = Settings.httpProtocolString + this.appConfigProxy.api_host + "/" + MainConfig.API_NAME + "?" + _loc2_;
            this.stack.urlRequest.url = _loc6_;
         }
         this.stack.addRequest(param1);
         if(this.callBackStack)
         {
            if(this.callBackStack.rqId == -1)
            {
               this.callBackStack.rqId = this.currentRequestId;
               this.callbackHistory[this.currentRequestId] = this.callBackStack;
            }
         }
         if(this.stack.flushNow)
         {
            this.flush();
         }
      }
      
      public function flush() : void
      {
         if(this.stack)
         {
            if(!this.stack.flushed)
            {
               if(this.inProgressStack)
               {
                  return;
               }
               this.inProgressStack = this.stack;
               this.inProgressStack.urlLoader.addEventListener(Event.COMPLETE,this.handleRequestResponse);
               this.inProgressStack.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.handleRequestError);
               this.inProgressStack.urlLoader.addEventListener(IOErrorEvent.NETWORK_ERROR,this.handleRequestError);
               this.inProgressStack.urlLoader.addEventListener(IOErrorEvent.VERIFY_ERROR,this.handleRequestError);
               this.inProgressStack.flush();
               sendNotification(ADMIN.LOG_NET_COMMAND,"-------FLUSH\n");
               this.stack = null;
            }
         }
      }
      
      private function handleRequestError(param1:IOErrorEvent) : void
      {
      }
      
      public function handleRequestResponse(param1:Event) : void
      {
         var responseData:String;
         var sentData:String;
         var response:Object = null;
         var responseId:String = null;
         var responseIdCallback:String = null;
         var event:Event = param1;
         this.inProgressStack.urlLoader.removeEventListener(Event.COMPLETE,this.handleRequestResponse);
         responseData = this.inProgressStack.urlLoader.data;
         sentData = unescape(this.inProgressStack.urlVars.toString());
         this.inProgressStack = null;
         try
         {
            response = com.adobe.serialization.json.JSON.decode(responseData);
         }
         catch(error:Error)
         {
            return;
         }
         if(this.cvCall)
         {
            FileHashmap.cvList = response.obj.cv;
            sendNotification(Note.PARSE_CV_TAGS,response.obj.cv);
            this.cvCall = false;
         }
         else
         {
            for(responseId in response.callstack)
            {
               this.lastParsedResponse = int(responseId);
               sendNotification(Note.COMMAND_ID_RESPONSE,this.lastParsedResponse);
            }
            sendNotification(Note.JSON_RESPONSE_RECEIVED,response.obj);
            sendNotification(Note.JSON_SERVER_ERROR,response.callstack);
            for(responseIdCallback in response.callstack)
            {
               if(this.callbackHistory[responseIdCallback])
               {
                  this.runCallbackStack(response.obj,response.callstack);
               }
            }
         }
         this.checkForFlush();
      }
      
      private function checkForFlush() : void
      {
         if(this.stack)
         {
            if(this.stack.flushNow)
            {
               this.flush();
            }
         }
      }
      
      public function set pushInterval(param1:int) : void
      {
         this._pushInterval = param1;
      }
      
      public function set fiaMaxTime(param1:int) : void
      {
         this._fiaMaxTime = param1;
      }
      
      public function set fiaMaxActions(param1:int) : void
      {
         this._fiaMaxActions = param1;
      }
      
      public function set lastParsedResponse(param1:int) : void
      {
         this._lastParsedResponse = param1;
      }
      
      public function get pushInterval() : int
      {
         return this._pushInterval;
      }
      
      public function get fiaMaxTime() : int
      {
         return this._fiaMaxTime;
      }
      
      public function get fiaMaxActions() : int
      {
         return this._fiaMaxActions;
      }
      
      public function get lastParsedResponse() : int
      {
         return this._lastParsedResponse;
      }
      
      public function get nextRequestId() : int
      {
         ++this._currentRequestId;
         return this._currentRequestId;
      }
      
      public function get currentRequestId() : int
      {
         return this._currentRequestId;
      }
      
      public function callServer(param1:String, param2:Array) : NetProxy
      {
         this.callBackStack = new CallBackStack();
         this.callBackStack.netName = param1;
         this.callBackStack.netBody = param2;
         return this;
      }
      
      public function addCallback(param1:String, param2:Object = null, param3:int = -1) : NetProxy
      {
         if(!this.callBackStack)
         {
            return this;
         }
         if(param3 != -1)
         {
            this.callBackStack.checkForValid = true;
         }
         this.callBackStack.stack.push(new NetCallBackVO(param1,param2,param3));
         return this;
      }
      
      public function addCallbackIfTrue(param1:String, param2:Object = null) : NetProxy
      {
         return this.addCallback(param1,param2,1);
      }
      
      public function addCallbackIfFalse(param1:String, param2:Object = null) : NetProxy
      {
         return this.addCallback(param1,param2,0);
      }
      
      public function sendNow() : void
      {
         sendNotification(this.callBackStack.netName,this.callBackStack.netBody);
      }
      
      private function runCallbackStack(param1:Object, param2:Object) : void
      {
         var valid:int;
         var i:int = 0;
         var data:Object = param1;
         var validObj:Object = param2;
         this.callBackStack = this.callbackHistory[this.lastParsedResponse];
         valid = -1;
         if(this.callBackStack)
         {
            try
            {
               if(this.callBackStack.checkForValid)
               {
                  valid = int(validObj[this.callBackStack.rqId]["0"]["t"]);
               }
            }
            catch(e:Error)
            {
            }
            if(this.callBackStack.stack)
            {
               i = 0;
               while(i < this.callBackStack.stack.length)
               {
                  if(this.callBackStack.stack[i].noteBody == null && this.callBackStack.stack[i].valid == valid)
                  {
                     sendNotification(this.callBackStack.stack[i].noteName,data);
                  }
                  else if(this.callBackStack.stack[i].valid == valid)
                  {
                     sendNotification(this.callBackStack.stack[i].noteName,this.callBackStack.stack[i].noteBody);
                  }
                  i++;
               }
            }
         }
         delete this.callbackHistory[this.lastParsedResponse];
      }
   }
}

