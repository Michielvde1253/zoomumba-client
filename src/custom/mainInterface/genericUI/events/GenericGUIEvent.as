package custom.mainInterface.genericUI.events
{
   import flash.events.Event;
   
   public class GenericGUIEvent extends Event
   {
      public static const MAIN_CLICKED:String = "MAIN_CLICKED";
      
      public static const BUTTON_CLICKED:String = "BUTTON_CLICKED";
      
      public static const MINIMIZED:String = "MINIMIZED";
      
      public static const MAXIMIZED:String = "MAXIMIZED";
      
      public var id:String = null;
      
      public function GenericGUIEvent(param1:String, param2:String = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.id = param2;
      }
      
      override public function clone() : Event
      {
         return new GenericGUIEvent(type,this.id,bubbles,cancelable);
      }
   }
}

