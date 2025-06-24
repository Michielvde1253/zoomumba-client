package com.bigpoint.zoomumba.model.features.crafting
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.items.fieldItems.ItemBlueprintVo;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingItemOrderIdsVo;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingRewardVo;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingStateVo;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CraftingProxy extends Proxy
   {
      public static const NAME:String = "CraftingProxy";
      
      private var _firstWindowStartup:Boolean;
      
      private var _blueprintRewards:Vector.<BlueprintInfoVO>;
      
      private var _userBlueprints:Vector.<ItemBlueprintVo>;
      
      private var _inventoryProxy:InventoryProxy;
      
      private var _materialProxy:MaterialProxy;
      
      private var _currencyProxy:CurrencyProxy;
      
      private var _netProxy:NetProxy;
      
      private var _craftingData:CraftingStateVo;
      
      private var _craftingRewardVo:CraftingRewardVo;
      
      public function CraftingProxy()
      {
         super(NAME,null);
      }
      
      public function initBlueprintRewards(param1:Vector.<BlueprintInfoVO>) : void
      {
         this._blueprintRewards = param1;
      }
      
      public function getUserBlueprintRewardIdsByCategorie(param1:int) : Vector.<int>
      {
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc3_:int = int(this._blueprintRewards.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1 == this._blueprintRewards[_loc4_].category && this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc4_].blueprintId))
            {
               _loc2_.push(this._blueprintRewards[_loc4_].itemId);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getUserBlueprintOrderIdVecByCategorie(param1:int) : Vector.<CraftingItemOrderIdsVo>
      {
         var _loc2_:Vector.<CraftingItemOrderIdsVo> = new Vector.<CraftingItemOrderIdsVo>();
         var _loc3_:int = int(this._blueprintRewards.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1 == this._blueprintRewards[_loc4_].category && this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc4_].blueprintId))
            {
               _loc2_.push(new CraftingItemOrderIdsVo(this._blueprintRewards[_loc4_].itemId,param1,this._blueprintRewards[_loc4_].blueprintId));
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getUserBlueprintOrderIdVec() : Vector.<CraftingItemOrderIdsVo>
      {
         var _loc1_:Vector.<CraftingItemOrderIdsVo> = new Vector.<CraftingItemOrderIdsVo>();
         var _loc2_:int = int(this._blueprintRewards.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc3_].blueprintId))
            {
               _loc1_.push(new CraftingItemOrderIdsVo(this._blueprintRewards[_loc3_].itemId,this._blueprintRewards[_loc3_].category,this._blueprintRewards[_loc3_].blueprintId));
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getAllUserBlueprintRewardIds() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:int = int(this._blueprintRewards.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc3_].blueprintId))
            {
               _loc1_.push(this._blueprintRewards[_loc3_].itemId);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getUserBlueprintCount() : int
      {
         return this._userBlueprints.length;
      }
      
      public function canCraftItem(param1:int, param2:int) : Boolean
      {
         var _loc4_:ItemStackVO = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:BlueprintInfoVO = this.getBlueprintInfoDataByRewardItemId(param1,param2);
         if(_loc3_)
         {
            _loc5_ = int(_loc3_.neededMaterials.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = _loc3_.neededMaterials[_loc6_];
               if(this.haveEnoughtMaterial(_loc4_) == false)
               {
                  return false;
               }
               _loc6_++;
            }
            if(this.currencyProxy.petPowns < _loc3_.petpaws)
            {
               return false;
            }
         }
         return true;
      }
      
      public function haveEnoughtMaterial(param1:ItemStackVO) : Boolean
      {
         if(param1.ammount > this.materialProxy.getMaterialAmount(param1.itemId))
         {
            return false;
         }
         return true;
      }
      
      public function getBlueprintInfoByBlueprintId(param1:int) : BlueprintInfoVO
      {
         var _loc2_:BlueprintInfoVO = null;
         var _loc3_:int = int(this._blueprintRewards.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._blueprintRewards[_loc4_].blueprintId == param1)
            {
               return this._blueprintRewards[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getBlueprintInfoDataByRewardItemId(param1:int, param2:int) : BlueprintInfoVO
      {
         var _loc3_:BlueprintInfoVO = null;
         var _loc4_:int = int(this._blueprintRewards.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(this._blueprintRewards[_loc5_].itemId == param1 && this._blueprintRewards[_loc5_].category == param2)
            {
               return this._blueprintRewards[_loc5_];
            }
            _loc5_++;
         }
         return null;
      }
      
      public function hasUserBlueprintByBlueprintId(param1:int) : Boolean
      {
         var _loc2_:int = int(this._userBlueprints.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._userBlueprints[_loc3_].id == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasUserBlueprintByRewardItemId(param1:int, param2:int) : Boolean
      {
         var _loc3_:BlueprintInfoVO = this.getBlueprintInfoDataByRewardItemId(param1,param2);
         if(this.hasUserBlueprintByBlueprintId(_loc3_.blueprintId))
         {
            return true;
         }
         return false;
      }
      
      public function getRewardsByMaterialId(param1:int, param2:Boolean = true) : Vector.<ItemVO>
      {
         var _loc4_:ItemVO = null;
         var _loc3_:Vector.<ItemVO> = new Vector.<ItemVO>();
         var _loc5_:int = int(this._blueprintRewards.length);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            if(this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc7_].blueprintId))
            {
               _loc6_ = int(this._blueprintRewards[_loc7_].neededMaterials.length);
               _loc8_ = 0;
               while(_loc8_ < _loc6_)
               {
                  if(this._blueprintRewards[_loc7_].neededMaterials[_loc8_].itemId == param1)
                  {
                     _loc4_ = new ItemVO(this._blueprintRewards[_loc7_].itemId,-1,this._blueprintRewards[_loc7_].category);
                     _loc3_.push(_loc4_);
                  }
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         if(param2 == false)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               if(this.hasUserBlueprintByBlueprintId(this._blueprintRewards[_loc7_].blueprintId) == false)
               {
                  _loc6_ = int(this._blueprintRewards[_loc7_].neededMaterials.length);
                  _loc8_ = 0;
                  while(_loc8_ < _loc6_)
                  {
                     if(this._blueprintRewards[_loc7_].neededMaterials[_loc8_].itemId == param1)
                     {
                        _loc4_ = new ItemVO(this._blueprintRewards[_loc7_].itemId,-1,this._blueprintRewards[_loc7_].category);
                        _loc3_.push(_loc4_);
                     }
                     _loc8_++;
                  }
               }
               _loc7_++;
            }
         }
         return _loc3_;
      }
      
      public function setUserItems(param1:Vector.<ItemBlueprintVo>) : void
      {
         this._userBlueprints = param1;
      }
      
      public function setCraftingState(param1:CraftingStateVo) : void
      {
         this._craftingData = param1;
         sendNotification(Note.UPDATE_CRAFTING_STATE);
      }
      
      public function netSendCraftingCollect(param1:String = "") : void
      {
         if(param1 == "")
         {
            this.netProxy.callServer(NET.CRAFTING_COLLECT,[]).sendNow();
         }
         else
         {
            this.netProxy.callServer(NET.CRAFTING_COLLECT,[]).addCallbackIfTrue(param1).sendNow();
         }
      }
      
      public function netSendPotionRaise(param1:String) : void
      {
         if(param1 == "")
         {
            this.netProxy.callServer(NET.CRAFTING_TIME_DECREASE,[]).sendNow();
         }
         else
         {
            this.netProxy.callServer(NET.CRAFTING_TIME_DECREASE,[]).addCallbackIfTrue(param1).sendNow();
         }
      }
      
      public function netSendStartBlueprintCrafting(param1:int, param2:String = "") : void
      {
         if(param2 == "")
         {
            this.netProxy.callServer(NET.CRAFTING_START,[param1]).sendNow();
         }
         else
         {
            this.netProxy.callServer(NET.CRAFTING_START,[param1]).addCallback(param2).sendNow();
         }
      }
      
      public function netSendInstantFinish(param1:String) : void
      {
         if(param1 == "")
         {
            this.netProxy.callServer(NET.CRAFTING_COLLECT_INSTANT,[]).sendNow();
         }
         else
         {
            this.netProxy.callServer(NET.CRAFTING_COLLECT_INSTANT,[]).addCallbackIfTrue(param1).sendNow();
         }
      }
      
      public function setRewardData(param1:CraftingRewardVo) : void
      {
         this._craftingRewardVo = param1;
      }
      
      public function get blueprintRewards() : Vector.<BlueprintInfoVO>
      {
         return this._blueprintRewards;
      }
      
      public function get inventoryProxy() : InventoryProxy
      {
         if(this._inventoryProxy == null)
         {
            this._inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         }
         return this._inventoryProxy;
      }
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.retrieveProxy(MaterialProxy.NAME) as MaterialProxy;
         }
         return this._materialProxy;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
      
      public function get netProxy() : NetProxy
      {
         if(this._netProxy == null)
         {
            this._netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         }
         return this._netProxy;
      }
      
      public function get craftingData() : CraftingStateVo
      {
         return this._craftingData;
      }
      
      public function get isActive() : Boolean
      {
         return this._craftingData.active == 1;
      }
      
      public function get craftingRewardVo() : CraftingRewardVo
      {
         return this._craftingRewardVo;
      }
      
      public function get firstWindowStartup() : Boolean
      {
         return this._firstWindowStartup;
      }
      
      public function set firstWindowStartup(param1:Boolean) : void
      {
         this._firstWindowStartup = param1;
      }
   }
}

