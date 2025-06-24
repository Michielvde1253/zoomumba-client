package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class CollectableShopData extends ShopItemData
   {
      public var collectablesNeeded:int;
      
      public var breedChance:int = 0;
      
      public function CollectableShopData()
      {
         super();
         categoryId = Categories.COLLECTIBLE;
         internalType = ItemInternalTypes.COLLECTABLE;
      }
   }
}

