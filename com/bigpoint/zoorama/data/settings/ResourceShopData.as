package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class ResourceShopData extends ShopItemData
   {
      public var resourceId:int;
      
      public var alias:String;
      
      public var resourceCount:int;
      
      public var breedChance:int = 0;
      
      public var baseCap:int;
      
      public var playfields:Array = [];
      
      public var cageTypeUsage:Object = null;
      
      public var buyAmount:int = 0;
      
      public function ResourceShopData()
      {
         super();
         internalType = ItemInternalTypes.RESOURCE;
         categoryId = Categories.RESOURCES;
      }
      
      override public function get itemId() : int
      {
         return this.resourceId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.resourceId = param1;
      }
   }
}

