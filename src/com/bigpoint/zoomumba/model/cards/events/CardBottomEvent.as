package com.bigpoint.zoomumba.model.cards.events
{
   import flash.events.Event;
   
   public class CardBottomEvent extends Event
   {
      public static const LEFT_BUTTON_CLICKED:String = "LEFT_BUTTON_CLICKED";
      
      public static const RIGHT_BUTTON_CLICKED:String = "RIGHT_BUTTON_CLICKED";
      
      public function CardBottomEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new CardBottomEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("CardBottomEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

