package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UpdateRewardDataCommand extends SimpleCommand
   {
      public function UpdateRewardDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:FortuneWheelVO = param1.getBody() as FortuneWheelVO;
         var _loc3_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         _loc3_.updateData(_loc2_);
      }
   }
}

