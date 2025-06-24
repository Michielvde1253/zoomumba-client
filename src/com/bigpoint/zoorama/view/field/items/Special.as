package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.SpecialData;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Special extends Building
   {
      public static var ESTER_EGG_ID:int = 20;
      
      public static var ANNIVERSARY_STAGE:int = 1500;
      
      public static var TREE_FRONT_ENTRANCE_1_UID:int = 1003;
      
      public static var TREE_FRONT_ENTRANCE_2_UID:int = 1004;
      
      public static var OCEN_WORLD_SIGN_UID:int = 1002;
      
      public static var EXPAND_FIELD_SIGN_UID:int = 1005;
      
      public static var SAFARI_MINI_GAME_JEEP_UID:int = 1007;
      
      public static var FORGOTTEN_ZOO_SIGN_UID:int = 1011;
      
      public static var ANNIVERSARY_TEASER:int = 1008;
      
      public static var GATE_UID_1:int = 1;
      
      public static var GATE_UID_2:int = 2;
      
      public static var GATE_UID_3:int = 3;
      
      public static var GATE_UID_4:int = 4;
      
      public static var GATE_UID_5:int = 5;
      
      public static var GATE_UID_7:int = 7;
      
      public static var GATE_UID_8:int = 8;
      
      public static var GATE_FORGOTTEN_UID:int = 21;
      
      public static var GATE_FENCE_UID_1:int = 11;
      
      public static var GATE_FENCE_UID_2:int = 12;
      
      public static var GATE_FENCE_UID_3:int = 13;
      
      public static var GATE_FENCE_UID_4:int = 14;
      
      public static var GATE_FENCE_UID_5:int = 15;
      
      public static var GATE_FENCE_UID_7:int = 16;
      
      public static var GATE_FENCE_UID_8:int = 18;
      
      public static var FORTUNE_WHEEL:int = 22;
      
      public static var CIRCUS:int = 23;
      
      public static var HAUNTED_CARAVAN:int = 24;
      
      public static var CINEMA:int = 25;
      
      public static var BABY_CARAVAN:int = 26;
      
      public static var XMAS_SLEIGH:int = 27;
      
      public static var XMAS_TREE:int = 28;
      
      public static const ADV_BREED_VAN:int = 29;
      
      public static const OCEAN_WORLD_LIFE_GUARD:int = 1014;
      
      public static const GATE_ICON_LOCATION_Y:int = -90;
      
      public static const GATE_ICON_LOCATION_X:int = 50;
      
      public static const GATE_ICON_OCEANWORLD_LOCATION_Y:int = -95;
      
      public static const GATE_ICON_OCEANWORLD_LOCATION_X:int = -35;
      
      private var _entranceFee:int = -1;
      
      private var collectIcons:Vector.<MovieClip> = new Vector.<MovieClip>(MainConfig.ZOOM_LEVELS.length);
      
      private var currentCollectIcon:MovieClip;
      
      private var activateCollectButton:SimpleButton;
      
      private var _attraction:int = 0;
      
      public function Special(param1:Notifier, param2:Sprite, param3:int)
      {
         super(param1,param2,param3);
         _category = Categories.SPECIAL;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 2;
         this.itemWidth = 2;
         this.fillSpecialConfigData();
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleSpecalAsset);
         if(_itemId == ESTER_EGG_ID)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 1;
            this.itemWidth = 1;
            this.multyStates = 3;
         }
         if(_itemId == GATE_UID_1 || _itemId == GATE_UID_2 || _itemId == GATE_UID_3 || _itemId == GATE_UID_4 || _itemId == GATE_UID_5 || _itemId == GATE_UID_7 || _itemId == GATE_UID_8 || _itemId == GATE_FORGOTTEN_UID)
         {
            this._dragable = false;
            this._systemItem = true;
         }
         if(_itemId == GATE_FENCE_UID_1 || _itemId == GATE_FENCE_UID_2 || _itemId == GATE_FENCE_UID_3 || _itemId == GATE_FENCE_UID_4 || _itemId == GATE_FENCE_UID_5 || _itemId == GATE_FENCE_UID_7 || _itemId == GATE_FENCE_UID_8)
         {
            this._dragable = false;
            if(_itemId == GATE_FENCE_UID_1 || _itemId == GATE_FENCE_UID_4)
            {
               this.itemHeight = 3;
               this.itemWidth = 1;
            }
            else
            {
               this.itemHeight = 3;
               this.itemWidth = 2;
            }
            this._systemItem = true;
         }
         if(_itemId == TREE_FRONT_ENTRANCE_1_UID || _itemId == TREE_FRONT_ENTRANCE_2_UID)
         {
            this._dragable = false;
            this.higlightable = false;
            this.itemWidth = 1;
            this._systemItem = true;
         }
         if(_itemId == EXPAND_FIELD_SIGN_UID)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 1;
            this.itemWidth = 1;
            this._systemItem = true;
         }
         if(_itemId == FORGOTTEN_ZOO_SIGN_UID)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 2;
            this.itemWidth = 3;
            this.scaleX = 0.5;
            this.scaleY = 0.5;
            this._systemItem = true;
         }
         if(_itemId == FORTUNE_WHEEL)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 2;
            this.itemWidth = 2;
            this._systemItem = true;
         }
         if(_itemId == CIRCUS)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 6;
            this.itemWidth = 6;
            this._systemItem = true;
         }
         if(_itemId == HAUNTED_CARAVAN)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 5;
            this.itemWidth = 3;
            this._systemItem = true;
         }
         if(_itemId == ANNIVERSARY_STAGE)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 4;
            this.itemWidth = 4;
            this._systemItem = true;
            this.multyStates = 3;
         }
         if(_itemId == BABY_CARAVAN)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 3;
            this.itemWidth = 3;
            this._systemItem = true;
         }
         if(_itemId == XMAS_SLEIGH)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 3;
            this.itemWidth = 6;
            this._systemItem = true;
         }
         if(_itemId == XMAS_TREE)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 3;
            this.itemWidth = 3;
            this._systemItem = true;
         }
         if(param3 == CINEMA)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemHeight = 3;
            this.itemWidth = 3;
            this._systemItem = true;
         }
         if(param3 == ADV_BREED_VAN)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemWidth = 2;
            this.itemHeight = 2;
            this._systemItem = true;
         }
         if(param3 == OCEAN_WORLD_LIFE_GUARD)
         {
            this._dragable = false;
            this.higlightable = true;
            this.itemWidth = 2;
            this.itemHeight = 2;
            this._systemItem = true;
         }
         switch(_itemId)
         {
            case OCEN_WORLD_SIGN_UID:
            case SAFARI_MINI_GAME_JEEP_UID:
               this._dragable = false;
               this._systemItem = true;
         }
         createActiveZone();
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : Special
      {
         canConstruct = true;
         var _loc4_:Special = new Special(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc3_:SpecialData = SpecialData(param1);
         super.updateState(param1,param2);
         if(this._currentStateId != _loc3_.stateId)
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
      
      private function hadleSpecalAsset(param1:SWFAsset) : void
      {
         if(!_isDisposed)
         {
            if(this._currentStateId == 0)
            {
               skin = param1.getEmbededMovieClip("ObjectMC");
            }
            else
            {
               skin = param1.getEmbededMovieClip("ObjectState" + this._currentStateId + "MC");
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
      
      private function fillSpecialConfigData() : void
      {
      }
      
      public function playDecorSound(param1:Event = null) : void
      {
         var _loc2_:String = SoundEffectNames["SND_DECOR_" + this.itemId];
         if(_loc2_)
         {
            SoundManager.getInstance().playSoundEffect(_loc2_);
         }
      }
      
      public function set entranceFee(param1:int) : void
      {
         this._entranceFee = param1;
         this.updateIcons();
      }
      
      public function get entranceFee() : int
      {
         return this._entranceFee;
      }
      
      public function get attraction() : int
      {
         return this._attraction;
      }
      
      public function get currentStateId() : int
      {
         return this._currentStateId;
      }
      
      private function updateIcons() : void
      {
         var _loc1_:int = 0;
         if(this._entranceFee > -1)
         {
            if(_itemId != GATE_FENCE_UID_1 && _itemId != GATE_FORGOTTEN_UID && _itemId != GATE_FENCE_UID_2 && _itemId != GATE_FENCE_UID_3 && _itemId != GATE_FENCE_UID_4 && _itemId != GATE_FENCE_UID_5 && _itemId != GATE_FENCE_UID_7 && _itemId != GATE_FENCE_UID_8)
            {
               if(!this.currentCollectIcon)
               {
                  _loc1_ = 0;
                  while(_loc1_ < MainConfig.ZOOM_LEVELS.length)
                  {
                     this.collectIcons[_loc1_] = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,"StoreCollectableSlowAnim_" + 100 * MainConfig.ZOOM_LEVELS[_loc1_] + "_MC");
                     this.collectIcons[_loc1_].mouseChildren = false;
                     this.collectIcons[_loc1_].mouseEnabled = false;
                     this.collectIcons[_loc1_].stop();
                     this.currentCollectIcon = this.collectIcons[zoomIndex];
                     _loc1_++;
                  }
                  this.activateCollectButton = AssetLibrary.getButton(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_STORE_ACTIVATE_COLLECT_BUTTON);
                  if(enabled)
                  {
                     this.activateCollectButton.addEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
                     this.activateCollectButton.mouseEnabled = true;
                  }
                  else
                  {
                     this.activateCollectButton.mouseEnabled = false;
                  }
                  this.addChild(this.activateCollectButton);
                  this.activateCollectButton.visible = false;
                  this.activateCollectButton.useHandCursor = true;
               }
               this.activateCollectButton.scaleX = this.activateCollectButton.scaleY = _zoomlevel * 0.8;
               if(this.contains(this.currentCollectIcon))
               {
                  this.removeChild(this.currentCollectIcon);
               }
               this.currentCollectIcon = this.collectIcons[zoomIndex];
               this.addChild(this.currentCollectIcon);
               if(_itemId == GATE_UID_8)
               {
                  this.currentCollectIcon.y = GATE_ICON_OCEANWORLD_LOCATION_Y * _zoomlevel;
                  this.currentCollectIcon.x = GATE_ICON_OCEANWORLD_LOCATION_X * _zoomlevel;
               }
               else
               {
                  this.currentCollectIcon.y = GATE_ICON_LOCATION_Y * _zoomlevel;
                  this.currentCollectIcon.x = GATE_ICON_LOCATION_X * _zoomlevel;
               }
               this.activateCollectButton.y = this.currentCollectIcon.y;
               this.activateCollectButton.x = this.currentCollectIcon.x;
               if(this._entranceFee >= MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT)
               {
                  this.currentCollectIcon.visible = true;
                  this.activateCollectButton.visible = true;
                  this.currentCollectIcon.play();
               }
               else
               {
                  this.currentCollectIcon.visible = false;
                  this.activateCollectButton.visible = false;
                  this.currentCollectIcon.stop();
               }
            }
         }
      }
      
      private function activateCollectButtonClickHandler(param1:Event) : void
      {
         if(enabled)
         {
            notifier.dispatchNotice(new ItemNotice(ItemNotice.CLICK,Categories.SPECIAL,_itemId,_level,uniqueId,_groundRequired,_rotatePos,new Point(itemWidth,itemHeight)));
         }
      }
      
      public function hideCollectAnimation() : void
      {
         if(this.currentCollectIcon)
         {
            this.currentCollectIcon.visible = false;
         }
      }
      
      public function showCollectAnimation() : void
      {
         if(this.currentCollectIcon)
         {
            if(this._entranceFee >= MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT)
            {
               this.currentCollectIcon.visible = true;
            }
         }
      }
      
      public function switchState(param1:int, param2:int) : void
      {
         if(this._currentStateId != param1)
         {
            if(multyStates >= param1 && this.itemId == param2)
            {
               this._currentStateId = param1;
               if(param2 == 1500)
               {
               }
               if(Boolean(skin) && this.contains(skin))
               {
                  this.removeChild(skin);
               }
               if(skin)
               {
                  skin = null;
                  AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleSpecalAsset);
               }
            }
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(this.activateCollectButton)
         {
            if(_enabled)
            {
               this.activateCollectButton.addEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
               this.activateCollectButton.mouseEnabled = true;
            }
            else
            {
               this.activateCollectButton.mouseEnabled = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(skin)
         {
            skin.removeEventListener("playDecorSound",this.playDecorSound);
         }
         this.collectIcons = null;
         this.currentCollectIcon = null;
         if(this.activateCollectButton)
         {
            this.activateCollectButton.removeEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
            this.activateCollectButton.removeEventListener(MouseEvent.CLICK,this.activateCollectButtonClickHandler);
         }
         this.activateCollectButton = null;
         super.dispose();
      }
   }
}

