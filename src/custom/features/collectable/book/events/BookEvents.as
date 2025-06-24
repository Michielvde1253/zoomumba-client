package custom.features.collectable.book.events
{
   import flash.events.Event;
   
   public class BookEvents extends Event
   {
      public static const RIBBON_BUTTON_MOUSE_OVER:String = "RIBBON_BUTTON_MOUSE_OVER";
      
      public static const RIBBON_BUTTON_MOUSE_OUT:String = "RIBBON_BUTTON_MOUSE_OUT";
      
      public static const RIBBON_BUTTON_MOUSE_CLICK:String = "RIBBON_BUTTON_MOUSE_CLICK";
      
      public var ribbonId:int;
      
      public function BookEvents(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

