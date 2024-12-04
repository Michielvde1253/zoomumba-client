package custom.card.events
{
   import flash.events.Event;
   
   public class CardSexChangeEvent extends Event
   {
      public static const CHANGED:String = "sexChanged";
      
      public var isMale:Boolean = true;
      
      public function CardSexChangeEvent(param1:String, param2:Boolean = true, param3:Boolean = true, param4:Boolean = false)
      {
         this.isMale = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new CardSexChangeEvent(type,this.isMale,bubbles,cancelable);
      }
   }
}

