package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class StorageShopData extends ShopItemData
   {
      public var instancesInGame:int = 0;
      
      public var premiumId:int = -1;
      
      public var alias:String = "";
      
      public var params:Object = {};
      
      public var width:int;
      
      public var height:int;
      
      public var userFieldSize:int = 0;
      
      public function StorageShopData()
      {
         super();
         internalType = ItemInternalTypes.STORAGE;
         categoryId = Categories.STORAGE;
      }
      
      public function get currentExpansion() : int
      {
         return this.userFieldSize - MainConstants.FIELD_SIZE_START;
      }
      
      public function get availableDueExpansion() : Boolean
      {
         return Boolean(cappedAmount) ? this.currentExpansion > this.instancesInGame : true;
      }
      
      override public function get itemId() : int
      {
         return this.premiumId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.premiumId = param1;
      }
      
      override public function getBuyReal() : int
      {
         return !!this.params["buyReal"] ? int(this.params["buyReal"][Math.max(Math.min(this.instancesInGame,this.params["buyReal"].length - 1),0)]) : super.getBuyReal();
      }
      
      override public function getSellVirtual() : int
      {
         return !!this.params["sellVirtual"] ? int(this.params["sellVirtual"][Math.max(Math.min(this.instancesInGame - 1,this.params["sellVirtual"].length - 1),0)]) : super.getSellVirtual();
      }
      
      public function get isWater() : Boolean
      {
         return false;
      }
   }
}

