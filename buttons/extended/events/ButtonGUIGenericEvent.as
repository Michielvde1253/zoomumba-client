package buttons.extended.events
{
   import flash.events.Event;
   
   public class ButtonGUIGenericEvent extends Event
   {
      public static const CLICK:String = "ButtonGUIGenericEvent_Click";
      
      public var params:Object = null;
      
      public function ButtonGUIGenericEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.params = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new ButtonGUIGenericEvent(type,this.params,bubbles,cancelable);
      }
   }
}

