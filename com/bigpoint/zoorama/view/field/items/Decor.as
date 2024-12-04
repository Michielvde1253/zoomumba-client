package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Decor extends Building
   {
      public static var SNOW_MAN_UID:int = 41;
      
      public static var FORTUNE_WHEEL_DEPRICATED:int = 2000;
      
      public static var STORAGE_START_ID:int = 2001;
      
      public static var STORAGE_COUNT:int = 6;
      
      public static var HEARTS_GLOBE:int = 54;
      
      public static var TENTH_MILLION_USER_UID:int = 76;
      
      public static var NUT_CRACKER:int = 91;
      
      public static var FAIRY_LIGHT_REINDEER:int = 92;
      
      public static var FLYING_CANLES_HALLOWEEN:int = 387;
      
      public static var QUIDDICH:int = 390;
      
      public static var PATRONUS:int = 389;
      
      private var _attraction:int = 0;
      
      public function Decor(param1:Notifier, param2:Sprite, param3:int)
      {
         super(param1,param2,param3);
         _category = Categories.DECOR;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 2;
         this.itemWidth = 2;
         this.fillDecorConfigData();
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleDecorAsset);
         if(_itemId == 3000 || _itemId == 3001)
         {
            this._dragable = false;
            this.higlightable = false;
            this._systemItem = true;
            this.itemWidth = 0;
            this.itemHeight = 0;
         }
         createActiveZone();
      }
      
      public static function get STORAGE_END_ID() : int
      {
         return STORAGE_START_ID + STORAGE_COUNT;
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : Decor
      {
         canConstruct = true;
         var _loc4_:Decor = new Decor(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc3_:DecorData = DecorData(param1);
         super.updateState(param1,param2);
         if(_currentStateId != _loc3_.stateId)
         {
            this.switchState(_loc3_.stateId,this._itemId);
         }
      }
      
      override protected function updateView() : void
      {
         var _loc1_:String = null;
         if(skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
            }
            _loc1_ = "zoom_" + String(_zoomlevel);
            skin.gotoAndStop(_loc1_);
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
         this.updateIcons();
      }
      
      public function handleShoot(param1:SWFAsset) : void
      {
         skin = param1.getEmbededMovieClip("cannon");
         this.updateView();
      }
      
      private function hadleDecorAsset(param1:SWFAsset) : void
      {
         if(!_isDisposed)
         {
            if(_currentStateId == 0)
            {
               skin = param1.getEmbededMovieClip("ObjectMC");
            }
            else
            {
               skin = param1.getEmbededMovieClip("ObjectState" + _currentStateId + "MC");
               if(_itemId == TENTH_MILLION_USER_UID || _itemId == NUT_CRACKER || _itemId == FAIRY_LIGHT_REINDEER || _itemId == FLYING_CANLES_HALLOWEEN || _itemId == PATRONUS || _itemId == QUIDDICH)
               {
                  _currentStateId = 0;
               }
            }
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            skin.addEventListener("playDecorSound",this.playDecorSound);
            this.updateView();
         }
      }
      
      private function fillDecorConfigData() : void
      {
         var _loc1_:DecorShopData = ConfigurationModule.getInstance().getDecorationData(this._itemId);
         if(_loc1_)
         {
            this.itemWidth = _loc1_.width;
            this.itemHeight = _loc1_.height;
            this.defaultItemWidth = _loc1_.width;
            this.defaultItemHeight = _loc1_.height;
            this._groundRequired = _loc1_.groundRequired;
            this._sellable = _loc1_.getSellable();
            this._sellVirtual = _loc1_.getSellVirtual();
            this._sellReal = _loc1_.getSellReal();
            this._directBuildReal = _loc1_.directBuildReal;
            this._alias = _loc1_.alias;
            this._attraction = _loc1_.getAttraction();
            this.multyStates = _loc1_.multyStates;
         }
         else if(this.uniqueId >= 0)
         {
         }
      }
      
      public function playDecorSound(param1:Event = null) : void
      {
         var _loc2_:String = SoundEffectNames["SND_DECOR_" + this.itemId];
         if(_loc2_)
         {
            SoundManager.getInstance().playSoundEffect(_loc2_);
         }
      }
      
      public function get attraction() : int
      {
         return this._attraction;
      }
      
      public function get currentStateId() : int
      {
         return _currentStateId;
      }
      
      private function updateIcons() : void
      {
      }
      
      public function switchState(param1:int, param2:int) : void
      {
         if(_currentStateId != param1)
         {
            if(multyStates >= param1 && this.itemId == param2)
            {
               _currentStateId = param1;
               if(this.contains(skin))
               {
                  this.removeChild(skin);
               }
               if(skin)
               {
                  skin = null;
                  AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleDecorAsset);
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         if(skin)
         {
            skin.removeEventListener("playDecorSound",this.playDecorSound);
         }
         super.dispose();
      }
   }
}

