package com.bigpoint.zoorama.view.info
{
   import flash.events.Event;
   
   public class InfoIconEvent extends Event
   {
      public static const ICON_CHANGED:String = "infoIconChanged";
      
      public var position:int;
      
      public function InfoIconEvent(param1:String, param2:int = 0)
      {
         this.position = param2;
         super(param1);
      }
   }
}

