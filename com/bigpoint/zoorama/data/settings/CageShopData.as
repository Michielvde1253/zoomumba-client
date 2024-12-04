package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class CageShopData extends ShopItemData
   {
      public var cageId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var buildTime:int;
      
      public var directBuildReal:int;
      
      public var alias:String;
      
      public var type:int;
      
      public var playfields:Array = [];
      
      public function CageShopData()
      {
         super();
         internalType = ItemInternalTypes.CAGE;
         categoryId = Categories.CAGE;
      }
      
      override public function get itemId() : int
      {
         return this.cageId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.cageId = param1;
      }
   }
}

