package com.bigpoint.zoomumba.controller.managmentCenter
{
   import com.bigpoint.zoomumba.view.managmentCenter.ManagmentCenterMediator;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RegisterManagmentCenterMediatorCommand extends SimpleCommand
   {
      public function RegisterManagmentCenterMediatorCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:UIComponent = param1.getBody() as UIComponent;
         facade.registerMediator(new ManagmentCenterMediator(_loc2_));
      }
   }
}

