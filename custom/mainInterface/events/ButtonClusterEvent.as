package custom.mainInterface.events
{
   import flash.events.Event;
   
   public class ButtonClusterEvent extends Event
   {
      public static const CLUSTER_BUTTON_CLICK:String = "CLUSTER_BUTTON_CLICK";
      
      public var buttonID:int;
      
      public function ButtonClusterEvent(param1:String, param2:int = 0, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.buttonID = param2;
      }
   }
}

