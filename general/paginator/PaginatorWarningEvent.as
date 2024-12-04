package general.paginator
{
   import flash.events.Event;
   
   public class PaginatorWarningEvent extends Event
   {
      public static const REACHED_LIMIT:String = "REACHED_LIMIT";
      
      public var maximum:Boolean;
      
      public function PaginatorWarningEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:PaginatorWarningEvent = new PaginatorWarningEvent(type,bubbles,cancelable);
         _loc1_.maximum = this.maximum;
         return _loc1_;
      }
   }
}

