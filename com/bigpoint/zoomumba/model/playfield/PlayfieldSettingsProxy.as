package com.bigpoint.zoomumba.model.playfield
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.RoadData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldInfoVO;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PlayfieldSettingsProxy extends Proxy
   {
      public static const NAME:String = "PlayfieldSettingsProxy";
      
      private var playfieldSettings:Dictionary = new Dictionary();
      
      private var playfieldsInfo:Dictionary = new Dictionary();
      
      private var attractivityDic:Dictionary = new Dictionary();
      
      public var itemConfigProxy:ItemConfigProxy;
      
      public var mainConfigProxy:MainConfigProxy;
      
      private var _recalculateAttraction:Boolean = false;
      
      private var _activePlayfieldType:int = -2;
      
      public var globalPlayfieldsInfo:PlayfieldInfoVO = new PlayfieldInfoVO();
      
      public var fieldIds:Array = [];
      
      private var _managmentCenterActive:Boolean;
      
      public function PlayfieldSettingsProxy()
      {
         super(NAME,null);
      }
      
      public function getFieldInfo(param1:int) : PlayfieldInfoVO
      {
         return this.playfieldsInfo[param1];
      }
      
      public function getCurrentFieldInfo() : PlayfieldInfoVO
      {
         return this.playfieldsInfo[this.getCurrentPlayFieldId()] as PlayfieldInfoVO;
      }
      
      public function getFieldSettings(param1:int) : PlayfieldSettingsVO
      {
         return this.playfieldSettings[param1];
      }
      
      public function getCurrentFieldSettings() : PlayfieldSettingsVO
      {
         return this.playfieldSettings[this.getCurrentPlayFieldId()] as PlayfieldSettingsVO;
      }
      
      public function getCurrentPlayFieldId() : int
      {
         return this.getPlayFieldId(this.activePlayfieldType);
      }
      
      public function hasPlayFieldId(param1:int) : Boolean
      {
         return this.fieldIds.length > param1 && this.fieldIds[param1] >= 0;
      }
      
      private function getItemKey(param1:int, param2:int, param3:int) : String
      {
         return "fId:" + param1.toString() + ";" + "cat:" + param2.toString() + ";" + "uId:" + param3.toString();
      }
      
      private function getAttMemRef(param1:String, param2:String) : int
      {
         return !!this.attractivityDic[param1] ? int(this.attractivityDic[param1][param2]) || 0 : 0;
      }
      
      private function setAttMemRef(param1:String, param2:String, param3:int) : void
      {
         this.attractivityDic[param1] = this.attractivityDic[param1] || {};
         this.attractivityDic[param1][param2] = param3;
      }
      
      private function flushAttMemRef(param1:String) : void
      {
         delete this.attractivityDic[param1];
      }
      
      public function get activePlayfieldType() : int
      {
         return this._activePlayfieldType;
      }
      
      public function get managmentCenterActive() : Boolean
      {
         return this._managmentCenterActive;
      }
      
      public function getPlayFieldId(param1:int) : int
      {
         return int(this.fieldIds[param1]) || -1;
      }
      
      public function setPlayFieldId(param1:int, param2:int) : void
      {
         this.fieldIds[param1] = param2;
      }
      
      public function setPlayfieldTypeById(param1:int) : void
      {
         if(param1 == PlayFieldsTypes.FIELD_TYPE_MANAGMENT_CENTER)
         {
            this._managmentCenterActive = true;
            return;
         }
         this._managmentCenterActive = false;
         var _loc2_:int = int(this.fieldIds.indexOf(param1));
         this._activePlayfieldType = _loc2_ >= 0 ? _loc2_ : PlayFieldsTypes.FIELD_TYPE_FOREIGN;
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.getProxy(ItemConfigProxy);
      }
      
      public function parseFieldSettings(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:PlayfieldSettingsVO = null;
         for(_loc2_ in param1)
         {
            _loc3_ = new PlayfieldSettingsVO();
            ObjectHelper.copyData(_loc3_,param1[_loc2_]);
            if(_loc3_.fSize != 0 && this.playfieldSettings[int(_loc2_)] && this.playfieldSettings[int(_loc2_)].fSize != 0 && this.playfieldSettings[int(_loc2_)].fSize < _loc3_.fSize)
            {
               sendNotification(PLAYFIELD.EXPAND_PLAYFIELD,_loc3_);
            }
            this.playfieldSettings[int(_loc2_)] = _loc3_;
            this.playfieldsInfo[int(_loc2_)] = this.playfieldsInfo[int(_loc2_)] || new PlayfieldInfoVO();
         }
         sendNotification(ResponseName.FIELD_SETTINGS,this.getCurrentFieldSettings());
         this.recalculatePlayfieldsInfo(true);
      }
      
      public function storeNeighbourPlayfield(param1:PlayfieldSettingsVO) : void
      {
         this.playfieldSettings[param1.fId] = param1;
      }
      
      public function recalculatePlayfieldsInfo(param1:Boolean = false) : void
      {
         var _loc3_:PlayfieldInfoVO = null;
         var _loc4_:int = 0;
         if(Boolean(this.getFieldSettings(this.getCurrentPlayFieldId())) && this.getFieldSettings(this.getCurrentPlayFieldId()).fType <= 0)
         {
            return;
         }
         var _loc2_:AppProxy = facade.getProxy(AppProxy);
         if(_loc2_.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            return;
         }
         if(param1)
         {
            this._recalculateAttraction = true;
         }
         if(!this._recalculateAttraction)
         {
            return;
         }
         if(this.globalPlayfieldsInfo)
         {
            this.globalPlayfieldsInfo.reset();
         }
         if(this.fieldIds)
         {
            for each(_loc4_ in this.fieldIds)
            {
               if(this.getFieldSettings(_loc4_) != null)
               {
                  if(!(_loc4_ < 0 || this.getFieldSettings(_loc4_).fType <= 0))
                  {
                     this.calculateRealAttraction(_loc4_);
                     _loc3_ = this.getFieldInfo(_loc4_);
                     this.globalPlayfieldsInfo.currentAttraction += _loc3_.currentAttraction;
                     this.globalPlayfieldsInfo.staticAttraction += _loc3_.staticAttraction;
                     this.globalPlayfieldsInfo.maxAttraction += _loc3_.maxAttraction;
                     this.globalPlayfieldsInfo.fieldAttraction += _loc3_.fieldAttraction;
                     this.globalPlayfieldsInfo.fieldMaxAttraction += _loc3_.fieldMaxAttraction;
                     this.globalPlayfieldsInfo.fieldCurrentAttraction += _loc3_.fieldCurrentAttraction;
                     this.globalPlayfieldsInfo.storesMoney += _loc3_.storesMoney;
                  }
               }
            }
         }
         this._recalculateAttraction = false;
         sendNotification(Note.PLAYFIELD_INFO_SETTINGS_UPDATED);
      }
      
      private function changeStoreMoney(param1:String, param2:int, param3:StoreData, param4:Boolean) : void
      {
         var _loc7_:StoreShopData = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param4)
         {
            _loc7_ = this.itemConfigProxy.getStoreData(param3.itemId);
            if(param3.collectTimeStamp > TimeManager.currentTime)
            {
               _loc5_ = _loc7_.moneyPerHour;
            }
         }
         _loc6_ = _loc5_ - this.getAttMemRef(param1,"mo");
         this.getFieldInfo(param2).storesMoney = this.getFieldInfo(param2).storesMoney + _loc6_;
         if(param4)
         {
            this._recalculateAttraction = this._recalculateAttraction || _loc6_ != 0;
            this.setAttMemRef(param1,"mo",_loc5_);
         }
         else
         {
            this._recalculateAttraction = this._recalculateAttraction || true;
         }
      }
      
      private function calculateRealAttraction(param1:int) : void
      {
         if(Boolean(this.getFieldSettings(param1)) && this.getFieldSettings(param1).fType <= 0)
         {
            return;
         }
         if(!this._recalculateAttraction)
         {
            return;
         }
         this.mainConfigProxy = this.mainConfigProxy || facade.getProxy(MainConfigProxy);
         var _loc2_:int = this.getFieldInfo(param1).staticAttraction;
         var _loc3_:int = this.getFieldInfo(param1).maxAttraction;
         var _loc4_:int = this.getFieldInfo(param1).currentAttraction;
         var _loc5_:Number = 0;
         if(_loc2_ > _loc3_ * 0.2)
         {
            _loc2_ = Math.floor(_loc3_ * 0.2);
         }
         this.getFieldInfo(param1).fieldAttraction = _loc2_ + _loc4_;
         this.getFieldInfo(param1).fieldMaxAttraction = _loc2_ + _loc3_;
         this.getFieldInfo(param1).fieldCurrentAttraction = Math.max(0,_loc2_ + _loc4_ - Math.ceil(this.getCurrentTrash(param1) / this.mainConfigProxy.trashFactorForAttraction));
      }
      
      private function changeCurrentAttraction(param1:String, param2:int, param3:CageData, param4:Boolean) : void
      {
         var _loc6_:AnimalSpeciesVO = null;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc5_:Number = 0;
         if(param3.speciesId > 0 && (param3.healthTimeStamp > TimeManager.currentTime || param3.sickTimeStamp > TimeManager.currentTime) && param4 && param3.active == 1)
         {
            _loc6_ = this.itemConfigProxy.getShopAnimalSpecie(param3.speciesId);
            _loc7_ = this.itemConfigProxy.getCageSpecieBonus(param3.speciesId,param3.itemId);
            _loc8_ = _loc7_ == CageSpecieBonus.CRAZY ? 1.1 : 1;
            _loc9_ = 0;
            _loc10_ = param3.cleanTimeStamp > TimeManager.currentTime ? 0.3 : 0;
            _loc11_ = param3.waterTimeStamp > TimeManager.currentTime ? 0.3 : 0;
            _loc12_ = param3.feedTimeStamp > TimeManager.currentTime ? 0.3 : 0;
            _loc13_ = param3.cuddleTimeStamp > TimeManager.currentTime ? 0.5 : 0;
            _loc14_ = 0.1 + _loc10_ + _loc11_ + _loc12_ + _loc13_;
            _loc5_ += param3.maleCount * _loc6_.attraction[0];
            _loc5_ = _loc5_ + param3.femaleCount * _loc6_.attraction[1];
            _loc5_ = _loc5_ + param3.childCount * _loc6_.attraction[2];
            _loc5_ = Math.round(_loc5_ * _loc14_ * _loc8_);
            _loc9_ = _loc5_ - this.getAttMemRef(param1,"ca");
            this.getFieldInfo(param2).currentAttraction = this.getFieldInfo(param2).currentAttraction + _loc9_;
            this.setAttMemRef(param1,"ca",_loc5_);
            this._recalculateAttraction = this._recalculateAttraction || _loc9_ != 0;
         }
         else if(!param4 || param3.active != 1)
         {
            this.getFieldInfo(param2).currentAttraction = this.getFieldInfo(param2).currentAttraction - this.getAttMemRef(param1,"ca");
            if(param3.active != 1)
            {
               this.setAttMemRef(param1,"ca",0);
            }
            this._recalculateAttraction = this._recalculateAttraction || true;
         }
      }
      
      private function changeStaticAttraction(param1:String, param2:int, param3:FieldItemData, param4:Boolean) : void
      {
         var _loc7_:DecorData = null;
         var _loc8_:DecorShopData = null;
         var _loc9_:CageData = null;
         var _loc10_:CageShopData = null;
         var _loc11_:RoadData = null;
         var _loc12_:RoadShopData = null;
         var _loc13_:StoreData = null;
         var _loc14_:StoreShopData = null;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(param4)
         {
            if(param3 is DecorData)
            {
               _loc7_ = param3 as DecorData;
               _loc8_ = this.itemConfigProxy.getDecorationData(param3.itemId);
               if(_loc8_ == null)
               {
                  return;
               }
               _loc5_ = _loc8_.getAttraction();
            }
            else if(param3 is CageData)
            {
               _loc9_ = param3 as CageData;
               _loc10_ = this.itemConfigProxy.getCageData(param3.itemId);
               if(_loc10_ == null)
               {
                  return;
               }
               _loc5_ = _loc10_.getAttraction();
            }
            else if(param3 is RoadData)
            {
               _loc11_ = param3 as RoadData;
               _loc12_ = this.itemConfigProxy.getRoadData(param3.itemId);
               if(_loc12_ == null)
               {
                  return;
               }
               _loc5_ = _loc12_.getAttraction();
            }
            else if(param3 is StoreData)
            {
               _loc13_ = param3 as StoreData;
               _loc14_ = this.itemConfigProxy.getStoreData(param3.itemId);
               if(_loc14_ == null)
               {
                  return;
               }
               _loc5_ = _loc14_.getAttraction();
            }
         }
         _loc6_ = _loc5_ - this.getAttMemRef(param1,"sa");
         this.getFieldInfo(param2).staticAttraction = this.getFieldInfo(param2).staticAttraction + _loc6_;
         if(param4)
         {
            this._recalculateAttraction = this._recalculateAttraction || _loc6_ != 0;
            this.setAttMemRef(param1,"sa",_loc5_);
         }
         else
         {
            this._recalculateAttraction = this._recalculateAttraction || true;
         }
      }
      
      private function changeMaxAttraction(param1:String, param2:int, param3:CageData, param4:Boolean) : void
      {
         var _loc6_:AnimalSpeciesVO = null;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc5_:Number = 0;
         if(param3.speciesId > 0 && param4)
         {
            _loc6_ = this.itemConfigProxy.getShopAnimalSpecie(param3.speciesId);
            _loc7_ = this.itemConfigProxy.getCageSpecieBonus(param3.speciesId,param3.itemId);
            _loc8_ = _loc7_ == CageSpecieBonus.CRAZY ? 1.1 : 1;
            _loc5_ += param3.maleCount * _loc6_.attraction[0];
            _loc5_ = _loc5_ + param3.femaleCount * _loc6_.attraction[1];
            _loc5_ = _loc5_ + param3.childCount * _loc6_.attraction[2];
            _loc5_ = Math.round(_loc5_ * 1.5 * _loc8_);
            this.getFieldInfo(param2).maxAttraction = this.getFieldInfo(param2).maxAttraction + (_loc5_ - this.getAttMemRef(param1,"ma"));
            this.setAttMemRef(param1,"ma",_loc5_);
            this._recalculateAttraction = this._recalculateAttraction || _loc5_ != 0;
         }
         else if(!param4)
         {
            this.getFieldInfo(param2).maxAttraction = this.getFieldInfo(param2).maxAttraction - this.getAttMemRef(param1,"ma");
            this._recalculateAttraction = this._recalculateAttraction || true;
         }
      }
      
      public function changeAttractions(param1:int, param2:FieldItemData, param3:Boolean) : void
      {
         var _loc4_:String = null;
         if(this.getFieldSettings(param1) == null || param2 == null)
         {
            return;
         }
         if(this.getFieldSettings(param1) && this.getFieldSettings(param1).fType <= 0 || param1 == 0)
         {
            return;
         }
         if(param1 > 0 && param2.uniqueId > 0 && this.fieldIds.length > 0)
         {
            this.itemConfigProxy = this.itemConfigProxy || facade.getProxy(ItemConfigProxy);
            this.mainConfigProxy = this.mainConfigProxy || facade.getProxy(MainConfigProxy);
            _loc4_ = this.getItemKey(param1,param2.category,param2.uniqueId);
            if(param2 is DecorData || param2 is RoadData || param2 is StoreData)
            {
               this.changeStaticAttraction(_loc4_,param1,param2,param3);
            }
            else if(param2 is CageData)
            {
               this.changeStaticAttraction(_loc4_,param1,param2,param3);
               this.changeMaxAttraction(_loc4_,param1,param2 as CageData,param3);
               this.changeCurrentAttraction(_loc4_,param1,param2 as CageData,param3);
            }
            if(param2 is StoreData)
            {
               this.changeStoreMoney(_loc4_,param1,param2 as StoreData,param3);
            }
            this.calculateRealAttraction(param1);
            if(!param3)
            {
               this.flushAttMemRef(_loc4_);
            }
         }
      }
      
      public function getGlobalMoneyPerHour() : int
      {
         return Math.round(Math.sqrt(this.globalPlayfieldsInfo.fieldAttraction) * 35 + this.globalPlayfieldsInfo.storesMoney);
      }
      
      public function getAttractionPercent(param1:int) : Number
      {
         if(this.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_FOREIGN)
         {
            return 0;
         }
         return this.getFieldInfo(param1).fieldCurrentAttraction / this.getFieldInfo(param1).fieldMaxAttraction;
      }
      
      public function getGlobalAttractionPercent() : Number
      {
         return this.globalPlayfieldsInfo.fieldMaxAttraction > 0 ? this.globalPlayfieldsInfo.fieldCurrentAttraction / this.globalPlayfieldsInfo.fieldMaxAttraction : 0;
      }
      
      public function getCurrentTrash(param1:int) : int
      {
         return this.getFieldSettings(param1).trashbins + this.getFieldSettings(param1).trashroads;
      }
   }
}

