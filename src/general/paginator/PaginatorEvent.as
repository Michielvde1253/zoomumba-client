package general.paginator
{
   import flash.events.Event;
   
   public class PaginatorEvent extends Event
   {
      public static const CHANGE_PAGE:String = "CHANGE_PAGE";
      
      public var page:int = -1;
      
      public var pageFirstIndex:int = -1;
      
      public var pageLastIndex:int = -1;
      
      public function PaginatorEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:PaginatorEvent = new PaginatorEvent(type,bubbles,cancelable);
         _loc1_.page = this.page;
         _loc1_.pageFirstIndex = this.pageFirstIndex;
         _loc1_.pageLastIndex = this.pageLastIndex;
         return _loc1_;
      }
   }
}

