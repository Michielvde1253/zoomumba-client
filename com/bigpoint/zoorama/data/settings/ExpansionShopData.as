package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class ExpansionShopData extends ShopItemData
   {
      public var premiumId:int = -1;
      
      public var alias:String = "";
      
      public var params:Object = {};
      
      public var userLevel:int = 0;
      
      public var userFieldSize:int = 0;
      
      public var lvlNextAutomaticExp:int = 0;
      
      private var _useCachedPrice:Boolean = true;
      
      private var _cachedPriceReal:int = -1;
      
      private var _cachedPriceVirtual:int = -1;
      
      private var _cachedPriceCollectable:int = -1;
      
      public var playfields:Array = [];
      
      public function ExpansionShopData()
      {
         super();
         internalType = ItemInternalTypes.EXPANSION;
         categoryId = Categories.EXPANSION;
      }
      
      public function get currentExpansion() : int
      {
         return this.userFieldSize - MainConstants.FIELD_SIZE_START;
      }
      
      public function flushCachedPrice() : void
      {
         this._cachedPriceReal = this._cachedPriceVirtual = this._cachedPriceCollectable = -1;
         this._useCachedPrice = true;
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
         return !!this.params["expands"] ? this.returnPrice(this.params["expands"],true) : super.getBuyReal();
      }
      
      override public function getBuyVirtual() : int
      {
         return !!this.params["expands"] ? this.returnPrice(this.params["expands"],false) : super.getBuyVirtual();
      }
      
      override public function getBuyCollectable() : int
      {
         return !!this.params["expands"] ? this.returnPriceCollectable(this.params["expands"]) : super.getBuyCollectable();
      }
      
      private function returnPrice(param1:Object, param2:Boolean) : int
      {
         var _loc5_:Object = null;
         if(this._useCachedPrice)
         {
            if(param2 && this._cachedPriceReal != -1)
            {
               return this._cachedPriceReal;
            }
            if(!param2 && this._cachedPriceVirtual != -1)
            {
               return this._cachedPriceVirtual;
            }
         }
         var _loc3_:Object = null;
         var _loc4_:int = -1;
         for each(_loc5_ in param1)
         {
            if(_loc5_.lvl)
            {
               if(this.userLevel < _loc5_.lvl && this.userFieldSize < _loc5_.fsize)
               {
                  if(_loc3_ == null || _loc3_.fsize > _loc5_.fsize)
                  {
                     this._cachedPriceReal = _loc5_.cR;
                     this._cachedPriceVirtual = _loc5_.cV;
                     this.lvlNextAutomaticExp = _loc5_.lvl;
                     _loc4_ = param2 ? int(_loc5_.cR) : int(_loc5_.cV);
                  }
                  _loc3_ = _loc5_;
               }
            }
            else if(this.userFieldSize < _loc5_.fsize)
            {
               if(_loc3_ == null || _loc3_.fsize > _loc5_.fsize)
               {
                  this._cachedPriceReal = _loc5_.cR;
                  this._cachedPriceVirtual = _loc5_.cV;
                  _loc4_ = param2 ? int(_loc5_.cR) : int(_loc5_.cV);
               }
               _loc3_ = _loc5_;
            }
         }
         visible = _loc3_ != null;
         return _loc4_;
      }
      
      private function returnPriceCollectable(param1:Object) : int
      {
         var _loc4_:Object = null;
         if(this._useCachedPrice && this._cachedPriceCollectable != -1)
         {
            return this._cachedPriceCollectable;
         }
         var _loc2_:Object = null;
         var _loc3_:int = -1;
         for each(_loc4_ in param1)
         {
            if(this.userFieldSize < _loc4_.fsize)
            {
               if(_loc2_ == null || _loc2_.fsize > _loc4_.fsize)
               {
                  this._cachedPriceCollectable = _loc4_.cC;
                  _loc3_ = int(_loc4_.cC);
               }
               _loc2_ = _loc4_;
            }
         }
         visible = _loc2_ != null;
         return _loc3_;
      }
   }
}

