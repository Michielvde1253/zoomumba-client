package custom.info.events
{
   import flash.events.Event;
   
   public class InfoSexChangeEvent extends Event
   {
      public static const CHANGED:String = "sexChanged";
      
      public var isMale:Boolean = true;
      
      public function InfoSexChangeEvent(param1:String, param2:Boolean = true, param3:Boolean = true, param4:Boolean = false)
      {
         this.isMale = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new InfoSexChangeEvent(type,this.isMale,bubbles,cancelable);
      }
   }
}

