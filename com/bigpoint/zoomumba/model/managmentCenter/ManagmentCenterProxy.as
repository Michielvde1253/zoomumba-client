package com.bigpoint.zoomumba.model.managmentCenter
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.vo.*;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmenCenterCityViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ManagmentCenterProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "ManagmentCenterProxy";
      
      private var _managmentCenterDataVo:ManagmentCenterDataVo;
      
      private var _managmentCenterConfigVo:ManagmentCenterConfigVo;
      
      private var _managmentCenterCityViewVo:ManagmenCenterCityViewVo;
      
      private var _nurseryProxy:NurseryProxy;
      
      private var _circusBoxes:Vector.<StoreData>;
      
      public function ManagmentCenterProxy()
      {
         super(NAME);
         this._circusBoxes = new Vector.<StoreData>();
      }
      
      public function initNetData(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         this._managmentCenterDataVo = new ManagmentCenterDataVo();
         if(param1.managementCenterConfig)
         {
            this.readOutManagmentCenterConfig(param1.managementCenterConfig);
         }
         if(param1.managementCenterData)
         {
            this.readOutManagmentCenterData(param1.managementCenterData);
         }
         this.setupBuildViewVo();
      }
      
      public function setupBuildViewVo() : void
      {
         var _loc1_:ManagmentCenterBuildingViewVo = null;
         var _loc2_:ManagmentCenterLevelConfigVo = null;
         var _loc3_:ManagmentCenterBuildingConfigVo = null;
         var _loc4_:ManagmentCenterBuildingDataVo = null;
         this._managmentCenterCityViewVo = new ManagmenCenterCityViewVo();
         if(this._managmentCenterDataVo)
         {
            for each(_loc4_ in this._managmentCenterDataVo.buildingDataVo)
            {
               _loc2_ = this.getLevelConfigByLevelAndBuildingId(_loc4_.id,_loc4_.level);
               _loc3_ = this.getBuildingConfigByBuildingId(_loc4_.id);
               _loc1_ = new ManagmentCenterBuildingViewVo();
               if(_loc4_.builded == false)
               {
                  _loc1_.viewState = 0;
               }
               else
               {
                  _loc1_.viewState = _loc2_.viewState;
               }
               _loc1_.level = _loc4_.level;
               _loc1_.id = _loc4_.id;
               _loc1_.eventId = _loc4_.eventId;
               _loc1_.attention = _loc4_.attention;
               _loc1_.canBuy = _loc3_.buyable;
               _loc1_.userLevelRequired = _loc3_.userLevelRequired;
               _loc1_.newbie = _loc4_.newbie;
               _loc1_.uId = _loc4_.uId;
               if(_loc1_.canBuy)
               {
                  _loc1_.buyReal = _loc2_.buyReal;
                  _loc1_.buyVirtual = _loc2_.buyVirtual;
               }
               if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_KINDERGARTEN)
               {
                  this.initNurseryProxy(_loc1_);
               }
               else if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_BREEDINGSTATION)
               {
                  this.initBreedingStation(_loc1_);
               }
               else if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_CRAFTING)
               {
                  this.initCraftingStation(_loc1_);
               }
               else if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_RECYCLING)
               {
                  this.initRecyclingStation(_loc1_);
               }
               if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_CAGECRAFTING || _loc4_.id == MANAGMENTCENTER.MC_BUILDING_FOODCRAFTING)
               {
                  _loc1_.commingSoon = true;
                  _loc1_.viewState = 0;
               }
               else if(_loc4_.id == MANAGMENTCENTER.MC_BUILDING_CONSTRUCTIONSITE)
               {
                  _loc1_.commingSoon = true;
               }
               this._managmentCenterCityViewVo.buildingViewVo.push(_loc1_);
            }
         }
      }
      
      public function getLevelConfigByLevelAndBuildingId(param1:String, param2:int) : ManagmentCenterLevelConfigVo
      {
         var _loc4_:ManagmentCenterLevelConfigVo = null;
         var _loc3_:ManagmentCenterBuildingConfigVo = this.getBuildingConfigByBuildingId(param1);
         if(_loc3_)
         {
            for each(_loc4_ in _loc3_.levelConfig)
            {
               if(_loc4_.level == param2)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function initBreedingStation(param1:ManagmentCenterBuildingViewVo) : ManagmentCenterBuildingViewVo
      {
         var _loc2_:BreedingLabVO = new BreedingLabVO();
         _loc2_.itemId = MainConstants.SPECIAL_BREEDING_LAB;
         _loc2_.uniqueId = param1.uId;
         var _loc3_:BreedingLabProxy = facade.retrieveProxy(BreedingLabProxy.NAME + "_" + Categories.BREEDING_LAB + "_" + _loc2_.uniqueId) as BreedingLabProxy;
         if(!_loc3_)
         {
            facade.registerProxy(new BreedingLabProxy(Categories.BREEDING_LAB,_loc2_.uniqueId,_loc2_));
         }
         if(_loc3_)
         {
            param1.showAction = Boolean(_loc3_.currentState == BreedingLabProxy.STATE_FINISHED);
            param1.timerAction = _loc3_.lab.end;
         }
         else
         {
            param1.showAction = Boolean(false);
            param1.timerAction = 0;
         }
         return param1;
      }
      
      private function initRecyclingStation(param1:ManagmentCenterBuildingViewVo) : ManagmentCenterBuildingViewVo
      {
         var _loc2_:RecyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         if(_loc2_.isAnyCrafingReady())
         {
            param1.showAction = true;
            param1.timerAction = 9999999;
         }
         else
         {
            param1.showAction = false;
            param1.timerAction = 0;
         }
         return param1;
      }
      
      public function initCraftingStation(param1:ManagmentCenterBuildingViewVo) : ManagmentCenterBuildingViewVo
      {
         var _loc2_:CraftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         if(_loc2_.isActive == true && _loc2_.craftingData.endTime - TimeManager.currentTime <= 0)
         {
            param1.showAction = true;
            param1.timerAction = _loc2_.craftingData.endTime - TimeManager.currentTime;
         }
         else
         {
            param1.showAction = false;
            param1.timerAction = 0;
         }
         return param1;
      }
      
      public function initNurseryProxy(param1:ManagmentCenterBuildingViewVo) : ManagmentCenterBuildingViewVo
      {
         var _loc2_:NurseryVO = new NurseryVO();
         _loc2_.id = MainConstants.SPECIAL_NURSERY;
         _loc2_.uniqueId = param1.uId;
         this._nurseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         if(!this._nurseryProxy)
         {
            facade.registerProxy(new NurseryProxy(Categories.NURSERY,_loc2_.uniqueId,_loc2_));
         }
         if(this._nurseryProxy)
         {
            param1.showAction = Boolean(this._nurseryProxy.currentState == NurseryProxy.STATE_FINISHED);
            param1.timerAction = this._nurseryProxy.nursery.end;
         }
         else
         {
            param1.showAction = Boolean(false);
            param1.timerAction = 0;
         }
         return param1;
      }
      
      public function getMaxLevelConfigByBuildingId(param1:String) : ManagmentCenterLevelConfigVo
      {
         var _loc2_:ManagmentCenterBuildingConfigVo = this.getBuildingConfigByBuildingId(param1);
         return _loc2_.levelConfig[_loc2_.levelConfig.length - 1];
      }
      
      public function getBuildingConfigByBuildingId(param1:String) : ManagmentCenterBuildingConfigVo
      {
         var _loc2_:ManagmentCenterBuildingConfigVo = null;
         for each(_loc2_ in this._managmentCenterConfigVo.buildingConfigVo)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getBuildingViewVoByBuildingId(param1:String) : ManagmentCenterBuildingViewVo
      {
         var _loc2_:ManagmentCenterBuildingViewVo = null;
         for each(_loc2_ in this._managmentCenterCityViewVo.buildingViewVo)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function readOutManagmentCenterData(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:ManagmentCenterBuildingDataVo = null;
         var _loc6_:String = null;
         var _loc5_:Boolean = false;
         this._managmentCenterDataVo = new ManagmentCenterDataVo();
         for(_loc3_ in param1)
         {
            _loc2_ = param1[_loc3_];
            _loc4_ = new ManagmentCenterBuildingDataVo();
            _loc4_.id = _loc3_;
            if(_loc2_.attention != null)
            {
               _loc4_.attention = _loc2_.attention == 1;
            }
            if(_loc2_.builded != null)
            {
               _loc4_.builded = _loc2_.builded == 1;
            }
            if(_loc2_.level != null)
            {
               _loc4_.level = _loc2_.level;
            }
            if(_loc2_.uId != null)
            {
               _loc4_.uId = _loc2_.uId;
            }
            if(_loc2_.eventId != null)
            {
               _loc4_.eventId = _loc2_.eventId;
            }
            if(_loc2_.newbie != null)
            {
               _loc4_.newbie = _loc2_.newbie;
            }
            _loc5_ = false;
            for each(_loc6_ in MANAGMENTCENTER.MC_ASSET_BUILDS)
            {
               if(_loc6_ == _loc3_)
               {
                  _loc5_ = true;
                  break;
               }
            }
            if(_loc5_)
            {
               this._managmentCenterDataVo.buildingDataVo.push(_loc4_);
            }
         }
      }
      
      public function updateAllCirusBoxes(param1:Vector.<StoreData>) : void
      {
         var _loc2_:FieldItemData = null;
         this._circusBoxes = new Vector.<StoreData>();
         for each(_loc2_ in param1)
         {
            if(_loc2_.playFieldId == -1 && _loc2_.itemId == 34 && _loc2_.category == Categories.STORE)
            {
               this._circusBoxes.push(_loc2_);
            }
         }
      }
      
      public function clearCirusBox(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._circusBoxes.length)
         {
            if(this._circusBoxes[_loc2_].uniqueId == param1)
            {
               this._circusBoxes.splice(_loc2_,1);
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function setCirusBox(param1:StoreData) : void
      {
         if(param1.playFieldId < 0 && param1.itemId == 34 && param1.category == Categories.STORE)
         {
            if(this.refreshCircusBox(param1) == false)
            {
               this._circusBoxes.push(param1);
            }
         }
         else if(param1.playFieldId == -1 && param1.itemId == -1 && param1.category == Categories.STORE)
         {
            this.clearCirusBox(param1.uniqueId);
         }
      }
      
      private function refreshCircusBox(param1:StoreData) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._circusBoxes.length)
         {
            if(this._circusBoxes[_loc2_].uniqueId == param1.uniqueId)
            {
               this._circusBoxes[_loc2_] = param1;
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function searchCircusBox(param1:int) : FieldItemData
      {
         var _loc2_:FieldItemData = null;
         for each(_loc2_ in this._circusBoxes)
         {
            if(_loc2_.uniqueId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function readOutManagmentCenterConfig(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:ManagmentCenterBuildingConfigVo = null;
         var _loc7_:ManagmentCenterLevelConfigVo = null;
         this._managmentCenterConfigVo = new ManagmentCenterConfigVo();
         for(_loc3_ in param1)
         {
            _loc6_ = new ManagmentCenterBuildingConfigVo();
            _loc2_ = param1[_loc3_];
            _loc6_.id = _loc3_;
            if(_loc2_.buyable != null)
            {
               _loc6_.buyable = _loc2_.buyable == 1;
            }
            if(_loc2_.userLevelRequired != null)
            {
               _loc6_.userLevelRequired = _loc2_.userLevelRequired;
            }
            if(_loc2_.levels)
            {
               for(_loc5_ in _loc2_.levels)
               {
                  _loc7_ = new ManagmentCenterLevelConfigVo();
                  _loc4_ = _loc2_.levels[_loc5_];
                  _loc7_.level = parseInt(String(_loc5_));
                  if(_loc4_.buyReal != null)
                  {
                     _loc7_.buyReal = _loc4_.buyReal;
                  }
                  if(_loc4_.buyVirtual != null)
                  {
                     _loc7_.buyVirtual = _loc4_.buyVirtual;
                  }
                  if(_loc4_.maxCap != null)
                  {
                     _loc7_.maxCap = _loc4_.maxCap;
                  }
                  if(_loc4_.viewState != null)
                  {
                     _loc7_.viewState = _loc4_.viewState;
                  }
                  _loc6_.levelConfig.push(_loc7_);
               }
            }
            this._managmentCenterConfigVo.buildingConfigVo.push(_loc6_);
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      public function get managmentCenterViewVo() : ManagmenCenterCityViewVo
      {
         return this._managmentCenterCityViewVo;
      }
      
      public function get managmentCenterDataVo() : ManagmentCenterDataVo
      {
         return this._managmentCenterDataVo;
      }
      
      public function get circusBoxes() : Vector.<StoreData>
      {
         return this._circusBoxes;
      }
   }
}

