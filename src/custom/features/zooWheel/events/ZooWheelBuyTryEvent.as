package custom.features.zooWheel.events
{
   import flash.events.Event;
   
   public class ZooWheelBuyTryEvent extends Event
   {
      public static const CLICKED:String = "ZooWheelBuyTryEventCLICKED";
      
      public function ZooWheelBuyTryEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ZooWheelBuyTryEvent(type);
      }
   }
}

