package com.bigpoint.zoomumba.controller.events
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class EventEndCommand extends SimpleCommand
   {
      public function EventEndCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc3_:int = int(param1.getBody());
         var _loc4_:GlobalEventVO = _loc2_.getGlobalEvent(_loc3_);
         switch(_loc3_)
         {
            case EventTypes.ADV_BREEDING_EVENT:
               sendNotification(Note.ADVANCED_BREEDING_EVENT_END);
         }
      }
   }
}

