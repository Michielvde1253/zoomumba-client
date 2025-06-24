package com.bigpoint.zoomumba.view.gui.event.events
{
   import flash.events.Event;
   
   public class BallonEvent extends Event
   {
      public static const SHOOT_BALLON_EVENT:String = "SHOOT_BALLON_EVENT";
      
      public static const ENDFLIGHT_BALLON_EVENT:String = "ENDFLIGHT_BALLON_EVENT";
      
      public function BallonEvent(param1:String)
      {
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new BallonEvent(type);
      }
      
      override public function toString() : String
      {
         return formatToString("BallonEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

