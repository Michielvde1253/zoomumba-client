package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.model.gameConfig.vo.PriceVO;
   
   public class InheritedShopData
   {
      public var categoryId:int = -1;
      
      public var internalType:int = -1;
      
      public var shopTab:int = -1;
      
      public var showPrice:Boolean = true;
      
      public var visible:Boolean = true;
      
      public var bg:int = 0;
      
      public var hideBuyButton:Boolean = false;
      
      public var uniqueId:int = -1;
      
      private var _itemId:int = -1;
      
      public var campSizeRequired:int = 0;
      
      public var expansionRequired:int = 0;
      
      protected var _attraction:Object;
      
      public var picAssetId:String = "";
      
      public var maleAssetId:String = "";
      
      public var femaleAssetId:String = "";
      
      public var childAssetId:String = "";
      
      private var _localisedTitle:String = "";
      
      public var localisedInfoId:String = "";
      
      public var localisedInfoReplacers:Array = null;
      
      [Transient]
      public var price:PriceVO = new PriceVO();
      
      public var userLevelRequired:int = 0;
      
      public var buyable:int = 0;
      
      public var sellable:int = 0;
      
      public var buyVirtual:int = 0;
      
      public var buyReal:int = 0;
      
      public var sellVirtual:int = 0;
      
      public var sellReal:int = 0;
      
      public var collectableType:int = -1;
      
      public var isEventItem:int = 0;
      
      public var itemsSelectedForBuy:int = 1;
      
      public var onlyDev:int = 0;
      
      public var translatedTextSpecies:String = "";
      
      public var cardName:String = "";
      
      public function InheritedShopData()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return this._itemId;
      }
      
      public function set itemId(param1:int) : void
      {
         this._itemId = param1;
      }
      
      public function get expansionNeeded() : int
      {
         return this.campSizeRequired - MainConstants.FIELD_SIZE_START;
      }
      
      public function set bG(param1:int) : void
      {
         this.bg = param1;
      }
      
      final public function get attraction() : Object
      {
         return this._attraction;
      }
      
      final public function set attraction(param1:Object) : void
      {
         this._attraction = param1;
      }
      
      public function get localisedTitle() : String
      {
         if(this.cardName == null)
         {
            return "";
         }
         return this.cardName;
      }
      
      public function set localisedTitle(param1:String) : void
      {
         this.cardName = param1;
      }
      
      public function getAttraction() : int
      {
         return int(this._attraction);
      }
      
      public function getUserLevelRequired() : int
      {
         return this.userLevelRequired;
      }
      
      public function getBuyable() : int
      {
         return this.buyable;
      }
      
      public function getSellable() : int
      {
         return this.sellable;
      }
      
      public function getBuyVirtual() : int
      {
         return this.buyVirtual;
      }
      
      public function getBuyReal() : int
      {
         return this.buyReal;
      }
      
      public function getBuyCollectable() : int
      {
         return 0;
      }
      
      public function getSellVirtual() : int
      {
         return this.sellVirtual;
      }
      
      public function getSellReal() : int
      {
         return this.sellReal;
      }
   }
}

