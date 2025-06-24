package com.bigpoint.utils
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class ItemTypeHelper
   {
      public function ItemTypeHelper()
      {
         super();
      }
      
      public static function typeToCategory(param1:String) : int
      {
         var _loc2_:int = Categories.CATEGORY_UNDEFINED;
         switch(param1)
         {
            case "avatar":
               _loc2_ = Categories.AVATAR;
               break;
            case "surprisebox":
            case "surpriseBox":
               _loc2_ = Categories.SUPRISE_BOX;
               break;
            case "user":
               _loc2_ = Categories.USER;
               break;
            case "resources":
            case "resource":
               _loc2_ = Categories.RESOURCES;
               break;
            case "assists":
            case "assist":
               _loc2_ = Categories.ASSISTANCE;
               break;
            case "cages":
            case "cage":
               _loc2_ = Categories.CAGE;
               break;
            case "decors":
            case "decor":
            case "decos":
            case "deco":
               _loc2_ = Categories.DECOR;
               break;
            case "road":
               _loc2_ = Categories.ROAD;
               break;
            case "stores":
            case "store":
            case "shops":
            case "shop":
               _loc2_ = Categories.STORE;
               break;
            case "trashbins":
            case "trashbin":
               _loc2_ = Categories.TRASHBIN;
               break;
            case "animals":
            case "animal":
               _loc2_ = Categories.ANIMAL;
               break;
            case "materials":
            case "material":
               _loc2_ = Categories.MATERIAL;
               break;
            case "species":
            case "specie":
               _loc2_ = Categories.SPECIES;
               break;
            case "collectionItems":
            case "collectionItem":
            case "collection":
               _loc2_ = Categories.COLLECTIBLE;
               break;
            case "powerUps":
            case "powerup":
               _loc2_ = Categories.POWERUP;
               break;
            case "eventItem":
            case "eventitem":
               _loc2_ = Categories.EVENTITEM;
               break;
            case "cR":
               _loc2_ = Categories.USER;
               break;
            case "cV":
               _loc2_ = Categories.USER;
               break;
            case "payPremium":
               _loc2_ = Categories.PAY_PREMIUM;
               break;
            case "specials":
               _loc2_ = Categories.SPECIAL;
               break;
            case "collectable":
               _loc2_ = Categories.COLLECTIBLE;
               break;
            case "events":
               _loc2_ = Categories.EVENTS;
               break;
            case "currency":
               _loc2_ = Categories.CURRENCY;
               break;
            case "pack":
               _loc2_ = Categories.PACK;
               break;
            case "blueprints":
            case "Blueprints":
            case "bluePrints":
            case "blueprint":
            case "Blueprint":
            case "bluePrint":
               _loc2_ = Categories.BLUEPRINT;
               break;
            default:
               _loc2_ = Categories.CATEGORY_UNDEFINED;
         }
         return _loc2_;
      }
      
      public static function categoryToType(param1:int) : String
      {
         var _loc2_:String = "not defined";
         switch(param1)
         {
            case Categories.USER:
               _loc2_ = "user";
               break;
            case Categories.RESOURCES:
               _loc2_ = "resources";
               break;
            case Categories.ASSISTANCE:
               _loc2_ = "assists";
               break;
            case Categories.CAGE:
               _loc2_ = "cages";
               break;
            case Categories.DECOR:
               _loc2_ = "decors";
               break;
            case Categories.ROAD:
               _loc2_ = "roads";
               break;
            case Categories.STORE:
               _loc2_ = "stores";
               break;
            case Categories.TRASHBIN:
               _loc2_ = "trashbins";
               break;
            case Categories.ANIMAL:
               _loc2_ = "animals";
               break;
            case Categories.SPECIES:
               _loc2_ = "species";
               break;
            case Categories.EVENTITEM:
               _loc2_ = "eventItem";
               break;
            case Categories.COLLECTIBLE:
               _loc2_ = "collectionItems";
               break;
            case Categories.POWERUP:
               _loc2_ = "powerUps";
               break;
            case Categories.EVENTS:
               _loc2_ = "events";
               break;
            case Categories.BLUEPRINT:
               _loc2_ = "blueprints";
         }
         return _loc2_;
      }
   }
}

