package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CancelBuyNewSpinCommand extends SimpleCommand
   {
      public function CancelBuyNewSpinCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         if(_loc2_.ticketBought)
         {
            _loc2_.ticketBought = false;
         }
         else
         {
            _loc2_.buyInProgress = false;
         }
      }
   }
}

