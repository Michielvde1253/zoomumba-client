package com.bigpoint.zoomumba.model.playfield
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.items.DropVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.user.material.vo.MaterialVO;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PlayFieldProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "PlayFieldProxy";
      
      private var dictionaryModel:Dictionary;
      
      private var countModel:Dictionary;
      
      private var itemDictionary:Dictionary;
      
      private var playfieldSettings:PlayfieldSettingsProxy;
      
      public function PlayFieldProxy()
      {
         super(NAME);
         this.dictionaryModel = new Dictionary();
         this.countModel = new Dictionary();
      }
      
      override public function onRegister() : void
      {
         this.playfieldSettings = facade.getProxy(PlayfieldSettingsProxy);
      }
      
      private function getKeyByType(param1:int, param2:int) : String
      {
         return "fId:" + param1.toString() + ";" + "cat:" + param2.toString();
      }
      
      private function getCountKey(param1:int, param2:int, param3:int) : String
      {
         return "fId:" + param1.toString() + ";" + "cat:" + param2.toString() + ";" + "itemId:" + param3.toString();
      }
      
      private function getCategoryFromItemData(param1:FieldItemData) : int
      {
         var _loc2_:int = param1.category;
         if(param1.category == Categories.DECOR)
         {
         }
         return _loc2_;
      }
      
      private function changeItemCount(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:String = this.getCountKey(param2,param3,param4);
         var _loc6_:int = int(int(this.countModel[_loc5_]) || 0);
         this.countModel[_loc5_] = _loc6_ + param1;
      }
      
      private function getInternalItemCount(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:String = this.getCountKey(param1,param2,param3);
         return int(this.countModel[_loc4_]) || 0;
      }
      
      public function getItemCount(param1:int, param2:int = -1, param3:Boolean = false, param4:int = -1) : int
      {
         var _loc6_:FieldItemData = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:FieldItemData = null;
         var _loc5_:int = 0;
         if(param2 != -1 && param4 != -1)
         {
            _loc5_ = this.getInternalItemCount(param2,param1,param4);
         }
         else if(param2 != -1 && param4 == -1)
         {
            for each(_loc6_ in this.dictionaryModel[this.getKeyByType(param2,param1)])
            {
               _loc5_ += this.getInternalItemCount(param2,param1,_loc6_.itemId);
            }
         }
         else if(param2 == -1 && param4 != -1)
         {
            for each(_loc7_ in this.playfieldSettings.fieldIds)
            {
               if(_loc7_ != -1 || _loc7_ != 0 || _loc7_ == 0 && param3)
               {
                  _loc5_ += this.getInternalItemCount(_loc7_,param1,param4);
               }
            }
         }
         else
         {
            for each(_loc8_ in this.playfieldSettings.fieldIds)
            {
               for each(_loc9_ in this.dictionaryModel[this.getKeyByType(_loc8_,param1)])
               {
                  if(_loc8_ != -1 || _loc8_ != 0 || _loc8_ == 0 && param3)
                  {
                     _loc5_ += this.getInternalItemCount(_loc8_,param1,_loc9_.itemId);
                  }
               }
            }
         }
         return _loc5_;
      }
      
      public function setItem(param1:FieldItemData, param2:int) : void
      {
         var _loc7_:Object = null;
         var _loc8_:Dictionary = null;
         var _loc3_:int = this.getCategoryFromItemData(param1);
         var _loc4_:String = this.getKeyByType(param2,_loc3_);
         var _loc5_:Dictionary = this.dictionaryModel[_loc4_] || new Dictionary();
         var _loc6_:Boolean = _loc3_ == Categories.CAGE || _loc3_ == Categories.DECOR || _loc3_ == Categories.ROAD || _loc3_ == Categories.STORE;
         if(param1.del == 1 && param1.inv != 1)
         {
            this.changeItemCount(-1,param2,_loc3_,param1.itemId);
            if(_loc6_)
            {
               this.playfieldSettings.changeAttractions(param2,param1,false);
            }
            delete _loc5_[param1.uniqueId];
         }
         else
         {
            if(param1.inv == 1)
            {
               delete _loc5_[param1.uniqueId];
               _loc7_ = this.getKeyByType(0,_loc3_);
               _loc8_ = this.dictionaryModel[_loc7_] || new Dictionary();
               _loc8_[param1.uniqueId] = param1;
               this.dictionaryModel[_loc7_] = _loc8_;
               this.changeItemCount(1,0,_loc3_,param1.itemId);
               if(_loc6_)
               {
                  this.playfieldSettings.changeAttractions(param2,param1,false);
               }
               return;
            }
            _loc5_[param1.uniqueId] = param1;
            this.changeItemCount(1,param2,_loc3_,param1.itemId);
            if(_loc6_)
            {
               this.playfieldSettings.changeAttractions(param2,param1,true);
            }
         }
         this.dictionaryModel[_loc4_] = _loc5_;
         this.updateItemCount();
      }
      
      public function getInventoryForCategory(param1:int) : Dictionary
      {
         return this.dictionaryModel[this.getKeyByType(0,param1)];
      }
      
      public function getFieldItem(param1:int, param2:int, param3:int) : FieldItemData
      {
         return !!this.dictionaryModel[this.getKeyByType(param1,param2)] ? this.dictionaryModel[this.getKeyByType(param1,param2)][param3] || null : null;
      }
      
      private function updateItemCount() : void
      {
         TimeManager.unregisterTickFunction(this.doSendUpdateRequest);
         TimeManager.registerTickFunction(this.doSendUpdateRequest);
      }
      
      private function doSendUpdateRequest() : void
      {
         sendNotification(PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED);
         TimeManager.unregisterTickFunction(this.doSendUpdateRequest);
      }
      
      public function getAnimalsFromCage(param1:int) : Vector.<AnimalData>
      {
         var _loc5_:AnimalData = null;
         var _loc2_:String = this.getKeyByType(this.playfieldSettings.getCurrentPlayFieldId(),Categories.ANIMAL);
         var _loc3_:Dictionary = this.dictionaryModel[_loc2_];
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Vector.<AnimalData> = new Vector.<AnimalData>();
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.cId == param1)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function getCageForAnimal(param1:int) : CageData
      {
         var _loc3_:String = null;
         var _loc4_:Dictionary = null;
         var _loc5_:AnimalData = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.playfieldSettings.fieldIds.length)
         {
            _loc3_ = this.getKeyByType(this.playfieldSettings.fieldIds[_loc2_],Categories.ANIMAL);
            _loc4_ = this.dictionaryModel[_loc3_];
            if(_loc4_)
            {
               for each(_loc5_ in _loc4_)
               {
                  if(_loc5_.uniqueId == param1)
                  {
                     return this.getCage(this.playfieldSettings.fieldIds[_loc2_],_loc5_.cId);
                  }
               }
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCage(param1:int, param2:int) : CageData
      {
         var _loc3_:String = this.getKeyByType(param1,Categories.CAGE);
         var _loc4_:Dictionary = this.dictionaryModel[_loc3_];
         if((Boolean(_loc4_)) && Boolean(_loc4_[param2]))
         {
            return _loc4_[param2];
         }
         return null;
      }
      
      public function getCageList() : Vector.<CageData>
      {
         var _loc4_:CageData = null;
         var _loc1_:String = this.getKeyByType(0,Categories.CAGE);
         var _loc2_:Vector.<CageData> = new Vector.<CageData>();
         if(!_loc1_)
         {
            return _loc2_;
         }
         var _loc3_:Dictionary = this.dictionaryModel[_loc1_];
         for each(_loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_ as CageData);
         }
         return _loc2_;
      }
      
      public function getCageWithConfigList(param1:Boolean = false) : Vector.<ShopItemData>
      {
         var _loc6_:CageData = null;
         var _loc7_:CageShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:String = this.getKeyByType(0,Categories.CAGE);
         var _loc4_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc3_)
         {
            return _loc4_;
         }
         var _loc5_:Dictionary = this.dictionaryModel[_loc3_];
         for each(_loc6_ in _loc5_)
         {
            _loc7_ = _loc2_.getCageData(_loc6_.itemId);
            if(_loc6_.uniqueId != -1 && Boolean(_loc7_))
            {
               if(!(param1 == true && _loc6_.playFieldId != 0))
               {
                  _loc7_.uniqueId = _loc6_.uniqueId;
                  _loc7_.level = _loc6_.level;
                  _loc4_.push(this.itemTypeTransformer(_loc7_) as ShopItemData);
               }
            }
         }
         return _loc4_;
      }
      
      public function getAnimalWithConfigList(param1:Boolean = false) : Vector.<ShopItemData>
      {
         var _loc6_:AnimalData = null;
         var _loc7_:AnimalShopData = null;
         var _loc8_:AnimalSpeciesVO = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:String = this.getKeyByType(0,Categories.ANIMAL);
         var _loc4_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc3_)
         {
            return _loc4_;
         }
         var _loc5_:Dictionary = this.dictionaryModel[_loc3_];
         for each(_loc6_ in _loc5_)
         {
            if(!(param1 == true && _loc6_.playFieldId != 0))
            {
               _loc7_ = _loc2_.getAnimalData(_loc6_.animalId);
               if(_loc7_)
               {
                  _loc8_ = _loc2_.getShopAnimalSpecie(_loc7_.speciesId);
                  _loc7_.uniqueId = _loc6_.uniqueId;
                  _loc7_.raisable = _loc8_.raisable;
                  _loc7_.raisingTime = _loc8_.raisingTime;
                  _loc7_.raisingCost = _loc8_.raisingCost;
                  _loc7_.raisingDirectCost = _loc8_.raisingDirectCost;
                  _loc7_.genusId = _loc8_.genusId;
                  _loc7_.breedableAdvance = _loc8_.breedableAdvance;
                  _loc7_.breedAdvanceTime = _loc8_.breedAdvanceTime;
                  _loc7_.breedAdvanceCost = _loc8_.breedAdvanceCost;
                  _loc7_.breedAdvanceReward = _loc8_.breedAdvanceReward;
                  _loc7_.attraction = _loc8_.attraction;
                  _loc4_.push(this.itemTypeTransformer(_loc7_) as ShopItemData);
               }
            }
         }
         return _loc4_;
      }
      
      public function getSpecialWithConfigList() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.storageWithConfig)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getRoadsWithConfigList() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc3_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.roadWithConfig)
         {
            _loc1_.push(_loc2_);
         }
         for each(_loc3_ in this.trashWithConfig)
         {
            _loc1_.push(_loc3_);
         }
         return _loc1_;
      }
      
      public function getMaterialsWithConfigList() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.materialsWithConfig)
         {
            if(_loc2_.count > 0)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getMaterialsWithConfigListAsObject(param1:Boolean = false) : Vector.<Object>
      {
         var _loc3_:ShopItemData = null;
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         if(param1)
         {
            for each(_loc3_ in this.normalMaterialsWithConfig)
            {
               _loc2_.push(_loc3_);
            }
         }
         else
         {
            for each(_loc3_ in this.materialsWithConfig)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getMaterialShopDataById(param1:int) : MaterialShopData
      {
         var _loc6_:MaterialShopData = null;
         var _loc7_:MaterialVO = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         var _loc4_:MaterialProxy = facade.getProxy(MaterialProxy);
         var _loc5_:Vector.<MaterialVO> = _loc4_.materialData;
         for each(_loc7_ in _loc5_)
         {
            _loc6_ = _loc2_.getMaterialData(_loc7_.id);
            if((Boolean(_loc6_)) && _loc6_.itemId == param1)
            {
               _loc6_.materialCount = _loc4_.getMaterialAmount(_loc7_.id);
               _loc6_.internalType = ItemInternalTypes.MATERIAL;
               _loc6_.count = _loc4_.getMaterialAmount(_loc7_.id);
               return _loc6_;
            }
         }
         return null;
      }
      
      public function getRoadFromInventory() : Vector.<Object>
      {
         return new Vector.<Object>();
      }
      
      private function get trashWithConfig() : Vector.<ShopItemData>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:TrashbinShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.TRASHBIN);
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getTrashBinData(_loc5_.itemId);
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_) as ShopItemData);
         }
         return _loc3_;
      }
      
      private function get roadWithConfig() : Vector.<ShopItemData>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:RoadShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.ROAD);
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getRoadData(_loc5_.itemId);
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_));
         }
         return _loc3_;
      }
      
      private function get normalMaterialsWithConfig() : Vector.<ShopItemData>
      {
         var _loc5_:MaterialVO = null;
         var _loc6_:MaterialShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc3_:MaterialProxy = facade.getProxy(MaterialProxy);
         var _loc4_:Vector.<MaterialVO> = _loc3_.materialData;
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getMaterialData(_loc5_.id);
            if((Boolean(_loc6_)) && _loc6_.isRecyclable == 1)
            {
               _loc6_.materialCount = _loc3_.getMaterialAmount(_loc5_.id);
               _loc6_.count = _loc3_.getMaterialAmount(_loc5_.id);
               _loc2_.push(this.itemTypeTransformer(_loc6_));
            }
         }
         return _loc2_;
      }
      
      private function get materialsWithConfig() : Vector.<ShopItemData>
      {
         var _loc5_:MaterialVO = null;
         var _loc6_:MaterialShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc3_:MaterialProxy = facade.getProxy(MaterialProxy);
         var _loc4_:Vector.<MaterialVO> = _loc3_.materialData;
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getMaterialData(_loc5_.id);
            if(_loc6_)
            {
               _loc6_.materialCount = _loc3_.getMaterialAmount(_loc5_.id);
               _loc6_.count = _loc3_.getMaterialAmount(_loc5_.id);
               _loc6_.itemId = _loc6_.materialId;
               _loc2_.push(this.itemTypeTransformer(_loc6_));
            }
         }
         return _loc2_;
      }
      
      private function get storageWithConfig() : Vector.<ShopItemData>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:StorageShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.STORAGE);
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getStorageData(_loc5_.itemId);
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_) as ShopItemData);
         }
         return _loc3_;
      }
      
      private function get nurseryWithConfig() : Vector.<Object>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:NurseryShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.NURSERY);
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getNurseryData();
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_) as NurseryShopData);
         }
         return _loc3_;
      }
      
      private function get breedingLabWithConfig() : Vector.<Object>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:BreedingLabShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.BREEDING_LAB);
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getBreedingLabData();
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_) as BreedingLabShopData);
         }
         return _loc3_;
      }
      
      public function getDecoWithConfigList() : Vector.<ShopItemData>
      {
         var _loc5_:FieldItemData = null;
         var _loc6_:DecorShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.DECOR);
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getDecorationData(_loc5_.itemId);
            if(_loc6_ == null)
            {
               return null;
            }
            _loc6_.uniqueId = _loc5_.uniqueId;
            _loc3_.push(this.itemTypeTransformer(_loc6_) as InheritedShopData);
         }
         return _loc3_;
      }
      
      public function getDecoWithConfigListByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:DecorShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getDecorationData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_) as InheritedShopData);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function getRoadWithConfigListByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:RoadShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getRoadData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_));
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getShopsWithConfigListByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:StoreShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getStoreData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_));
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getCageWithConfigListByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:CageShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getCageData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_) as ShopItemData);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getRoadsWithConfigListByIds(param1:Vector.<int>, param2:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc4_:ShopItemData = null;
         var _loc5_:ShopItemData = null;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc4_ in this.getRoadWithConfigByIds(param1))
         {
            _loc3_.push(_loc4_);
         }
         for each(_loc5_ in this.getTrashWithConfigByIds(param2))
         {
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      private function getTrashWithConfigByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:TrashbinShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getTrashBinData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_) as ShopItemData);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function getRoadWithConfigByIds(param1:Vector.<int>) : Vector.<ShopItemData>
      {
         var _loc5_:RoadShopData = null;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = _loc2_.getRoadData(param1[_loc4_]);
            if(_loc5_)
            {
               _loc3_.push(this.itemTypeTransformer(_loc5_));
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getShopsWithConfigList() : Vector.<ShopItemData>
      {
         var _loc5_:StoreData = null;
         var _loc6_:StoreShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:String = this.getKeyByType(0,Categories.STORE);
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc2_)
         {
            return _loc3_;
         }
         var _loc4_:Dictionary = this.dictionaryModel[_loc2_];
         for each(_loc5_ in _loc4_)
         {
            _loc6_ = _loc1_.getStoreData(_loc5_.itemId);
            if(_loc6_)
            {
               _loc6_.uniqueId = _loc5_.uniqueId;
               _loc3_.push(this.itemTypeTransformer(_loc6_));
            }
         }
         return _loc3_;
      }
      
      public function getDefaultWithConfigListByCategorieId(param1:int, param2:int, param3:Boolean = false) : Vector.<ShopItemData>
      {
         var _loc8_:FieldItemData = null;
         var _loc9_:ShopItemData = null;
         var _loc4_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc5_:String = this.getKeyByType(0,param1);
         var _loc6_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         if(!_loc5_)
         {
            return _loc6_;
         }
         var _loc7_:Dictionary = this.dictionaryModel[_loc5_];
         for each(_loc8_ in _loc7_)
         {
            if(_loc8_.itemId == param2 && _loc8_.category == param1)
            {
               _loc9_ = _loc4_.getShopItemDataByCategorieAndItemID(param1,_loc8_.itemId);
               if(_loc9_)
               {
                  if(!(param3 == true && _loc8_.playFieldId != 0))
                  {
                     _loc9_.uniqueId = _loc8_.uniqueId;
                     _loc6_.push(_loc9_ as ShopItemData);
                  }
               }
            }
         }
         return _loc6_;
      }
      
      public function getItemsConfigListByConfigId(param1:int, param2:int = -1, param3:Boolean = false) : Vector.<ShopItemData>
      {
         var _loc6_:ShopItemData = null;
         var _loc7_:Object = null;
         var _loc4_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc5_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc8_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         switch(param1)
         {
            case Categories.ANIMAL:
               _loc8_ = this.getAnimalWithConfigList(param3);
               for each(_loc7_ in _loc8_)
               {
                  _loc6_ = _loc7_ as ShopItemData;
                  _loc4_.push(_loc6_);
               }
               return _loc4_;
            case Categories.CAGE:
               _loc8_ = this.getCageWithConfigList(param3);
               for each(_loc7_ in _loc8_)
               {
                  _loc6_ = _loc7_ as ShopItemData;
                  _loc4_.push(_loc6_);
               }
               return _loc4_;
            case Categories.ROAD:
               _loc4_ = this.getDefaultWithConfigListByCategorieId(param1,param2,param3);
               break;
            default:
               _loc4_ = this.getDefaultWithConfigListByCategorieId(param1,param2,param3);
         }
         if(param2 != -1)
         {
            for each(_loc6_ in _loc4_)
            {
               if(_loc6_.itemId == param2)
               {
                  _loc5_.push(_loc6_);
               }
            }
            _loc4_ = _loc5_;
         }
         return _loc4_;
      }
      
      private function itemTypeTransformer(param1:InheritedShopData) : InheritedShopData
      {
         switch(param1)
         {
            case AnimalSpeciesVO:
               param1.internalType = ItemInternalTypes.SPECIE;
               break;
            case MaterialShopData:
               param1.internalType = ItemInternalTypes.MATERIAL;
               break;
            case CageShopData:
               param1.internalType = ItemInternalTypes.CAGE;
               break;
            case StoreShopData:
               param1.internalType = ItemInternalTypes.STORE;
               break;
            case DecorShopData:
               param1.internalType = ItemInternalTypes.DECORATION;
               break;
            case ResourceShopData:
               param1.internalType = ItemInternalTypes.RESOURCE;
               break;
            case AssistanceShopData:
               param1.internalType = ItemInternalTypes.ASSISTANT;
               break;
            case PremiumShopData:
               param1.internalType = ItemInternalTypes.SPECIAL;
               break;
            case ResourceShopData:
               param1.internalType = ItemInternalTypes.RESOURCE;
               break;
            case RoadShopData:
               param1.internalType = ItemInternalTypes.ROAD;
               break;
            case TrashbinShopData:
               param1.internalType = ItemInternalTypes.TRASHBIN;
               break;
            case AnimalShopData:
               param1.internalType = ItemInternalTypes.ANIMAL;
         }
         return param1;
      }
      
      public function haveInInventory(param1:int, param2:int) : Boolean
      {
         var _loc5_:FieldItemData = null;
         var _loc3_:String = this.getKeyByType(0,param1);
         var _loc4_:Dictionary = this.dictionaryModel[_loc3_];
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.itemId == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function haveSpecieInInventory(param1:int, param2:int) : Boolean
      {
         var _loc5_:FieldItemData = null;
         var _loc3_:String = this.getKeyByType(0,param1);
         var _loc4_:Dictionary = this.dictionaryModel[_loc3_];
         for each(_loc5_ in _loc4_)
         {
            if(AnimalData(_loc5_).specieId == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getItemsByType(param1:int, param2:int) : Vector.<FieldItemData>
      {
         var _loc6_:Object = null;
         var _loc3_:String = this.getKeyByType(param1,param2);
         var _loc4_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         var _loc5_:Dictionary = this.dictionaryModel[_loc3_];
         for(_loc6_ in _loc5_)
         {
            _loc4_.push(_loc5_[_loc6_] as FieldItemData);
         }
         return _loc4_;
      }
      
      public function getItemByTypeAndId(param1:int, param2:int) : FieldItemData
      {
         var _loc3_:Vector.<FieldItemData> = this.getItemsByType(this.playfieldSettings.getCurrentPlayFieldId(),param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].uniqueId == param2)
            {
               return _loc3_[_loc4_] as FieldItemData;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getItemByTypeAndIdFromInventory(param1:int, param2:int) : FieldItemData
      {
         var _loc3_:Vector.<FieldItemData> = this.getItemsByType(0,param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].uniqueId == param2)
            {
               return _loc3_[_loc4_] as FieldItemData;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function hackItemTableIn(param1:Dictionary) : void
      {
         this.itemDictionary = param1;
      }
      
      public function getCageActionDrop(param1:int, param2:int) : DropVO
      {
         var _loc3_:DropVO = null;
         var _loc4_:Cage = this.itemDictionary[param1 * 10 + Categories.CAGE] as Cage;
         if(_loc4_)
         {
            switch(param2)
            {
               case CageActionIds.FEED:
                  _loc3_ = _loc4_.feedDrop;
                  break;
               case CageActionIds.WATER:
                  _loc3_ = _loc4_.waterDrop;
                  break;
               case CageActionIds.CLEAN:
                  _loc3_ = _loc4_.cleanDrop;
                  break;
               case CageActionIds.CUDDLE:
                  _loc3_ = _loc4_.cuddleDrop;
                  break;
               case CageActionIds.HEAL:
                  _loc3_ = _loc4_.healDrop;
                  break;
               case CageActionIds.BREAD:
                  _loc3_ = _loc4_.breadDrop;
                  break;
               case CageActionIds.SUPERFEED:
                  _loc3_ = _loc4_.superFeedDrop;
                  break;
               case CageActionIds.POWERFEED:
                  _loc3_ = _loc4_.powerFeedDrop;
                  break;
               case CageActionIds.SUPERHEAL:
                  _loc3_ = _loc4_.superHealDrop;
                  break;
               case CageActionIds.SUPERBREAD:
                  _loc3_ = _loc4_.superBreadDrop;
                  break;
               default:
                  sendNotification(Note.WARNING_REPORT,"PlayFieldProxy: getCageActionDrop - drop for action : cageActionId is not handled");
            }
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"PlayFieldProxy: getCageActionDrop - cage item with unique id:" + param1 + " is not found.");
         }
         return _loc3_ || new DropVO();
      }
      
      public function getItemsByCategory(param1:int) : Vector.<ItemAbstract>
      {
         var _loc3_:ItemAbstract = null;
         var _loc2_:Vector.<ItemAbstract> = new Vector.<ItemAbstract>();
         for each(_loc3_ in this.itemDictionary)
         {
            if(_loc3_.category == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getItemPossition(param1:int, param2:int) : Point
      {
         var _loc3_:ItemAbstract = this.itemDictionary[param2 * 10 + param1] as ItemAbstract;
         if(!_loc3_)
         {
            return new Point(0,0);
         }
         return new Point(_loc3_.posX,_loc3_.posY);
      }
      
      public function getItem(param1:int, param2:int) : ItemAbstract
      {
         return this.itemDictionary[param2 * 10 + param1] as ItemAbstract;
      }
      
      public function isActionValid(param1:int, param2:int) : Boolean
      {
         var _loc6_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Cage = this.itemDictionary[param1 * 10 + Categories.CAGE] as Cage;
         var _loc5_:int = TimeManager.currentTime;
         switch(param2)
         {
            case CageActionIds.FEED:
               _loc6_ = Math.floor((_loc4_.feedTimeStamp - _loc5_) / _loc4_.feedTime * 100);
               if(_loc6_ < MainConfig.PERCENTAGE_FOR_ACTIONS)
               {
                  _loc3_ = true;
               }
         }
         return _loc3_;
      }
   }
}

