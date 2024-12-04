package fr.kapit.event
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import fr.kapit.components.IKapDebugComponent;
   
   public class SuperTabNavigatorTabChangeEvent extends Event
   {
      public static var NAME:String = "SuperTabNavigatorTabChangeEvent";
      
      private var _inspector:IKapDebugComponent;
      
      private var _displayObject:DisplayObject;
      
      public function SuperTabNavigatorTabChangeEvent(param1:DisplayObject, param2:IKapDebugComponent, param3:Boolean = false, param4:Boolean = false)
      {
         super(NAME,param3,param4);
         this._inspector = param2;
         this._displayObject = param1;
      }
      
      public function get inspector() : IKapDebugComponent
      {
         return this._inspector;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      override public function clone() : Event
      {
         return new SuperTabNavigatorTabChangeEvent(this.displayObject,this.inspector,bubbles,cancelable);
      }
   }
}

