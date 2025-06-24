package windows.core.tabs.events
{
   import flash.events.Event;
   
   public class TabsGroupEvent extends Event
   {
      public static const INDEX_CHANGED:String = "INDEX_CHANGED";
      
      public var index:int = -1;
      
      public function TabsGroupEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:TabsGroupEvent = new TabsGroupEvent(type,bubbles,cancelable);
         _loc1_.index = this.index;
         return _loc1_;
      }
   }
}

