package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.items.DropVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.components.animals.AnimData;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.fieldItems.commandIds.CageCommandIds;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedSuccessWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.notices.itemDrop.ItemDropNotice;
   import com.bigpoint.zoorama.notices.view.field.CageNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.animal.Animal;
   import com.bigpoint.zoorama.view.field.icons.Smiley;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.itemDrop.ItemDropTypes;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class Cage extends Building
   {
      public static const BREED_CANT_START:int = 0;
      
      public static const BREED_CAN_START:int = 1;
      
      public static const BREED_BABY_IS_READY:int = 2;
      
      private static const ICON_LOCATION_Y:int = -16;
      
      private static const SOUND_LOCK_TIME:int = 8000;
      
      private var animals:Animal;
      
      private var _attraction:int = 0;
      
      private var _feedTime:int;
      
      private var _feedExpReward:int;
      
      private var _waterTime:int;
      
      private var _waterExpReward:int;
      
      private var _cleanTime:int;
      
      private var _cleanExpReward:int;
      
      private var _cuddleTime:int;
      
      private var _cuddleExpReward:int;
      
      private var _breadTime:int;
      
      private var _breadCostVirtual:int;
      
      private var _breadCostReal:int;
      
      private var _breedExp:int;
      
      private var _directBreedReal:int;
      
      private var _superFeedTime:int;
      
      private var _sickTime:int;
      
      private var _healthTime:int;
      
      private var _superFeedExpReward:int;
      
      private var _foodId:int;
      
      private var _foodPerAnimal:int;
      
      private var _waterPerAnimal:int;
      
      private var _levelRequired:int;
      
      private var _minFeedPawsReward:int;
      
      private var _maxFeedPawsReward:int;
      
      private var _powerFeedTime:int;
      
      private var _powerFeedExpReward:int;
      
      private var _fenceTween:TweenLite;
      
      private var _collectionItems:Vector.<ItemVO>;
      
      private var _sickTimeStamp:int = -1;
      
      private var _healthTimeStamp:int = -1;
      
      private var _cleanTimeStamp:int = -1;
      
      private var _eventTimeStamp:int = -1;
      
      private var _feedTimeStamp:int = -1;
      
      private var isSuperFeed:int = -1;
      
      private var _waterTimeStamp:int = -1;
      
      private var _cuddleTimeStamp:int = -1;
      
      private var _breedTimeStamp:int = -1;
      
      private var _happiness:int = -1;
      
      private var _canBreed:Boolean = false;
      
      public var commandIds:CageCommandIds = new CageCommandIds();
      
      private var smiley:Smiley;
      
      private var emptyCageIcons:Vector.<MovieClip> = new Vector.<MovieClip>(MainConfig.ZOOM_LEVELS.length);
      
      private var lastEmptyCageIcon:MovieClip;
      
      private var _eventId:int = -1;
      
      private var eventTimeTrack:TimeTrack;
      
      private var feedTimeTrack:TimeTrack;
      
      private var waterTimeTrack:TimeTrack;
      
      private var cleanTimeTrack:TimeTrack;
      
      private var cuddleTimeTrack:TimeTrack;
      
      private var sickTimeTrack:TimeTrack;
      
      private var breedTimeTrack:TimeTrack;
      
      private var _feedDrop:DropVO;
      
      private var _superFeedDrop:DropVO;
      
      private var _powerFeedDrop:DropVO;
      
      private var _waterDrop:DropVO;
      
      private var _cuddleDrop:DropVO;
      
      private var _cleanDrop:DropVO;
      
      private var _healDrop:DropVO;
      
      private var _superHealDrop:DropVO;
      
      private var _breadDrop:DropVO;
      
      private var _superBreadDrop:DropVO;
      
      private var soundPlaybackLockTimer:Timer;
      
      private var isSoundLocked:Boolean = false;
      
      private var breedingReadyIcons:Vector.<Sprite> = new Vector.<Sprite>(MainConfig.ZOOM_LEVELS.length);
      
      private var breedingFinishedIcons:Vector.<Sprite> = new Vector.<Sprite>(MainConfig.ZOOM_LEVELS.length);
      
      private var breedingReadyFlag:Boolean = false;
      
      private var breedingFinishedFlag:Boolean = false;
      
      private var lastBreedingIcon:Sprite;
      
      private var isActive:int;
      
      private var isBreedable:int;
      
      private var _animalAttraction:int;
      
      private var percentWaterLeft:int;
      
      private var percentFoodLeft:int;
      
      private var percentCleanLeft:int;
      
      private var percentCuddleLeft:int;
      
      private var cageItemData:CageData;
      
      private var _cageTypesPlaceable:Array;
      
      private var hideFence:Boolean;
      
      public var instantHealthRestored:Boolean = false;
      
      public function Cage(param1:Notifier, param2:Sprite, param3:int)
      {
         this.eventTimeTrack = TimeManager.creatEmptyTrack(this.handleEventExpired);
         this.feedTimeTrack = TimeManager.creatEmptyTrack(this.handleFeedNeeded);
         this.waterTimeTrack = TimeManager.creatEmptyTrack(this.handleWaterNeeded);
         this.cleanTimeTrack = TimeManager.creatEmptyTrack(this.handleCleenNeeded);
         this.cuddleTimeTrack = TimeManager.creatEmptyTrack(this.handleCuddleNeeded);
         this.sickTimeTrack = TimeManager.creatEmptyTrack(this.handleHealed);
         this.breedTimeTrack = TimeManager.creatEmptyTrack(this.handleBreedBredge);
         super(param1,param2,param3);
         _category = Categories.CAGE;
         _groundRequired = ItemAbstract.GROUND_GRASS;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 2;
         this.itemWidth = 2;
         if(param3 > 0)
         {
            this._itemId = param3;
         }
         this.fillCageConfigData();
         var _loc4_:int = 0;
         while(_loc4_ < MainConfig.ZOOM_LEVELS.length)
         {
            this.emptyCageIcons[_loc4_] = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,"CageEmptyIcon_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_MC");
            this.emptyCageIcons[_loc4_].mouseChildren = false;
            this.emptyCageIcons[_loc4_].mouseEnabled = false;
            this.breedingFinishedIcons[_loc4_] = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,"BreedingFinished_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_SPR");
            this.breedingFinishedIcons[_loc4_].mouseChildren = false;
            this.breedingFinishedIcons[_loc4_].mouseEnabled = false;
            this.breedingReadyIcons[_loc4_] = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,"BreedingReady_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_SPR");
            this.breedingReadyIcons[_loc4_].mouseChildren = false;
            this.breedingReadyIcons[_loc4_].mouseEnabled = false;
            _loc4_++;
         }
         this.animals = new Animal(notifier);
         this.smiley = new Smiley();
         this.smiley.mouseChildren = false;
         this.smiley.mouseEnabled = false;
         this.addChild(this.smiley);
         this.smiley.visible = false;
         createActiveZone();
         this.soundPlaybackLockTimer = new Timer(SOUND_LOCK_TIME,1);
         this.soundPlaybackLockTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.handleSoundPlaybackLockTimerComplete);
         this.soundPlaybackLockTimer.stop();
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : Cage
      {
         canConstruct = true;
         var _loc4_:Cage = new Cage(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      private function handleBreedBredge() : void
      {
         this.handleBreed();
      }
      
      public function get isBreedingReadyFlag() : Boolean
      {
         return this.breedingReadyFlag;
      }
      
      public function get isBreedingFinishedFlag() : Boolean
      {
         return this.breedingFinishedFlag;
      }
      
      override public function get isMouseOverInfIcon() : Boolean
      {
         return checkIfMouseIsOver([this.emptyCageIcons,this.breedingFinishedIcons,this.breedingReadyIcons,inactiveIcons]);
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc5_:CageDropRequestVO = null;
         this.cageItemData = CageData(param1);
         this.isActive = this.cageItemData.active;
         this.isBreedable = this.cageItemData.breedable;
         var _loc3_:Boolean = false;
         var _loc4_:int = this._eventId;
         if(this.cageItemData.eventId != -1)
         {
            this._eventId = this.cageItemData.eventId;
         }
         if(this.cageItemData.eventTimeStamp != -1)
         {
            this._eventTimeStamp = this.cageItemData.eventTimeStamp;
            TimeManager.updateTrackTime(this.eventTimeTrack,this._eventTimeStamp);
            if(this._eventTimeStamp < TimeManager.currentTime)
            {
               this._eventId = -1;
            }
         }
         if(this.cageItemData.level != -1)
         {
            if(this.cageItemData.level != _level || _loc4_ != this._eventId)
            {
               this.setLevel(this.cageItemData.level,_loc4_ != this._eventId);
            }
         }
         if(this.cageItemData.speciesId != -1)
         {
            this.speciesId = this.cageItemData.speciesId;
         }
         if(this.cageItemData.maleCount != -1)
         {
            this.animals.maleCount = this.cageItemData.maleCount;
            this.recalculateAnimals();
         }
         if(this.cageItemData.femaleCount != -1)
         {
            this.animals.femaleCount = this.cageItemData.femaleCount;
            this.recalculateAnimals();
         }
         if(this.cageItemData.breedTimeStamp != -1)
         {
            this._breedTimeStamp = this.cageItemData.breedTimeStamp;
            TimeManager.updateTrackTime(this.breedTimeTrack,this._breedTimeStamp);
            _loc3_ = true;
         }
         if(this.cageItemData.feedTimeStamp != -1 && this.commandIds.feed <= param2)
         {
            this._feedTimeStamp = this.cageItemData.feedTimeStamp;
            TimeManager.updateTrackTime(this.feedTimeTrack,this._feedTimeStamp);
            _loc3_ = true;
         }
         if(this.commandIds.breedEnd > 0 && this.commandIds.breedEnd <= param2 && param2 != PlayField.GUESS_COMMANDID)
         {
            notifier.dispatchNotice(new WindowNotice(WindowNotice.CLOSE_WINDOW,OldWindowTypes.ANIMALBREED_IN_PROGRESS));
            if(this.cageItemData.childCount > this.animals.childCount)
            {
               notifier.dispatchNotice(new AnimalBreedSuccessWindowNotice(WindowNotice.OPEN_WINDOW,this));
               _loc5_ = new CageDropRequestVO(this.cageItemData.uniqueId,CageActionIds.BREAD);
               TempGetterProxy.sendNotification(Note.GENERATE_DROPS,_loc5_);
               notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.SHOW_DROP,ItemDropTypes.ACTION_BREED_SUCCESS,ItemDropTypes.ITEM_PAW,1,new Point(this.posX,this.posY),this,this.commandIds.breedEnd));
            }
            else
            {
               notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.ANIMALBREED_FAILED,new WindowButtonParams(null,null,this.openBreadWindow)));
            }
            this.commandIds.breedEnd = -1;
         }
         if(this.cageItemData.childCount != -1)
         {
            this.animals.childCount = this.cageItemData.childCount;
            this.recalculateAnimals();
         }
         if(this.cageItemData.sickTimeStamp != -1)
         {
            this._sickTimeStamp = this.cageItemData.sickTimeStamp;
            TimeManager.updateTrackTime(this.sickTimeTrack,this._sickTimeStamp);
            _loc3_ = true;
         }
         if(this.cageItemData.healthTimeStamp != -1)
         {
            this._healthTimeStamp = this.cageItemData.healthTimeStamp;
            _loc3_ = true;
         }
         if(this.cageItemData.isSuperFeed != -1)
         {
            this.isSuperFeed = this.cageItemData.isSuperFeed;
         }
         if(this.cageItemData.waterTimeStamp != -1 && this.commandIds.water <= param2)
         {
            this._waterTimeStamp = this.cageItemData.waterTimeStamp;
            TimeManager.updateTrackTime(this.waterTimeTrack,this._waterTimeStamp);
            _loc3_ = true;
         }
         if(this.cageItemData.cleanTimeStamp != -1 && this.commandIds.clean <= param2)
         {
            this._cleanTimeStamp = this.cageItemData.cleanTimeStamp;
            TimeManager.updateTrackTime(this.cleanTimeTrack,this._cleanTimeStamp);
            _loc3_ = true;
         }
         if(this.cageItemData.cuddleTimeStamp != -1 && this.commandIds.cudle <= param2)
         {
            this._cuddleTimeStamp = this.cageItemData.cuddleTimeStamp;
            TimeManager.updateTrackTime(this.cuddleTimeTrack,this._cuddleTimeStamp);
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.recalculateHappiness();
         }
         if(this.cageItemData.feedDrop)
         {
            this._feedDrop = this.cageItemData.feedDrop;
         }
         if(this.cageItemData.superFeedDrop)
         {
            this._superFeedDrop = this.cageItemData.superFeedDrop;
         }
         if(this.cageItemData.powerFeedDrop)
         {
            this._powerFeedDrop = this.cageItemData.powerFeedDrop;
         }
         if(this.cageItemData.waterDrop)
         {
            this._waterDrop = this.cageItemData.waterDrop;
         }
         if(this.cageItemData.cuddleDrop)
         {
            this._cuddleDrop = this.cageItemData.cuddleDrop;
         }
         if(this.cageItemData.cleanDrop)
         {
            this._cleanDrop = this.cageItemData.cleanDrop;
         }
         if(this.cageItemData.healDrop)
         {
            this._healDrop = this.cageItemData.healDrop;
         }
         if(this.cageItemData.superHealDrop)
         {
            this._superHealDrop = this.cageItemData.superHealDrop;
         }
         if(this.cageItemData.breadDrop)
         {
            this._breadDrop = this.cageItemData.breadDrop;
         }
         if(this.cageItemData.superBreadDrop)
         {
            this._superBreadDrop = this.cageItemData.superBreadDrop;
         }
         super.updateState(param1,param2);
      }
      
      public function get animalTier() : int
      {
         var _loc1_:AnimalSpeciesVO = ConfigurationModule.getInstance().getAnimalSpecieData(this.speciesId);
         return _loc1_.tier;
      }
      
      private function setLevel(param1:int, param2:Boolean = false) : void
      {
         _level = param1;
         var _loc3_:int = -1;
         var _loc4_:int = this._level;
         if(this._eventTimeStamp >= TimeManager.currentTime && this._eventId != -1 && param2)
         {
            _loc3_ = this._eventId;
            _loc4_ = MainConstants.MAX_CAGE_LEVEL;
            AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.CAGE,this._itemId,_loc4_,_loc3_),this.hadleCageAsset);
         }
         else if(!param2)
         {
            AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.CAGE,this._itemId,_loc4_,_loc3_),this.hadleCageAsset);
         }
      }
      
      private function hadleCageAsset(param1:SWFAsset) : void
      {
         if(!_isDisposed)
         {
            nextLevelSkin = param1.getEmbededMovieClip(AssetConfig.DEFAULT_OBJECT_MC);
            nextLevelSkin.mouseEnabled = false;
            nextLevelSkin.mouseChildren = false;
            this.updateView();
         }
      }
      
      private function recalculateHappiness() : void
      {
         var _loc1_:int = 0;
         if(this._healthTimeStamp != 0)
         {
            this._happiness = 0;
            _loc1_ = TimeManager.currentTime;
            if(this._sickTimeStamp <= TimeManager.currentTime && this._healthTimeStamp > TimeManager.currentTime)
            {
               this._happiness += MainConfig.ANIMAL_HAPPYNESS_BASE;
               if(this._cleanTimeStamp > TimeManager.currentTime)
               {
                  this._happiness += MainConfig.ANIMAL_HAPPYNESS_CLEAN;
                  this.percentCleanLeft = Math.floor((this.cleanTimeStamp - _loc1_) / this.cleanTime * 100);
               }
               if(this._feedTimeStamp > TimeManager.currentTime)
               {
                  this._happiness += MainConfig.ANIMAL_HAPPYNESS_FOOD;
                  this.percentFoodLeft = Math.floor((this.feedTimeStamp - _loc1_) / this.feedTime * 100);
               }
               if(this._waterTimeStamp > TimeManager.currentTime)
               {
                  this._happiness += MainConfig.ANIMAL_HAPPYNESS_WATER;
                  this.percentWaterLeft = Math.floor((this.waterTimeStamp - _loc1_) / this.waterTime * 100);
               }
               if(this._cuddleTimeStamp > TimeManager.currentTime)
               {
                  this._happiness += MainConfig.ANIMAL_HAPPYNESS_CUDDLE;
                  this.percentCuddleLeft = Math.floor((this.cuddleTimeStamp - _loc1_) / this.cuddleTime * 100);
               }
            }
         }
         else
         {
            this._happiness = 40;
         }
      }
      
      private function openBreadWindow() : void
      {
         notifier.dispatchNotice(new CageNotice(CageNotice.OPEN_CAGE_BREED_WINDOW,this));
      }
      
      private function recalculateAnimals() : void
      {
         this._canBreed = this.maleCount - this.childCount > 0 && this.femaleCount - this.childCount > 0;
      }
      
      override protected function updateView() : void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:Boolean = false;
         if(nextLevelSkin)
         {
            if(skin)
            {
               if(this.contains(skin))
               {
                  (this.skin["animalHolder_mc"] as MovieClip).removeChild(this.animals);
                  this.removeChild(skin);
                  _loc1_ = true;
               }
            }
            skin = nextLevelSkin;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            nextLevelSkin = null;
         }
         if(skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
               (this.skin["animalHolder_mc"] as MovieClip).addChild(this.animals);
               if(_loc1_)
               {
                  _loc2_ = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_CAGE_UPGRADE_ANIM);
                  _loc2_.scaleX = _loc2_.scaleY = _zoomlevel;
                  this.skin.addChild(_loc2_);
                  TweenLite.to(_loc2_,1,{
                     "frame":_loc2_.totalFrames,
                     "onComplete":this.removeLevelUpAnim,
                     "onCompleteParams":[_loc2_],
                     "ease":Linear.easeIn
                  });
               }
            }
            skin.gotoAndStop("zoom_" + String(_zoomlevel));
            this.updateIcons();
            this.animals.scale = _zoomlevel;
            if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this.skin.scaleX = -1;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this.skin.scaleX = 1;
            }
         }
         super.updateView();
      }
      
      private function removeLevelUpAnim(param1:MovieClip) : void
      {
         DisplayObjectHelper.removeChild(this.skin,param1);
      }
      
      private function updateBreedIcons() : void
      {
         if(Settings.TUTORIAL_ACTIVE)
         {
            if(itemId == 3)
            {
               if(this.lastBreedingIcon)
               {
                  this.lastBreedingIcon.visible = false;
               }
               return;
            }
         }
         this.removeLastBreedingIcon();
         if(this.canBreed && Boolean(this.isBreedable))
         {
            if(this.breedTimeStamp <= 0)
            {
               this.removeLastEmptyCageIcon();
               if(!this.lastBreedingIcon || !this.contains(this.lastBreedingIcon))
               {
                  this.lastBreedingIcon = this.breedingReadyIcons[zoomIndex];
                  this.addChild(this.lastBreedingIcon);
                  if(this.itemWidth >= 3 && this.itemHeight >= 3)
                  {
                     this.lastBreedingIcon.y = MainConfig.TILE_HEIGHT * _zoomlevel * 1.5;
                  }
                  else
                  {
                     this.lastBreedingIcon.y = MainConfig.TILE_HEIGHT * _zoomlevel * 0.5;
                  }
                  this.breedingReadyFlag = true;
               }
            }
            else if(this.breedTimeStamp > TimeManager.currentTime)
            {
               this.removeLastBreedingIcon();
            }
            else
            {
               this.removeLastEmptyCageIcon();
               if(!this.lastBreedingIcon || !this.contains(this.lastBreedingIcon) && this.breedTimeStamp > 0)
               {
                  this.lastBreedingIcon = this.breedingFinishedIcons[zoomIndex];
                  this.addChild(this.lastBreedingIcon);
                  if(this.itemWidth >= 3 && this.itemHeight >= 3)
                  {
                     this.lastBreedingIcon.y = MainConfig.TILE_HEIGHT * _zoomlevel * 1.5;
                  }
                  else
                  {
                     this.lastBreedingIcon.y = MainConfig.TILE_HEIGHT * _zoomlevel * 0.5;
                  }
                  this.breedingFinishedFlag = true;
               }
            }
         }
         else
         {
            this.removeLastBreedingIcon();
         }
         if(!this.isActive)
         {
            this.removeLastBreedingIcon();
         }
      }
      
      private function removeLastBreedingIcon() : void
      {
         if(this.lastBreedingIcon)
         {
            if(this.contains(this.lastBreedingIcon))
            {
               this.removeChild(this.lastBreedingIcon);
               this.breedingReadyFlag = false;
               this.breedingFinishedFlag = false;
            }
            this.lastBreedingIcon = null;
         }
      }
      
      private function updateIcons() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         if(this.smiley)
         {
            if(this.maleCount > 0 || this.femaleCount > 0 || this.childCount > 0)
            {
               _loc1_ = TimeManager.currentTime;
               this.percentCuddleLeft = Math.floor((this._cuddleTimeStamp - _loc1_) / this._cuddleTime * 100);
               _loc2_ = false;
               if(this.sickTimeStamp > TimeManager.currentTime && this.healthTimeStamp > TimeManager.currentTime)
               {
                  _loc2_ = true;
               }
               this.smiley.showHappiness(this._happiness,this.instantHealthRestored,this.percentFoodLeft,this.percentWaterLeft,this.percentCleanLeft,this.percentCuddleLeft,_loc2_,false);
               this.smiley.y = ICON_LOCATION_Y * _zoomlevel;
               this.smiley.zoomLevel = _zoomlevel;
               this.smiley.visible = true;
            }
            else
            {
               this.smiley.visible = false;
            }
         }
         this.updateEmptyCageIcon();
         this.handleBreed();
         this.updateBreedIcons();
      }
      
      public function updateEmptyCageIcon(param1:Boolean = false) : void
      {
         if(Settings.TUTORIAL_ACTIVE)
         {
            return;
         }
         if(param1)
         {
            this.removeLastEmptyCageIcon();
         }
         if(buildTimeStamp <= 0 && this.maleCount <= 0 && this.femaleCount <= 0 && this.childCount <= 0)
         {
            if(!this.lastEmptyCageIcon || !this.contains(this.lastEmptyCageIcon))
            {
               this.lastEmptyCageIcon = this.emptyCageIcons[zoomIndex];
               this.addChild(this.lastEmptyCageIcon);
            }
            this.lastEmptyCageIcon.y = ICON_LOCATION_Y * _zoomlevel;
         }
         else
         {
            this.removeLastEmptyCageIcon();
         }
      }
      
      private function removeLastEmptyCageIcon() : void
      {
         if(this.lastEmptyCageIcon)
         {
            if(this.contains(this.lastEmptyCageIcon))
            {
               this.removeChild(this.lastEmptyCageIcon);
            }
            this.lastEmptyCageIcon = null;
         }
      }
      
      private function handleFeedNeeded() : void
      {
         this.feedTimeStamp = 0;
         this.forceStatRecalculate();
      }
      
      private function handleEventExpired() : void
      {
         this._eventId = -1;
         this.setLevel(_level,true);
      }
      
      private function handleWaterNeeded() : void
      {
         this.waterTimeStamp = 0;
         this.forceStatRecalculate();
      }
      
      private function handleCleenNeeded() : void
      {
         this.cleanTimeStamp = 0;
         this.forceStatRecalculate();
      }
      
      private function handleCuddleNeeded() : void
      {
         this.cuddleTimeStamp = 0;
         this.forceStatRecalculate();
      }
      
      public function handleHealed() : void
      {
         this.sickTimeStamp = 0;
         this.forceStatRecalculate();
      }
      
      private function handleBreed() : void
      {
         if(this.isActive == 1)
         {
            this.updateBreedIcons();
         }
      }
      
      override protected function handleMouseUp(param1:MouseEvent) : void
      {
         super.handleMouseUp(param1);
         this.playAnimalSound();
      }
      
      private function forceStatRecalculate() : void
      {
         var _loc1_:PlayfieldSettingsProxy = Facade.getInstance().getProxy(PlayfieldSettingsProxy);
         if(this.cageItemData.active)
         {
            _loc1_.changeAttractions(this.cageItemData.playFieldId,this.cageItemData,true);
            _loc1_.recalculatePlayfieldsInfo();
         }
      }
      
      private function playAnimalSound() : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         if(this.isSoundLocked)
         {
            return;
         }
         var _loc1_:SoundManager = SoundManager.getInstance();
         if(this.animals)
         {
            _loc2_ = this.animals.speciesId;
            if(_loc2_ > 0)
            {
               _loc3_ = SoundEffectNames.ANIMAL_SNDS_PER_ID[_loc2_];
               if(!_loc3_)
               {
                  return;
               }
               _loc4_ = _loc3_.lastIndexOf("_") + 1;
               if(_loc4_ > 1)
               {
                  _loc5_ = _loc3_.length;
                  _loc6_ = parseInt(_loc3_.substring(_loc4_,_loc5_));
                  _loc7_ = _loc3_.substring(0,_loc4_ - 1);
                  _loc8_ = Math.random() * (_loc6_ - 1);
                  _loc9_ = 1 + Math.round(_loc8_);
                  _loc3_ = _loc7_ + "_" + _loc9_;
               }
               if(_loc3_)
               {
                  this.isSoundLocked = true;
                  this.soundPlaybackLockTimer.start();
                  _loc1_.playSoundEffect(_loc3_);
               }
            }
         }
      }
      
      private function handleSoundPlaybackLockTimerComplete(param1:TimerEvent) : void
      {
         this.isSoundLocked = false;
      }
      
      private function fillCageConfigData() : void
      {
         var _loc1_:CageShopData = ConfigurationModule.getInstance().getCageData(this._itemId);
         this._collectionItems = ConfigurationModule.getInstance().getCollectionDatabyTCategorieAndId(Categories.CAGE,this._itemId);
         if(_loc1_)
         {
            this._attraction = _loc1_.getAttraction();
            this.itemWidth = _loc1_.width;
            this.itemHeight = _loc1_.height;
            this.defaultItemWidth = _loc1_.width;
            this.defaultItemHeight = _loc1_.height;
            this._sellable = _loc1_.sellable;
            this._sellVirtual = _loc1_.sellVirtual;
            this._sellReal = _loc1_.sellReal;
            this._buildTime = _loc1_.buildTime;
            this._eventId = _loc1_.eventId;
            this._directBuildReal = _loc1_.directBuildReal;
            this._alias = _loc1_.alias;
         }
      }
      
      public function get cleanTimeStamp() : int
      {
         return this._cleanTimeStamp;
      }
      
      public function set cleanTimeStamp(param1:int) : void
      {
         this._cleanTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get feedTimeStamp() : int
      {
         return this._feedTimeStamp;
      }
      
      public function set feedTimeStamp(param1:int) : void
      {
         this._feedTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get waterTimeStamp() : int
      {
         return this._waterTimeStamp;
      }
      
      public function set waterTimeStamp(param1:int) : void
      {
         this._waterTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get cuddleTimeStamp() : int
      {
         return this._cuddleTimeStamp;
      }
      
      public function set cuddleTimeStamp(param1:int) : void
      {
         this._cuddleTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get breedTimeStamp() : int
      {
         return this._breedTimeStamp;
      }
      
      public function set breedTimeStamp(param1:int) : void
      {
         this._breedTimeStamp = param1;
         TimeManager.updateTrackTime(this.breedTimeTrack,this._breedTimeStamp);
         this.updateIcons();
      }
      
      public function get animarSpiecieId() : int
      {
         return this.animals.speciesId;
      }
      
      public function get familyCount() : int
      {
         return this.animals.familyCount;
      }
      
      public function get pairCount() : int
      {
         return this.animals.pairCount;
      }
      
      public function get maleCount() : int
      {
         return this.animals.maleCount;
      }
      
      public function set maleCount(param1:int) : void
      {
         this.animals.maleCount = param1;
         this.recalculateAnimals();
      }
      
      public function get femaleCount() : int
      {
         return this.animals.femaleCount;
      }
      
      public function set femaleCount(param1:int) : void
      {
         this.animals.femaleCount = param1;
         this.recalculateAnimals();
      }
      
      public function get childCount() : int
      {
         return this.animals.childCount;
      }
      
      public function set childCount(param1:int) : void
      {
         this.animals.childCount = param1;
         this.recalculateAnimals();
      }
      
      public function get speciesId() : int
      {
         return this.animals.speciesId;
      }
      
      public function set speciesId(param1:int) : void
      {
         if(param1 > 0 && this.animals.speciesId != param1)
         {
            this.fillSpiecieCageData(param1);
            this.animals.cageId = itemId;
            this.animals.speciesId = param1;
            this.fillSpiecieData();
         }
      }
      
      private function fillSpiecieCageData(param1:int) : void
      {
         var _loc2_:CageSpecieShopData = ConfigurationModule.getInstance().getCageSpeciedata(this._itemId,param1);
         if(_loc2_)
         {
            this.animals.maxAdult = _loc2_.maxAdult;
            this.animals.maxChild = _loc2_.maxChild;
         }
      }
      
      private function fillSpiecieData() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(this.animals.speciesId);
         if(_loc1_)
         {
            this._feedTime = _loc1_.feedTime;
            this._feedExpReward = _loc1_.feedExpReward;
            this._waterTime = _loc1_.waterTime;
            this._waterExpReward = _loc1_.waterExpReward;
            this._cleanTime = _loc1_.cleanTime;
            this._cleanExpReward = _loc1_.cleanExpReward;
            this._cuddleTime = _loc1_.cuddleTime;
            this._cuddleExpReward = _loc1_.cuddleExpReward;
            this._breadTime = _loc1_.breedTime;
            this._breadCostReal = _loc1_.breedCostReal;
            this._breadCostVirtual = _loc1_.breedCostVirtual;
            this._breedExp = _loc1_.breedExp;
            this._directBreedReal = _loc1_.directBreedReal;
            this._superFeedTime = _loc1_.superFeedTime;
            this._superFeedExpReward = _loc1_.superFeedExpReward;
            this._sickTime = _loc1_.sickTime;
            this._healthTime = _loc1_.healthTime;
            this._foodId = _loc1_.foodId;
            this._foodPerAnimal = _loc1_.foodPerAnimal;
            this._waterPerAnimal = _loc1_.waterPerAnimal;
            this._levelRequired = _loc1_.userLevelRequired;
            this._minFeedPawsReward = _loc1_.minFeedPawsReward;
            this._maxFeedPawsReward = _loc1_.maxFeedPawsReward;
            this._animalAttraction = _loc1_.getAttraction();
            this._powerFeedTime = _loc1_.powerFeedTime;
            this._powerFeedExpReward = _loc1_.powerFeedExpReward;
            this._cageTypesPlaceable = _loc1_.cageTypesPlaceable;
         }
      }
      
      public function get level() : int
      {
         return _level;
      }
      
      public function get canBreed() : Boolean
      {
         return this._canBreed;
      }
      
      public function get feedTime() : int
      {
         return this._feedTime;
      }
      
      public function get feedExpReward() : int
      {
         return this._feedExpReward;
      }
      
      public function get waterTime() : int
      {
         return this._waterTime;
      }
      
      public function get waterExpReward() : int
      {
         return this._waterExpReward;
      }
      
      public function get cleanTime() : int
      {
         return this._cleanTime;
      }
      
      public function get cleanExpReward() : int
      {
         return this._cleanExpReward;
      }
      
      public function get cuddleTime() : int
      {
         return this._cuddleTime;
      }
      
      public function get cuddleExpReward() : int
      {
         return this._cuddleExpReward;
      }
      
      public function get breadTime() : int
      {
         var _loc1_:int = this._breadTime;
         var _loc2_:BabyCaravanProxy = Facade.getInstance().retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         if(_loc2_ && _loc2_.isEventActive && _loc2_.canRedeemMore)
         {
            if(_itemId == 14 && this.speciesId != _loc2_.specieId)
            {
               _loc1_ /= 2;
            }
         }
         else if(_itemId == 14)
         {
            _loc1_ /= 2;
         }
         return _loc1_;
      }
      
      public function get breadCostReal() : int
      {
         return this._breadCostReal;
      }
      
      public function get breadCostVirtual() : int
      {
         return this._breadCostVirtual;
      }
      
      public function get breadExperience() : int
      {
         return this._breedExp;
      }
      
      public function get superFeedTime() : int
      {
         return this._superFeedTime;
      }
      
      public function get superFeedExpReward() : int
      {
         return this._superFeedExpReward;
      }
      
      public function get foodId() : int
      {
         return this._foodId;
      }
      
      public function get foodPerAnimal() : int
      {
         return this._foodPerAnimal;
      }
      
      public function get maxAdultCount() : int
      {
         return this.animals.maxAdult;
      }
      
      public function get maxChildCount() : int
      {
         return this.animals.maxChild;
      }
      
      public function get animalCount() : int
      {
         return this.animals.maleCount + this.animals.femaleCount + this.animals.childCount;
      }
      
      public function get adultCount() : int
      {
         return this.animals.maleCount + this.animals.femaleCount;
      }
      
      public function get waterPerAnimal() : int
      {
         return this._waterPerAnimal;
      }
      
      public function get sickTimeStamp() : int
      {
         return this._sickTimeStamp;
      }
      
      public function get percentageTimeForWater() : Number
      {
         return this.getProporcionalValue(this.waterTimeStamp,this.waterTime);
      }
      
      public function get percentageTimeForFeed() : Number
      {
         return this.getProporcionalValue(this.feedTimeStamp,this.feedTime);
      }
      
      public function get percentageTimeForClean() : Number
      {
         return this.getProporcionalValue(this.cleanTimeStamp,this.cleanTime);
      }
      
      public function get percentageTimeForCuddle() : Number
      {
         return this.getProporcionalValue(this.cuddleTimeStamp,this.cuddleTime);
      }
      
      public function get isSick() : Boolean
      {
         return this.healthTimeStamp < TimeManager.currentTime || this.sickTimeStamp > TimeManager.currentTime;
      }
      
      public function get isHealing() : Boolean
      {
         return this.healthTimeStamp > TimeManager.currentTime && this.sickTimeStamp > TimeManager.currentTime;
      }
      
      private function getProporcionalValue(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 1;
         if(param1 >= TimeManager.currentTime)
         {
            _loc3_ = 1 - (param1 - TimeManager.currentTime) / param2;
         }
         return _loc3_;
      }
      
      public function set sickTimeStamp(param1:int) : void
      {
         this._sickTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get healthTimeStamp() : int
      {
         return this._healthTimeStamp;
      }
      
      public function set healthTimeStamp(param1:int) : void
      {
         this._healthTimeStamp = param1;
         this.recalculateHappiness();
         this.updateIcons();
      }
      
      public function get sickTime() : int
      {
         return this._sickTime;
      }
      
      public function get healthTime() : int
      {
         return this._healthTime;
      }
      
      public function get levelRequired() : int
      {
         return this._levelRequired;
      }
      
      public function get directBreedReal() : int
      {
         return this._directBreedReal;
      }
      
      override public function set zoomlevel(param1:Number) : void
      {
         super.zoomlevel = param1;
         this.updateEmptyCageIcon(true);
      }
      
      public function get happiness() : int
      {
         return this._happiness;
      }
      
      public function get attraction() : int
      {
         return this._attraction;
      }
      
      public function get minFeedPawsReward() : int
      {
         return this._minFeedPawsReward;
      }
      
      public function get maxFeedPawsReward() : int
      {
         return this._maxFeedPawsReward;
      }
      
      public function get powerFeedTime() : int
      {
         return this._powerFeedTime;
      }
      
      public function get powerFeedExpReward() : int
      {
         return this._powerFeedExpReward;
      }
      
      public function get animalAttraction() : int
      {
         return this._animalAttraction;
      }
      
      public function set animalAttraction(param1:int) : void
      {
         this._animalAttraction = param1;
      }
      
      public function get eventId() : int
      {
         return this._eventId;
      }
      
      public function get eventTimeStamp() : int
      {
         return this._eventTimeStamp;
      }
      
      public function get superBreadDrop() : DropVO
      {
         return this._superBreadDrop;
      }
      
      public function get breadDrop() : DropVO
      {
         return this._breadDrop;
      }
      
      public function get superHealDrop() : DropVO
      {
         return this._superHealDrop;
      }
      
      public function get healDrop() : DropVO
      {
         return this._healDrop;
      }
      
      public function get cleanDrop() : DropVO
      {
         return this._cleanDrop;
      }
      
      public function get cuddleDrop() : DropVO
      {
         return this._cuddleDrop;
      }
      
      public function get waterDrop() : DropVO
      {
         return this._waterDrop;
      }
      
      public function get powerFeedDrop() : DropVO
      {
         return this._powerFeedDrop;
      }
      
      public function get superFeedDrop() : DropVO
      {
         return this._superFeedDrop;
      }
      
      public function get feedDrop() : DropVO
      {
         return this._feedDrop;
      }
      
      public function get cageTypesPlaceable() : Array
      {
         return this._cageTypesPlaceable;
      }
      
      public function set cageTypesPlaceable(param1:Array) : void
      {
         this._cageTypesPlaceable = param1;
      }
      
      override public function dispose() : void
      {
         this.animals.dispose();
         this.animals = null;
         if(this.smiley)
         {
            this.removeChild(this.smiley);
            this.smiley.dispose();
            this.smiley = null;
         }
         this.commandIds = null;
         TimeManager.removeTrack(this.feedTimeTrack);
         TimeManager.removeTrack(this.waterTimeTrack);
         TimeManager.removeTrack(this.cleanTimeTrack);
         TimeManager.removeTrack(this.cuddleTimeTrack);
         TimeManager.removeTrack(this.sickTimeTrack);
         TimeManager.removeTrack(this.breedTimeTrack);
         this.feedTimeTrack = null;
         this.waterTimeTrack = null;
         this.cleanTimeTrack = null;
         this.cuddleTimeTrack = null;
         this.sickTimeTrack = null;
         this.breedTimeTrack = null;
         this.removeLastEmptyCageIcon();
         this.emptyCageIcons = null;
         this.soundPlaybackLockTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.handleSoundPlaybackLockTimerComplete);
         this.soundPlaybackLockTimer = null;
         this.removeLastBreedingIcon();
         this.breedingReadyIcons = null;
         this.breedingFinishedIcons = null;
         this.killFenceTween();
         super.dispose();
      }
      
      public function getStopedAnims() : Vector.<AnimData>
      {
         if(this.animals)
         {
            return this.animals.getAnimsByActivity(false);
         }
         return new Vector.<AnimData>();
      }
      
      public function getRunningAnims() : Vector.<AnimData>
      {
         if(this.animals)
         {
            return this.animals.getAnimsByActivity(true);
         }
         return new Vector.<AnimData>();
      }
      
      public function instantHealUsed() : void
      {
         this.instantHealthRestored = true;
      }
      
      public function instantHealInitialised() : void
      {
         this.instantHealthRestored = false;
      }
      
      public function killFenceTween() : void
      {
         if(this._fenceTween)
         {
            this._fenceTween.kill();
            this._fenceTween = null;
         }
      }
      
      public function hideFrontFence() : void
      {
         var fence:Sprite = null;
         if(this.hideFence == false)
         {
            this.killFenceTween();
            try
            {
               if(this.getChildAt(0) && (this.getChildAt(0) is MovieClip || this.getChildAt(0) is Sprite) && Boolean((this.getChildAt(0) as Sprite).getChildByName("fence_mc")))
               {
                  fence = this.getChildAt(0)["fence_mc"] as Sprite;
                  if(fence)
                  {
                     this._fenceTween = TweenLite.to(fence,0.3,{
                        "alpha":0.3,
                        "ease":Linear.easeNone
                     });
                  }
               }
            }
            catch(err:Error)
            {
            }
            this.hideFence = true;
         }
      }
      
      public function showFrontFence() : void
      {
         var fence:Sprite = null;
         this.killFenceTween();
         try
         {
            if(this.getChildAt(0) && this.getChildAt(0)["fence_mc"] && Boolean(this.getChildAt(0)["fence_mc"] as Sprite))
            {
               fence = this.getChildAt(0)["fence_mc"] as Sprite;
               if(fence)
               {
                  this._fenceTween = TweenLite.to(fence,0.3,{
                     "alpha":1,
                     "ease":Linear.easeNone
                  });
               }
            }
         }
         catch(err:Error)
         {
         }
         this.hideFence = false;
      }
   }
}

