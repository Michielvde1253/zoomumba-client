package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class PremiumShopData extends ShopItemData
   {
      public var premiumId:int = -1;
      
      public var alias:String = "";
      
      public var params:Object = {};
      
      public var playfields:Array = [];
      
      public function PremiumShopData()
      {
         super();
         internalType = ItemInternalTypes.SPECIAL;
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
      
      public function set buildTime(param1:int) : void
      {
      }
      
      public function set height(param1:int) : void
      {
      }
      
      public function set width(param1:int) : void
      {
      }
      
      public function set directBuildReal(param1:int) : void
      {
      }
      
      public function set groundRequired(param1:int) : void
      {
      }
      
      public function set multyStates(param1:int) : void
      {
      }
   }
}

