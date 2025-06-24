package com.bigpoint.zoomumba.model.news
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieType;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.news.vo.NewsVO;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class NewsProxy extends Proxy
   {
      public static const NAME:String = "NewsProxy";
      
      public static const MSG_TYPE_WELCOME_BACK:String = "welcomeBack";
      
      public static const MSG_TYPE_HELLO:String = "hello";
      
      private var cookieProxy:AppCookieProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var appProxy:AppProxy;
      
      private var userProxy:UserProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _initialized:Boolean = false;
      
      private var _triggerShow:Boolean = false;
      
      private var _hasBeenShown:Boolean = false;
      
      private var _hasBeenCircusShown:Boolean = false;
      
      private var _hasBeenBreedingShown:Boolean = false;
      
      public function NewsProxy()
      {
         super(NAME,new NewsVO());
      }
      
      private function get newsVO() : NewsVO
      {
         return data as NewsVO;
      }
      
      private function get nextTimeToShowNews() : int
      {
         return TimeManager.currentTime + TimeManager.SECONDS_IN_HOUR * 8;
      }
      
      private function get shows() : Boolean
      {
         var _loc1_:int = this.cookieProxy.getCookie(AppCookieType.NEWS_NEXT_SHOW);
         return this.userProxy.addedEntranceFee >= 0 && _loc1_ < TimeManager.currentTime || !this._hasBeenShown;
      }
      
      public function get cardHolderData() : Vector.<Object>
      {
         return this.newsVO.cardGroupHolderData;
      }
      
      public function get tabs() : Vector.<int>
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<int> = new Vector.<int>();
         for each(_loc2_ in this.newsVO.tabs)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function parseData(param1:Object) : void
      {
         var _loc2_:Object = null;
         ObjectHelper.copyData(this.newsVO,param1);
         if(this.itemConfigProxy == null)
         {
            this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         this.newsVO.cardGroupHolderData = new Vector.<Object>();
         for each(_loc2_ in this.newsVO.items)
         {
            this.newsVO.cardGroupHolderData.push(this.itemConfigProxy.getShopDataByCategory(_loc2_.id,Categories.getCategoryIdFromName(_loc2_.type)));
         }
         this._initialized = true;
         if(this._triggerShow)
         {
            this.checkForShow();
         }
      }
      
      private function checkForRunningEvent() : Boolean
      {
         var _loc2_:Vector.<WindowVars> = null;
         var _loc3_:WindowVars = null;
         var _loc1_:GlobalEventProxy = super.facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc1_)
         {
            if(this._triggerShow)
            {
               this._triggerShow = false;
            }
            _loc2_ = new Vector.<WindowVars>();
            if(_loc1_.isEventActive(EventTypes.ADV_BREEDING_EVENT) && this._hasBeenBreedingShown == false)
            {
               this._hasBeenBreedingShown = true;
               _loc2_.push(new WindowVars(WindowTypes.ADVANCED_BREEDING_NEWS_WINDOW));
            }
            if(_loc1_.isEventActive(EventTypes.CIRCUS_EVENT) && this._hasBeenCircusShown == false)
            {
               this._hasBeenCircusShown = true;
               _loc2_.push(new WindowVars(WindowTypes.CIRCUS_NEWS_WINDOW));
            }
            if(!_loc2_ || _loc2_.length == 0)
            {
               return false;
            }
            if(this.appProxy.currentAppMode != AppMode.TUTORIAL && this.shows)
            {
               this.cookieProxy.setCookie(AppCookieType.NEWS_NEXT_SHOW,this.nextTimeToShowNews);
               for each(_loc3_ in _loc2_)
               {
                  sendNotification(WinNote.OPEN_WINDOW,_loc3_);
               }
            }
            return true;
         }
         return true;
      }
      
      override public function onRegister() : void
      {
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.cookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
      }
      
      public function checkForShow() : void
      {
         if(!this.checkForRunningEvent())
         {
            this.checkForRunningEvent();
         }
         if(this._initialized)
         {
            this._triggerShow = false;
            if(this.appProxy.currentAppMode != AppMode.TUTORIAL && this.shows)
            {
               this.cookieProxy.setCookie(AppCookieType.NEWS_NEXT_SHOW,this.nextTimeToShowNews);
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NEWS_WINDOW,"",MSG_TYPE_WELCOME_BACK));
               this._hasBeenShown = true;
            }
         }
         else
         {
            this._triggerShow = true;
         }
      }
      
      public function getBubbleText(param1:String = "hello") : Object
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case MSG_TYPE_WELCOME_BACK:
               _loc2_ = TextResourceModule.getText("zoo.news.text.welcome.login");
               break;
            case MSG_TYPE_HELLO:
               _loc2_ = TextResourceModule.getText("zoo.news.text.welcome.general");
         }
         var _loc3_:String = "%username%";
         var _loc4_:int = int(_loc2_.indexOf(_loc3_));
         var _loc5_:String = "<br>";
         var _loc6_:int = int(_loc2_.indexOf(_loc5_));
         var _loc7_:String = _loc2_.substring(0,_loc4_);
         var _loc8_:String = _loc2_.substr(_loc4_,_loc3_.length + 1);
         _loc8_ = _loc8_.replace(_loc3_,this.userProxy.userName);
         var _loc9_:String = _loc2_.substring(_loc6_ + _loc5_.length);
         return {
            "line1":_loc7_,
            "line2":_loc8_,
            "line3":_loc9_
         };
      }
      
      public function getVisitorValueText(param1:String = "hello") : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         switch(param1)
         {
            case MSG_TYPE_WELCOME_BACK:
               _loc2_ = this.userProxy.addedEntranceFee * 50 / 35;
               _loc3_ = StringHelper.numberFormater(_loc2_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
               break;
            case MSG_TYPE_HELLO:
               _loc2_ = 0;
               _loc3_ = StringHelper.numberFormater(_loc2_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR))) + "/h";
         }
         return _loc3_;
      }
      
      public function getVisitorValueToolTip(param1:String = "hello") : String
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(param1)
         {
            case MSG_TYPE_WELCOME_BACK:
               _loc2_ = this.userProxy.addedEntranceFee * 50 / 35;
               _loc3_ = TextResourceModule.getTextReplaced("zoo.tooltip.news.visitors.login",Vector.<TextReplace>([new TextReplace("%visitorsAbsence%",_loc2_.toString())]));
               break;
            case MSG_TYPE_HELLO:
               _loc2_ = 0;
               _loc3_ = TextResourceModule.getTextReplaced("zoo.tooltip.news.visitors.general",Vector.<TextReplace>([new TextReplace("%CurrentVisitorsPerHour%",_loc2_.toString())]));
         }
         return _loc3_;
      }
      
      public function getMoneyValue(param1:String = "hello") : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case MSG_TYPE_WELCOME_BACK:
               _loc2_ = this.userProxy.addedEntranceFee;
               break;
            case MSG_TYPE_HELLO:
               _loc2_ = this.userProxy.entranceFee;
         }
         return _loc2_;
      }
      
      public function getMoneyValueToolTip(param1:String = "hello") : String
      {
         return TextResourceModule.getTextReplaced("zoo.tooltip.news.money",Vector.<TextReplace>([new TextReplace("%waitingPP%",this.getMoneyValue(param1).toString())]));
      }
   }
}

