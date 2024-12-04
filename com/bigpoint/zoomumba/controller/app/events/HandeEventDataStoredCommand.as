package com.bigpoint.zoomumba.controller.app.events
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandeEventDataStoredCommand extends SimpleCommand
   {
      private var esternEventStartTracker:TimeTrack;
      
      private var esternEventEndTracker:TimeTrack;
      
      public function HandeEventDataStoredCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:BabyCaravanProxy = null;
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc4_:GlobalEventVO = _loc3_.getGlobalEvent(_loc2_);
         if(_loc2_ == EventTypes.EASTER_EVENT)
         {
            if(TimeManager.currentTime < _loc4_.endDate)
            {
               if(TimeManager.currentTime < _loc4_.startDate)
               {
                  this.esternEventStartTracker = TimeManager.creatEmptyTrack(this.handleEsternEventStarted);
                  TimeManager.updateTrackTime(this.esternEventStartTracker,_loc4_.startDate);
               }
               this.esternEventEndTracker = TimeManager.creatEmptyTrack(this.handleEsternEventEnded);
               TimeManager.updateTrackTime(this.esternEventEndTracker,_loc4_.endDate);
            }
         }
         else if(_loc2_ == EventTypes.BABY_CARAVAN_EVENT)
         {
            _loc5_ = facade.getProxy(BabyCaravanProxy) as BabyCaravanProxy;
            _loc5_.setSpecieIds(_loc4_.affectedActionObject);
         }
      }
      
      private function handleEsternEventEnded() : void
      {
         sendNotification(Note.GLOBAL_EVENT_ESTER_END);
      }
      
      private function handleEsternEventStarted() : void
      {
         sendNotification(Note.GLOBAL_EVENT_ESTER_START);
      }
   }
}

