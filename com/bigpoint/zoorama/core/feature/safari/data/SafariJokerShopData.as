package com.bigpoint.zoorama.core.feature.safari.data
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   
   public class SafariJokerShopData extends ShopItemData
   {
      public var groupId:int;
      
      public var needsMoney:Boolean = true;
      
      public var enabled:Boolean = true;
      
      public var isBeeingUsed:Boolean = false;
      
      public var jokerUsePosX:int = -1;
      
      public var jokerUsePosY:int = -1;
      
      public function SafariJokerShopData()
      {
         super();
         categoryId = Categories.SAFARI_JOKER;
         buyable = 1;
         sellable = 0;
         giftable = 0;
         onlyDev = 0;
         count = 1;
      }
      
      public function get jokerId() : int
      {
         return itemId;
      }
      
      public function set jokerId(param1:int) : void
      {
         itemId = param1;
      }
   }
}

