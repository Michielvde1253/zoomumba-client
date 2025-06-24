package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenExternalSetEmailCommand extends SimpleCommand
   {
      public function OpenExternalSetEmailCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         TempGetterProxy.exitFullscreenMode();
         navigateToURL(new URLRequest((facade.getProxy(UserProxy) as UserProxy).accountCenterVo.link),"accountCenter");
      }
   }
}

