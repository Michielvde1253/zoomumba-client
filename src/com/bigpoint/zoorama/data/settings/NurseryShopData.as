package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class NurseryShopData extends ShopItemData
   {
      public var specialId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var playfields:Array = [];
      
      public function NurseryShopData()
      {
         super();
         internalType = ItemInternalTypes.NURSERY;
         categoryId = Categories.NURSERY;
      }
      
      override public function get itemId() : int
      {
         return this.specialId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.specialId = param1;
      }
      
      public function get sbId() : int
      {
         return this.specialId;
      }
      
      public function set sbId(param1:int) : void
      {
         this.specialId = param1;
      }
   }
}

