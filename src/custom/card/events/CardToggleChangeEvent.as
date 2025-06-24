package custom.card.events
{
   import flash.events.Event;
   
   public class CardToggleChangeEvent extends Event
   {
      public static const CHANGED:String = "toggleChanged";
      
      public var isOn:Boolean = false;
      
      public function CardToggleChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.isOn = param2;
      }
      
      override public function clone() : Event
      {
         return new CardToggleChangeEvent(type,this.isOn,bubbles,cancelable);
      }
   }
}

