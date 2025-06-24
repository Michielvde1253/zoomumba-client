package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AppModeChangeCommand extends SimpleCommand
   {
      public function AppModeChangeCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         _loc2_.currentAppMode = param1.getBody() as String;
      }
   }
}

