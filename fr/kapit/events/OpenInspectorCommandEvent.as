package fr.kapit.events
{
   import flash.events.Event;
   
   public class OpenInspectorCommandEvent extends Event
   {
      public static const NAME:String = "OpenInspectorCommandEvent";
      
      private var _host:Object;
      
      private var _inspectorName:String;
      
      private var _name:String;
      
      private var _targetObject:Object;
      
      public function OpenInspectorCommandEvent(param1:String, param2:Object, param3:String = null, param4:Object = null)
      {
         super(NAME);
         this._targetObject = param2;
         this._inspectorName = param1;
         this._name = param3;
         this._host = param4;
      }
      
      override public function clone() : Event
      {
         return new OpenInspectorCommandEvent(this.inspectorName,this.targetObject,this.name,this.host);
      }
      
      public function get host() : Object
      {
         return this._host;
      }
      
      public function get inspectorName() : String
      {
         return this._inspectorName;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get targetObject() : Object
      {
         return this._targetObject;
      }
   }
}

