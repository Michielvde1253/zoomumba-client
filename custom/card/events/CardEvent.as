package custom.card.events
{
   import flash.events.Event;
   
   public class CardEvent extends Event
   {
      public static const INFO_BUTTON_CLICKED:String = "infoClicked";
      
      public static const BUY_BUTTON_CLICKED:String = "buyClicked";
      
      public static const ACTION_BUTTON_CLICKED:String = "actionClicked";
      
      public static const IN_INVENTORY_BUTTON_CLICKED:String = "inInventoryClicked";
      
      public function CardEvent(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return super.clone();
      }
   }
}

