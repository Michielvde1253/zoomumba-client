package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RequestRewardCommand extends SimpleCommand
   {
      public function RequestRewardCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc3_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         _loc3_.lastCommandInProgress = true;
         sendNotification(NET.REDEEM_FORTUNE_WHEEL_TICKET);
         _loc3_._rewardRequestId = _loc2_.currentRequestId;
      }
   }
}

