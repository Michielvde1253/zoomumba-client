package com.bigpoint.zoomumba.model.net2.vo
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class CallstackVO
   {
      public var urlLoader:URLLoader;
      
      public var urlRequest:URLRequest;
      
      public var urlVars:URLVariables;
      
      public var callstack:Vector.<JSONRequestVO>;
      
      public var flushed:Boolean = false;
      
      public var flushNow:Boolean = false;
      
      public var createdAt:int;
      
      public function CallstackVO()
      {
         super();
         this.callstack = new Vector.<JSONRequestVO>();
         this.urlLoader = new URLLoader();
         this.urlRequest = new URLRequest();
         this.urlRequest.method = URLRequestMethod.POST;
         this.createdAt = TimeManager.currentTime;
      }
      
      public function addRequest(param1:JSONRequestVO) : void
      {
         this.callstack.push(param1);
         if(param1.flush)
         {
            this.flushNow = true;
         }
      }
      
      public function flush() : void
      {
         this.preComposePOSTData();
         this.urlLoader.load(this.urlRequest);
         this.flushed = true;
      }
      
      private function preComposePOSTData() : void
      {
         this.urlVars = new URLVariables();
         var _loc1_:String = "{\"callstack\":[";
         var _loc2_:String = "]}";
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < this.callstack.length)
         {
            if(_loc4_ < this.callstack.length - 1)
            {
               _loc3_ += this.callstack[_loc4_].postParams + ",";
            }
            else
            {
               _loc3_ += this.callstack[_loc4_].postParams;
            }
            _loc4_++;
         }
         this.urlVars.json = _loc1_ + _loc3_ + _loc2_;
         this.urlRequest.data = this.urlVars;
      }
   }
}

