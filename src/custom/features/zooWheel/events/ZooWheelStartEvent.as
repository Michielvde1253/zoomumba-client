package custom.features.zooWheel.events
{
   import flash.events.Event;
   
   public class ZooWheelStartEvent extends Event
   {
      public static const START:String = "start";
      
      public static const FORWARD:String = "forward";
      
      public static const BUY:String = "buy";
      
      public function ZooWheelStartEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ZooWheelStartEvent(type);
      }
   }
}

