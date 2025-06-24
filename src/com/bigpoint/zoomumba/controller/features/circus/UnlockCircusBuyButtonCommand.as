package com.bigpoint.zoomumba.controller.features.circus
{
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UnlockCircusBuyButtonCommand extends SimpleCommand
   {
      public function UnlockCircusBuyButtonCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:CircusProxy = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
         _loc2_.canBuy = true;
      }
   }
}

