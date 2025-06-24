package com.bigpoint.zoorama.utils.configModules
{
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.tempView.MediatorDispachingEvents;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   import org.puremvc.as3.interfaces.INotification;
   
   public class ConfigurationModule extends MediatorDispachingEvents
   {
      private static var _instance:ConfigurationModule;
      
      public static const NAME:String = "ConfigurationModule";
      
      private var mainConfigProxy:MainConfigProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var cageUpgradeProxy:CageUpgradeProxy;
      
      private var collectionSetProxy:CollectionSetsConfigProxy;
      
      private var collectionPoolSetProxy:CollectionPoolSetProxy;
      
      public function ConfigurationModule()
      {
         if(_instance == null)
         {
            super(NAME);
            return;
         }
         throw Error("ConfigurationModule should not be created more then once.");
      }
      
      public static function getInstance() : ConfigurationModule
      {
         if(_instance == null)
         {
            _instance = new ConfigurationModule();
         }
         return _instance;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.mainConfigProxy = facade.retrieveProxy(MainConfigProxy.NAME) as MainConfigProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.cageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         this.collectionSetProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         this.collectionPoolSetProxy = facade.retrieveProxy(CollectionPoolSetProxy.NAME) as CollectionPoolSetProxy;
      }
      
      public function get maxXPLevel() : int
      {
         return this.mainConfigProxy.maxXPLevel;
      }
      
      public function getNextHighestXPLevel(param1:int) : int
      {
         return this.mainConfigProxy.getNextHighestXPLevel(param1);
      }
      
      public function checkLevelUpPerXP(param1:int, param2:int) : Boolean
      {
         return this.mainConfigProxy.checkLevelUpPerXP(param1,param2);
      }
      
      public function getPercentForXP(param1:int) : int
      {
         return this.mainConfigProxy.getPercentForXP(param1);
      }
      
      public function get trashFactorForAttraction() : Number
      {
         return this.mainConfigProxy.trashFactorForAttraction;
      }
      
      public function get resourcesCap() : int
      {
         return this.mainConfigProxy.resourcesCap;
      }
      
      public function getLevelUpCageConfig(param1:int) : LevelConfigVO
      {
         return this.cageUpgradeProxy.getLevelUpCageConfig(param1);
      }
      
      public function getWelcomeBackItems(param1:int) : Vector.<WelcomeBackItem>
      {
         return this.mainConfigProxy.getWelcomeBackItems(param1);
      }
      
      public function getAllShopAssistanceAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopAssistanceAsVector();
      }
      
      public function getAssistanceData(param1:int) : AssistanceShopData
      {
         return this.itemConfigProxy.getAssistanceData(param1);
      }
      
      public function getAllShopPremiumsAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopPremiumsAsVector();
      }
      
      public function getPremiumData(param1:int) : PremiumShopData
      {
         return this.itemConfigProxy.getPremiumData(param1);
      }
      
      public function getNextExpansion(param1:int) : Object
      {
         return this.itemConfigProxy.getNextExpansion(param1);
      }
      
      public function getAllShopSpeciesAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopSpeciesAsVector();
      }
      
      public function getSpecieData(param1:int) : SpecieShopData
      {
         return this.itemConfigProxy.getSpecieData(param1);
      }
      
      public function getAnimalSpecieData(param1:int) : AnimalSpeciesVO
      {
         return this.itemConfigProxy.getShopAnimalSpecie(param1);
      }
      
      public function getAllShopAnimalsAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopAnimalsAsVector();
      }
      
      public function getAnimalData(param1:int) : AnimalShopData
      {
         return this.itemConfigProxy.getAnimalData(param1);
      }
      
      public function getMaleAnimalData(param1:int) : AnimalShopData
      {
         return this.itemConfigProxy.getMaleAnimalData(param1);
      }
      
      public function getFemaleAnimalData(param1:int) : AnimalShopData
      {
         return this.itemConfigProxy.getFemaleAnimalData(param1);
      }
      
      public function getChildAnimalData(param1:int) : AnimalShopData
      {
         return this.itemConfigProxy.getChildAnimalData(param1);
      }
      
      public function getAllShopCagesAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopCagesAsVector();
      }
      
      public function getCageData(param1:int) : CageShopData
      {
         return this.itemConfigProxy.getCageData(param1);
      }
      
      public function getCollectionDatabyTCategorieAndId(param1:int, param2:int) : Vector.<ItemVO>
      {
         var _loc3_:Vector.<ItemVO> = this.collectionSetProxy.getCollectionDatabyTCategorieAndId(param1,param2);
         this.collectionPoolSetProxy.loadItems(_loc3_);
         return _loc3_;
      }
      
      public function getAllCageSpecieAsVector() : Vector.<Vector.<CageSpecieShopData>>
      {
         return this.itemConfigProxy.getAllCageSpecieAsVector();
      }
      
      public function getAllCagesBySpecieAsVector(param1:int) : Vector.<CageShopData>
      {
         return this.itemConfigProxy.getAllCagesBySpecieAsVector(param1,true);
      }
      
      public function getCageSpeciedata(param1:int, param2:int) : CageSpecieShopData
      {
         return this.itemConfigProxy.getCageSpeciedata(param1,param2);
      }
      
      public function getAllShopStoresAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopStoresAsVector();
      }
      
      public function getStoreData(param1:int) : StoreShopData
      {
         return this.itemConfigProxy.getStoreData(param1);
      }
      
      public function getMaterialData(param1:int) : MaterialShopData
      {
         return this.itemConfigProxy.getMaterialData(param1);
      }
      
      public function getBreedingLabData() : BreedingLabShopData
      {
         return this.itemConfigProxy.getBreedingLabData();
      }
      
      public function getNurseryData() : NurseryShopData
      {
         return this.itemConfigProxy.getNurseryData();
      }
      
      public function getAllShopDecorationsAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopDecorationsAsVector();
      }
      
      public function getDecorationData(param1:int) : DecorShopData
      {
         return this.itemConfigProxy.getDecorationData(param1);
      }
      
      public function getAllShopResourcesAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopResourcesAsVector();
      }
      
      public function getResourseData(param1:int) : ResourceShopData
      {
         return this.itemConfigProxy.getResourseData(param1);
      }
      
      public function getAllShopRoadsAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopRoadsAsVector();
      }
      
      public function getRoadData(param1:int) : RoadShopData
      {
         return this.itemConfigProxy.getRoadData(param1);
      }
      
      public function getAllShopTrashBinsAsVector() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopTrashBinsAsVector();
      }
      
      public function getTrashBinData(param1:int) : TrashbinShopData
      {
         return this.itemConfigProxy.getTrashBinData(param1);
      }
      
      public function getAllItemsForLevel(param1:int = 2) : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllItemsForLevel(param1);
      }
      
      public function getAllShopCards_FOR_TESTING() : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopCards_FOR_TESTING();
      }
      
      public function getAllItemsByCategoryAndLevel(param1:Vector.<int>, param2:int, param3:int) : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllItemsByCategoryAndLevel(param1,param2,param3);
      }
      
      public function getAllShopItemDataAsVector(param1:int) : Vector.<ShopItemData>
      {
         return this.itemConfigProxy.getAllShopItemDataAsVector(param1);
      }
      
      public function getItemDataByCategoryName(param1:String, param2:int) : ShopItemData
      {
         return this.itemConfigProxy.getItemDataByCategoryName(param1,param2);
      }
      
      public function getItemData(param1:int, param2:int) : ShopItemData
      {
         return this.itemConfigProxy.getItemById(param2,param1);
      }
   }
}

