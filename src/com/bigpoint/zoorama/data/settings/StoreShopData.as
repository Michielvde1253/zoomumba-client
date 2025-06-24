package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class StoreShopData extends ShopItemData
   {
      public var storeId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var collectTime:int;
      
      public var collectVirtual:int;
      
      public var collectReal:int;
      
      public var buildTime:int;
      
      public var directBuildReal:int;
      
      public var alias:String;
      
      public var moneyPerHour:int;
      
      public var multyStates:int;
      
      public var playfields:Array = [];
      
      public function StoreShopData()
      {
         super();
         internalType = ItemInternalTypes.STORE;
         categoryId = Categories.STORE;
      }
      
      override public function get itemId() : int
      {
         return this.storeId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.storeId = param1;
      }
      
      public function set mph(param1:int) : void
      {
         this.moneyPerHour = param1;
      }
   }
}

