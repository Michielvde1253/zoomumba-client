package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class RoadShopData extends ShopItemData
   {
      public var roadId:int;
      
      public var alias:String;
      
      public var height:int;
      
      public var width:int;
      
      public var playfields:Array = [];
      
      public function RoadShopData()
      {
         super();
         internalType = ItemInternalTypes.ROAD;
         categoryId = Categories.ROAD;
      }
      
      override public function get itemId() : int
      {
         return this.roadId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.roadId = param1;
      }
   }
}

