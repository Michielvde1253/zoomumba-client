package com.bigpoint.zoorama.utils.configModules
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.view.field.items.Decor;
   
   public class TextIdHelper
   {
      public function TextIdHelper()
      {
         super();
      }
      
      public static function getCardName(param1:int, param2:int, param3:int = -1) : String
      {
         var _loc4_:* = "";
         switch(param1)
         {
            case Categories.ANIMAL:
            case Categories.SPECIES:
               if(param3 > 0)
               {
                  _loc4_ = "zoo.genus.title." + param3;
                  if(TextResourceModule.getText(_loc4_) == _loc4_)
                  {
                     _loc4_ = "zoo.window.shopAnimalInfo.titel_" + param2;
                  }
               }
               else
               {
                  _loc4_ = "zoo.window.shopAnimalInfo.titel_" + param2;
               }
               break;
            case Categories.CAGE:
               _loc4_ = "zoo.window.shopCageInfo.titel_" + param2;
               break;
            case Categories.DECOR:
               if(param2 >= Decor.STORAGE_START_ID && param2 < Decor.STORAGE_END_ID && FeatureActiveReference.storage)
               {
                  _loc4_ = "zoo.premium.title." + param2;
               }
               else if(param2 == 80 || param2 == 81 || param2 == 82)
               {
                  _loc4_ = "zoo.window.shopDecorationInfo.titel_80";
               }
               else
               {
                  _loc4_ = "zoo.window.shopDecorationInfo.titel_" + param2;
               }
               break;
            case Categories.STORE:
               _loc4_ = "zoo.window.shopStoreInfo.titel_" + param2;
               break;
            case Categories.RESOURCES:
               _loc4_ = "zoo.window.shopResourceInfo.titel_" + param2;
               break;
            case Categories.MATERIAL:
               _loc4_ = "zoo.window.recyclingMaterialInfo.titel_" + param2;
               break;
            case Categories.ROAD:
               _loc4_ = "zoo.window.shopRoadsInfo.titel_" + param2;
               break;
            case Categories.TRASHBIN:
               _loc4_ = "zoo.window.shopTrashbinInfo.titel_" + param2;
               break;
            case Categories.ASSISTANCE:
               _loc4_ = "zoo.premium.assist.title." + param2;
               break;
            case Categories.PREMIUM:
               _loc4_ = "zoo.premium.title." + param2;
               break;
            case Categories.POWERUP:
               _loc4_ = "zoo.shop.specials.powerUps." + param2 + ".title";
               break;
            case Categories.SAFARI_JOKER:
               _loc4_ = "zoo.safari.jokers.titel_" + param2;
               break;
            case Categories.BREEDING_LAB:
               _loc4_ = "zoo.premium.breedingLab.title";
               break;
            case Categories.NURSERY:
               _loc4_ = "zoo.premium.nursery.title";
               break;
            case Categories.COLLECTIBLE:
               _loc4_ = "zoo.collectableItems.name." + param2;
               break;
            case Categories.STORAGE:
               _loc4_ = "zoo.premium.title." + param2;
               break;
            case Categories.EXPANSION:
               _loc4_ = "zoo.premium.title." + param2;
               break;
            case Categories.USER:
               _loc4_ = "zoo.window.general." + UserResources.getName(param2) + "_singular";
               break;
            case Categories.SUPRISE_BOX:
               _loc4_ = "zoo.window.recyclingMaterialInfo.surpriseBox.titel_" + param2;
         }
         return TextResourceModule.getText(_loc4_);
      }
      
      public static function getCardInfo(param1:int, param2:int, param3:int = -1) : String
      {
         var _loc4_:* = "";
         switch(param1)
         {
            case Categories.ANIMAL:
               _loc4_ = "zoo.window.shopAnimalInfo.text_" + ConfigurationModule.getInstance().getAnimalData(param2).speciesId;
               break;
            case Categories.SPECIES:
               if(param3 != -1 && param3 != 0)
               {
                  _loc4_ = "zoo.genus.text." + param3;
                  if(TextResourceModule.getText(_loc4_) == _loc4_)
                  {
                     _loc4_ = "zoo.window.shopAnimalInfo.text_" + param2;
                  }
               }
               else
               {
                  _loc4_ = "zoo.window.shopAnimalInfo.text_" + param2;
               }
               break;
            case Categories.CAGE:
               _loc4_ = "zoo.window.shopCageInfo.text_" + param2;
               break;
            case Categories.DECOR:
               if(param2 >= Decor.STORAGE_START_ID && param2 < Decor.STORAGE_END_ID && FeatureActiveReference.storage)
               {
                  _loc4_ = "zoo.premium.infoText." + param2;
               }
               else if(param2 == 80 || param2 == 81 || param2 == 82)
               {
                  _loc4_ = "zoo.window.shopDecorationInfo.text_80";
               }
               else
               {
                  _loc4_ = "zoo.window.shopDecorationInfo.text_" + param2;
               }
               break;
            case Categories.STORE:
               _loc4_ = "zoo.window.shopStoreInfo.text_" + param2;
               break;
            case Categories.RESOURCES:
               _loc4_ = "zoo.window.shopResourceInfo.text_" + param2;
               break;
            case Categories.ROAD:
               _loc4_ = "zoo.window.shopRoadsInfo.text_" + param2;
               break;
            case Categories.TRASHBIN:
               _loc4_ = "zoo.window.shopTrashbinInfo.text_" + param2;
               break;
            case Categories.ASSISTANCE:
               _loc4_ = "zoo.premium.assist.infoText." + param2;
               break;
            case Categories.PREMIUM:
               _loc4_ = "zoo.premium.infoText." + param2;
               break;
            case Categories.POWERUP:
               _loc4_ = "zoo.shop.specials.powerUps." + param2 + ".text";
               break;
            case Categories.SAFARI_JOKER:
               _loc4_ = "zoo.safari.jokers.text_" + param2;
               break;
            case Categories.COLLECTIBLE:
               _loc4_ = "zoo.collectableItems.setInfo." + param2;
               break;
            case Categories.STORAGE:
               _loc4_ = "zoo.premium.infoText." + param2;
               break;
            case Categories.MATERIAL:
               _loc4_ = "zoo.window.recyclingMaterialInfo.text_" + param2;
               break;
            case Categories.EXPANSION:
               _loc4_ = "zoo.premium.infoText." + param2;
               break;
            case Categories.BREEDING_LAB:
               _loc4_ = "zoo.premium.breedingLab.text";
               break;
            case Categories.NURSERY:
               _loc4_ = "zoo.premium.nursery.text";
               break;
            case Categories.SUPRISE_BOX:
               _loc4_ = "zoo.window.recyclingMaterialInfo.surpriseBox.text_" + param2;
         }
         return TextResourceModule.getText(_loc4_);
      }
      
      public static function getSetInfo(param1:int, param2:int) : String
      {
         var _loc3_:String = "NOT HANDLED";
         switch(param1)
         {
            case Categories.ANIMAL:
               break;
            case Categories.SPECIES:
               _loc3_ = "zoo.speciesItems.setInfo." + param2;
               break;
            case Categories.CAGE:
               _loc3_ = "zoo.cageItems.setInfo." + param2;
               break;
            case Categories.DECOR:
            case Categories.STORE:
            case Categories.RESOURCES:
            case Categories.ROAD:
            case Categories.TRASHBIN:
            case Categories.PREMIUM:
               break;
            case Categories.ASSISTANCE:
               _loc3_ = "zoo.assistantItems.setInfo." + param2;
               break;
            case Categories.SAFARI_JOKER:
               break;
            case Categories.COLLECTIBLE:
               _loc3_ = "zoo.collectableItems.setInfo." + param2;
               break;
            case Categories.EVENTS:
               _loc3_ = "zoo.eventItems.setInfo." + param2;
         }
         return TextResourceModule.getText(_loc3_);
      }
      
      public static function getSetName(param1:int, param2:int) : String
      {
         var _loc3_:* = "NOT HANDLED";
         switch(param1)
         {
            case Categories.ANIMAL:
               break;
            case Categories.SPECIES:
               _loc3_ = TextIdHelper.getCardName(param1,param2);
               break;
            case Categories.CAGE:
               _loc3_ = TextIdHelper.getCardName(param1,param2);
               break;
            case Categories.DECOR:
            case Categories.STORE:
            case Categories.RESOURCES:
            case Categories.ROAD:
            case Categories.TRASHBIN:
            case Categories.PREMIUM:
            case Categories.MATERIAL:
               break;
            case Categories.ASSISTANCE:
               _loc3_ = "zoo.assistantItems.setName." + param2;
               break;
            case Categories.SAFARI_JOKER:
               break;
            case Categories.COLLECTIBLE:
               _loc3_ = "zoo.collectableItems.name." + param2;
               break;
            case Categories.EVENTS:
               _loc3_ = "zoo.eventItems.setName." + param2;
               break;
            case Categories.USER:
               _loc3_ = "zoo.window.general." + UserResources.getName(param2) + "_singular";
         }
         return TextResourceModule.getText(_loc3_);
      }
      
      public static function getName(param1:int, param2:int) : String
      {
         var _loc3_:* = "NAME";
         switch(param1)
         {
            case Categories.USER:
               _loc3_ = "zoo.window.general." + UserResources.getName(param2) + "_singular";
               break;
            case Categories.SPECIES:
               _loc3_ = "zoo.window.shopAnimalInfo.titel_" + param2;
         }
         return TextResourceModule.getText(_loc3_);
      }
   }
}

