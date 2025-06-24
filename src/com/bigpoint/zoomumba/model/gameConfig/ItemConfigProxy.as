package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemConfigVO;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.PowerupShopData;
   import com.bigpoint.zoorama.data.settings.PremiumPackShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.SurpriseBoxShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ItemConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "ItemConfigProxy";
      
      private var userProxy:UserProxy;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function ItemConfigProxy(param1:ItemConfigVO)
      {
         super(NAME,param1);
      }
      
      private function get itemConfigVO() : ItemConfigVO
      {
         return data as ItemConfigVO;
      }
      
      override public function onRegister() : void
      {
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      public function getStorageData(param1:int) : StorageShopData
      {
         return this.itemConfigVO.storageData[param1];
      }
      
      public function getExpansionData(param1:int) : ExpansionShopData
      {
         return this.itemConfigVO.expansionData[param1];
      }
      
      public function getSpeciesOfFood(param1:int) : Array
      {
         return this.itemConfigVO.foodSpecieData[param1];
      }
      
      public function getAllShopAnimalSpeciesAsVector() : Vector.<AnimalSpeciesVO>
      {
         var _loc2_:AnimalSpeciesVO = null;
         var _loc1_:Vector.<AnimalSpeciesVO> = new Vector.<AnimalSpeciesVO>();
         for each(_loc2_ in this.itemConfigVO.animalSpecieData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getShopAnimalSpecie(param1:int) : AnimalSpeciesVO
      {
         var _loc2_:AnimalSpeciesVO = null;
         for each(_loc2_ in this.itemConfigVO.animalSpecieData)
         {
            if(_loc2_.speciesId == param1)
            {
               return _loc2_ as AnimalSpeciesVO;
            }
         }
         return null;
      }
      
      public function getShopAnimalSpecieByAnimalId(param1:int) : AnimalSpeciesVO
      {
         var _loc2_:AnimalShopData = this.getAnimalData(param1);
         if(_loc2_)
         {
            return this.getShopAnimalSpecie(_loc2_.speciesId);
         }
         return null;
      }
      
      public function getAllShopSpeciesAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.speciesData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getSpecieData(param1:int) : SpecieShopData
      {
         if(this.itemConfigVO.speciesData[param1])
         {
            return this.itemConfigVO.speciesData[param1].clone() as SpecieShopData;
         }
         return null;
      }
      
      public function getSpecieIdByItemId(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:AnimalShopData = null;
         for each(_loc3_ in this.itemConfigVO.animalsData)
         {
            if(_loc3_.itemId == param1)
            {
               _loc2_ = _loc3_.speciesId;
            }
         }
         return _loc2_;
      }
      
      public function getAllShopAnimalsAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.animalsData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getAnimalData(param1:int) : AnimalShopData
      {
         if(this.itemConfigVO.animalsData[param1])
         {
            return this.itemConfigVO.animalsData[param1].clone() as AnimalShopData;
         }
         return null;
      }
      
      public function getMaleAnimalData(param1:int) : AnimalShopData
      {
         if(this.itemConfigVO.animalsMaleData[param1])
         {
            return this.itemConfigVO.animalsMaleData[param1].clone() as AnimalShopData;
         }
         return null;
      }
      
      public function getFemaleAnimalData(param1:int) : AnimalShopData
      {
         if(this.itemConfigVO.animalsFemaleData[param1])
         {
            return this.itemConfigVO.animalsFemaleData[param1].clone() as AnimalShopData;
         }
         return null;
      }
      
      public function getChildAnimalData(param1:int) : AnimalShopData
      {
         if(this.itemConfigVO.animalsChildData[param1])
         {
            return this.itemConfigVO.animalsChildData[param1].clone() as AnimalShopData;
         }
         return null;
      }
      
      public function getShopItemDataByCategorieAndItemID(param1:int, param2:int) : ShopItemData
      {
         var _loc4_:ShopItemData = null;
         var _loc3_:Vector.<ShopItemData> = this.getAllShopItemDataAsVector(param1);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.itemId == param2)
            {
               return _loc4_.clone() as ShopItemData;
            }
         }
         return null;
      }
      
      public function getAllShopCagesAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.cagesData)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getCageData(param1:int) : CageShopData
      {
         if(this.itemConfigVO.cagesData[param1])
         {
            return this.itemConfigVO.cagesData[param1].clone() as CageShopData;
         }
         return null;
      }
      
      public function getAllShopStoresAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.storesData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getStoreData(param1:int) : StoreShopData
      {
         if(this.itemConfigVO.storesData[param1])
         {
            return this.itemConfigVO.storesData[param1].clone() as StoreShopData;
         }
         return null;
      }
      
      public function getBreedingLabData() : BreedingLabShopData
      {
         if(this.itemConfigVO.breedingLabData[int(MainConstants.SPECIAL_BREEDING_LAB)])
         {
            return this.itemConfigVO.breedingLabData[int(MainConstants.SPECIAL_BREEDING_LAB)].clone() as BreedingLabShopData;
         }
         return null;
      }
      
      public function getNurseryData() : NurseryShopData
      {
         if(this.itemConfigVO.nurseryData[int(MainConstants.SPECIAL_NURSERY)])
         {
            return this.itemConfigVO.nurseryData[int(MainConstants.SPECIAL_NURSERY)].clone() as NurseryShopData;
         }
         return null;
      }
      
      public function getAllShopDecorationsAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.decorsData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getDecorationData(param1:int) : DecorShopData
      {
         if(this.itemConfigVO.decorsData[param1])
         {
            return this.itemConfigVO.decorsData[param1].clone() as DecorShopData;
         }
         return null;
      }
      
      public function getAllShopResourcesAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.resourcesData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getAllShopRoadsAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.roadsData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getSpeciesAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.speciesData)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getRoadData(param1:int) : RoadShopData
      {
         if(this.itemConfigVO.roadsData[param1])
         {
            return this.itemConfigVO.roadsData[param1].clone() as RoadShopData;
         }
         return null;
      }
      
      public function getTrashBinData(param1:int) : TrashbinShopData
      {
         if(this.itemConfigVO.trashbinsData[param1])
         {
            return this.itemConfigVO.trashbinsData[param1].clone() as TrashbinShopData;
         }
         return null;
      }
      
      public function getStorageAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.storageData)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getAllShopTrashBinsAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.trashbinsData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getAllShopAssistanceAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.assistancesData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getAssistanceData(param1:int) : AssistanceShopData
      {
         if(this.itemConfigVO.assistancesData[param1])
         {
            return this.itemConfigVO.assistancesData[param1].clone() as AssistanceShopData;
         }
         return null;
      }
      
      public function getAllShopPremiumsAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.premiumsData)
         {
            _loc1_.push(_loc2_.clone());
         }
         return _loc1_;
      }
      
      public function getNurseryAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.nurseryData)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getBreedingLabAsVector() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.breedingLabData)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function getAllShopPremiumsByEventAsVector(param1:int) : Vector.<PremiumShopData>
      {
         var _loc3_:ShopItemData = null;
         var _loc2_:Vector.<PremiumShopData> = new Vector.<PremiumShopData>();
         for each(_loc3_ in this.itemConfigVO.premiumsData)
         {
            if(_loc3_ is PremiumShopData)
            {
               if((_loc3_ as PremiumShopData).params.eventId == param1 && (_loc3_ as PremiumShopData).premiumId != 23)
               {
                  _loc2_.push((_loc3_ as PremiumShopData).clone());
               }
            }
         }
         return _loc2_;
      }
      
      public function getPremiumData(param1:int) : PremiumShopData
      {
         if(this.itemConfigVO.premiumsData[param1])
         {
            return this.itemConfigVO.premiumsData[param1].clone() as PremiumShopData;
         }
         return null;
      }
      
      public function getNextExpansion(param1:int) : Object
      {
         var _loc5_:* = false;
         var _loc6_:Object = null;
         var _loc2_:PremiumShopData = this.getPremiumData(param1);
         var _loc3_:Object = _loc2_.params["expands"];
         var _loc4_:Object = null;
         for each(_loc6_ in _loc3_)
         {
            _loc5_ = true;
            if(_loc6_["lvl"])
            {
               _loc5_ = this.userProxy.userLevel < int(_loc6_["lvl"]);
            }
            if(_loc5_ && this.userProxy.fieldSize < int(_loc6_["fsize"]))
            {
               if(_loc4_)
               {
                  if(int(_loc4_["fsize"]) > int(_loc6_["fsize"]))
                  {
                     _loc4_ = _loc6_;
                  }
               }
               else
               {
                  _loc4_ = _loc6_;
               }
            }
         }
         return _loc4_;
      }
      
      public function getAllCageSpecieAsVector() : Vector.<Vector.<CageSpecieShopData>>
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<Vector.<CageSpecieShopData>> = new Vector.<Vector.<CageSpecieShopData>>();
         var _loc2_:int = 0;
         while(_loc2_ < this.itemConfigVO.cageSpeciesData.length)
         {
            _loc1_.push(new Vector.<CageSpecieShopData>());
            _loc3_ = 0;
            while(_loc3_ < this.itemConfigVO.cageSpeciesData[_loc2_].length)
            {
               if(this.itemConfigVO.cageSpeciesData[_loc2_][_loc3_])
               {
                  _loc1_[_loc2_].push(this.itemConfigVO.cageSpeciesData[_loc2_][_loc3_].clone() as CageSpecieShopData);
               }
               else
               {
                  _loc1_[_loc2_].push(null);
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getAllCagesBySpecieAsVector(param1:int, param2:Boolean = false) : Vector.<CageShopData>
      {
         var _loc4_:CageSpecieShopData = null;
         var _loc5_:CageShopData = null;
         var _loc6_:SpecieShopData = null;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc3_:int = this._playfieldSettingsProxy.activePlayfieldType;
         var _loc7_:Vector.<CageShopData> = new Vector.<CageShopData>();
         var _loc8_:int = int(this.itemConfigVO.cageSpeciesData.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc9_ = int(this.itemConfigVO.cageSpeciesData[_loc10_].length);
            _loc11_ = 0;
            for(; _loc11_ < _loc9_; _loc11_++)
            {
               _loc4_ = CageSpecieShopData(this.itemConfigVO.cageSpeciesData[_loc10_][_loc11_]);
               _loc5_ = CageShopData(this.itemConfigVO.cagesData[_loc10_]);
               if(_loc4_ && _loc5_ && _loc11_ == param1)
               {
                  if(param2)
                  {
                     _loc6_ = SpecieShopData(this.itemConfigVO.speciesData[param1]);
                     if(!this.canPlaceSpecieInCage(_loc6_.cageTypesPlaceable,_loc5_.type))
                     {
                        continue;
                     }
                  }
                  _loc7_.push(this.itemConfigVO.cagesData[_loc10_].clone() as CageShopData);
               }
            }
            _loc10_++;
         }
         return _loc7_;
      }
      
      private function canPlaceSpecieInCage(param1:Array, param2:int) : Boolean
      {
         var _loc3_:uint = param1.length;
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_] == param2)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public function getCageSpeciedata(param1:int, param2:int) : CageSpecieShopData
      {
         if(this.itemConfigVO.cageSpeciesData[param1][param2])
         {
            return this.itemConfigVO.cageSpeciesData[param1][param2].clone() as CageSpecieShopData;
         }
         return null;
      }
      
      public function getAllItemsForLevel(param1:int = 2) : Vector.<ShopItemData>
      {
         var _loc2_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopAnimalsAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopAssistanceAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopCagesAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopDecorationsAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopResourcesAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopRoadsAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopStoresAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         _loc3_ = this.getItemsWithRequiredUserlevel(this.getAllShopTrashBinsAsVector(),param1);
         if(_loc3_)
         {
            _loc2_ = _loc2_.concat(_loc3_.slice());
         }
         return _loc2_;
      }
      
      private function getItemsWithRequiredUserlevel(param1:Vector.<ShopItemData>, param2:int) : Vector.<ShopItemData>
      {
         var _loc6_:ShopItemData = null;
         var _loc7_:AnimalShopData = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1[_loc5_] as ShopItemData;
            if(param2 == _loc6_.getUserLevelRequired())
            {
               _loc7_ = _loc6_ as AnimalShopData;
               if(_loc7_)
               {
                  if(_loc7_.male == 1)
                  {
                     _loc6_.itemId = _loc7_.speciesId;
                     _loc4_.push(_loc6_);
                  }
               }
               else
               {
                  _loc4_.push(_loc6_);
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getShopDataByCategory(param1:int, param2:int) : InheritedShopData
      {
         switch(param2)
         {
            case Categories.SPECIES:
               return this.itemConfigVO.animalSpecieData[param1];
            case Categories.CAGE:
               return this.itemConfigVO.cagesData[param1];
            case Categories.STORE:
               return this.itemConfigVO.storesData[param1];
            case Categories.DECOR:
               return this.itemConfigVO.decorsData[param1];
            case Categories.RESOURCES:
               return this.itemConfigVO.resourcesData[param1];
            case Categories.ASSISTANCE:
               return this.itemConfigVO.assistancesData[param1];
            case Categories.PREMIUM:
               return this.itemConfigVO.premiumsData[param1];
            case Categories.PACK:
               return this.itemConfigVO.premiumPacksData[param1];
            case Categories.ROAD:
               return this.itemConfigVO.roadsData[param1];
            case Categories.TRASHBIN:
               return this.itemConfigVO.trashbinsData[param1];
            case Categories.EXPANSION:
               return this.itemConfigVO.expansionData[param1];
            case Categories.STORAGE:
               return this.itemConfigVO.storageData[param1];
            case Categories.POWERUP:
               return this.itemConfigVO.powerupData[param1];
            case Categories.ANIMAL:
               return this.itemConfigVO.animalsData[param1];
            case Categories.EVENTITEM:
               return this.itemConfigVO.eventItemData[param1];
            default:
               return null;
         }
      }
      
      public function getShopDataByItemType(param1:int, param2:int) : InheritedShopData
      {
         switch(param2)
         {
            case ItemInternalTypes.SPECIE:
               return this.itemConfigVO.animalSpecieData[param1];
            case ItemInternalTypes.CAGE:
               return this.itemConfigVO.cagesData[param1];
            case ItemInternalTypes.STORE:
               return this.itemConfigVO.storesData[param1];
            case ItemInternalTypes.DECORATION:
               return this.itemConfigVO.decorsData[param1];
            case ItemInternalTypes.RESOURCE:
               return this.itemConfigVO.resourcesData[param1];
            case ItemInternalTypes.ASSISTANT:
               return this.itemConfigVO.assistancesData[param1];
            case ItemInternalTypes.ROAD:
               return this.itemConfigVO.roadsData[param1];
            case ItemInternalTypes.TRASHBIN:
               return this.itemConfigVO.trashbinsData[param1];
            case ItemInternalTypes.EXPANSION:
               return this.itemConfigVO.expansionData[param1];
            case ItemInternalTypes.STORAGE:
               return this.itemConfigVO.storageData[param1];
            case ItemInternalTypes.POWERUP:
               return this.itemConfigVO.powerupData[param1];
            case ItemInternalTypes.ANIMAL:
               return this.itemConfigVO.animalsData[param1];
            case ItemInternalTypes.ANIMAL:
               return this.itemConfigVO.animalsData[param1];
            default:
               return null;
         }
      }
      
      public function getAllShopItems() : Vector.<InheritedShopData>
      {
         var _loc2_:AnimalSpeciesVO = null;
         var _loc3_:ShopItemData = null;
         var _loc4_:ShopItemData = null;
         var _loc5_:ShopItemData = null;
         var _loc6_:ShopItemData = null;
         var _loc7_:ShopItemData = null;
         var _loc8_:ShopItemData = null;
         var _loc9_:ShopItemData = null;
         var _loc10_:TrashbinShopData = null;
         var _loc11_:ExpansionShopData = null;
         var _loc12_:StorageShopData = null;
         var _loc13_:PowerupShopData = null;
         var _loc14_:ShopItemData = null;
         var _loc15_:ShopItemData = null;
         var _loc16_:ShopItemData = null;
         var _loc17_:PremiumPackShopData = null;
         var _loc18_:SurpriseBoxShopData = null;
         var _loc1_:Vector.<InheritedShopData> = new Vector.<InheritedShopData>();
         for each(_loc2_ in this.itemConfigVO.animalSpecieData)
         {
            _loc1_.push(_loc2_);
         }
         for each(_loc3_ in this.itemConfigVO.cagesData)
         {
            _loc1_.push(_loc3_);
         }
         for each(_loc4_ in this.itemConfigVO.storesData)
         {
            _loc1_.push(_loc4_.clone());
         }
         for each(_loc5_ in this.itemConfigVO.decorsData)
         {
            _loc1_.push(_loc5_.clone());
         }
         for each(_loc6_ in this.itemConfigVO.resourcesData)
         {
            _loc1_.push(_loc6_.clone());
         }
         for each(_loc7_ in this.itemConfigVO.assistancesData)
         {
            _loc1_.push(_loc7_.clone());
         }
         for each(_loc8_ in this.itemConfigVO.premiumsData)
         {
            _loc1_.push(_loc8_.clone());
         }
         for each(_loc9_ in this.itemConfigVO.roadsData)
         {
            _loc1_.push(_loc9_.clone());
         }
         for each(_loc10_ in this.itemConfigVO.trashbinsData)
         {
            _loc1_.push(_loc10_.clone());
         }
         for each(_loc11_ in this.itemConfigVO.expansionData)
         {
            _loc1_.push(_loc11_.clone());
         }
         for each(_loc12_ in this.itemConfigVO.storageData)
         {
            _loc1_.push(_loc12_.clone());
         }
         for each(_loc13_ in this.itemConfigVO.powerupData)
         {
            _loc1_.push(_loc13_.clone());
         }
         for each(_loc14_ in this.itemConfigVO.premiumsData)
         {
            _loc1_.push(_loc14_.clone());
         }
         for each(_loc15_ in this.itemConfigVO.breedingLabData)
         {
            _loc1_.push(_loc15_.clone());
         }
         for each(_loc16_ in this.itemConfigVO.nurseryData)
         {
            _loc1_.push(_loc16_.clone());
         }
         for each(_loc17_ in this.itemConfigVO.premiumPacksData)
         {
            _loc1_.push(_loc17_);
         }
         for each(_loc18_ in this.itemConfigVO.surpriseBoxItemData)
         {
            _loc1_.push(_loc18_.clone());
         }
         return _loc1_;
      }
      
      public function getAllShopCards_FOR_TESTING() : Vector.<ShopItemData>
      {
         var _loc2_:ShopItemData = null;
         var _loc3_:ShopItemData = null;
         var _loc4_:ShopItemData = null;
         var _loc5_:ShopItemData = null;
         var _loc6_:ShopItemData = null;
         var _loc7_:ShopItemData = null;
         var _loc1_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         for each(_loc2_ in this.itemConfigVO.speciesData)
         {
            _loc1_.push(_loc2_.clone());
         }
         for each(_loc3_ in this.itemConfigVO.cagesData)
         {
            _loc1_.push(_loc3_.clone());
         }
         for each(_loc4_ in this.itemConfigVO.storesData)
         {
            _loc1_.push(_loc4_.clone());
         }
         for each(_loc5_ in this.itemConfigVO.decorsData)
         {
            _loc1_.push(_loc5_.clone());
         }
         for each(_loc6_ in this.itemConfigVO.roadsData)
         {
            _loc1_.push(_loc6_.clone());
         }
         for each(_loc7_ in this.itemConfigVO.trashbinsData)
         {
            _loc1_.push(_loc7_.clone());
         }
         return _loc1_;
      }
      
      public function getAllItemsByCategoryAndLevel(param1:Vector.<int>, param2:int, param3:int) : Vector.<ShopItemData>
      {
         var vector:Vector.<ShopItemData> = null;
         var minorLevel:int = 0;
         var majorLevel:int = 0;
         var cat:int = 0;
         var categories:Vector.<int> = param1;
         var minLevel:int = param2;
         var rangeLevel:int = param3;
         var vectorAll:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         minorLevel = rangeLevel < 0 ? minLevel + rangeLevel : minLevel;
         majorLevel = rangeLevel > 0 ? minLevel + rangeLevel : minLevel;
         for each(cat in categories)
         {
            vector = this.getAllShopItemDataAsVector(cat);
            if(vector)
            {
               vector = vector.filter(function(param1:ShopItemData, param2:int, param3:Vector.<ShopItemData>):Boolean
               {
                  return param1.getUserLevelRequired() >= minorLevel && param1.getUserLevelRequired() <= majorLevel;
               });
               vectorAll = vectorAll.concat(vector);
            }
         }
         return vectorAll;
      }
      
      public function getAllShopItemDataAsVector(param1:int) : Vector.<ShopItemData>
      {
         var _loc2_:Vector.<ShopItemData> = null;
         switch(param1)
         {
            case Categories.CAGE:
               _loc2_ = this.getAllShopCagesAsVector();
               break;
            case Categories.ANIMAL:
               _loc2_ = this.getAllShopAnimalsAsVector();
               break;
            case Categories.STORE:
               _loc2_ = this.getAllShopStoresAsVector();
               break;
            case Categories.DECOR:
               _loc2_ = this.getAllShopDecorationsAsVector();
               break;
            case Categories.RESOURCES:
               _loc2_ = this.getAllShopResourcesAsVector();
               break;
            case Categories.ROAD:
               _loc2_ = this.getAllShopRoadsAsVector();
               break;
            case Categories.TRASHBIN:
               _loc2_ = this.getAllShopTrashBinsAsVector();
               break;
            case Categories.ASSISTANCE:
               _loc2_ = this.getAllShopAssistanceAsVector();
               break;
            case Categories.PREMIUM:
               _loc2_ = this.getAllShopPremiumsAsVector();
               break;
            case Categories.NURSERY:
               _loc2_ = this.getNurseryAsVector();
               break;
            case Categories.BREEDING_LAB:
               _loc2_ = this.getBreedingLabAsVector();
               break;
            case Categories.SPECIES:
               _loc2_ = this.getSpeciesAsVector();
               break;
            case Categories.STORAGE:
               _loc2_ = this.getStorageAsVector();
         }
         return _loc2_;
      }
      
      public function getItemDataByCategoryName(param1:String, param2:int) : ShopItemData
      {
         var _loc3_:* = undefined;
         switch(Categories.getCategoryIdFromName(param1))
         {
            case Categories.ANIMAL:
               _loc3_ = this.getAnimalData(param2);
               break;
            case Categories.SPECIES:
               _loc3_ = this.getSpecieData(param2);
               break;
            case Categories.CAGE:
               _loc3_ = this.getCageData(param2);
               break;
            case Categories.DECOR:
               _loc3_ = this.getDecorationData(param2);
               break;
            case Categories.STORE:
               _loc3_ = this.getStoreData(param2);
               break;
            case Categories.ROAD:
               _loc3_ = this.getRoadData(param2);
               break;
            case Categories.TRASHBIN:
               _loc3_ = this.getTrashBinData(param2);
               break;
            case Categories.ASSISTANCE:
               _loc3_ = this.getAssistanceData(param2);
               break;
            case Categories.PREMIUM:
               _loc3_ = this.getPremiumData(param2);
               break;
            case Categories.RESOURCES:
               _loc3_ = this.getResourseData(param2);
         }
         return _loc3_;
      }
      
      public function getItemById(param1:int, param2:int) : ShopItemData
      {
         var _loc4_:ShopItemData = null;
         var _loc3_:Vector.<ShopItemData> = this.getAllShopItemDataAsVector(param2);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].itemId == param1)
            {
               return _loc3_[_loc5_];
            }
            _loc5_++;
         }
         return new ShopItemData();
      }
      
      public function getCageSpecieBonus(param1:int, param2:int) : int
      {
         var _loc3_:int = CageSpecieBonus.NORMAL;
         var _loc4_:AnimalSpeciesVO = this.itemConfigVO.animalSpecieData[param1];
         if(_loc4_)
         {
            if(_loc4_.cages[param2])
            {
               _loc3_ = int(_loc4_.cages[param2]);
            }
         }
         return _loc3_;
      }
      
      public function getMaterialData(param1:int) : MaterialShopData
      {
         if(this.itemConfigVO.materialData[param1])
         {
            return this.itemConfigVO.materialData[param1].clone() as MaterialShopData;
         }
         return null;
      }
      
      public function getResourseData(param1:int) : ResourceShopData
      {
         if(this.itemConfigVO.resourcesData[param1])
         {
            return this.itemConfigVO.resourcesData[param1].clone() as ResourceShopData;
         }
         return null;
      }
   }
}

