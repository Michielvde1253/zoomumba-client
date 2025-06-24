package com.bigpoint.zoomumba.model.features.recycling
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.RecyclingConst;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingConfigVo;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingSlotDataVo;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingSlotRentVo;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.vo.ManagmentCenterBuildingConfigVo;
   import com.bigpoint.zoomumba.model.managmentCenter.vo.ManagmentCenterLevelConfigVo;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class RecyclingProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "RecyclingProxy";
      
      private var _firstWindowStartup:Boolean;
      
      private var _netProxy:NetProxy;
      
      private var _recyclingConfigVo:RecyclingConfigVo;
      
      private var _cardProductionHolderData:Vector.<Object>;
      
      private var _recyclingSlotData:Vector.<RecyclingSlotDataVo>;
      
      private var _ressourceProxy:ResourcesProxy;
      
      private var _itemConfigProxy:ItemConfigProxy;
      
      private var _managmentCenterProxy:ManagmentCenterProxy;
      
      private var arrowOk:Class = RecyclingProxy_arrowOk;
      
      public function RecyclingProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      public function initRecyclingConfigData(param1:Object) : void
      {
         var _loc2_:RecyclingSlotRentVo = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         this._recyclingConfigVo = new RecyclingConfigVo();
         this._recyclingConfigVo.freeSlots = param1.freeSlots;
         this._recyclingConfigVo.maxStack = param1.maxStack;
         this._recyclingConfigVo.rareDropChanceBooster = param1.rareDropChanceBooster;
         this._recyclingConfigVo.maxSlots = param1.maxSlots;
         this._recyclingConfigVo.rareDropChance = new Vector.<int>();
         for each(_loc3_ in param1.slotRentDays)
         {
            _loc2_ = new RecyclingSlotRentVo();
            _loc2_.rc = _loc3_.rc;
            _loc2_.days = _loc3_.days;
            this._recyclingConfigVo.slotRentList.push(_loc2_);
         }
         for each(_loc4_ in param1.rareDropChance)
         {
            this._recyclingConfigVo.rareDropChance.push(_loc4_);
         }
         this._recyclingConfigVo.rareDropChance.sort(this.sortingDropChanceFunction);
         this._recyclingConfigVo.slotRentList.sort(this.sortingFunction);
      }
      
      private function sortingFunction(param1:RecyclingSlotRentVo, param2:RecyclingSlotRentVo) : Number
      {
         if(param1.days.valueOf() < param2.days.valueOf())
         {
            return -1;
         }
         if(param1.days.valueOf() > param2.days.valueOf())
         {
            return 1;
         }
         return 0;
      }
      
      private function sortingDropChanceFunction(param1:int, param2:int) : Number
      {
         if(param1 < param2)
         {
            return -1;
         }
         if(param1 > param2)
         {
            return 1;
         }
         return 0;
      }
      
      public function getSlotRentVoByIndex(param1:int) : RecyclingSlotRentVo
      {
         return this.recyclingConfigVo.slotRentList[param1];
      }
      
      public function getSlotIndexVoByDays(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.slotRentMax)
         {
            if(this.getSlotRentVoByIndex(_loc2_).days == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 0;
      }
      
      public function get slotRentMax() : int
      {
         return this.recyclingConfigVo.slotRentList.length;
      }
      
      public function isAnyCrafingReady() : Boolean
      {
         var _loc1_:RecyclingSlotDataVo = null;
         var _loc2_:int = 1;
         while(_loc2_ <= this._recyclingConfigVo.maxSlots)
         {
            _loc1_ = this.getRecyclingSlotDataById(_loc2_);
            if(_loc1_)
            {
               if(_loc1_.finishTime <= TimeManager.currentTime && _loc1_.materialId != 0)
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function initCardProductionHolderData() : void
      {
         var _loc1_:RecyclingCardInfoVo = null;
         var _loc2_:RecyclingSlotDataVo = null;
         this._cardProductionHolderData = new Vector.<Object>();
         var _loc3_:int = 1;
         var _loc4_:int = 1;
         while(_loc4_ <= this._recyclingConfigVo.maxSlots)
         {
            _loc1_ = new RecyclingCardInfoVo();
            _loc2_ = this.getRecyclingSlotDataById(_loc4_);
            _loc1_.internalType = ItemInternalTypes.RECYCLING_CARD;
            _loc1_.categoryId = Categories.MATERIAL;
            _loc1_.bG = CARDS.CARD_BACKGROUND_STYLE_RECYCLE;
            if(_loc2_)
            {
               _loc1_.slotDataVo = _loc2_;
               _loc1_.itemId = _loc2_.materialId;
               if(_loc1_.slotDataVo.materialId == 0)
               {
                  _loc1_.state = RecyclingConst.SLOT_TYPE_FREE;
               }
               else
               {
                  _loc1_.materialShopData = this.itemConfigProxy.getMaterialData(_loc1_.slotDataVo.materialId);
               }
               if(_loc1_.slotDataVo.finishTime <= TimeManager.currentTime && _loc1_.slotDataVo.materialId != 0)
               {
                  _loc1_.state = RecyclingConst.SLOT_TYPE_READY_FOR_COLLECT;
               }
               else if(_loc1_.slotDataVo.finishTime != 0 && _loc1_.slotDataVo.materialId != 0)
               {
                  _loc1_.state = RecyclingConst.SLOT_TYPE_PRODUCE;
                  _loc1_.buyable = 1;
                  _loc1_.buyReal = _loc1_.materialShopData.craftInstantReal * _loc1_.slotDataVo.amount;
               }
            }
            else
            {
               _loc1_.slotDataVo = new RecyclingSlotDataVo();
               _loc1_.slotDataVo.slotId = _loc4_;
               _loc1_.state = RecyclingConst.SLOT_TYPE_BUY;
               _loc1_.buyReal = this.getSlotRentVoByIndex(0).rc;
            }
            this._cardProductionHolderData.push(_loc1_);
            _loc4_++;
         }
      }
      
      public function getFreeSlot(param1:int) : int
      {
         var _loc2_:int = param1;
         while(_loc2_ < 99999)
         {
            if(this.getRecyclingSlotDataById(_loc2_) == null)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get cardProductionHolderData() : Vector.<Object>
      {
         return this._cardProductionHolderData;
      }
      
      public function getRecylceSlots() : void
      {
         this.netProxy.callServer(NET.RECYCLE_GET_SLOTS,[]).sendNow();
      }
      
      public function instantCollectReycleSlot(param1:int) : void
      {
         this.netProxy.callServer(NET.RECYCLE_INSTANT_COLLLECT_RECYCLE_SLOT,[param1]).sendNow();
      }
      
      public function collectReycleSlot(param1:int) : void
      {
         this.netProxy.callServer(NET.RECYCLE_COLLLECT_RECYCLE_SLOT,[param1]).sendNow();
      }
      
      public function bookNewReycleSlot(param1:int, param2:int) : void
      {
         this.netProxy.callServer(NET.RECYCLE_BOOK_NEW_SLOT,[param1,param2]).sendNow();
      }
      
      public function startRecyclingMaterial(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.netProxy.callServer(NET.RECYCLE_START_RECYCLE_MATERIAL,[param1,param2,param3,param4]).sendNow();
      }
      
      public function buySurpriseBox(param1:int) : void
      {
         this.netProxy.callServer(NET.RECYCLE_BUY_SURPRISEBOX,[param1]).sendNow();
      }
      
      public function storeRecyclingSlotData(param1:Vector.<RecyclingSlotDataVo>) : void
      {
         this._recyclingSlotData = param1;
         this.initCardProductionHolderData();
         sendNotification(Note.RECYCLING_SLOTS_REFRESHED,param1);
      }
      
      public function get recyclingNextLevelConfigVo() : ManagmentCenterLevelConfigVo
      {
         return this.managmentCenterProxy.getLevelConfigByLevelAndBuildingId(MANAGMENTCENTER.MC_BUILDING_RECYCLING,this.recyclingBuildingViewVo.level + 1);
      }
      
      public function get recyclingBuildingConfigVo() : ManagmentCenterBuildingConfigVo
      {
         return this.managmentCenterProxy.getBuildingConfigByBuildingId(MANAGMENTCENTER.MC_BUILDING_RECYCLING);
      }
      
      public function get recyclingBuildingViewVo() : ManagmentCenterBuildingViewVo
      {
         return this.managmentCenterProxy.getBuildingViewVoByBuildingId(MANAGMENTCENTER.MC_BUILDING_RECYCLING);
      }
      
      public function getRecyclingSlotDataById(param1:int) : RecyclingSlotDataVo
      {
         var _loc2_:int = 0;
         if(this._recyclingSlotData)
         {
            _loc2_ = 0;
            while(_loc2_ < this._recyclingSlotData.length)
            {
               if(this._recyclingSlotData[_loc2_].slotId == param1)
               {
                  return this._recyclingSlotData[_loc2_];
               }
               _loc2_++;
            }
         }
         return null;
      }
      
      public function get boosterAmount() : int
      {
         return this.ressourceProxy.getResourseAmmount(Resources.RECYCLING_BOOSTER);
      }
      
      public function get trashAmount() : int
      {
         return this.ressourceProxy.getResourseAmmount(Resources.TRASH);
      }
      
      public function get trashMaxAmount() : int
      {
         return this.ressourceProxy.getMaxResourse(Resources.TRASH);
      }
      
      public function get ressourceProxy() : ResourcesProxy
      {
         if(this._ressourceProxy == null)
         {
            this._ressourceProxy = facade.getProxy(ResourcesProxy) as ResourcesProxy;
         }
         return this._ressourceProxy;
      }
      
      public function get netProxy() : NetProxy
      {
         if(this._netProxy == null)
         {
            this._netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         }
         return this._netProxy;
      }
      
      public function get itemConfigProxy() : ItemConfigProxy
      {
         if(this._itemConfigProxy == null)
         {
            this._itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         return this._itemConfigProxy;
      }
      
      private function get managmentCenterProxy() : ManagmentCenterProxy
      {
         if(this._managmentCenterProxy == null)
         {
            this._managmentCenterProxy = facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
         }
         return this._managmentCenterProxy;
      }
      
      public function get recyclingConfigVo() : RecyclingConfigVo
      {
         return this._recyclingConfigVo;
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

