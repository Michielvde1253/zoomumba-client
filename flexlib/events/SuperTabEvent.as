package flexlib.events
{
   import flash.events.Event;
   
   public class SuperTabEvent extends Event
   {
      public static const TAB_CLOSE:String = "tabClose";
      
      public static const TAB_UPDATED:String = "tabUpdated";
      
      public var tabIndex:Number;
      
      public function SuperTabEvent(param1:String, param2:Number = -1, param3:Boolean = false, param4:Boolean = false)
      {
         this.tabIndex = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new SuperTabEvent(type,this.tabIndex,bubbles,cancelable);
      }
   }
}

