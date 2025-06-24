package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class Store extends Building
   {
      private static const ICON_LOCATION_Y:int = -75;
      
      private var _collectTime:int;
      
      private var _collectVirtual:int;
      
      private var _collectReal:int;
      
      private var _moneyPerHour:int;
      
      private var _attraction:int = 0;
      
      private var _collectTimeStamp:int = -1;
      
      private var collectTimeTrack:TimeTrack;
      
      private var collectIconsVirtual:Vector.<MovieClip> = new Vector.<MovieClip>(MainConfig.ZOOM_LEVELS.length);
      
      private var collectIconsReal:Vector.<MovieClip> = new Vector.<MovieClip>(MainConfig.ZOOM_LEVELS.length);
      
      private var lastCollectIcon:MovieClip;
      
      private var activateCollectButton:SimpleButton;
      
      private var collectIconContainer:Sprite;
      
      private var collectionButtonVisible:Boolean = true;
      
      private var _canCollect:Boolean;
      
      private var storeItemData:StoreData;
      
      private var asset:SWFAsset;
      
      public function Store(param1:Notifier, param2:Sprite, param3:int)
      {
         this.collectTimeTrack = TimeManager.creatEmptyTrack(this.handleCollectNeeded);
         super(param1,param2,param3);
         _category = Categories.STORE;
         _groundRequired = ItemAbstract.GROUND_GRASS;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.collectIconContainer = new Sprite();
         var _loc4_:int = 0;
         while(_loc4_ < MainConfig.ZOOM_LEVELS.length)
         {
            this.collectIconsVirtual[_loc4_] = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,"StoreCollectableSlowAnim_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_MC");
            this.collectIconsVirtual[_loc4_].mouseChildren = false;
            this.collectIconsVirtual[_loc4_].mouseEnabled = false;
            this.collectIconsVirtual[_loc4_].stop();
            this.collectIconsReal[_loc4_] = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,"StoreCollectableRealSlowAnim_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_MC");
            this.collectIconsReal[_loc4_].mouseChildren = false;
            this.collectIconsReal[_loc4_].mouseEnabled = false;
            this.collectIconsReal[_loc4_].stop();
            _loc4_++;
         }
         this.activateCollectButton = AssetLibrary.getButton(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_STORE_ACTIVATE_COLLECT_BUTTON);
         this.activateCollectButton.addEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
         this.itemHeight = 1;
         this.itemWidth = 1;
         this.fillStoreConfigData();
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleStoreAsset);
         createActiveZone();
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : Store
      {
         var _loc4_:Store = null;
         canConstruct = true;
         _loc4_ = new Store(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(_enabled)
         {
            this.activateCollectButton.mouseEnabled = true;
            this.activateCollectButton.useHandCursor = true;
         }
         else
         {
            this.activateCollectButton.mouseEnabled = false;
         }
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         this.storeItemData = StoreData(param1);
         if(this.storeItemData.collectTimeStamp != -1)
         {
            this.collectTimeStamp = this.storeItemData.collectTimeStamp;
         }
         super.updateState(param1,param2);
         this.updateView();
         if(_currentStateId != this.storeItemData.stateId)
         {
            this.switchState(this.storeItemData.stateId,this._itemId);
         }
      }
      
      public function switchState(param1:int, param2:int) : void
      {
         if(_currentStateId != param1 && Boolean(skin))
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
                  this.initAsset();
               }
            }
         }
      }
      
      override protected function updateView() : void
      {
         if(skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
            }
            skin.gotoAndStop("zoom_" + String(_zoomlevel));
            if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this.skin.scaleX = -1;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this.skin.scaleX = 1;
            }
            this.collectIconContainer.y = ICON_LOCATION_Y * _zoomlevel;
         }
         this.updateIcons(true);
         super.updateView();
      }
      
      private function hadleStoreAsset(param1:SWFAsset) : void
      {
         this.asset = param1;
         this.initAsset();
      }
      
      private function initAsset() : void
      {
         if(!_isDisposed)
         {
            if(_currentStateId == 0)
            {
               skin = this.asset.getEmbededMovieClip("ObjectMC");
            }
            else
            {
               skin = this.asset.getEmbededMovieClip("ObjectState" + _currentStateId + "MC");
            }
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            this.updateView();
            this.updateCanCollect();
         }
      }
      
      private function fillStoreConfigData() : void
      {
         var _loc1_:StoreShopData = ConfigurationModule.getInstance().getStoreData(this._itemId);
         if(_loc1_)
         {
            this.itemWidth = _loc1_.width;
            this.itemHeight = _loc1_.height;
            this.defaultItemWidth = _loc1_.width;
            this.defaultItemHeight = _loc1_.height;
            this._sellable = _loc1_.getSellable();
            this._sellVirtual = _loc1_.getSellVirtual();
            this._sellReal = _loc1_.getSellReal();
            this._buildTime = _loc1_.buildTime;
            this._directBuildReal = _loc1_.directBuildReal;
            this._alias = _loc1_.alias;
            this._collectTime = _loc1_.collectTime;
            this._collectVirtual = _loc1_.collectVirtual;
            this._collectReal = _loc1_.collectReal;
            this._moneyPerHour = _loc1_.moneyPerHour;
            this._attraction = _loc1_.getAttraction();
            this.multyStates = _loc1_.multyStates;
         }
      }
      
      public function get collectTimeStamp() : int
      {
         return this._collectTimeStamp;
      }
      
      public function get collectTime() : int
      {
         return this._collectTime;
      }
      
      public function set collectTimeStamp(param1:int) : void
      {
         this._collectTimeStamp = param1;
         if(this._collectTimeStamp > 0)
         {
            TimeManager.updateTrackTime(this.collectTimeTrack,this._collectTimeStamp);
         }
         this.updateCanCollect();
         this.updateIcons();
      }
      
      private function updateCanCollect() : void
      {
         if(itemId == 34 && this._collectTimeStamp < TimeManager.currentTime)
         {
            this.updateView();
            this.switchState(1,itemId);
         }
         this._canCollect = this._collectTimeStamp < TimeManager.currentTime;
      }
      
      public function get collectVirtual() : int
      {
         return this._collectVirtual;
      }
      
      public function get collectReal() : int
      {
         return this._collectReal;
      }
      
      public function get moneyPerHour() : int
      {
         return this._moneyPerHour;
      }
      
      public function get attraction() : int
      {
         return this._attraction;
      }
      
      public function get canCollect() : Boolean
      {
         return this._canCollect;
      }
      
      private function updateIcons(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.removeLastCollectIcon();
         }
         if(itemId == 34)
         {
            return;
         }
         if(buildTimeStamp < TimeManager.currentTime)
         {
            this.updateCanCollect();
            if(this.collectionButtonVisible && this._collectTimeStamp != -1 && this._canCollect)
            {
               if(!this.contains(this.collectIconContainer))
               {
                  this.addChild(this.collectIconContainer);
               }
               if(!this.lastCollectIcon || !this.collectIconContainer.contains(this.lastCollectIcon))
               {
                  if(this._collectReal > 0)
                  {
                     this.lastCollectIcon = this.collectIconsReal[zoomIndex];
                  }
                  else
                  {
                     this.lastCollectIcon = this.collectIconsVirtual[zoomIndex];
                  }
                  this.collectIconContainer.addChild(this.lastCollectIcon);
                  this.lastCollectIcon.play();
               }
               if(!this.collectIconContainer.contains(this.activateCollectButton))
               {
                  this.collectIconContainer.addChild(this.activateCollectButton);
               }
            }
            else
            {
               this.removeLastCollectIcon();
               if(this.collectIconContainer != null && this.collectIconContainer.contains(this.activateCollectButton))
               {
                  this.collectIconContainer.removeChild(this.activateCollectButton);
               }
            }
         }
      }
      
      private function activateCollectButtonClickHandler(param1:MouseEvent) : void
      {
         notifier.dispatchNotice(new ItemNotice(ItemNotice.CLICK,Categories.STORE,_itemId,_level,uniqueId,_groundRequired,_rotatePos,new Point(itemWidth,itemHeight)));
      }
      
      private function removeLastCollectIcon() : void
      {
         if(this.lastCollectIcon)
         {
            if(this.collectIconContainer.contains(this.lastCollectIcon))
            {
               this.collectIconContainer.removeChild(this.lastCollectIcon);
               this.lastCollectIcon.gotoAndStop(1);
            }
            this.lastCollectIcon = null;
         }
      }
      
      public function handleCollectNeeded() : void
      {
         this.updateIcons();
         this.updateCanCollect();
         this.forceStatRecalculate();
      }
      
      private function forceStatRecalculate() : void
      {
         var _loc1_:PlayfieldSettingsProxy = Facade.getInstance().getProxy(PlayfieldSettingsProxy);
         _loc1_.changeAttractions(this.storeItemData.playFieldId,this.storeItemData,true);
         _loc1_.recalculatePlayfieldsInfo();
      }
      
      public function resetCollectTime() : void
      {
         this.collectTimeStamp = TimeManager.currentTime + this._collectTime;
      }
      
      public function hideCollectAnimation() : void
      {
         this.collectionButtonVisible = false;
         this.updateIcons();
      }
      
      public function showCollectAnimation() : void
      {
         this.collectionButtonVisible = true;
         this.updateIcons();
      }
      
      override public function dispose() : void
      {
         this.hideCollectAnimation();
         TimeManager.removeTrack(this.collectTimeTrack);
         this.collectTimeTrack = null;
         this.removeLastCollectIcon();
         this.collectIconsVirtual = null;
         this.collectIconsReal = null;
         this.collectIconContainer = null;
         if(this.activateCollectButton.hasEventListener(MouseEvent.CLICK))
         {
            this.activateCollectButton.addEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
         }
         this.activateCollectButton = null;
         super.dispose();
      }
   }
}

