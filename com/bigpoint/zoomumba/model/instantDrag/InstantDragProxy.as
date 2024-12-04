package com.bigpoint.zoomumba.model.instantDrag
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.instantDrag.vo.LastBuyVo;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class InstantDragProxy extends Proxy
   {
      public static const NAME:String = "KeyboardProxy";
      
      private var _ctrlHold:Boolean = false;
      
      private var _lastItem:LastBuyVo;
      
      private var _lastItems:Vector.<LastBuyVo>;
      
      private var _playFieldProxy:PlayFieldProxy;
      
      public function InstantDragProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this._lastItems = new Vector.<LastBuyVo>();
      }
      
      public function get playFieldProxy() : PlayFieldProxy
      {
         if(this._playFieldProxy == null)
         {
            this._playFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         }
         return this._playFieldProxy;
      }
      
      public function clearLastDragItem() : void
      {
         this._lastItem = null;
         this._lastItems = new Vector.<LastBuyVo>();
      }
      
      public function startNextDragItem() : void
      {
         var _loc1_:ShopItemData = null;
         var _loc2_:AnimalSpeciesVO = null;
         var _loc3_:AnimalSpeciesVO = null;
         var _loc4_:Vector.<ShopItemData> = null;
         var _loc5_:FieldItemData = null;
         if(!this._lastItem)
         {
         }
         if(this._ctrlHold == true && this._lastItem != null)
         {
            if(this._lastItem.buyMode == false)
            {
               _loc4_ = this.playFieldProxy.getItemsConfigListByConfigId(this._lastItem.categorieId,this._lastItem.itemId,true);
               for each(_loc1_ in _loc4_)
               {
                  if(this.isInLastItemData(_loc1_.uniqueId) == false && _loc1_.itemId == this._lastItem.itemId)
                  {
                     sendNotification(Note.START_NEXT_INVENTORY_ITEM_DRAG,_loc1_);
                     return;
                  }
               }
            }
            else if(this.userProxy.virtualAmount >= this._lastItem.price)
            {
               switch(this._lastItem.categorieId)
               {
                  case Categories.ANIMAL:
                  case Categories.SPECIES:
                     _loc2_ = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this._lastItem.itemId);
                     if(_loc2_)
                     {
                        sendNotification(Note.START_NEXT_BUY_ANIMAL_DRAG,_loc2_);
                     }
                  case Categories.BREEDING_LAB:
                  case Categories.NURSERY:
                  case Categories.SPECIAL:
                     break;
                  default:
                     _loc1_ = this.itemConfigProxy.getShopItemDataByCategorieAndItemID(this._lastItem.categorieId,this._lastItem.itemId);
                     sendNotification(Note.START_NEXT_BUY_ITEM_DRAG,_loc1_);
               }
            }
         }
      }
      
      public function isInLastItemData(param1:int) : Boolean
      {
         var _loc2_:LastBuyVo = null;
         for each(_loc2_ in this._lastItems)
         {
            if(_loc2_.uniqueId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function get userProxy() : UserProxy
      {
         return facade.getProxy(UserProxy);
      }
      
      private function get itemConfigProxy() : ItemConfigProxy
      {
         return facade.getProxy(ItemConfigProxy);
      }
      
      private function getNextUniqueItemId(param1:LastBuyVo) : int
      {
         return 0;
      }
      
      public function set lastItem(param1:LastBuyVo) : void
      {
         this._lastItem = param1;
         this._lastItems.push(param1);
      }
      
      public function set ctrlHold(param1:Boolean) : void
      {
         this._ctrlHold = param1;
      }
      
      public function get ctrlHold() : Boolean
      {
         return this._ctrlHold;
      }
   }
}

