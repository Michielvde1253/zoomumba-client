package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class HalloweenShopData extends ShopItemData
   {
      public var premiumId:int;
      
      public var alias:String;
      
      public var currency:Object;
      
      public var multyStates:int;
      
      public var buyCount:int = 1;
      
      public var playfields:Array = [];
      
      public function HalloweenShopData()
      {
         super();
         internalType = ItemInternalTypes.HALLOWEEN;
         categoryId = Categories.PREMIUM;
      }
      
      override public function get itemId() : int
      {
         return this.premiumId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.premiumId = param1;
      }
      
      public function set isInWheel(param1:int) : void
      {
      }
   }
}

