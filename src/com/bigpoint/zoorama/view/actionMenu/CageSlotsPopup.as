package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.dragItem.DragItem;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class CageSlotsPopup extends AbstractActionMenu
   {
      private static const MENU_X_OFFSET:int = 80;
      
      private static const MENU_Y_OFFSET:int = -70;
      
      private var cageSlotBG:MovieClip;
      
      private var adultIcons:Vector.<Sprite>;
      
      private var babyIcons:Vector.<MovieClip>;
      
      private var adultPics:Vector.<Sprite>;
      
      private var activeAnimalIcons:Vector.<Sprite>;
      
      private var targetCage:Cage;
      
      private var dragItem:DragItem;
      
      private var cageId:int;
      
      private var cageSpiecieId:int;
      
      private var dragItemId:int;
      
      private var familyCount:int;
      
      private var maleCount:int;
      
      private var femaleCount:int;
      
      private var childCount:int;
      
      private var canBuy:Boolean;
      
      private var inPair:Boolean;
      
      private var isMale:Boolean;
      
      private var isChild:Boolean;
      
      private var imposibleChildCount:int;
      
      private var specieIdForBonus:int;
      
      private var animalName:String;
      
      public function CageSlotsPopup()
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Sprite = null;
         this.adultIcons = new Vector.<Sprite>(MainConfig.FAMILY_COUNT_MAX * 2);
         this.babyIcons = new Vector.<MovieClip>(MainConfig.FAMILY_COUNT_MAX);
         this.adultPics = new Vector.<Sprite>();
         this.activeAnimalIcons = new Vector.<Sprite>();
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_CAGESLOTS;
         this.cageSlotBG = AssetLibrary.getMovieClip(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CAGESLOTS_BG);
         this.addChild(this.cageSlotBG);
         this.cageSlotBG.x = MENU_X_OFFSET;
         this.cageSlotBG.y = MENU_Y_OFFSET;
         StyleModule.setTextFieldStyle(this.cageSlotBG.windowDescription_txt,StyleModule.HEADER_BOLD_10_LEFT);
         var _loc1_:int = 0;
         while(_loc1_ < MainConfig.FAMILY_COUNT_MAX)
         {
            _loc2_ = AssetLibrary.getMovieClip(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CAGESLOTS_BABY_ICON);
            this.addChild(_loc2_);
            _loc2_.x = 140 + MENU_X_OFFSET;
            _loc2_.y = 57 + 52 * _loc1_ + MENU_Y_OFFSET;
            this.babyIcons[_loc1_] = _loc2_;
            _loc2_.stop();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < MainConfig.FAMILY_COUNT_MAX)
         {
            _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CAGESLOTS_ADULT_ICON);
            this.addChild(_loc3_);
            _loc3_.x = 38 + MENU_X_OFFSET;
            _loc3_.y = 51 + 52 * _loc1_ + MENU_Y_OFFSET;
            this.adultIcons[_loc1_] = _loc3_;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < MainConfig.FAMILY_COUNT_MAX)
         {
            _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CAGESLOTS_ADULT_ICON);
            this.addChild(_loc3_);
            _loc3_.x = 92 + MENU_X_OFFSET;
            _loc3_.y = 51 + 52 * (MainConfig.FAMILY_COUNT_MAX - 1) - 52 * _loc1_ + MENU_Y_OFFSET;
            this.adultIcons[MainConfig.FAMILY_COUNT_MAX + _loc1_] = _loc3_;
            _loc1_++;
         }
         _mustMoveIfNotFitsRight = true;
         _moveLeftBy = MENU_X_OFFSET * 2 + this.width;
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         var _loc2_:Cage = param1 as Cage;
         if(this.targetCage != param1 || _loc2_.animarSpiecieId != this.cageSpiecieId || _loc2_.maleCount != this.maleCount || _loc2_.femaleCount != this.femaleCount || _loc2_.childCount != this.childCount)
         {
            this.targetCage = _loc2_;
            this.setState();
         }
      }
      
      public function setDragItem(param1:DragItem = null) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = param1.dragitemId;
         }
         else
         {
            _loc2_ = 0;
         }
         if(this.dragItemId != _loc2_)
         {
            this.dragItemId = _loc2_;
            this.dragItem = param1;
            this.setState();
         }
      }
      
      private function setState() : void
      {
         var _loc1_:int = 0;
         var _loc2_:AnimalShopData = null;
         var _loc3_:CageSpecieShopData = null;
         if(this.targetCage)
         {
            this.cageId = this.targetCage.itemId;
            this.cageSpiecieId = this.targetCage.animarSpiecieId;
            this.specieIdForBonus = this.targetCage.animarSpiecieId;
            this.familyCount = this.targetCage.familyCount;
            this.maleCount = this.targetCage.maleCount;
            this.femaleCount = this.targetCage.femaleCount;
            this.childCount = this.targetCage.childCount;
            this.isChild = false;
            this.canBuy = false;
            _loc1_ = this.targetCage.speciesId;
            if(this.dragItem)
            {
               _loc2_ = ConfigurationModule.getInstance().getAnimalData(this.dragItem.dragitemId);
               if(_loc2_)
               {
                  this.specieIdForBonus = _loc2_.speciesId;
                  this.isMale = Boolean(_loc2_.male);
                  this.isChild = Boolean(_loc2_.child);
                  _loc3_ = ConfigurationModule.getInstance().getCageSpeciedata(this.targetCage.itemId,_loc2_.speciesId);
                  if(this.targetCage.animarSpiecieId >= 0)
                  {
                     if(this.targetCage.animarSpiecieId == _loc2_.speciesId)
                     {
                        this.canBuy = this.maleCount + this.femaleCount < this.familyCount * 2;
                     }
                     this.isMale = Boolean(_loc2_.male);
                     this.isChild = Boolean(_loc2_.child);
                     this.inPair = this.isMale ? this.maleCount < this.familyCount : this.femaleCount < this.familyCount;
                     this.imposibleChildCount = 0;
                     if(this.maleCount >= this.familyCount)
                     {
                        this.imposibleChildCount = this.maleCount - this.familyCount;
                        if(this.isMale && this.canBuy)
                        {
                           ++this.imposibleChildCount;
                        }
                     }
                     if(this.femaleCount >= this.familyCount)
                     {
                        this.imposibleChildCount = this.femaleCount - this.familyCount;
                        if(!this.isMale && this.canBuy)
                        {
                           ++this.imposibleChildCount;
                        }
                     }
                  }
                  else
                  {
                     this.familyCount = _loc3_.maxChild;
                     _loc1_ = _loc2_.speciesId;
                     this.maleCount = 0;
                     this.femaleCount = 0;
                     this.childCount = 0;
                     this.canBuy = true;
                     this.inPair = true;
                     this.isMale = Boolean(_loc2_.male);
                     this.imposibleChildCount = 0;
                  }
               }
            }
            if(this.familyCount > 0)
            {
               this.visible = true;
               if(this.targetCage.animarSpiecieId >= 0 && !this.dragItem)
               {
                  this.animalName = TextResourceModule.getText("zoo.window.shopAnimalInfo.titel_" + this.cageSpiecieId);
                  if(this.animalName.length <= 22)
                  {
                     this.cageSlotBG.windowDescription_txt.text = this.animalName;
                     StyleModule.setTextFieldStyle(this.cageSlotBG.windowDescription_txt,StyleModule.HEADER_12_CENTER);
                     this.cageSlotBG.windowDescription_txt.y = 11;
                     this.cageSlotBG.windowDescription_txt.visible = true;
                  }
                  else
                  {
                     this.cageSlotBG.windowDescription_txt.text = this.animalName.slice(0,18) + "...";
                     this.cageSlotBG.windowDescription_txt.y = 11;
                     StyleModule.setTextFieldStyle(this.cageSlotBG.windowDescription_txt,StyleModule.HEADER_12_CENTER);
                     this.cageSlotBG.windowDescription_txt.visible = true;
                  }
               }
               else
               {
                  this.cageSlotBG.windowDescription_txt.visible = false;
               }
               this.draw();
            }
            else
            {
               this.visible = false;
            }
            if(this.targetCage.animarSpiecieId >= 0)
            {
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.SPECIES,this.targetCage.speciesId),this.showAnimalIcons);
            }
            else if(_loc2_)
            {
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.SPECIES,_loc2_.speciesId),this.showAnimalIcons);
            }
         }
      }
      
      private function draw() : void
      {
         var _loc2_:int = 0;
         this.cageSlotBG.gotoAndStop("family_" + this.familyCount);
         while(this.adultPics.length)
         {
            this.removeChild(this.adultPics.pop());
         }
         var _loc1_:int = 0;
         while(_loc1_ < MainConfig.FAMILY_COUNT_MAX)
         {
            this.adultIcons[MainConfig.FAMILY_COUNT_MAX + _loc1_].visible = _loc1_ >= MainConfig.FAMILY_COUNT_MAX - this.familyCount;
            this.babyIcons[_loc1_].visible = _loc1_ < this.familyCount;
            if(_loc1_ < this.childCount)
            {
               this.babyIcons[_loc1_].gotoAndStop(2);
               TweenLite.to(this.babyIcons[_loc1_],0.1,{"removeTint":true});
            }
            else
            {
               this.babyIcons[_loc1_].gotoAndStop(1);
               if(MainConfig.FAMILY_COUNT_MAX - _loc1_ <= this.imposibleChildCount)
               {
                  TweenLite.to(this.babyIcons[_loc1_],0.5,{
                     "ease":Strong.easeOut,
                     "colorTransform":{
                        "tint":16711680,
                        "tintAmount":0.4
                     }
                  });
               }
               else
               {
                  TweenLite.to(this.babyIcons[_loc1_],0.1,{"removeTint":true});
               }
            }
            _loc1_++;
         }
         while(this.activeAnimalIcons.length)
         {
            this.activeAnimalIcons.pop();
         }
         _loc1_ = 0;
         while(_loc1_ < MainConfig.FAMILY_COUNT_MAX * 2)
         {
            if(_loc1_ < MainConfig.FAMILY_COUNT_MAX)
            {
               this.adultIcons[_loc1_].visible = _loc1_ < this.familyCount;
               if(_loc1_ < this.familyCount)
               {
                  this.activeAnimalIcons.push(this.adultIcons[_loc1_]);
               }
            }
            else
            {
               this.adultIcons[_loc1_].visible = _loc1_ > MainConfig.FAMILY_COUNT_MAX * 2 - 1 - this.familyCount;
               if(_loc1_ > MainConfig.FAMILY_COUNT_MAX * 2 - 1 - this.familyCount)
               {
                  this.activeAnimalIcons.push(this.adultIcons[_loc1_]);
               }
            }
            _loc1_++;
         }
         if(this.specieIdForBonus > 0)
         {
            _loc2_ = TempGetterProxy.getCageSpecieBotus(this.specieIdForBonus,this.cageId);
            switch(_loc2_)
            {
               case CageSpecieBonus.GOOD:
                  this.cageSlotBG.cageSpecieBonus_mc.gotoAndStop("good");
                  this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.visible = false;
                  break;
               case CageSpecieBonus.CRAZY:
                  this.cageSlotBG.cageSpecieBonus_mc.gotoAndStop("crazy");
                  this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.visible = false;
                  break;
               case CageSpecieBonus.NORMAL:
               default:
                  this.cageSlotBG.cageSpecieBonus_mc.gotoAndStop("normal");
                  this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.visible = true;
                  while(this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.numChildren)
                  {
                     this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.removeChildAt(0);
                  }
                  AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.CAGE,this.cageId),this.handleCageAsset);
            }
            this.cageId;
         }
      }
      
      private function handleCageAsset(param1:SWFAsset) : void
      {
         while(this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.numChildren)
         {
            this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.removeChildAt(0);
         }
         this.cageSlotBG.cageSpecieBonus_mc.cageIconContainer_mc.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      private function showAnimalIcons(param1:SWFAsset) : void
      {
         if(this.activeAnimalIcons.length <= 0)
         {
            this.draw();
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.maleCount)
         {
            this.addAdultIconAtPosition(param1.getEmbededSprite("MaleIconSPR"),_loc2_);
            _loc2_++;
         }
         var _loc3_:int = _loc2_;
         var _loc4_:int = 0;
         while(_loc4_ < this.femaleCount)
         {
            this.addAdultIconAtPosition(param1.getEmbededSprite("FemaleIconSPR"),this.activeAnimalIcons.length - 1 - _loc4_);
            _loc4_++;
         }
         var _loc5_:int = this.activeAnimalIcons.length - 1 - _loc4_;
         if(this.canBuy)
         {
            if(this.isChild)
            {
               if(this.childCount < MainConfig.FAMILY_COUNT_MAX)
               {
                  this.babyIcons[this.childCount].gotoAndStop(1);
                  if(this.maleCount > this.childCount && this.femaleCount > this.childCount)
                  {
                     TweenLite.to(this.babyIcons[this.childCount],0.5,{
                        "ease":Strong.easeOut,
                        "colorTransform":{
                           "tint":65280,
                           "tintAmount":0.4
                        }
                     });
                  }
                  else
                  {
                     TweenLite.to(this.babyIcons[this.childCount],0.5,{
                        "ease":Strong.easeOut,
                        "colorTransform":{
                           "tint":16711680,
                           "tintAmount":0.4
                        }
                     });
                  }
               }
            }
            else if(this.isMale)
            {
               this.addAdultIconAtPosition(param1.getEmbededSprite("MaleIconSPR"),_loc3_,true);
            }
            else
            {
               this.addAdultIconAtPosition(param1.getEmbededSprite("FemaleIconSPR"),_loc5_,true);
            }
         }
      }
      
      private function addAdultIconAtPosition(param1:Sprite, param2:int, param3:Boolean = false) : void
      {
         if(this.activeAnimalIcons.length > 0)
         {
            this.addChild(param1);
            param1.x = this.activeAnimalIcons[param2].x;
            param1.y = this.activeAnimalIcons[param2].y;
            this.activeAnimalIcons[param2].visible = false;
            this.adultPics.push(param1);
            if(param3)
            {
               if(this.inPair)
               {
                  TweenLite.to(param1,0.5,{
                     "ease":Strong.easeOut,
                     "colorTransform":{
                        "tint":65280,
                        "tintAmount":0.4
                     }
                  });
               }
               else
               {
                  TweenLite.to(param1,0.5,{
                     "ease":Strong.easeOut,
                     "colorTransform":{
                        "tint":16711680,
                        "tintAmount":0.4
                     }
                  });
               }
            }
         }
      }
      
      override public function close() : void
      {
      }
   }
}

