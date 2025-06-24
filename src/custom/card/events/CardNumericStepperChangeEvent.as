package custom.card.events
{
   import flash.events.Event;
   
   public class CardNumericStepperChangeEvent extends Event
   {
      public static const CHANGED:String = "stepperChanged";
      
      public var value:int = -1;
      
      public function CardNumericStepperChangeEvent(param1:String, param2:int, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.value = param2;
      }
      
      override public function clone() : Event
      {
         return new CardNumericStepperChangeEvent(type,this.value,bubbles,cancelable);
      }
   }
}

