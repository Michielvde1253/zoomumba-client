package com.bigpoint.zoomumba.model.net.responceDataVo
{
   import com.bigpoint.zoorama.data.event.EventData;
   
   public class EventDatas
   {
      private var events:Vector.<EventData>;
      
      public function EventDatas(param1:Object)
      {
         super();
         this.events = new Vector.<EventData>();
         this.data = param1;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:EventData = null;
         for(_loc2_ in param1)
         {
            _loc3_ = this.parseEvent(param1[_loc2_]);
            this.events.push(_loc3_);
         }
      }
      
      private function parseEvent(param1:Object) : EventData
      {
         return new EventData(param1);
      }
      
      public function getAllEvents() : Vector.<EventData>
      {
         return this.events;
      }
   }
}

