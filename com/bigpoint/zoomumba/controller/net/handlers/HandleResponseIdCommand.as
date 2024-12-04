package com.bigpoint.zoomumba.controller.net.handlers
{
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleResponseIdCommand extends SimpleCommand
   {
      public function HandleResponseIdCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         var _loc3_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         var _loc4_:int = param1.getBody() as int;
         if(_loc4_ >= _loc2_.waitForCommandId)
         {
            _loc2_.waitForCommandId = -1;
         }
         if(_loc4_ >= _loc3_._rewardRequestId)
         {
            _loc3_.lastCommandInProgress = false;
            _loc3_._rewardRequestId = -1;
         }
      }
   }
}

