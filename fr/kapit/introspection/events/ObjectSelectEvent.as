package fr.kapit.introspection.events
{
   import flash.events.Event;
   
   public class ObjectSelectEvent extends Event
   {
      public static const NAME:String = "ObjectSelectEvent";
      
      private var _targetObject:Object;
      
      public function ObjectSelectEvent(param1:Object)
      {
         super(NAME);
         this._targetObject = param1;
      }
      
      override public function clone() : Event
      {
         return new ObjectSelectEvent(this.targetObject);
      }
      
      public function get targetObject() : Object
      {
         return this._targetObject;
      }
   }
}

