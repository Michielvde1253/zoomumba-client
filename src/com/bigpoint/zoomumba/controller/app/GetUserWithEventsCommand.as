package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GetUserWithEventsCommand extends SimpleCommand
   {
      private var map:Array = [EventTypes.VALENTINES_EVENT,NET.VALENTINES_GET_CONFIG];
      
      public function GetUserWithEventsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:GlobalEventProxy = facade.getProxy(GlobalEventProxy);
         var _loc3_:int = 0;
         while(_loc3_ < this.map.length)
         {
            if(_loc2_.isEventActive(this.map[_loc3_]))
            {
               sendNotification(this.map[_loc3_ + 1]);
            }
            _loc3_ += 2;
         }
         sendNotification(NET.GET_USER);
      }
   }
}

