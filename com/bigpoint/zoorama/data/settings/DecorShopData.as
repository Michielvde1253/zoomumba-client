package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class DecorShopData extends ShopItemData
   {
      public var decoId:int;
      
      public var width:int;
      
      public var height:int;
      
      public var groundRequired:int;
      
      public var buildTime:int;
      
      public var directBuildReal:int;
      
      public var alias:String;
      
      public var multyStates:int;
      
      public var playfields:Array = [];
      
      public function DecorShopData()
      {
         super();
         internalType = ItemInternalTypes.DECORATION;
         categoryId = Categories.DECOR;
      }
      
      override public function get itemId() : int
      {
         return this.decoId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.decoId = param1;
      }
      
      public function set isInWheel(param1:int) : void
      {
      }
   }
}

