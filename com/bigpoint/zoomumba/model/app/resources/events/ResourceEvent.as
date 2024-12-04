package com.bigpoint.zoomumba.model.app.resources.events
{
   import flash.events.Event;
   
   public class ResourceEvent extends Event
   {
      public static const DECODED:String = "decoded";
      
      public static const ERROR:String = "decodeError";
      
      public function ResourceEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ResourceEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("ResourceEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

