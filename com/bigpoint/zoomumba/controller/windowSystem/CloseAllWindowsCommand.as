package com.bigpoint.zoomumba.controller.windowSystem
{
   import com.bigpoint.zoomumba.model.windowSystem.WindowSystemProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CloseAllWindowsCommand extends SimpleCommand
   {
      public function CloseAllWindowsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:WindowSystemProxy = facade.retrieveProxy(WindowSystemProxy.NAME) as WindowSystemProxy;
         _loc2_.deleteAllWindowData();
      }
   }
}

