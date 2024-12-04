package fr.kapit.introspection.events
{
   import flash.events.Event;
   
   public class InspectorActivatedEvent extends Event
   {
      public static const NAME:String = "InspectorActivatedEvent";
      
      private var _inspectorName:String;
      
      private var _targetObject:Object;
      
      public function InspectorActivatedEvent(param1:String, param2:Object)
      {
         super(NAME);
         this._inspectorName = param1;
         this._targetObject = param2;
      }
      
      override public function clone() : Event
      {
         return new InspectorActivatedEvent(this.inspectorName,this.targetObject);
      }
      
      public function get inspectorName() : String
      {
         return this._inspectorName;
      }
      
      public function get targetObject() : Object
      {
         return this._targetObject;
      }
   }
}

