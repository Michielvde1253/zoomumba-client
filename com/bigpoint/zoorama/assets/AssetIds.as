package com.bigpoint.zoorama.assets
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemConstants;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariShopWindow;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   
   public class AssetIds
   {
      public static var ROAD_THEME:String = "";
      
      private static const INFO_TYPE_TIMES:String = "x";
      
      private static const INFO_TYPE_HOURS:String = "h";
      
      public function AssetIds()
      {
         super();
      }
      
      public static function getShopId(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         switch(param1)
         {
            case Categories.ANIMAL:
               _loc3_ = AssetConfig.PREFIX_ANIMAL_PREVIEW;
               break;
            case Categories.CAGE:
               _loc3_ = "shopcage_";
               break;
            case Categories.DECOR:
               _loc3_ = "shopdecor_";
               break;
            case Categories.STORE:
               _loc3_ = "shopstore_";
               break;
            case Categories.RESOURCES:
               _loc3_ = "shopresource_";
               break;
            case Categories.ROAD:
               _loc3_ = "shoproad_";
               break;
            case Categories.TRASHBIN:
               _loc3_ = "shoptrashbin_";
               break;
            case Categories.ASSISTANCE:
               _loc3_ = "shopAssistant_";
               break;
            case Categories.PREMIUM:
               _loc3_ = "shopPremium_";
         }
         return _loc3_ + param2;
      }
      
      public static function getFieldAssetId(param1:int, param2:int, param3:int = 1, param4:int = -1) : String
      {
         var _loc5_:String = "";
         switch(param1)
         {
            case Categories.ANIMAL:
               throw Error("AssetIds.getFieldAssetId > Animals don\'t have field assets.");
            case Categories.SPECIES:
               _loc5_ = "specie_field_" + param2;
               break;
            case Categories.CAGE:
               _loc5_ = "cage_field_" + param2 + "_" + param3;
               if(param4 != -1)
               {
                  _loc5_ += "_" + param4;
               }
               break;
            case Categories.DECOR:
               _loc5_ = "decor_field_" + param2;
               break;
            case Categories.SLEIGH:
            case Categories.SPECIAL:
               _loc5_ = "special_field_" + param2;
               break;
            case Categories.STORE:
               _loc5_ = "store_field_" + param2;
               break;
            case Categories.BREEDING_LAB:
               _loc5_ = "advBreeding_field";
               break;
            case Categories.NURSERY:
               _loc5_ = "nursery_field";
               break;
            case Categories.ROAD:
               if(ROAD_THEME != "")
               {
                  _loc5_ = "road_field_" + param2 + "_" + ROAD_THEME;
               }
               else
               {
                  _loc5_ = "road_field_" + param2;
               }
               break;
            case Categories.TRASHBIN:
               _loc5_ = "trashBin_field_" + param2;
               break;
            case Categories.TRASHROAD:
               _loc5_ = "trashOnRoad_field_" + param2;
               break;
            case Categories.SPECIAL:
               throw Error("AssetIds.getFieldAssetId > TODO:imlement");
            case Categories.RESOURCES:
               throw Error("AssetIds.getFieldAssetId > Resources don\'t have field assets.");
            case Categories.ASSISTANCE:
               throw Error("AssetIds.getFieldAssetId > Assistances don\'t have field assets.");
            case Categories.PREMIUM:
               throw Error("AssetIds.getFieldAssetId > Premium items don\'t have field assets. (Special buildings should be used instead)");
            case Categories.VISITOR:
               _loc5_ = "visitor_field_" + param2;
               break;
            case Categories.SAFARI_JOKER:
               throw Error("AssetIds.getFieldAssetId > Safari jokers items don\'t have field assets.");
            case Categories.CATEGORY_UNDEFINED:
            default:
               throw Error("AssetIds.getFieldAssetId > Category Id is not defined.");
         }
         return _loc5_;
      }
      
      public static function getPreviewAssetId(param1:int, param2:int, param3:int = 0, param4:int = -1) : String
      {
         var _loc6_:ItemConfigProxy = null;
         var _loc7_:CageShopData = null;
         var _loc5_:* = "";
         switch(param1)
         {
            case Categories.USER:
               if(param2 == UserResources.OCEAN_VIRTUAL_MONEY)
               {
                  param2 = UserResources.VIRTUAL_MONEY;
               }
               _loc5_ = "userResource_preview_" + param2;
               break;
            case Categories.ANIMAL:
               _loc5_ = "specie_preview_animal_" + param2;
               break;
            case Categories.SPECIES:
               throw Error("AssetIds.getPreviewAssetId > Species don\'t have preview assets.(Animals has.) itemId: " + param2);
            case Categories.CAGE:
               _loc6_ = TempGetterProxy.getItemConfigProxy();
               _loc7_ = _loc6_.getCageData(param2);
               if(_loc7_ == null)
               {
                  return null;
               }
               if(param3 == 0)
               {
                  param3 = _loc7_.baseLevel;
               }
               else if(param3 < _loc7_.baseLevel)
               {
                  param3 = _loc7_.baseLevel;
                  TempGetterProxy.sendNotification(Note.WARNING_REPORT,"Cage with id " + param2.toString() + " does not have the level you requested ");
               }
               _loc5_ = "cage_preview_" + param2 + "_" + param3;
               if(param4 != -1)
               {
                  _loc5_ += "_" + param4;
               }
               break;
            case Categories.DECOR:
               _loc5_ = "decor_preview_" + param2;
               break;
            case Categories.STORE:
               _loc5_ = "store_preview_" + param2;
               break;
            case Categories.ROAD:
               _loc5_ = "road_preview_" + param2;
               break;
            case Categories.TRASHBIN:
               _loc5_ = "trashBin_preview_" + param2;
               break;
            case Categories.TRASHROAD:
               throw Error("AssetIds.getPreviewAssetId > Trash on road don\'t have preview assets.(Trash Bin has.)");
            case Categories.SPECIAL:
               _loc5_ = "special_preview_" + param2;
               break;
            case Categories.RESOURCES:
               _loc5_ = "resource_preview_" + param2;
               break;
            case Categories.ASSISTANCE:
               _loc5_ = "assistant_preview_" + param2;
               break;
            case Categories.PREMIUM:
               _loc5_ = "premium_preview_" + param2;
               break;
            case Categories.EVENTS:
               _loc5_ = "event_preview_" + param2;
               break;
            case Categories.POWERUP:
               _loc5_ = "powerUp_preview_" + param2;
               break;
            case Categories.PAY_PREMIUM:
               _loc5_ = "payPremium_preview_" + param2;
               break;
            case Categories.VISITOR:
               throw Error("AssetIds.getPreviewAssetId > Visitors don\'t have preview assets.");
            case Categories.SAFARI_JOKER:
               if(param2 == 2 && SafariShopWindow.useAsiaHack)
               {
                  _loc5_ = "joker_preview_" + param2 + "_asia";
               }
               else
               {
                  _loc5_ = "joker_preview_" + param2;
               }
               break;
            case Categories.COLLECTIBLE:
               _loc5_ = "collectable_preview_" + param2;
               break;
            case Categories.EXPANSION:
               _loc5_ = "premium_preview_" + param2;
               break;
            case Categories.STORAGE:
               _loc5_ = "decor_preview_" + param2;
               break;
            case Categories.BREEDING_LAB:
               _loc5_ = "advBreeding_preview";
               break;
            case Categories.NURSERY:
               _loc5_ = "nursery_preview";
               break;
            case Categories.MANAGEMENT_CENTER:
               _loc5_ = "managementcenter_preview_" + param2 + "_" + param3;
               break;
            case Categories.MATERIAL:
               _loc5_ = "material_preview_" + param2;
               break;
            case Categories.SUPRISE_BOX:
               _loc5_ = "surpriseBox_preview_" + param2;
               break;
            case Categories.CATEGORY_UNDEFINED:
            default:
               if(Settings.DEBUG_MODE)
               {
                  throw Error("AssetIds.getPreviewAssetId > Category [" + param1 + "] id is not defined.");
               }
               break;
         }
         return _loc5_;
      }
      
      public static function getShopItemData(param1:String, param2:int, param3:int = 0) : ShopItemData
      {
         var _loc4_:ShopItemData = null;
         var _loc5_:AnimalShopData = null;
         if(param1 == "user")
         {
            _loc4_ = new ShopItemData();
            _loc4_.categoryId = Categories.CATEGORY_UNDEFINED;
            if(param2 == 0)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_VIRTUAL_MONEY_ICON;
               _loc4_.localizedName = param3 <= 1 ? TextResourceModule.getText("zoo.window.general.petPenny_singular") : TextResourceModule.getText("zoo.window.general.petPenny_plural");
            }
            else if(param2 == 1)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_REAL_MONEY_ICON;
               _loc4_.localizedName = param3 <= 1 ? TextResourceModule.getText("zoo.window.general.zooDollar_singular") : TextResourceModule.getText("zoo.window.general.zoo.window.general.zooDollar_plural");
            }
            else if(param2 == 2)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_EXPERIERENCE_REWARD_ICON;
               _loc4_.localizedName = TextResourceModule.getText("zoo.window.general.xp_plural");
            }
            else if(param2 == 3)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_PETPAW_REWARD_ICON;
               _loc4_.localizedName = param3 <= 1 ? TextResourceModule.getText("zoo.window.general.petPaw_singular") : TextResourceModule.getText("zoo.window.general.petPaw_plural");
            }
            else if(param2 == 999)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_ALLASSIST_REWARD_ICON;
               _loc4_.countType = INFO_TYPE_HOURS;
            }
         }
         else if(param1 == "collectionItems")
         {
            _loc4_ = new ShopItemData();
            _loc4_.categoryId = Categories.CATEGORY_UNDEFINED;
            _loc4_.countType = INFO_TYPE_TIMES;
            if(param2 == 1)
            {
               _loc4_.linkageId = AssetConfig.COMMONS_FZOO_COIN_ICON;
               _loc4_.localizedName = TextResourceModule.getText("zoo.collectableItems.forgottenZoo.title");
            }
         }
         else if(param1 == "powerUps")
         {
            _loc4_ = new ShopItemData();
            _loc4_.categoryId = Categories.POWERUP;
            _loc4_.linkageId = PowerupItemConstants.ICONS[param2];
            _loc4_.localizedName = TextResourceModule.getText(PowerupItemConstants.TOOLTIP_TEXTS[param2]);
            _loc4_.countType = INFO_TYPE_TIMES;
         }
         else
         {
            switch(param1)
            {
               case "assist":
               case "assists":
                  _loc4_ = ConfigurationModule.getInstance().getAssistanceData(param2);
                  _loc4_.countType = INFO_TYPE_HOURS;
                  break;
               case "cages":
               case "cage":
                  _loc4_ = ConfigurationModule.getInstance().getCageData(param2);
                  _loc4_.level = ConfigurationModule.getInstance().getCageData(param2).baseLevel;
                  break;
               case "decors":
               case "decor":
               case "decos":
               case "deco":
                  _loc4_ = ConfigurationModule.getInstance().getDecorationData(param2);
                  break;
               case "road":
                  _loc4_ = ConfigurationModule.getInstance().getRoadData(param2);
                  break;
               case "stores":
               case "store":
               case "shops":
               case "shop":
                  _loc4_ = ConfigurationModule.getInstance().getStoreData(param2);
                  break;
               case "material":
               case "materials":
                  _loc4_ = ConfigurationModule.getInstance().getMaterialData(param2);
                  break;
               case "trashbins":
               case "trashbin":
                  _loc4_ = ConfigurationModule.getInstance().getTrashBinData(param2);
                  break;
               case "animals":
               case "animal":
                  _loc5_ = ConfigurationModule.getInstance().getAnimalData(param2);
                  _loc4_ = ConfigurationModule.getInstance().getAnimalData(param2);
                  _loc4_.localizedName = TextIdHelper.getCardName(_loc5_.categoryId,_loc5_.speciesId);
                  break;
               case "resources":
               case "resource":
                  _loc4_ = ConfigurationModule.getInstance().getResourseData(param2);
                  _loc4_.countType = INFO_TYPE_TIMES;
            }
         }
         if(Boolean(_loc4_) && param3 != 0)
         {
            _loc4_.count = param3;
         }
         if(Boolean(_loc4_) && _loc4_.localizedName == "")
         {
            _loc4_.localizedName = TextIdHelper.getCardName(_loc4_.categoryId,_loc4_.itemId);
         }
         return _loc4_;
      }
      
      public static function getPreviewAssetForItemVO(param1:int, param2:int) : String
      {
         var _loc6_:CageShopData = null;
         var _loc3_:int = param1;
         var _loc4_:int = param2;
         var _loc5_:int = 0;
         if(param1 == Categories.SPECIES)
         {
            _loc3_ = Categories.ANIMAL;
            _loc4_ = ConfigurationModule.getInstance().getMaleAnimalData(param2).itemId;
         }
         if(param1 == Categories.CAGE)
         {
            _loc6_ = ConfigurationModule.getInstance().getCageData(param2);
            _loc5_ = _loc6_.baseLevel;
         }
         return AssetIds.getPreviewAssetId(_loc3_,_loc4_,_loc5_);
      }
   }
}

