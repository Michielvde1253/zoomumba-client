package com.bigpoint.utils.custom.advSpots
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemAssetVO;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.generic.FillableSpot;
   import spark.components.Group;
   
   public class AutomatorAdvFillableSpot
   {
      public static const STATE_ONLY_DISPLAY:String = "onlyDisplay";
      
      public static const STATE_ONLY_DISPLAY_ANIMAL_BABY:String = "onlyDisplaySpecieBaby";
      
      public static const STATE_ONLY_DISPLAY_ANIMAL_MALE:String = "onlyDisplaySpecieMale";
      
      public static const STATE_ONLY_DISPLAY_ANIMAL_FEMALE:String = "onlyDisplaySpecieFemale";
      
      public static const STATE_ITEM_ADDED:String = "filledDefault";
      
      public static const STATE_ANIMAL_BABY_ADDED:String = "filledSpecieBaby";
      
      public static const STATE_ANIMAL_MALE_ADDED:String = "filledSpecieMale";
      
      public static const STATE_ANIMAL_FEMALE_ADDED:String = "filledSpecieFemale";
      
      public function AutomatorAdvFillableSpot()
      {
         super();
      }
      
      public static function fillAnimals(param1:Object, param2:ItemConfigProxy, param3:Group, param4:String, param5:Array) : Boolean
      {
         var _loc6_:ItemAssetVO = null;
         var _loc7_:AnimalShopData = null;
         var _loc8_:FillableSpot = null;
         var _loc9_:int = 0;
         var _loc11_:String = null;
         var _loc10_:Boolean = true;
         for(_loc11_ in param1)
         {
            _loc9_ = int(param1[_loc11_]);
            _loc8_ = param3[param4 + _loc11_] as FillableSpot;
            if(_loc9_ != -1 && _loc8_.value == null)
            {
               _loc7_ = param2.getAnimalData(_loc9_);
               _loc6_ = new ItemAssetVO(Categories.ANIMAL,_loc9_);
               _loc6_.callBack = repositionAsset;
               _loc6_.callBackParams = [_loc8_,_loc7_,param5];
               _loc6_.scale = 1;
               _loc6_.preloaderType = PreloaderTypes.MINI;
               _loc6_.linkage = AssetConfig.DEFAULT_CIRCLE_SPR;
               fillSpot(_loc8_,_loc9_,AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY,_loc6_);
            }
            if(_loc8_.value == null)
            {
               _loc10_ = false;
            }
         }
         return _loc10_;
      }
      
      public static function fillCurrencies(param1:Vector.<AnimalShopData>, param2:ItemConfigProxy, param3:Group) : Boolean
      {
         var _loc4_:ItemAssetVO = null;
         var _loc5_:AnimalShopData = null;
         var _loc6_:FillableSpot = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = true;
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc6_ = param3.getChildAt(_loc9_) as FillableSpot;
            if(param1[_loc9_])
            {
               _loc7_ = param1[_loc9_].animalId;
               if(_loc6_.value == null)
               {
                  _loc5_ = param2.getAnimalData(_loc7_);
                  _loc4_ = new ItemAssetVO(Categories.ANIMAL,_loc7_);
                  _loc4_.scale = 1;
                  _loc4_.preloaderType = PreloaderTypes.MINI;
                  _loc4_.linkage = AssetConfig.DEFAULT_CIRCLE_SPR;
                  fillSpot(_loc6_,_loc7_,AutomatorAdvFillableSpot.STATE_ITEM_ADDED,_loc4_);
               }
            }
            if(_loc6_.value == null)
            {
               _loc8_ = false;
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      private static function repositionAsset(... rest) : void
      {
         if(Boolean(rest[1].child) || Boolean(rest[1].male))
         {
            rest[0].currentState = rest[2][0];
         }
         else
         {
            rest[0].currentState = rest[2][1];
         }
      }
      
      public static function fillChance(param1:Object, param2:Group, param3:String, param4:String, param5:Boolean = false) : Boolean
      {
         var _loc6_:ItemAssetVO = null;
         var _loc7_:FillableSpot = null;
         var _loc8_:Object = null;
         var _loc10_:String = null;
         var _loc9_:Boolean = true;
         for(_loc10_ in param1)
         {
            _loc8_ = param1[_loc10_];
            _loc7_ = param2[param3 + _loc10_] as FillableSpot;
            if(_loc8_ != null && _loc7_.value == null)
            {
               _loc6_ = new ItemAssetVO(_loc8_.category,_loc8_.itemId);
               _loc6_.fixedWidth = 50;
               _loc6_.preloaderType = PreloaderTypes.MINI;
               fillSpot(_loc7_,_loc8_,param4,_loc6_);
            }
            if(_loc7_.value == null)
            {
               _loc9_ = false;
               if(param5)
               {
                  _loc7_.currentState = "disabled";
               }
            }
         }
         return _loc9_;
      }
      
      private static function fillSpot(param1:FillableSpot, param2:Object, param3:String, param4:ItemAssetVO) : void
      {
         param1.value = param2;
         param1.currentState = param3;
         param1.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(param4.category,param4.itemId),param4.linkage,param4.preloaderType,param4.fixedWidth,param4.fixedHeight,param4.scale,param4.callBack,param4.callBackParams,false);
      }
   }
}

