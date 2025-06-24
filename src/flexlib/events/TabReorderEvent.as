package flexlib.events
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.events.IndexChangedEvent;
   
   public class TabReorderEvent extends IndexChangedEvent
   {
      public function TabReorderEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:DisplayObject = null, param5:Number = -1, param6:Number = -1, param7:Event = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7);
      }
      
      override public function clone() : Event
      {
         return new TabReorderEvent(type,bubbles,cancelable,relatedObject,oldIndex,newIndex,triggerEvent);
      }
   }
}

