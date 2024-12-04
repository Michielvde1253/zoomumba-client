package com.bigpoint.zoomumba.model.parser
{
   import com.adobe.serialization.json.JSON;
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.advBreed.GenusConfigProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.EventLevelConfigVO;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoomumba.model.app.core.LoadingProcessProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.settings.AIDProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.events.ballonEvent.BallonEventProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.community.CommunityEventProxy;
   import com.bigpoint.zoomumba.model.events.easter.EasterProxy;
   import com.bigpoint.zoomumba.model.events.frog.FrogProxy;
   import com.bigpoint.zoomumba.model.events.xmas.XMas2012Proxy;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementConfigProxy;
   import com.bigpoint.zoomumba.model.features.cinema.CinemaProxy;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.mainBuildingSelect.MainBuildingSelectionProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.AffectedPropertyVO;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemConfigVO;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.gameConfig.AdamConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.FeatureConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PromoPackProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AdamConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.FeatureConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.MainConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.PremiumPackConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.PromoPackVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.parser.vo.RewardItemVo;
   import com.bigpoint.zoomumba.model.parser.vo.RewardItemsVo;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopItemOrderVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.doubleXp.DoubleXpWindowProxy;
   import com.bigpoint.zoomumba.model.windows.doubleXp.vo.DoubleXpConfigVo;
   import com.bigpoint.zoomumba.model.windows.nowInShop.NowInShopWindowProxy;
   import com.bigpoint.zoomumba.model.windows.nowInShop.vo.NowInShopConfigVo;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.BlueprintShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.data.settings.HalloweenShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.PowerupShopData;
   import com.bigpoint.zoorama.data.settings.PremiumPackShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.SurpriseBoxShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ParserProxy extends Proxy
   {
      private static const CONFIG_MAIN:String = "main";
      
      private static const CONFIG_GAME_ITEMS:String = "gameItems";
      
      private static const CONFIG_SHOP_ORDER:String = "shopOrder";
      
      private static const CONFIG_FEATURES:String = "features";
      
      private static const CONFIG_PREMIUM:String = "premium";
      
      private static const CONFIG_POWERUPS:String = "pwrUpConf";
      
      private static const CONFIG_EVENTITEM:String = "eventItem";
      
      private static const CONFIG_GENUS:String = "genus";
      
      private static const CONFIG_PAY_PACKS:String = "payPack";
      
      private static const CONFIG_FEATURE_CIRCUS:String = "circus";
      
      private static const CONFIG_CINEMA:String = "cinema";
      
      private static const CONFIG_FEATURE_VALENTINE:String = "valentine";
      
      private static const CONFIG_MAIN_BUILDING_SELECTION:String = "entranceBuildings";
      
      private static const CONFIG_RECYCLING_BUILDING:String = "recyclingCenter";
      
      private static const CONFIG_EVENT_REWARDS:String = "eventRewards";
      
      private static const CONFIG_COLLECTION_SETS:String = "collSetConf";
      
      private static const CONFIG_EASTER:String = "easterConf";
      
      private static const CONFIG_FROG:String = "frogConf";
      
      private static const CONFIG_BOARDGAME:String = "boardgame";
      
      private static const CONFIG_HALLOWEEN2012:String = "halloween2012Conf";
      
      private static const CONFIG_XMAS2012:String = "xmas2012Conf";
      
      private static const CONFIG_VALENTINES2013:String = "valentines2013Conf";
      
      private static const CONFIG_DOUBLE_XP:String = "doubleXp";
      
      private static const CONFIG_NOW_IN_SHOP:String = "nowInShop";
      
      private static const COMMUNITY_PAYIN:String = "communityPayin";
      
      public static const ACHIEVEMENTS_CONFIG:String = "acObj";
      
      public static const COUTNER_CONFIG:String = "counter";
      
      public static const THEME_CONFIG:String = "theme";
      
      public static const SURPRISE_BOXES_NODE_NAME:String = "surpriseBoxes";
      
      private static const PREMIUM_PACK_ONE_NODE_NAME:String = "premium_1";
      
      private static const PREMIUM_PACK_TWO_NODE_NAME:String = "premium_2";
      
      private static const PREMIUM_PACK_FULL_NODE_NAME:String = "premium_full";
      
      public static var NAME:String = "ParserProxy";
      
      private const ANIMAL_SPECIES_NODE_NAME:String = "animalsSpecies";
      
      private const ANIMAL_NODE_NAME:String = "animals";
      
      private const ASSISTANCE_NODE_NAME:String = "assists";
      
      private const PREMIUM_NODE_NAME:String = "premium";
      
      private const SPECIALS_NODE_NAME:String = "specials";
      
      private const CAGE_NODE_NAME:String = "cages";
      
      private const MATERIAL_NODE_NAME:String = "materials";
      
      private const BLUEPRINTS_NODE_NAME:String = "blueprints";
      
      private const CAGE_SPECIES_NODE_NAME:String = "cagesSpecies";
      
      private const DECORATION_NODE_NAME:String = "decos";
      
      private const RESOURCE_NODE_NAME:String = "resources";
      
      private const SPECIES_NODE_NAME:String = "species";
      
      private const STORE_NODE_NAME:String = "stores";
      
      private const ROAD_NODE_NAME:String = "roads";
      
      private const TRASHBIN_NODE_NAME:String = "trashbins";
      
      private const PROMO_PACK_NODE_NAME:String = "packs";
      
      private const AFFECTS_NODE_NAME:String = "affects";
      
      private const GLOBAL_EVENT_DATA:String = "events";
      
      private const CAGE_UPGRADE_EVENT_DATA:String = "cageUpEv";
      
      public function ParserProxy()
      {
         super(NAME);
      }
      
      public function startParseConfigurationData(param1:Object, param2:Vector.<String> = null) : void
      {
         var _loc5_:LoadingProcessProxy = null;
         if(param2.length <= 0)
         {
            facade.removeCommand(Note.CONFIGURATION_RESPONSE_RECEIVED);
            _loc5_ = facade.retrieveProxy(LoadingProcessProxy.NAME) as LoadingProcessProxy;
            facade.registerMediator(ConfigurationModule.getInstance());
            _loc5_.setGameConfigLoaded();
            return;
         }
         var _loc3_:String = param2.shift();
         var _loc4_:Object = param1[_loc3_] as Object;
         switch(_loc3_)
         {
            case CONFIG_MAIN:
               this.parseConfigurationData(_loc4_);
               break;
            case THEME_CONFIG:
               this.parseThemeConfig(_loc4_);
               break;
            case CONFIG_GAME_ITEMS:
               this.parseInventoryData(_loc4_);
               break;
            case CONFIG_SHOP_ORDER:
               this.parseShopOrderData(_loc4_);
               break;
            case CONFIG_PREMIUM:
               this.parsePremiumPacksData(_loc4_);
               break;
            case CONFIG_FEATURES:
               FeatureActiveReference.initialize(_loc4_);
               this.parseFeatureConfigData(_loc4_);
               break;
            case CONFIG_MAIN_BUILDING_SELECTION:
               this.parseMainBuildingSelectionConfigData(_loc4_);
               break;
            case CONFIG_RECYCLING_BUILDING:
               this.parseRecyclingBuildingConfigData(_loc4_);
               break;
            case CONFIG_EVENT_REWARDS:
               this.parseEventRewards(_loc4_);
               break;
            case this.GLOBAL_EVENT_DATA:
               this.parseGlobalEventConfigData(_loc4_);
               break;
            case this.PROMO_PACK_NODE_NAME:
               this.parsePromoPackConfigData(_loc4_);
               break;
            case CONFIG_COLLECTION_SETS:
               this.parseCollectableSetsConfigData(_loc4_);
               break;
            case this.CAGE_UPGRADE_EVENT_DATA:
               this.parseCageUpgradeEventConfigData(_loc4_);
               break;
            case ACHIEVEMENTS_CONFIG:
               this.parseAchievementsConfig(_loc4_);
               break;
            case CONFIG_PAY_PACKS:
               this.parsePayPacksConfig(_loc4_);
               break;
            case CONFIG_FEATURE_CIRCUS:
               this.parseCircusData(_loc4_);
               break;
            case CONFIG_FEATURE_VALENTINE:
               sendNotification(Note.PARSE_VALENTINES_CONFIG,_loc4_);
               break;
            case COUTNER_CONFIG:
               this.parseCounterData(_loc4_);
               break;
            case CONFIG_CINEMA:
               this.parseCinemaData(_loc4_);
               break;
            case CONFIG_EASTER:
               this.parseEasterData(_loc4_);
               break;
            case CONFIG_FROG:
               this.parseFrogData(_loc4_);
               break;
            case CONFIG_BOARDGAME:
               this.parseBoardGameData(_loc4_);
               break;
            case CONFIG_XMAS2012:
               this.parseXmas2012Data(_loc4_);
               break;
            case CONFIG_DOUBLE_XP:
               this.parseDoubleXpData(_loc4_);
               break;
            case CONFIG_NOW_IN_SHOP:
               this.parseNowInShopData(_loc4_);
               break;
            case COMMUNITY_PAYIN:
               this.parseCommunityPayinConfig(_loc4_);
         }
         TweenLite.delayedCall(0.1,this.startParseConfigurationData,[param1,param2]);
      }
      
      private function parseRecyclingBuildingConfigData(param1:Object) : void
      {
         var _loc2_:RecyclingProxy = null;
         if(facade.getProxy(RecyclingProxy) == null)
         {
            _loc2_ = new RecyclingProxy();
            facade.registerProxy(_loc2_);
         }
         else
         {
            _loc2_ = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         }
         if(_loc2_)
         {
            _loc2_.initRecyclingConfigData(param1);
         }
      }
      
      public function parseCommunityPayinConfig(param1:Object) : void
      {
         var _loc2_:CommunityEventProxy = null;
         if(facade.getProxy(CommunityEventProxy) == null)
         {
            _loc2_ = new CommunityEventProxy();
            facade.registerProxy(_loc2_);
         }
         else
         {
            _loc2_ = facade.getProxy(CommunityEventProxy) as CommunityEventProxy;
         }
         _loc2_.update(param1);
      }
      
      private function parseThemeConfig(param1:Object) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:String = "";
         var _loc6_:String = "";
         if(param1.music)
         {
            _loc3_ = param1.music;
         }
         if(param1.theme_preloader)
         {
            _loc4_ = param1.theme_preloader;
         }
         if(param1.background)
         {
            _loc6_ = param1.background;
         }
         if(param1.roadtheme)
         {
            _loc5_ = param1.roadtheme;
         }
         _loc2_.setThemeNames(_loc4_,_loc6_,_loc3_,_loc5_);
      }
      
      private function parseConfigurationData(param1:Object) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:WelcomeBackItem = null;
         var _loc13_:Vector.<LevelConfigVO> = null;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:LevelConfigVO = null;
         var _loc2_:MainConfigVO = new MainConfigVO();
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc4_:AIDProxy = facade.retrieveProxy(AIDProxy.NAME) as AIDProxy;
         var _loc5_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(param1.push_interval)
         {
            _loc3_.pushInterval = parseInt(param1.push_interval);
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand ::  push_interval not available in config.main");
         }
         if(param1.fia_maxtime)
         {
            _loc3_.fiaMaxTime = param1.fia_maxtime;
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand ::  fia_maxtime not available in config.main");
         }
         if(param1.fia_maxactions)
         {
            _loc3_.fiaMaxActions = param1.fia_maxactions;
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand ::  fia_maxactions not available in config.main");
         }
         if(param1.u_level)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.u_level.length)
            {
               _loc8_ = Number(param1.u_level[_loc7_]);
               _loc2_.userExperienceLevels.push(_loc8_);
               _loc7_++;
            }
         }
         else
         {
            sendNotification(Note.ERROR_REPORT,"ConfigurationParserCommand ::  u_level not available in config.main");
         }
         _loc4_.userDataChange_enabled = Boolean(param1.userDataChange_enabled) || Boolean(param1.userDataChange_enabled);
         if(param1.att_trash_factor)
         {
            _loc2_.trashFactorForAttraction = Number(param1.att_trash_factor);
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand ::  att_trash_factor not available in config.main");
         }
         if(param1.res_cap)
         {
            _loc2_.resourcesCap = Number(param1.res_cap);
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand ::  res_cap not available in config.main");
         }
         if(param1.crmObj)
         {
            for(_loc9_ in param1.crmObj)
            {
               _loc10_ = int(_loc9_);
               while(_loc2_.welcomeBackItems.length <= _loc10_)
               {
                  _loc2_.welcomeBackItems.push(null);
               }
               _loc2_.welcomeBackItems[_loc10_] = new Vector.<WelcomeBackItem>();
               for each(_loc11_ in param1.crmObj[_loc9_])
               {
                  _loc12_ = new WelcomeBackItem();
                  ObjectHelper.copyData(_loc12_,_loc11_);
                  _loc2_.welcomeBackItems[_loc10_].push(_loc12_);
               }
            }
         }
         if(param1.ucObj)
         {
            _loc13_ = new Vector.<LevelConfigVO>();
            for(_loc14_ in param1.ucObj)
            {
               _loc15_ = int(_loc14_);
               _loc16_ = new LevelConfigVO();
               _loc16_.virtualMoneyCost = int(param1.ucObj[_loc14_]["pp"]);
               _loc16_.petPowsCost = int(param1.ucObj[_loc14_]["pPaw"]);
               _loc16_.pearlsCost = int(param1.ucObj[_loc14_]["oceanworld_pearls"]);
               _loc16_.oceanWorldVirtualMoneyCost = int(param1.ucObj[_loc14_]["oceanworld_pp"]);
               _loc16_.experienceBonus = Number(param1.ucObj[_loc14_]["xpBonus"]);
               while(_loc13_.length <= _loc15_)
               {
                  _loc13_.push(null);
               }
               _loc13_[_loc15_] = _loc16_;
            }
         }
         var _loc6_:CageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         _loc6_.storeCageConfig(_loc13_);
         facade.registerProxy(new MainConfigProxy(_loc2_));
      }
      
      private function parseCageUpgradeEventConfigData(param1:Object) : void
      {
         var keyName:String = null;
         var object:Object = null;
         var eventCageUpgrade:EventLevelConfigVO = null;
         var dataAttributeName:String = null;
         var data:Object = param1;
         var cageUpgradeProxy:CageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         var eventCageUpgrades:Vector.<EventLevelConfigVO> = new Vector.<EventLevelConfigVO>();
         for(keyName in data)
         {
            object = data[keyName];
            eventCageUpgrade = new EventLevelConfigVO();
            for(dataAttributeName in object)
            {
               eventCageUpgrade[dataAttributeName] = object[dataAttributeName];
            }
            eventCageUpgrades.push(eventCageUpgrade);
         }
         cageUpgradeProxy.storeEventCageConfig(eventCageUpgrades);
      }
      
      public function parseShopOrderData(param1:Object) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc2_:ShopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         var _loc3_:Vector.<Vector.<ShopItemOrderVO>> = new Vector.<Vector.<ShopItemOrderVO>>();
         var _loc4_:Vector.<ShopItemOrderVO> = new Vector.<ShopItemOrderVO>();
         var _loc5_:ShopItemOrderVO = new ShopItemOrderVO();
         for each(_loc6_ in param1["normal"])
         {
            _loc4_ = new Vector.<ShopItemOrderVO>();
            for each(_loc7_ in _loc6_)
            {
               _loc5_ = new ShopItemOrderVO();
               ObjectHelper.copyData(_loc5_,_loc7_);
               _loc4_.push(_loc5_);
            }
            _loc3_.push(_loc4_);
         }
         _loc2_.tabOrderNormalVO = _loc3_;
         _loc3_ = new Vector.<Vector.<ShopItemOrderVO>>();
         for each(_loc6_ in param1["oceanworld"])
         {
            _loc4_ = new Vector.<ShopItemOrderVO>();
            for each(_loc7_ in _loc6_)
            {
               _loc5_ = new ShopItemOrderVO();
               ObjectHelper.copyData(_loc5_,_loc7_);
               _loc4_.push(_loc5_);
            }
            _loc3_.push(_loc4_);
         }
         _loc2_.tabOrderOceanVO = _loc3_;
      }
      
      public function parseInventoryData(param1:Object) : void
      {
         var keyName:String = null;
         var subData:Object = null;
         var test:Object = null;
         var resourceData:Object = null;
         var resourceVO:ResourceShopData = null;
         var animalSpecieData:Object = null;
         var animalSpecieVO:AnimalSpeciesVO = null;
         var itemConfigProxy:ItemConfigProxy = null;
         var data:Object = param1;
         var itemConfigVO:ItemConfigVO = new ItemConfigVO();
         for(keyName in data)
         {
            subData = data[keyName];
            if(subData == null)
            {
               continue;
            }
            for each(test in subData)
            {
               if(!test.premiumId)
               {
               }
            }
            switch(keyName)
            {
               case this.SPECIES_NODE_NAME:
                  this.parseSpeciesData(itemConfigVO,subData);
                  break;
               case this.ANIMAL_NODE_NAME:
                  this.parseAnimalsData(itemConfigVO,subData);
                  break;
               case this.CAGE_NODE_NAME:
                  this.parseCagesData(itemConfigVO,subData);
                  break;
               case this.CAGE_SPECIES_NODE_NAME:
                  this.parseCageSpeciesData(itemConfigVO,subData);
                  break;
               case this.SPECIALS_NODE_NAME:
                  this.parseSpecialsData(itemConfigVO,subData);
                  break;
               case this.STORE_NODE_NAME:
                  this.parseStoreData(itemConfigVO,subData);
                  break;
               case this.DECORATION_NODE_NAME:
                  this.parseDecorationsData(itemConfigVO,subData);
                  break;
               case this.ROAD_NODE_NAME:
                  this.parseRoadData(itemConfigVO,subData);
                  break;
               case this.TRASHBIN_NODE_NAME:
                  this.parseTrashbinData(itemConfigVO,subData);
                  break;
               case this.ASSISTANCE_NODE_NAME:
                  this.parseAssistanceData(itemConfigVO,subData);
                  break;
               case this.PREMIUM_NODE_NAME:
                  this.parsePremiumData(itemConfigVO,subData);
                  break;
               case CONFIG_POWERUPS:
                  this.parsePowerupsConfigData(subData,itemConfigVO);
                  break;
               case CONFIG_EVENTITEM:
                  break;
               case CONFIG_GENUS:
                  this.parseGenusConfigData(subData);
                  break;
               case this.RESOURCE_NODE_NAME:
                  for each(resourceData in subData)
                  {
                     resourceVO = new ResourceShopData();
                     ObjectHelper.copyData(resourceVO,resourceData);
                     itemConfigVO.resourcesData[resourceVO.resourceId] = resourceVO;
                  }
                  break;
               case this.MATERIAL_NODE_NAME:
                  this.parseMaterialData(itemConfigVO,subData);
                  break;
               case this.BLUEPRINTS_NODE_NAME:
                  this.parseBlueprintsData(itemConfigVO,subData);
                  break;
               case SURPRISE_BOXES_NODE_NAME:
                  this.parseSurpriseBoxData(itemConfigVO,subData);
                  break;
               case this.ANIMAL_SPECIES_NODE_NAME:
                  for each(animalSpecieData in subData)
                  {
                     animalSpecieVO = new AnimalSpeciesVO();
                     try
                     {
                        ObjectHelper.copyData(animalSpecieVO,animalSpecieData);
                     }
                     catch(error:Error)
                     {
                        sendNotification(Note.WARNING_REPORT,"ConfigurationModule : ANIMAL_SPECIES_NODE_NAME()" + error);
                     }
                     animalSpecieVO.selectedId = animalSpecieVO.animalIds[0];
                     itemConfigVO.foodSpecieData[animalSpecieVO.foodId] = itemConfigVO.foodSpecieData[animalSpecieVO.foodId] || [];
                     (itemConfigVO.foodSpecieData[animalSpecieVO.foodId] as Array).push(animalSpecieVO.itemId);
                     itemConfigVO.animalSpecieData[animalSpecieVO.speciesId] = animalSpecieVO;
                  }
                  break;
            }
         }
         if(facade.hasProxy(ItemConfigProxy.NAME))
         {
            itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
            itemConfigProxy.setData(itemConfigVO);
         }
         else
         {
            facade.registerProxy(new ItemConfigProxy(itemConfigVO));
         }
      }
      
      private function parseBlueprintsData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:BlueprintShopData = null;
         var _loc6_:ItemStackVO = null;
         var _loc7_:ItemVO = null;
         var _loc9_:BlueprintInfoVO = null;
         var _loc10_:Object = null;
         var _loc11_:CraftingProxy = null;
         var _loc12_:int = 0;
         var _loc8_:Vector.<BlueprintInfoVO> = new Vector.<BlueprintInfoVO>();
         for(_loc10_ in param2)
         {
            _loc3_ = param2[_loc10_];
            _loc9_ = new BlueprintInfoVO();
            _loc5_ = new BlueprintShopData();
            ObjectHelper.copyData(_loc5_,_loc3_);
            _loc5_.itemId = _loc5_.blueprintId;
            _loc9_.blueprintId = _loc5_.blueprintId;
            _loc9_.petpaws = _loc5_.craftPaws;
            _loc9_.duration = _loc5_.craftDuration;
            _loc9_.craftInstantReal = _loc5_.craftInstantReal;
            if(_loc3_.materials)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc3_.materials.length)
               {
                  _loc4_ = _loc3_.materials[_loc12_];
                  _loc6_ = new ItemStackVO();
                  _loc6_.ammount = parseInt(_loc4_.count);
                  _loc6_.itemId = parseInt(_loc4_.id);
                  _loc6_.category = Categories.MATERIAL;
                  _loc5_.neededMaterials.push(_loc6_);
                  _loc9_.neededMaterials.push(_loc6_);
                  _loc12_++;
               }
            }
            if(_loc3_.reward)
            {
               _loc5_.rewardXP = parseInt(_loc3_.reward.xp);
               if(_loc3_.reward.item)
               {
                  _loc5_.rewardItem = new ItemVO();
                  _loc5_.rewardItem.category = ItemTypeHelper.typeToCategory(_loc3_.reward.item.type);
                  _loc5_.rewardItem.itemId = parseInt(_loc3_.reward.item.id);
                  _loc9_.itemId = _loc5_.rewardItem.itemId;
                  _loc9_.category = _loc5_.rewardItem.category;
               }
            }
            _loc8_.push(_loc9_);
            param1.blueprints[_loc5_.itemId] = _loc5_;
         }
         _loc11_ = facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy;
         _loc11_.initBlueprintRewards(_loc8_);
      }
      
      private function parseSurpriseBoxData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:SurpriseBoxShopData = null;
         for(_loc3_ in param2)
         {
            _loc4_ = new SurpriseBoxShopData();
            ObjectHelper.copyData(_loc4_,param2[_loc3_]);
            _loc4_.itemId = _loc4_.boxId;
            param1.surpriseBoxItemData[_loc4_.itemId] = _loc4_;
         }
      }
      
      private function parseSpeciesData(param1:ItemConfigVO, param2:Object) : void
      {
         var specieData:Object = null;
         var specieVO:SpecieShopData = null;
         var specieAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(specieData in data)
         {
            specieVO = new SpecieShopData();
            for(specieAttributeName in specieData)
            {
               specieVO[specieAttributeName] = specieData[specieAttributeName];
            }
            itemConfigVO.speciesData[specieVO.speciesId] = specieVO;
         }
      }
      
      private function parseAnimalsData(param1:ItemConfigVO, param2:Object) : void
      {
         var animalData:Object = null;
         var animalVO:AnimalShopData = null;
         var animalAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(animalData in data)
         {
            animalVO = new AnimalShopData();
            for(animalAttributeName in animalData)
            {
               try
               {
                  animalVO[animalAttributeName] = animalData[animalAttributeName];
               }
               catch(error:Error)
               {
                  sendNotification(Note.WARNING_REPORT,"ConfigurationModule : parseAnimalsData()" + error);
               }
            }
            if(!animalVO.male && !animalVO.child)
            {
               animalVO.female = 1;
            }
            itemConfigVO.animalsData[animalVO.animalId] = animalVO;
            if(animalVO.child)
            {
               itemConfigVO.animalsChildData[animalVO.speciesId] = animalVO;
            }
            else if(animalVO.male)
            {
               itemConfigVO.animalsMaleData[animalVO.speciesId] = animalVO;
            }
            else
            {
               itemConfigVO.animalsFemaleData[animalVO.speciesId] = animalVO;
            }
         }
      }
      
      private function parseCagesData(param1:ItemConfigVO, param2:Object) : void
      {
         var cageData:Object = null;
         var cageVO:CageShopData = null;
         var cageAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(cageData in data)
         {
            cageVO = new CageShopData();
            for(cageAttributeName in cageData)
            {
               cageVO[cageAttributeName] = cageData[cageAttributeName];
            }
            itemConfigVO.cagesData[cageVO.cageId] = cageVO;
         }
      }
      
      private function parseMaterialData(param1:ItemConfigVO, param2:Object) : void
      {
         var materialData:Object = null;
         var materialVO:MaterialShopData = null;
         var materialAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(materialData in data)
         {
            materialVO = new MaterialShopData();
            for(materialAttributeName in materialData)
            {
               materialVO[materialAttributeName] = materialData[materialAttributeName];
            }
            materialVO.itemId = materialVO.materialId;
            itemConfigVO.materialData[materialVO.materialId] = materialVO;
         }
      }
      
      private function parseCageSpeciesData(param1:ItemConfigVO, param2:Object) : void
      {
         var datas:Object = null;
         var cageId:String = null;
         var dataObj:Object = null;
         var specieCageVO:CageSpecieShopData = null;
         var cageSpecieAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(datas in data)
         {
            for(cageId in datas)
            {
               dataObj = datas[cageId];
               specieCageVO = new CageSpecieShopData();
               for(cageSpecieAttributeName in dataObj)
               {
                  specieCageVO[cageSpecieAttributeName] = dataObj[cageSpecieAttributeName];
               }
               while(itemConfigVO.cageSpeciesData.length - 1 < specieCageVO.cageId)
               {
                  itemConfigVO.cageSpeciesData.push(new Vector.<CageSpecieShopData>());
               }
               while(itemConfigVO.cageSpeciesData[specieCageVO.cageId].length - 1 < specieCageVO.speciesId)
               {
                  itemConfigVO.cageSpeciesData[specieCageVO.cageId].push(null);
               }
               itemConfigVO.cageSpeciesData[specieCageVO.cageId][specieCageVO.speciesId] = specieCageVO;
            }
         }
      }
      
      private function parseSpecialsData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:String = null;
         for(_loc3_ in param2)
         {
            switch(int(_loc3_))
            {
               case MainConstants.SPECIAL_BREEDING_LAB:
                  this.parseBreedingLabConfig(param1,param2[_loc3_]);
                  break;
               case MainConstants.SPECIAL_NURSERY:
                  this.parseNurseryConfig(param1,param2[_loc3_]);
                  break;
            }
         }
      }
      
      private function parseBreedingLabConfig(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:BreedingLabShopData = new BreedingLabShopData();
         ObjectHelper.copyData(_loc3_,param2);
         param1.breedingLabData[_loc3_.itemId] = _loc3_;
         var _loc4_:BreedingLabVO = new BreedingLabVO();
         ObjectHelper.copyData(_loc4_,param2);
         _loc4_.itemId = MainConstants.SPECIAL_BREEDING_LAB;
         _loc4_.uniqueId = _loc3_.uniqueId;
         var _loc5_:BreedingLabProxy = facade.retrieveProxy(BreedingLabProxy.NAME + "_" + Categories.BREEDING_LAB + "_" + _loc4_.uniqueId) as BreedingLabProxy;
         if(!_loc5_)
         {
            facade.registerProxy(new BreedingLabProxy(Categories.BREEDING_LAB,_loc4_.uniqueId,_loc4_));
         }
         else
         {
            _loc5_.updateData(_loc4_);
         }
      }
      
      private function parseNurseryConfig(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:NurseryShopData = new NurseryShopData();
         ObjectHelper.copyData(_loc3_,param2);
         param1.nurseryData[_loc3_.itemId] = _loc3_;
         var _loc4_:NurseryVO = new NurseryVO();
         ObjectHelper.copyData(_loc4_,param2);
         _loc4_.id = MainConstants.SPECIAL_NURSERY;
         _loc4_.uniqueId = _loc3_.uniqueId;
         var _loc5_:NurseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         if(!_loc5_)
         {
            facade.registerProxy(new NurseryProxy(Categories.NURSERY,_loc4_.uniqueId,_loc4_));
         }
         else
         {
            _loc5_.updateData(_loc4_);
         }
      }
      
      private function parseStoreData(param1:ItemConfigVO, param2:Object) : void
      {
         var storeData:Object = null;
         var storeVO:StoreShopData = null;
         var storeAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(storeData in data)
         {
            storeVO = new StoreShopData();
            for(storeAttributeName in storeData)
            {
               storeVO[storeAttributeName] = storeData[storeAttributeName];
            }
            itemConfigVO.storesData[storeVO.storeId] = storeVO;
         }
      }
      
      private function parseDecorationsData(param1:ItemConfigVO, param2:Object) : void
      {
         var decorData:Object = null;
         var decorVO:DecorShopData = null;
         var decorAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(decorData in data)
         {
            decorVO = new DecorShopData();
            for(decorAttributeName in decorData)
            {
               decorVO[decorAttributeName] = decorData[decorAttributeName];
            }
            itemConfigVO.decorsData[decorVO.decoId] = decorVO;
         }
      }
      
      private function parseRoadData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:RoadShopData = null;
         for each(_loc3_ in param2)
         {
            _loc4_ = new RoadShopData();
            ObjectHelper.copyData(_loc4_,_loc3_);
            param1.roadsData[_loc4_.roadId] = _loc4_;
         }
      }
      
      private function parseTrashbinData(param1:ItemConfigVO, param2:Object) : void
      {
         var trashbinData:Object = null;
         var trashVO:TrashbinShopData = null;
         var trashAttributeName:String = null;
         var itemConfigVO:ItemConfigVO = param1;
         var data:Object = param2;
         for each(trashbinData in data)
         {
            trashVO = new TrashbinShopData();
            for(trashAttributeName in trashbinData)
            {
               trashVO[trashAttributeName] = trashbinData[trashAttributeName];
            }
            itemConfigVO.trashbinsData[trashVO.trashbinId] = trashVO;
         }
      }
      
      private function parseAssistanceData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:AssistanceShopData = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_.onlyDev != 1)
            {
               _loc4_ = new AssistanceShopData();
               ObjectHelper.copyData(_loc4_,_loc3_);
               param1.assistancesData[_loc4_.assistId] = _loc4_;
            }
         }
      }
      
      private function parsePremiumData(param1:ItemConfigVO, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param2)
         {
            if(_loc3_.onlyDev == 1)
            {
               continue;
            }
            _loc4_ = _loc3_["premiumId"] as int;
            switch(_loc4_)
            {
               case MainConstants.PREMIUM_ID_ZOO_EXPANSION:
               case MainConstants.PREMIUM_ID_ZOO_MAX_EXPANSION:
               case MainConstants.PREMIUM_ID_FZOO_EXPANSION:
               case MainConstants.PREMIUM_ID_FZOO_FULL_EXPANSION:
               case MainConstants.PREMIUM_ID_MZOO_EXPANSION:
               case MainConstants.PREMIUM_ID_MZOO_FULL_EXPANSION:
               case MainConstants.PREMIUM_ID_FOURTHZOO_EXPANSION:
               case MainConstants.PREMIUM_ID_FOURTHZOO_FULL_EXPANSION:
               case MainConstants.PREMIUM_ID_COASTZOO_EXPANSION:
               case MainConstants.PREMIUM_ID_COASTZOO_FULL_EXPANSION:
               case MainConstants.PREMIUM_ID_OCEANWORLD_EXPANSION:
               case MainConstants.PREMIUM_ID_OCEANWORLD_FULL_EXPANSION:
                  this.parseExpansion(_loc3_,param1);
                  break;
               case MainConstants.PREMIUM_ID_TRICKS:
               case MainConstants.PREMIUM_ID_TREATS:
                  this.parseHalloween(_loc3_,param1);
                  break;
               case MainConstants.PREMIUM_ID_ZOO_DIRECTOR:
                  this.parseZooDirector(_loc3_,param1);
                  break;
               case MainConstants.PREMIUM_ID_SUPER_FOOD_PACK:
               case MainConstants.PREMIUM_ID_POWER_FOOD_PACK:
               case MainConstants.PREMIUM_ID_ELIXIR_PACK:
               case MainConstants.PREMIUM_ID_RAISING_POTION_PACK:
                  this.parsePremiumPacks(_loc3_,param1);
                  break;
               default:
                  this.parsePremium(_loc3_,param1);
                  break;
            }
         }
      }
      
      private function parseDoubleXpData(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc2_:DoubleXpConfigVo = new DoubleXpConfigVo();
         var _loc3_:DoubleXpWindowProxy = new DoubleXpWindowProxy();
         for each(_loc4_ in param1.displayAnimals)
         {
            _loc2_.displayAnimals.push(_loc4_);
         }
         _loc3_.doubleXpConfigVo = _loc2_;
         facade.registerProxy(_loc3_);
      }
      
      private function parseNowInShopData(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc2_:NowInShopConfigVo = new NowInShopConfigVo();
         var _loc3_:NowInShopWindowProxy = new NowInShopWindowProxy();
         for each(_loc4_ in param1.displayAnimals)
         {
            _loc2_.displayAnimals.push(_loc4_);
         }
         _loc3_.nowInShopConfigVo = _loc2_;
         facade.registerProxy(_loc3_);
      }
      
      private function parseHalloween(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:HalloweenShopData = new HalloweenShopData();
         ObjectHelper.copyData(_loc3_,param1);
         param2.premiumsData[_loc3_.itemId] = _loc3_;
      }
      
      private function parseZooDirector(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:AssistanceShopData = new AssistanceShopData();
         ObjectHelper.copyData(_loc3_,param1);
         _loc3_.buyable = 1;
         _loc3_.itemId = 0;
         _loc3_.buyReal = 1;
         _loc3_.hideBuyButton = true;
         param2.assistancesData[_loc3_.assistId] = _loc3_;
      }
      
      private function parseStorage(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:StorageShopData = new StorageShopData();
         ObjectHelper.copyData(_loc3_,param1);
         param2.storageData[_loc3_.premiumId] = _loc3_;
      }
      
      private function parseExpansion(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:ExpansionShopData = new ExpansionShopData();
         ObjectHelper.copyData(_loc3_,param1);
         param2.expansionData[_loc3_.premiumId] = _loc3_;
      }
      
      private function parsePremiumPacks(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:PremiumPackShopData = new PremiumPackShopData();
         ObjectHelper.copyData(_loc3_,param1);
         param2.premiumPacksData[_loc3_.premiumId] = _loc3_;
      }
      
      private function parsePremium(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:PremiumShopData = new PremiumShopData();
         ObjectHelper.copyData(_loc3_,param1);
         param2.premiumsData[_loc3_.premiumId] = _loc3_;
      }
      
      private function parseFeatureConfigData(param1:Object) : void
      {
         var featureName:String = null;
         var data:Object = param1;
         var featureConfigVO:FeatureConfigVO = new FeatureConfigVO();
         for(featureName in data)
         {
            try
            {
               featureConfigVO[featureName] = data[featureName];
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand failed to set feature canfig value for : " + featureName);
            }
         }
         facade.registerProxy(new FeatureConfigProxy(featureConfigVO));
      }
      
      private function parseCircusData(param1:Object) : void
      {
         facade.registerProxy(new CircusProxy(Vector.<int>(param1)));
      }
      
      private function parseCounterData(param1:Object) : void
      {
         var _loc2_:CounterValuesProxy = facade.retrieveProxy(CounterValuesProxy.NAME) as CounterValuesProxy;
         _loc2_.parseCounters(param1);
      }
      
      private function parseCinemaData(param1:Object) : void
      {
         facade.registerProxy(new CinemaProxy(Vector.<Object>(param1)));
      }
      
      private function parseEasterData(param1:Object) : void
      {
         facade.registerProxy(new EasterProxy(param1));
      }
      
      private function parseBoardGameData(param1:Object) : void
      {
         facade.registerProxy(new BoardgameProxy(param1));
         facade.registerProxy(new BallonEventProxy(param1));
      }
      
      private function parseFrogData(param1:Object) : void
      {
         facade.registerProxy(new FrogProxy(param1));
      }
      
      private function parseXmas2012Data(param1:Object) : void
      {
         facade.registerProxy(new XMas2012Proxy(param1));
      }
      
      private function parseMainBuildingSelectionConfigData(param1:Object) : void
      {
         facade.registerProxy(new MainBuildingSelectionProxy(param1));
      }
      
      private function parseEventRewards(param1:Object) : void
      {
         facade.registerProxy(new EventRewardsProxy(param1));
      }
      
      private function parsePremiumPacksData(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc2_:PremiumPackConfigProxy = facade.getProxy(PremiumPackConfigProxy);
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc3_];
            if(_loc4_ == null)
            {
               continue;
            }
            switch(_loc3_)
            {
               case PREMIUM_PACK_ONE_NODE_NAME:
                  _loc2_.premiumPackOne = this.parsePremiumPack(_loc4_);
                  break;
               case PREMIUM_PACK_TWO_NODE_NAME:
                  _loc2_.premiumPackTwo = this.parsePremiumPack(_loc4_);
                  break;
               case PREMIUM_PACK_FULL_NODE_NAME:
                  _loc2_.premiumPackFull = this.parsePremiumPack(_loc4_);
                  break;
            }
         }
         facade.registerProxy(_loc2_);
      }
      
      private function parsePremiumPack(param1:Object) : PremiumPackConfigVO
      {
         var attributeName:String = null;
         var data:Object = param1;
         var premiumPack:PremiumPackConfigVO = new PremiumPackConfigVO();
         for(attributeName in data)
         {
            try
            {
               premiumPack[attributeName] = data[attributeName];
            }
            catch(error:Error)
            {
            }
         }
         return premiumPack;
      }
      
      private function parseGenusConfigData(param1:Object) : void
      {
         var _loc2_:GenusConfigProxy = facade.retrieveProxy(GenusConfigProxy.NAME) as GenusConfigProxy;
         _loc2_.setData(param1);
         param1 = null;
      }
      
      private function parsePowerupsConfigData(param1:Object, param2:ItemConfigVO) : void
      {
         var _loc3_:Object = null;
         var _loc4_:PowerupProxy = null;
         var _loc5_:String = null;
         var _loc6_:PowerupShopData = null;
         for each(_loc3_ in param1)
         {
            _loc6_ = new PowerupShopData();
            ObjectHelper.copyData(_loc6_,_loc3_);
            param2.powerupData[_loc6_.itemId] = _loc6_;
         }
         _loc4_ = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         for(_loc5_ in param1)
         {
            _loc4_.addPowerupConfig(this.parsePowerupItem(param1[_loc5_]));
         }
      }
      
      private function parsePowerupItem(param1:Object) : PowerupItemConfigVO
      {
         var attributeName:String = null;
         var affected:AffectedPropertyVO = null;
         var data:Object = param1;
         var powerupItem:PowerupItemConfigVO = new PowerupItemConfigVO();
         for(attributeName in data)
         {
            if(attributeName != this.AFFECTS_NODE_NAME)
            {
               try
               {
                  powerupItem[attributeName] = data[attributeName];
               }
               catch(error:Error)
               {
               }
               continue;
            }
            affected = new AffectedPropertyVO();
            ObjectHelper.copyData(powerupItem.affectedProp,data[attributeName]);
         }
         return powerupItem;
      }
      
      public function parseGlobalEventConfigData(param1:Object) : void
      {
         var attributeName:String = null;
         var globalEventVO:GlobalEventVO = null;
         var globalEventData:Object = null;
         var eventAtribbName:String = null;
         var data:Object = param1;
         var globalEventPorxy:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         for(attributeName in data)
         {
            globalEventVO = new GlobalEventVO();
            globalEventData = data[attributeName];
            for(eventAtribbName in globalEventData)
            {
               if(eventAtribbName == "params")
               {
                  globalEventVO.params = this.parseDinamicData(data[eventAtribbName]);
                  addr139:
                  continue;
               }
               if(eventAtribbName == "displayTimer")
               {
                  globalEventVO.displayTimer = globalEventData.displayTimer != 0;
               }
               else if(eventAtribbName == "affectedActions")
               {
                  globalEventVO[eventAtribbName] = globalEventData[eventAtribbName];
                  globalEventVO.affectedActionObject = com.adobe.serialization.json.JSON.decode(globalEventData[eventAtribbName]);
               }
               else
               {
                  globalEventVO[eventAtribbName] = globalEventData[eventAtribbName];
               }
               §§goto(addr139);
               sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand : parseGlobalEventConfigData()" + this.§§slot[1]);
            }
            globalEventPorxy.storeGlobalEventData(globalEventVO);
         }
      }
      
      public function parseRewardItems(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:RewardItemsVo = new RewardItemsVo();
         var _loc3_:RewardItemVo = new RewardItemVo();
         _loc2_.rewardViewType = param1.type;
         for each(_loc5_ in param1.items)
         {
            for each(_loc4_ in _loc5_)
            {
               _loc3_ = new RewardItemVo();
               _loc3_.categoryId = Categories.MATERIAL;
               _loc3_.amount = _loc4_.count;
               _loc3_.id = _loc4_.id;
               _loc2_.items.push(_loc3_);
            }
         }
         if(_loc2_.items.length > 0)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_REWARD_WINDOW,"RECYCLING_REWARD_WINDOW",_loc2_));
         }
      }
      
      private function parsePromoPackConfigData(param1:Object) : void
      {
         var objectName:String = null;
         var pack:Object = null;
         var packVO:PromoPackVO = null;
         var dataName:String = null;
         var data:Object = param1;
         var promoPackProxy:PromoPackProxy = new PromoPackProxy();
         facade.registerProxy(promoPackProxy);
         for(objectName in data)
         {
            pack = data[objectName];
            packVO = new PromoPackVO();
            for(dataName in pack)
            {
               packVO[dataName] = pack[dataName];
            }
            promoPackProxy.addPack(packVO);
         }
      }
      
      private function parsePayPacksConfig(param1:Object) : void
      {
         var objectName:String = null;
         var pack:Object = null;
         var packVO:AdamConfigVO = null;
         var dataName:String = null;
         var data:Object = param1;
         var adamProxy:AdamConfigProxy = new AdamConfigProxy();
         facade.registerProxy(adamProxy);
         for(objectName in data)
         {
            pack = data[objectName];
            packVO = new AdamConfigVO();
            for(dataName in pack)
            {
               packVO.packId = pack.id;
               packVO.items = this.getItemsForPayPacks(data[objectName]["items"]);
            }
            adamProxy.addConfigItem(packVO);
         }
      }
      
      private function getItemsForPayPacks(param1:Object) : Vector.<ItemPackVO>
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:ItemPackVO = null;
         var _loc2_:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = ItemTypeHelper.typeToCategory(_loc3_);
            for(_loc6_ in _loc4_)
            {
               _loc7_ = new ItemPackVO();
               _loc7_.category = _loc5_;
               _loc7_.itemId = int(_loc6_);
               if(_loc3_ == "cV")
               {
                  _loc7_.itemId = UserResources.VIRTUAL_MONEY;
               }
               if(_loc3_ == "cR")
               {
                  _loc7_.itemId = UserResources.REAL_MONEY;
               }
               _loc7_.count = _loc4_[_loc6_];
               _loc2_.push(_loc7_);
            }
         }
         return _loc2_;
      }
      
      private function parseCollectableSetsConfigData(param1:Object) : void
      {
         var _loc3_:CollectionSetConfigVO = null;
         var _loc4_:String = null;
         var _loc5_:Vector.<ItemVO> = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Dictionary = new Dictionary();
         _loc2_[Categories.SPECIES] = new Vector.<CollectionSetConfigVO>();
         _loc2_[Categories.CAGE] = new Vector.<CollectionSetConfigVO>();
         _loc2_[Categories.ASSISTANCE] = new Vector.<CollectionSetConfigVO>();
         _loc2_[Categories.SPECIAL] = new Vector.<CollectionSetConfigVO>();
         for(_loc4_ in param1)
         {
            if(_loc4_ != "genus")
            {
               for(_loc6_ in param1[_loc4_])
               {
                  if(isNaN(Number(_loc6_)))
                  {
                     for(_loc7_ in param1[_loc4_][_loc6_])
                     {
                        _loc3_ = this.createCollectionSetConfigVO(param1[_loc4_][_loc6_][_loc7_],ItemTypeHelper.typeToCategory(_loc6_));
                        _loc2_[ItemTypeHelper.typeToCategory(_loc4_)].push(_loc3_);
                     }
                  }
                  else
                  {
                     _loc3_ = this.createCollectionSetConfigVO(param1[_loc4_][_loc6_],ItemTypeHelper.typeToCategory(_loc4_));
                     _loc2_[ItemTypeHelper.typeToCategory(_loc4_)].push(_loc3_);
                  }
               }
            }
         }
         _loc5_ = new Vector.<ItemVO>();
         _loc5_.push(new ItemVO(1000,-1,Categories.COLLECTIBLE));
         _loc5_.push(new ItemVO(1001,-1,Categories.COLLECTIBLE));
         _loc5_.push(new ItemVO(1002,-1,Categories.COLLECTIBLE));
         facade.registerProxy(new CollectionSetsConfigProxy(_loc2_));
         facade.registerProxy(new CollectionPoolSetProxy(_loc5_));
      }
      
      private function createCollectionSetConfigVO(param1:Object, param2:int) : CollectionSetConfigVO
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:ItemVO = null;
         var _loc8_:ItemPackVO = null;
         var _loc3_:Object = param1;
         var _loc4_:CollectionSetConfigVO = new CollectionSetConfigVO();
         _loc4_.setCategory = param2;
         _loc4_.setItemId = _loc3_["id"];
         _loc4_.collectionId = 10000 * _loc4_.setCategory + _loc4_.setItemId;
         _loc4_.collectables = new Vector.<ItemVO>();
         for(_loc5_ in _loc3_["items"])
         {
            _loc7_ = new ItemVO();
            _loc7_.category = Categories.COLLECTIBLE;
            _loc7_.itemId = _loc3_["items"][_loc5_];
            _loc4_.collectables.push(_loc7_);
         }
         _loc4_.rewards = new Vector.<ItemPackVO>();
         for(_loc6_ in _loc3_["rewards"])
         {
            _loc8_ = new ItemPackVO();
            _loc8_.packId = int(_loc6_);
            _loc8_.category = ItemTypeHelper.typeToCategory(_loc3_["rewards"][_loc6_]["type"]);
            _loc8_.itemId = _loc3_["rewards"][_loc6_]["id"];
            _loc8_.count = _loc3_["rewards"][_loc6_]["amount"];
            _loc4_.rewards.push(_loc8_);
         }
         return _loc4_;
      }
      
      private function parseDinamicData(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc2_:Object = new Object();
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] is String || param1[_loc3_] is Number)
            {
               _loc2_[_loc3_] = param1[_loc3_];
            }
            else
            {
               _loc2_[_loc3_] = this.parseDinamicData(param1[_loc3_]);
            }
         }
         return _loc2_;
      }
      
      private function parseAchievementsConfig(param1:Object) : void
      {
         var achievementItems:String = null;
         var achData:Object = null;
         var achVO:AchievementData = null;
         var attribute:String = null;
         var data:Object = param1;
         var achievementsVector:Vector.<AchievementData> = new Vector.<AchievementData>();
         for(achievementItems in data)
         {
            achData = data[achievementItems];
            achVO = new AchievementData();
            for(attribute in achData)
            {
               achVO[attribute] = achData[attribute];
            }
            achievementsVector.push(achVO);
         }
         facade.registerProxy(new AchievementConfigProxy(achievementsVector));
      }
   }
}

