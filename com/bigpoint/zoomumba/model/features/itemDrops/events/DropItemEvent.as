package com.bigpoint.zoomumba.model.features.itemDrops.events
{
   import com.bigpoint.zoorama.view.itemDrop.items.DropItem;
   import flash.events.Event;
   
   public class DropItemEvent extends Event
   {
      public static const DROP_CLICKED:String = "DROP_CLICKED";
      
      public static const DROP_TIMER_EXPIRED:String = "DROP_TIMER_EXPIRED";
      
      public var dropItem:DropItem;
      
      public function DropItemEvent(param1:String, param2:DropItem = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.dropItem = param2;
      }
   }
}

