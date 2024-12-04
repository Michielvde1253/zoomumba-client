package fr.kapit.utils.capture
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class ObjectCapturedEvent extends Event
   {
      public static var NAME:String = "ObjectCapturedEvent";
      
      private var _objectCaptured:DisplayObject;
      
      public function ObjectCapturedEvent(param1:DisplayObject, param2:Boolean = false, param3:Boolean = false)
      {
         super(NAME,param2,param3);
         this._objectCaptured = param1;
      }
      
      public function get objectCaptured() : DisplayObject
      {
         return this._objectCaptured;
      }
   }
}

