package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class PremiumPackShopData extends ShopItemData
   {
      public var premiumId:int = -1;
      
      private var _reward:ItemPackVO = new ItemPackVO();
      
      private var _currency:ItemPackVO = new ItemPackVO();
      
      public var selectedType:int = 1;
      
      public var playfields:Array = [];
      
      public function PremiumPackShopData()
      {
         super();
         internalType = ItemInternalTypes.PACK;
         categoryId = Categories.PREMIUM;
      }
      
      override public function get itemId() : int
      {
         return this.premiumId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.premiumId = param1;
      }
      
      public function set reward(param1:Object) : void
      {
         ObjectHelper.copyData(this._reward,param1);
         switch(this._currency.itemId)
         {
            case UserResources.REAL_MONEY:
               buyReal = this._currency.prices[0];
               break;
            case UserResources.VIRTUAL_MONEY:
               buyVirtual = this._currency.prices[0];
         }
      }
      
      public function get packPrices() : ItemPackVO
      {
         return this._currency;
      }
      
      public function get reward() : Object
      {
         return new Object();
      }
      
      public function set currency(param1:Object) : void
      {
         ObjectHelper.copyData(this._currency,param1);
      }
      
      public function get currency() : Object
      {
         return new Object();
      }
      
      public function get packReward() : ItemPackVO
      {
         return this._reward;
      }
   }
}

