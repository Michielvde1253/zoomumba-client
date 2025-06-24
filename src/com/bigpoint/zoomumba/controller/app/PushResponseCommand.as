package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieType;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class PushResponseCommand extends SimpleCommand
   {
      public function PushResponseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.checkHappyHour();
         this.checkDoubleXpEvent();
         this.checkTripleXpEvent();
         this.checkNowInShopEvent();
      }
      
      private function checkNowInShopEvent() : void
      {
         var _loc1_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc2_.isEventActive(EventTypes.NOW_IN_SHOP_EVENT) && !_loc1_.getCookie(AppCookieType.NOW_IN_SHOP))
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NOW_IN_SHOP));
            _loc1_.setCookie(AppCookieType.NOW_IN_SHOP,TimeManager.currentTime);
         }
      }
      
      private function checkHappyHour() : void
      {
         var _loc1_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc2_.isEventActive(EventTypes.HAPPY_HOUR_EVENT) && !_loc1_.getCookie(AppCookieType.HAPPY_HOUR))
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.HAPPY_HOUR_WINDOW));
            _loc1_.setCookie(AppCookieType.HAPPY_HOUR,TimeManager.currentTime);
         }
      }
      
      private function checkDoubleXpEvent() : void
      {
         var _loc1_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc2_.isEventActive(EventTypes.DOUBLE_XP_EVENT) && !_loc1_.getCookie(AppCookieType.DOUBLE_XP_EVENT))
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.DOUBLE_XP_WINDOW));
            _loc1_.setCookie(AppCookieType.DOUBLE_XP_EVENT,TimeManager.currentTime);
         }
      }
      
      private function checkTripleXpEvent() : void
      {
         var _loc1_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc2_.isEventActive(EventTypes.TRIPLE_XP_EVENT) && !_loc1_.getCookie(AppCookieType.TRIPLE_XP_EVENT))
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.TRIPLE_XP_WINDOW));
            _loc1_.setCookie(AppCookieType.TRIPLE_XP_EVENT,TimeManager.currentTime);
         }
      }
   }
}

