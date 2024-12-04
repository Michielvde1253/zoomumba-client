package com.bigpoint.zoomumba.controller.shop
{
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BuyCakesForZDCommand extends SimpleCommand
   {
      public function BuyCakesForZDCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(NET.BUY_PREMIUM,[MainConstants.PREMIUM_ANNIVERSARY_CAKE_ID]);
      }
   }
}

