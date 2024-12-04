package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.FlashParamObjectVO;
   import org.puremvc.as3.interfaces.ICommand;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class LoadSettingsCommand extends SimpleCommand implements ICommand
   {
      public function LoadSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         var _loc3_:FlashParamObjectVO = param1.getBody() as FlashParamObjectVO;
         _loc2_.loadConfig(_loc3_);
      }
   }
}

