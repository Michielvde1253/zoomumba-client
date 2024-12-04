package com.bigpoint.zoomumba.controller.debug
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class FeatureTestCommand extends SimpleCommand
   {
      public function FeatureTestCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:GlobalEventVO = new GlobalEventVO();
         _loc2_.startDate = TimeManager.currentTime + 15;
         _loc2_.endDate = TimeManager.currentTime + 30;
         _loc2_.eventId = EventTypes.EASTER_EVENT;
         var _loc3_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         _loc3_.storeGlobalEventData(_loc2_);
      }
   }
}

