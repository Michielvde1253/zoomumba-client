package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class MaterialShopData extends ShopItemData
   {
      public var materialId:int;
      
      public var alias:String;
      
      public var baseCap:int;
      
      public var materialCount:int;
      
      public var craftDuration:int;
      
      public var craftInstantReal:int;
      
      public var craftInstantVirtual:int;
      
      public var craftReal:int;
      
      public var craftTrash:int;
      
      public var craftVirtual:int;
      
      public var rareDropId:int;
      
      public var isRecyclable:int;
      
      public function MaterialShopData()
      {
         super();
         internalType = ItemInternalTypes.MATERIAL;
         categoryId = Categories.MATERIAL;
      }
      
      override public function get itemId() : int
      {
         return this.materialId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.materialId = param1;
      }
      
      public function get sbId() : int
      {
         return this.materialId;
      }
      
      public function set sbId(param1:int) : void
      {
         this.materialId = param1;
      }
   }
}

