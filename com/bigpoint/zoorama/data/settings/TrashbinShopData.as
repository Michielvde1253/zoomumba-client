package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class TrashbinShopData extends ShopItemData
   {
      public var trashbinId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var alias:String;
      
      public var playfields:Array = [];
      
      public function TrashbinShopData()
      {
         super();
         internalType = ItemInternalTypes.TRASHBIN;
         categoryId = Categories.TRASHBIN;
      }
      
      override public function get itemId() : int
      {
         return this.trashbinId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.trashbinId = param1;
      }
   }
}

