package custom.features.zooWheel.events
{
   import flash.events.Event;
   
   public class ZooWheelRewardEvent extends Event
   {
      public static const STOPPED_AT_REWARD:String = "STOPPED_AT_REAWRD";
      
      public var index:int = -1;
      
      public function ZooWheelRewardEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:ZooWheelRewardEvent = new ZooWheelRewardEvent(type);
         _loc1_.index = this.index;
         return _loc1_;
      }
   }
}

