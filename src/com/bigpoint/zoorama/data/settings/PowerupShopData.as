package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class PowerupShopData extends ShopItemData
   {
      public var playfields:Array = [];
      
      public var pId:int = -1;
      
      public function PowerupShopData()
      {
         super();
         internalType = ItemInternalTypes.POWERUP;
         categoryId = Categories.POWERUP;
      }
      
      override public function get itemId() : int
      {
         return this.pId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.pId = param1;
      }
   }
}

