package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class BreedingLabShopData extends ShopItemData
   {
      public var specialId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var playfields:Array = [];
      
      public function BreedingLabShopData()
      {
         super();
         internalType = ItemInternalTypes.BREEDING_LAB;
         categoryId = Categories.BREEDING_LAB;
      }
      
      override public function get itemId() : int
      {
         return this.specialId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.specialId = param1;
      }
   }
}

