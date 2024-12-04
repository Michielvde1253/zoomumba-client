package fr.kapit.introspection.events
{
   import flash.events.Event;
   
   public class EventFilterSelectedEvent extends Event
   {
      public static const EVENT_OFF:String = "eventOff";
      
      public static const EVENT_ON:String = "eventOn";
      
      private var _eventName:String;
      
      public function EventFilterSelectedEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._eventName = param2;
      }
      
      override public function clone() : Event
      {
         return new EventFilterSelectedEvent(type,this.eventName,bubbles,cancelable);
      }
      
      public function get eventName() : String
      {
         return this._eventName;
      }
   }
}

