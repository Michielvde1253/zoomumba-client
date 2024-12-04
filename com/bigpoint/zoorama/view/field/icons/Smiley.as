package com.bigpoint.zoorama.view.field.icons
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Sprite;
   
   public class Smiley extends Sprite
   {
      private static const HAPPINESS_LEVEL_COUNT:int = 6;
      
      private var skin:Sprite;
      
      private var allSmileyPics:Vector.<Vector.<Sprite>>;
      
      private var lastSmylePic:Sprite;
      
      private var coreSmiley:Sprite;
      
      private var cuddleNeed:Sprite;
      
      private var waterNeed:Sprite;
      
      private var foodNeed:Sprite;
      
      private var cured:Sprite;
      
      private var cleanNeed:Sprite;
      
      private var zoomIndex:int = 1;
      
      private var smyleIndex:int = 0;
      
      public function Smiley()
      {
         var _loc2_:int = 0;
         this.skin = new Sprite();
         this.allSmileyPics = new Vector.<Vector.<Sprite>>(MainConfig.ZOOM_LEVELS.length);
         this.coreSmiley = new Sprite();
         this.cuddleNeed = new Sprite();
         this.waterNeed = new Sprite();
         this.foodNeed = new Sprite();
         this.cured = new Sprite();
         this.cleanNeed = new Sprite();
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.allSmileyPics.length)
         {
            this.allSmileyPics[_loc1_] = new Vector.<Sprite>(Smiley.HAPPINESS_LEVEL_COUNT);
            _loc2_ = 0;
            while(_loc2_ < Smiley.HAPPINESS_LEVEL_COUNT)
            {
               this.allSmileyPics[_loc1_][_loc2_] = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS,"Happy" + _loc2_ + "_Zoom" + _loc1_ + "_SPR");
               _loc2_++;
            }
            _loc1_++;
         }
         this.coreSmiley = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Smiley");
         this.coreSmiley.scaleX = 0.38;
         this.coreSmiley.scaleY = 0.38;
         this.coreSmiley.cacheAsBitmap = true;
         this.cuddleNeed = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Needs_Cuddle");
         this.cuddleNeed.scaleX = 0.36;
         this.cuddleNeed.scaleY = 0.36;
         this.cuddleNeed.cacheAsBitmap = true;
         this.waterNeed = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Needs_Water");
         this.waterNeed.scaleX = 0.36;
         this.waterNeed.scaleY = 0.36;
         this.waterNeed.cacheAsBitmap = true;
         this.foodNeed = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Needs_Food");
         this.foodNeed.scaleX = 0.36;
         this.foodNeed.scaleY = 0.36;
         this.foodNeed.cacheAsBitmap = true;
         this.cleanNeed = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Needs_Clean");
         this.cleanNeed.scaleX = 0.38;
         this.cleanNeed.scaleY = 0.38;
         this.cleanNeed.cacheAsBitmap = true;
         this.cured = AssetLibrary.getSprite(AssetConfig.ASSET_SMILEYS_NEEDS,"Cured");
         this.cured.scaleX = 0.38;
         this.cured.scaleY = 0.38;
         this.cured.cacheAsBitmap = true;
         this.skin.mouseEnabled = false;
         this.skin.mouseChildren = false;
         this.addChild(this.skin);
         this.addChild(this.cured);
         this.addChild(this.coreSmiley);
         this.addChild(this.cleanNeed);
         this.addChild(this.cuddleNeed);
         this.addChild(this.waterNeed);
         this.addChild(this.foodNeed);
         this.cacheAsBitmap = true;
         this.skin.visible = false;
         this.coreSmiley.visible = false;
         this.cuddleNeed.visible = false;
         this.waterNeed.visible = false;
         this.foodNeed.visible = false;
         this.cleanNeed.visible = false;
         this.cured.visible = false;
      }
      
      public function showHappiness(param1:int, param2:Boolean, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:Boolean) : void
      {
         if(param7 && !param2)
         {
            this.hideNeeds();
            this.hide();
            this.showCured();
         }
         else
         {
            this.hideNeeds();
            this.hideCured();
            if(param8)
            {
               if(param1 >= MainConfig.ANIMAL_HAPPYNESS_LEVEL_5)
               {
                  this.setSmyleIndex(5);
                  this.show();
               }
               else if(param1 >= MainConfig.ANIMAL_HAPPYNESS_LEVEL_4)
               {
                  this.setSmyleIndex(4);
                  this.show();
               }
               else if(param1 >= MainConfig.ANIMAL_HAPPYNESS_LEVEL_3)
               {
                  this.setSmyleIndex(3);
                  this.show();
               }
               else if(param1 >= MainConfig.ANIMAL_HAPPYNESS_LEVEL_2)
               {
                  this.setSmyleIndex(3);
                  this.show();
               }
               else if(param1 > MainConfig.ANIMAL_HAPPYNESS_LEVEL_1)
               {
                  this.setSmyleIndex(3);
                  this.show();
               }
               else if(!param2)
               {
                  this.setSmyleIndex(0);
                  this.show();
               }
            }
            else
            {
               this.hide();
               if(param1 > MainConfig.ANIMAL_HAPPYNESS_LEVEL_1)
               {
                  if(param6 >= 80)
                  {
                     this.hideCuddle();
                  }
                  if(param3 < 80)
                  {
                     this.showFood();
                     this.showCoreSmiley();
                     if(param6 < 80)
                     {
                        this.showCuddle();
                     }
                  }
                  else
                  {
                     this.hideFood();
                  }
                  if(param4 < 80)
                  {
                     this.showWater();
                     this.showCoreSmiley();
                     if(param6 < 80)
                     {
                        this.showCuddle();
                     }
                  }
                  else
                  {
                     this.hideWater();
                  }
                  if(param5 <= 50)
                  {
                     this.showClean();
                     this.showCoreSmiley();
                     if(param6 < 80)
                     {
                        this.showCuddle();
                     }
                  }
                  else
                  {
                     this.hideClean();
                  }
                  if(param6 >= 80 && param5 >= 50 && param4 >= 80 && param3 >= 80)
                  {
                     this.hideCoreSmiley();
                  }
               }
               else if(!param2)
               {
                  this.hideNeeds();
                  this.setSmyleIndex(0);
                  this.show();
               }
            }
         }
      }
      
      private function setSmyleIndex(param1:int) : void
      {
         if(this.smyleIndex != param1)
         {
            this.smyleIndex = param1;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         if(this.lastSmylePic)
         {
            this.skin.removeChild(this.lastSmylePic);
         }
         this.lastSmylePic = this.allSmileyPics[this.zoomIndex][this.smyleIndex];
         this.skin.addChild(this.lastSmylePic);
      }
      
      private function hide() : void
      {
         this.skin.visible = false;
      }
      
      public function hideNeeds() : void
      {
         this.coreSmiley.visible = false;
         this.foodNeed.visible = false;
         this.waterNeed.visible = false;
         this.cleanNeed.visible = false;
         this.cuddleNeed.visible = false;
      }
      
      private function hideCured() : void
      {
         this.cured.visible = false;
         this.show();
      }
      
      private function hideCoreSmiley() : void
      {
         this.coreSmiley.visible = false;
      }
      
      private function hideFood() : void
      {
         this.foodNeed.visible = false;
      }
      
      private function hideWater() : void
      {
         this.waterNeed.visible = false;
      }
      
      private function hideClean() : void
      {
         this.cleanNeed.visible = false;
      }
      
      private function hideCuddle() : void
      {
         this.cuddleNeed.visible = false;
      }
      
      private function show() : void
      {
         this.skin.visible = true;
      }
      
      private function showCured() : void
      {
         this.cured.visible = true;
         this.hide();
      }
      
      private function showCoreSmiley() : void
      {
         this.coreSmiley.visible = true;
      }
      
      private function showFood() : void
      {
         this.foodNeed.visible = true;
      }
      
      private function showWater() : void
      {
         this.waterNeed.visible = true;
      }
      
      private function showClean() : void
      {
         this.cleanNeed.visible = true;
      }
      
      private function showCuddle() : void
      {
         this.cuddleNeed.visible = true;
      }
      
      public function dispose() : void
      {
         this.skin = null;
      }
      
      public function set zoomLevel(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < MainConfig.ZOOM_LEVELS.length)
         {
            if(param1 == MainConfig.ZOOM_LEVELS[_loc2_])
            {
               this.zoomIndex = _loc2_;
               if(this.zoomIndex == 2)
               {
                  this.coreSmiley.scaleX = 0.38;
                  this.coreSmiley.scaleY = 0.38;
                  this.cuddleNeed.scaleX = 0.36;
                  this.cuddleNeed.scaleY = 0.36;
                  this.waterNeed.scaleX = 0.36;
                  this.waterNeed.scaleY = 0.36;
                  this.foodNeed.scaleX = 0.36;
                  this.foodNeed.scaleY = 0.36;
                  this.cleanNeed.scaleX = 0.38;
                  this.cleanNeed.scaleY = 0.38;
                  this.cured.scaleX = 0.38;
                  this.cured.scaleY = 0.38;
               }
               else if(this.zoomIndex == 1)
               {
                  this.coreSmiley.scaleX = 0.15;
                  this.coreSmiley.scaleY = 0.15;
                  this.cuddleNeed.scaleX = 0.13;
                  this.cuddleNeed.scaleY = 0.13;
                  this.waterNeed.scaleX = 0.13;
                  this.waterNeed.scaleY = 0.13;
                  this.foodNeed.scaleX = 0.13;
                  this.foodNeed.scaleY = 0.13;
                  this.cleanNeed.scaleX = 0.15;
                  this.cleanNeed.scaleY = 0.15;
                  this.cured.scaleX = 0.15;
                  this.cured.scaleY = 0.15;
               }
               else if(this.zoomIndex == 0)
               {
                  this.coreSmiley.scaleX = 0.07;
                  this.coreSmiley.scaleY = 0.07;
                  this.cuddleNeed.scaleX = 0.05;
                  this.cuddleNeed.scaleY = 0.05;
                  this.waterNeed.scaleX = 0.05;
                  this.waterNeed.scaleY = 0.05;
                  this.foodNeed.scaleX = 0.05;
                  this.foodNeed.scaleY = 0.05;
                  this.cleanNeed.scaleX = 0.07;
                  this.cleanNeed.scaleY = 0.07;
                  this.cured.scaleX = 0.07;
                  this.cured.scaleY = 0.07;
               }
               break;
            }
            _loc2_++;
         }
         this.draw();
      }
   }
}

