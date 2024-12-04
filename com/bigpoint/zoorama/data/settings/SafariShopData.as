package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class SafariShopData extends ShopItemData
   {
      public var groupId:int = -1;
      
      public var active:Boolean = false;
      
      public var canActivate:Boolean = true;
      
      public var useMode:Boolean = false;
      
      public var jokerUsePosX:int = -1;
      
      public var jokerUsePosY:int = -1;
      
      public function SafariShopData()
      {
         super();
         internalType = ItemInternalTypes.SAFARI_JOKER;
         categoryId = Categories.SAFARI_JOKER;
      }
   }
}

