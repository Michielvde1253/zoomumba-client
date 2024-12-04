package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class SurpriseBoxShopData extends ShopItemData
   {
      public var boxId:int = -1;
      
      public var alias:String;
      
      public var playfields:Array = [];
      
      public function SurpriseBoxShopData()
      {
         super();
         internalType = ItemInternalTypes.SUPRISE_BOX;
         categoryId = Categories.SUPRISE_BOX;
      }
   }
}

