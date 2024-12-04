package windows.events
{
   import flash.events.Event;
   
   public class WindowCustomEvent extends Event
   {
      public static const WINDOW_VISUALLY_CREATED:String = "WINDOW_VISUALLY_CREATED";
      
      public static const WINDOW_CONTENT_UPDATED:String = "WINDOW_CONTENT_UPDATED";
      
      public static const WINDOW_CONTENT_CHANGED:String = "WINDOW_CONTENT_CHANGED";
      
      public static const CLOSE_BUTTON_CLICKED:String = "CLOSE_BUTTON_CLICKED";
      
      public static const CONFIRM_CLICKED:String = "CONFIRM_CLICKED";
      
      public static const CANCEL_CLICKED:String = "CANCEL_CLICKED";
      
      public var containerId:int = 0;
      
      public var contentClass:Class = null;
      
      public function WindowCustomEvent(param1:String, param2:int = 0, param3:Class = null, param4:Boolean = true, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.containerId = param2;
         this.contentClass = param3;
      }
      
      override public function clone() : Event
      {
         return new WindowCustomEvent(type,this.containerId,this.contentClass,bubbles,cancelable);
      }
   }
}

