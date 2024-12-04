package custom.features.collectable.book.events
{
   import flash.events.Event;
   
   public class BookStateEvent extends Event
   {
      public static const CHANGED:String = "BOOK_STATE_CHANGED";
      
      public var stateChanged:Boolean;
      
      public var indexChanged:Boolean;
      
      public var state:String;
      
      public var index:int;
      
      public function BookStateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:BookStateEvent = new BookStateEvent(type,bubbles,cancelable);
         _loc1_.state = this.state;
         _loc1_.stateChanged = this.stateChanged;
         _loc1_.index = this.index;
         _loc1_.indexChanged = this.indexChanged;
         return _loc1_;
      }
   }
}

