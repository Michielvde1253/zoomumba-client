package com.bigpoint.zoomumba.view.features.map
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MAPOVERVIEW;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.features.map.components.Cloud;
   import com.bigpoint.zoomumba.view.features.map.components.MapArea;
   import com.bigpoint.zoomumba.view.features.map.components.Pinguin;
   import com.bigpoint.zoomumba.view.features.map.config.MapConfig;
   import com.bigpoint.zoomumba.view.features.map.config.vo.LastVisitVo;
   import com.bigpoint.zoomumba.view.features.map.config.vo.MapZooConfigVo;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class MapFullScreenMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "MapFullScreenMediator";
      
      private static const CALC_CLOUD_TIME:int = 200;
      
      private static const CALC_CLOUD_DISTANCE:int = 3000;
      
      private var _mainView:Sprite;
      
      private var _viewState:String;
      
      private var _currentView:String;
      
      private var _isVisible:Boolean;
      
      private var _asset:Sprite;
      
      private var _assetMap:Sprite;
      
      private var _assetBG:Sprite;
      
      private var _assetBGTile:Sprite;
      
      private var _mapAreas:Vector.<MapArea>;
      
      private var _mapNames:Vector.<String>;
      
      private var _mapIds:Vector.<int>;
      
      private var _mapConfig:MapConfig;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var _currencyProxy:CurrencyProxy;
      
      private var _netProxy:NetProxy;
      
      private var _swfAssetSource:SWFAsset;
      
      private var _cloudSprite:Sprite;
      
      private var _cloudsVector:Vector.<Cloud>;
      
      private var _stick:Sprite;
      
      private var _pinguin:Pinguin;
      
      private var _selectedMap:MapArea;
      
      private var _delayCloud:TweenLite;
      
      private var _delayNessi:TweenLite;
      
      private var _birdEaster:MovieClip;
      
      private var _birdMoveEaster:MovieClip;
      
      private var _tailEaster:MovieClip;
      
      private var _nessiMc:MovieClip;
      
      private var _easterBlocker:Boolean = false;
      
      private var _easterTween:TweenLite;
      
      private var _lastVisitVo:LastVisitVo;
      
      public function MapFullScreenMediator(param1:UIComponent)
      {
         super(NAME,param1);
      }
      
      public static function checkNumberBetween(param1:Number, param2:Number, param3:Number) : Boolean
      {
         return param1 > param2 ? false : (param3 < param2 ? false : true);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this._mapConfig = new MapConfig();
         this._viewState = MAPOVERVIEW.MAP_OVERVIEW_WINDOWMODE;
         this._mapAreas = new Vector.<MapArea>();
         this._cloudsVector = new Vector.<Cloud>();
         this._mapNames = new <String>[MAPOVERVIEW.MC_COAST_ZOO,MAPOVERVIEW.MC_FORGOTTEN_ZOO,MAPOVERVIEW.MC_MAIN_ZOO,MAPOVERVIEW.MC_MANAGMENT_CENTER,MAPOVERVIEW.MC_NEW_ZOO,MAPOVERVIEW.MC_RIVER_ZOO,MAPOVERVIEW.MC_OCEANWORLD_ZOO];
         this._isVisible = true;
         this._mainView = new Sprite();
         this.getContainer().addChild(this._mainView);
         this.loadAsset();
         this.hide();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.APP_MODE_CHANGED,Note.FULLSCREEN_MODE_CHANGE,Note.APP_RESIZED,Note.MAP_REPARSE,DataNote.REAL_MONEY_UPDATED,Note.MAP_UNLOCK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = param1.getName();
         var _loc3_:Object = param1.getBody();
         switch(_loc2_)
         {
            case Note.MAP_UNLOCK:
               this.netProxy.callServer(NET.UNLOCK_FIELD,[param1.getBody()]).addCallbackIfTrue(Note.MAP_REPARSE).addCallbackIfFalse(Note.MAP_REPARSE).sendNow();
               break;
            case Note.MAP_REPARSE:
            case DataNote.REAL_MONEY_UPDATED:
               this.updateMapAreas();
               break;
            case DataNote.APP_MODE_CHANGED:
               if(_loc3_ as String != AppMode.MAP_OVERVIEW)
               {
                  this.hide();
               }
               break;
            case Note.FULLSCREEN_MODE_CHANGE:
            case Note.APP_RESIZED:
               if(this._asset)
               {
                  if(this.isVisible)
                  {
                     this.centerView();
                     this.buildClouds();
                  }
               }
         }
      }
      
      public function show(param1:LastVisitVo) : void
      {
         this._lastVisitVo = param1;
         this._mainView.visible = true;
         this.initPinuginCood();
         this.updateMapAreas();
         this.centerView();
         this.buildClouds();
         this.startStick();
         this._isVisible = true;
         this._delayNessi = TweenLite.delayedCall(this.randomRange(5,40),this.showNessi);
      }
      
      private function showNessi() : void
      {
         this.resetNessi();
         this._nessiMc.play();
      }
      
      private function resetNessi() : void
      {
         if(this._nessiMc)
         {
            this._nessiMc.gotoAndStop(1);
            if(this._delayNessi)
            {
               this._delayNessi.kill();
               this._delayNessi = null;
            }
         }
      }
      
      private function buildClouds() : void
      {
         var _loc1_:Cloud = null;
         var _loc2_:TweenLite = null;
         var _loc3_:int = this._mainView.stage.stageHeight - this._mainView.stage.stageHeight / 3;
         this._cloudSprite.x = Math.round(this._mainView.stage.stageWidth / 2) * -1;
         this._cloudSprite.y = Math.round(this._mainView.stage.stageHeight / 2) * -1;
         this.resetClouds();
         var _loc4_:int = 0;
         while(_loc4_ < this._cloudsVector.length / 3)
         {
            _loc1_ = this._cloudsVector[_loc4_];
            _loc1_.x = this.randomRange(25,this._mainView.stage.stageWidth - 25);
            _loc1_.y = this.randomRange(0,_loc3_);
            this.startCloudAni(_loc1_);
            _loc4_++;
         }
         this.flyRandomCloud();
      }
      
      private function flyRandomCloud() : void
      {
         var _loc1_:Cloud = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._cloudsVector.length)
         {
            _loc1_ = this._cloudsVector[this.randomRange(0,this._cloudsVector.length - 1)];
            if(_loc1_.isflying == false)
            {
               _loc1_.x = this._mainView.stage.stageWidth + _loc1_.width + 25;
               this.startCloudAni(_loc1_);
               break;
            }
            _loc2_++;
         }
         this._delayCloud = TweenLite.delayedCall(this.randomRange(5,23),this.flyRandomCloud);
      }
      
      private function resetClouds() : void
      {
         var _loc1_:Cloud = null;
         var _loc2_:TweenLite = null;
         var _loc3_:int = this._mainView.stage.stageHeight - this._mainView.stage.stageHeight / 3;
         if(this._delayCloud)
         {
            this._delayCloud.kill();
         }
         var _loc4_:int = 0;
         while(_loc4_ < this._cloudsVector.length)
         {
            _loc1_ = this._cloudsVector[_loc4_];
            _loc1_.disable();
            _loc1_.x = Math.round(this._mainView.stage.stageWidth + _loc1_.width);
            _loc1_.y = this.randomRange(0,_loc3_);
            _loc4_++;
         }
      }
      
      private function startCloudAni(param1:Cloud) : void
      {
         var _loc2_:int = param1.x;
         var _loc3_:int = 100 / CALC_CLOUD_DISTANCE * _loc2_;
         var _loc4_:int = CALC_CLOUD_TIME / 100 * _loc3_;
         _loc4_ = this.randomRange(_loc4_ - _loc4_ * 0.5,_loc4_ + _loc4_ * 0.5);
         param1.playTo(_loc4_,param1.width / 2 * -1,param1.y);
      }
      
      private function randomRange(param1:Number, param2:Number) : Number
      {
         return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
      }
      
      public function startStick() : void
      {
         this._mainView.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler,false,0,true);
         this._mainView.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutHandler,false,0,true);
         this.onMouseMoveHandler();
      }
      
      public function stopStick() : void
      {
         if(this._mainView.hasEventListener(MouseEvent.MOUSE_MOVE))
         {
            this._mainView.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMoveHandler);
            this._mainView.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutHandler);
         }
      }
      
      private function onMouseOutHandler(param1:MouseEvent) : void
      {
         Mouse.show();
      }
      
      private function onMouseMoveHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(checkNumberBetween(-277,this._mainView.mouseX,357))
         {
            this._stick.x = this._mainView.mouseX;
            _loc2_ = true;
         }
         if(checkNumberBetween(-200,this._mainView.mouseY,192))
         {
            this._stick.y = this._mainView.mouseY;
            _loc3_ = true;
         }
         if(_loc2_ && _loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
      
      public function hide() : void
      {
         var _loc1_:MapArea = null;
         this._isVisible = false;
         this._mainView.visible = this._isVisible;
         this.stopStick();
         this.resetClouds();
         this.resetNessi();
         if(this._pinguin)
         {
            this._pinguin.stopMoving();
         }
         for each(_loc1_ in this._mapAreas)
         {
            _loc1_.disable();
         }
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
         Mouse.show();
      }
      
      private function loadAsset() : void
      {
         AssetLibrary.sendAssetToFunction(String(MAPOVERVIEW.MAP_OVERVIEW_ASSET + MAPOVERVIEW.MAP_OVERVIEW_FULLSCREEN),this.handleAssetLoaded);
         this._currentView = this._viewState;
      }
      
      private function handleAssetLoaded(param1:SWFAsset) : void
      {
         this._swfAssetSource = param1;
         this._assetBGTile = new Sprite();
         this._asset = param1.getEmbededSprite("asset") as Sprite;
         this._assetMap = this._asset.getChildByName("map_mc") as Sprite;
         this._stick = this._asset.getChildByName("stick_mc") as Sprite;
         this._cloudSprite = this._asset.getChildByName("clouds_mc") as Sprite;
         this._nessiMc = this._assetMap.getChildByName("nessi_mc") as MovieClip;
         var _loc2_:int = 0;
         while(_loc2_ < this._cloudSprite.numChildren)
         {
            this._cloudsVector.push(new Cloud(this._cloudSprite.getChildAt(_loc2_) as Sprite));
            _loc2_++;
         }
         this._stick.mouseEnabled = false;
         this._stick.mouseChildren = false;
         if(this._asset.getChildByName("background_mc"))
         {
            this._assetBG = this._asset.getChildByName("background_mc") as Sprite;
         }
         this._mainView.addChild(this._assetBGTile);
         this._mainView.addChild(this._asset);
         this._pinguin = new Pinguin(this._assetMap.getChildByName("pingu_mc") as MovieClip);
         this._pinguin.addEventListener(Pinguin.MOVE_FINISHED_EVENT,this.finishedMove);
         this._pinguin.stopMoving();
         this.initEasterEgg();
         this.initAsset();
         this.centerView();
         this.resetNessi();
      }
      
      private function initPinuginCood() : void
      {
         var _loc1_:MapArea = null;
         this._pinguin.idleMode();
         if(this._lastVisitVo.lastAppMode == AppMode.NORMAL)
         {
            for each(_loc1_ in this._mapAreas)
            {
               if(_loc1_.config.id == this._lastVisitVo.lastPlayfieldId)
               {
                  this._pinguin.x = _loc1_.pinguX;
                  this._pinguin.y = _loc1_.pinguY;
               }
            }
         }
         else
         {
            for each(_loc1_ in this._mapAreas)
            {
               if(_loc1_.config.assetName == MAPOVERVIEW.MC_MANAGMENT_CENTER)
               {
                  this._pinguin.x = _loc1_.pinguX;
                  this._pinguin.y = _loc1_.pinguY;
               }
            }
         }
      }
      
      private function initEasterEgg() : void
      {
         this._tailEaster = this._assetBG.getChildByName("tail_mc") as MovieClip;
         this._birdEaster = this._assetBG.getChildByName("birdie_mc") as MovieClip;
         this._birdMoveEaster = this._birdEaster.getChildByName("bird_move_mc") as MovieClip;
         this._tailEaster.mouseEnabled = true;
         this._tailEaster.addEventListener(MouseEvent.CLICK,this.playEaster,false,0,true);
      }
      
      private function playEaster(param1:MouseEvent) : void
      {
         if(this._easterBlocker == false)
         {
            SoundManager.getInstance().playSoundEffect(SoundEffectNames.ANIMAL_SNDS_PER_ID[14]);
            this._birdMoveEaster = this._birdEaster.getChildByName("bird_move_mc") as MovieClip;
            this._tailEaster.play();
            this._birdEaster.play();
            this._birdMoveEaster.play();
            this._easterBlocker = true;
            this._easterTween = TweenLite.delayedCall(2,this.resetEasterBlocker);
         }
      }
      
      private function resetEasterBlocker() : void
      {
         this._easterBlocker = false;
      }
      
      private function updateMapAreas() : void
      {
         var _loc1_:MapArea = null;
         if(this._mapNames)
         {
            for each(_loc1_ in this._mapAreas)
            {
               this.checkMapArea(_loc1_);
               _loc1_.tooltipText = this.generateToolTip(_loc1_.config);
            }
         }
      }
      
      private function onPressMapArea(param1:Event) : void
      {
         var _loc2_:MapArea = param1.target as MapArea;
         var _loc3_:int = _loc2_.config.id;
         if(this._lastVisitVo.lastPlayfieldId == _loc2_.config.id && this._lastVisitVo.lastAppMode == AppMode.NORMAL)
         {
            this.closeMenuSwitchDirect(AppMode.NORMAL);
         }
         else if(this._lastVisitVo.lastAppMode == AppMode.MANAGMENT_CENTER && _loc2_.config.assetName == MAPOVERVIEW.MC_MANAGMENT_CENTER)
         {
            this.closeMenuSwitchDirect(AppMode.MANAGMENT_CENTER);
            sendNotification(Note.OPEN_MANAGMENT_CENTER);
         }
         else
         {
            if(_loc2_.enabled == false && _loc2_.config.assetName == MAPOVERVIEW.MC_OCEANWORLD_ZOO)
            {
               return;
            }
            if(_loc2_.enabled == false && _loc2_.config.assetName != MAPOVERVIEW.MC_MANAGMENT_CENTER)
            {
               sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
               return;
            }
            if(_loc2_.config.assetName == MAPOVERVIEW.MC_MANAGMENT_CENTER)
            {
               this._selectedMap = _loc2_;
               this._pinguin.moveTo(_loc2_.pinguX,_loc2_.pinguY);
            }
            else if(_loc2_.config.id != -1)
            {
               this.handleFieldAction(_loc2_);
            }
         }
         Mouse.show();
      }
      
      private function closeMenuSwitchDirect(param1:String) : void
      {
         sendNotification(Note.SHOW_SETTINGSMENU);
         sendNotification(Note.HIDE_GRID);
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
         sendNotification(Note.CHANGE_APP_MODE,param1);
         sendNotification(Note.HIDE_LOADER_LAYER);
      }
      
      private function checkMapArea(param1:MapArea) : void
      {
         var _loc2_:MapZooConfigVo = param1.config;
         if(_loc2_.id != PlayFieldsTypes.FIELD_TYPE_NOT_SET)
         {
            if(this.playfieldSettingsProxy.hasPlayFieldId(_loc2_.id))
            {
               param1.enabled = true;
               param1.grayOut(false);
               param1.locked = false;
            }
            else
            {
               param1.grayOut(true);
               param1.enabled = false;
               param1.locked = true;
               if(this.currencyProxy.getCurrency(UserResources.REAL_MONEY) >= _loc2_.cost && _loc2_.cost != -1)
               {
                  param1.enabled = true;
               }
            }
         }
         else
         {
            param1.enabled = true;
            param1.locked = false;
            param1.grayOut(false);
         }
      }
      
      private function handleFieldAction(param1:MapArea) : void
      {
         var _loc2_:String = null;
         if(this.playfieldSettingsProxy.hasPlayFieldId(param1.config.id))
         {
            this._selectedMap = param1;
            this._pinguin.moveTo(param1.pinguX,param1.pinguY);
         }
         else if(param1.config.cost != -1)
         {
            _loc2_ = TextResourceModule.getText("zoo.window.confirmation.map.buy");
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.title.buy"),_loc2_,param1.config.cost),new WindowParams("",null,"",null,Note.MAP_UNLOCK,param1.config.id)));
         }
      }
      
      private function finishedMove(param1:Event) : void
      {
         if(this._selectedMap.config.assetName == MAPOVERVIEW.MC_MANAGMENT_CENTER)
         {
            this.hide();
            sendNotification(Note.OPEN_MANAGMENT_CENTER);
         }
         else
         {
            this.switchPlayfield(this._selectedMap.config);
         }
      }
      
      private function switchPlayfield(param1:MapZooConfigVo) : void
      {
         this.hide();
         sendNotification(Note.SHOW_SETTINGSMENU);
         sendNotification(Note.SWITCH_PLAYFIELD,param1.id);
      }
      
      private function initAsset() : void
      {
         var _loc1_:MapZooConfigVo = null;
         var _loc2_:MapArea = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         if(this._asset)
         {
            for each(_loc3_ in this._mapNames)
            {
               _loc4_ = 0;
               while(_loc4_ < this._assetMap.numChildren)
               {
                  if(this._assetMap.getChildAt(_loc4_).name == _loc3_)
                  {
                     _loc1_ = this._mapConfig.getConfigByAssetName(_loc3_);
                     _loc2_ = new MapArea(this._assetMap.getChildAt(_loc4_) as Sprite,_loc1_,this.generateToolTip(_loc1_));
                     _loc2_.addEventListener(MapArea.CLICK,this.onPressMapArea,false,0,true);
                     this._mapAreas.push(_loc2_);
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      private function centerView() : void
      {
         if(Boolean(this._asset) && Boolean(this._asset.stage))
         {
            this._mainView.y = Math.round(this._mainView.stage.stageHeight / 2);
            this._mainView.x = Math.round(this._mainView.stage.stageWidth / 2);
         }
      }
      
      private function clearView() : void
      {
         var _loc1_:MapArea = null;
         if(Boolean(this._asset) && Boolean(this._mapAreas))
         {
            for each(_loc1_ in this._mapAreas)
            {
               _loc1_.removeEventListener(Event.ACTIVATE,this.onPressMapArea);
               _loc1_.destroy();
            }
            this._mapAreas = new Vector.<MapArea>();
         }
         if(this._asset)
         {
            if(this._mainView.contains(this._asset))
            {
               this._mainView.removeChild(this._asset);
            }
         }
         if(this._assetBGTile)
         {
            if(this._mainView.contains(this._assetBGTile))
            {
               this._mainView.removeChild(this._assetBGTile);
            }
         }
      }
      
      private function generateToolTip(param1:MapZooConfigVo) : String
      {
         var _loc3_:String = null;
         var _loc2_:* = "";
         _loc2_ = TextResourceModule.getText(param1.tooltipId);
         if(param1.id == PlayFieldsTypes.FIELD_TYPE_NOT_SET)
         {
            return _loc2_;
         }
         if(this.playfieldSettingsProxy.hasPlayFieldId(param1.id))
         {
            return _loc2_;
         }
         _loc2_ += ". ";
         if(param1.extensionLevel != -1)
         {
            _loc3_ = TextResourceModule.getText("zoo.tooltip.zooNames." + param1.extensionFrom.toString());
            _loc2_ += TextResourceModule.getText("zoo.window.confirmation.map.buyzooandextention");
            _loc2_ = _loc2_.replace("%level%",param1.extensionLevel.toString());
            _loc2_ = _loc2_.replace("%zooName%",_loc3_);
            _loc2_ = _loc2_.replace("%zooDollar%",param1.cost.toString());
         }
         else if(param1.cost != -1)
         {
            _loc2_ += TextResourceModule.getText("zoo.window.confirmation.map.buyzooandlevel");
            _loc2_ = _loc2_.replace("%level%",param1.level.toString());
            _loc2_ = _loc2_.replace("%zooDollar%",param1.cost.toString());
         }
         else
         {
            _loc2_ += TextResourceModule.getText("zoo.window.confirmation.map.level");
            _loc2_ = _loc2_.replace("%level%",param1.level.toString());
         }
         return _loc2_;
      }
      
      public function get isVisible() : Boolean
      {
         return this._isVisible;
      }
      
      private function getContainer() : UIComponent
      {
         return viewComponent as UIComponent;
      }
      
      public function get applicationMediator() : ApplicationMediator
      {
         return facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
      
      public function get netProxy() : NetProxy
      {
         if(this._netProxy == null)
         {
            this._netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         }
         return this._netProxy;
      }
      
      public function get playfieldSettingsProxy() : PlayfieldSettingsProxy
      {
         if(this._playfieldSettingsProxy == null)
         {
            this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
         }
         return this._playfieldSettingsProxy;
      }
   }
}

