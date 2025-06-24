package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class FieldItemStateNotice extends Notice
   {
      public static const CHANGE_ITEM_STATE:String = "itemStateChaneg";
      
      public static const CHANGE_ALL_ITEM_STATES:String = "allSameItemStateChange";
      
      public var newStateId:int;
      
      public var category:int;
      
      public var itemId:int;
      
      public var uniqueId:int;
      
      public function FieldItemStateNotice(param1:String, param2:int, param3:int = -1, param4:int = -1, param5:int = -1)
      {
         super(param1);
         this.newStateId = param2;
         this.category = param3;
         this.itemId = param4;
         this.uniqueId = param5;
      }
   }
}

