package com.bigpoint.zoomumba.controller.user.timing
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieType;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ShowAnniversaryEndScreenCommand extends SimpleCommand
   {
      public function ShowAnniversaryEndScreenCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc3_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         if(!_loc2_.isEventActive(EventTypes.ANNIVERSARY_WHOLE_EVENT))
         {
            if(!_loc3_.getCookie(AppCookieType.ANNIVERSARY_END_3))
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.anniversary.endInfo.title"),TextResourceModule.getText("zoo.event.anniversary.endInfo.step.3"))));
               _loc3_.setCookie(AppCookieType.ANNIVERSARY_END_3,1);
               return;
            }
         }
         if(_loc3_.getCookie(AppCookieType.ANNIVERSARY_END_3))
         {
            return;
         }
         if(!_loc2_.isEventActive(EventTypes.ANNIVERSARY_BALLON_EVENT))
         {
            if(!_loc3_.getCookie(AppCookieType.ANNIVERSARY_END_2))
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.anniversary.endInfo.title"),TextResourceModule.getText("zoo.event.anniversary.endInfo.step.2"))));
               _loc3_.setCookie(AppCookieType.ANNIVERSARY_END_2,1);
               return;
            }
         }
         if(_loc3_.getCookie(AppCookieType.ANNIVERSARY_END_2))
         {
            return;
         }
         if(!_loc2_.isEventActive(EventTypes.ANNIVERSARY_CAKE_EVENT))
         {
            if(!_loc3_.getCookie(AppCookieType.ANNIVERSARY_END_1))
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.anniversary.endInfo.title"),TextResourceModule.getText("zoo.event.anniversary.endInfo.step.1"))));
               _loc3_.setCookie(AppCookieType.ANNIVERSARY_END_1,1);
               return;
            }
         }
      }
   }
}

