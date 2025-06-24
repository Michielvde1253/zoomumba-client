package com.bigpoint.zoomumba.view.managmentCenter.components
{
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.managmentCenter.events.BuildingEvent;
   import com.bigpoint.zoomumba.model.managmentCenter.events.CircusBoxEvent;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmenCenterCityViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterViewVo;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ManagmentCity extends Sprite
   {
      private var _viewState:String = "";
      
      private var _isVisible:Boolean = false;
      
      private var _managmentCenterDataVo:ManagmenCenterCityViewVo;
      
      private var _assetModes:Vector.<ManagmentCenterViewVo>;
      
      private var _circusBoxStoreData:Vector.<StoreData>;
      
      private var _buildings:Vector.<ManagmentBuilding>;
      
      private var _currentView:String = "";
      
      private var _isInit:Boolean;
      
      private var _isDragMode:Boolean;
      
      private var _asset:Sprite;
      
      private var _background:MovieClip;
      
      private var _dragPlate:MovieClip;
      
      private var _backgroundtile:BitmapData;
      
      private var _backgroundtileMc:Sprite;
      
      private var _circusBoxes:ManagmentCirusBoxes;
      
      public function ManagmentCity()
      {
         super();
         this._assetModes = new Vector.<ManagmentCenterViewVo>();
         this._circusBoxStoreData = new Vector.<StoreData>();
      }
      
      public function show(param1:String) : void
      {
         this._viewState = param1;
         this.prepareLoadAsset();
      }
      
      public function updateView(param1:String) : void
      {
         this._viewState = param1;
         this.prepareLoadAsset();
      }
      
      public function centerCity() : void
      {
         if(this._isInit)
         {
            this.stopDragCity();
            this._asset.y = this.stage.stageHeight / 2 - this._background.height / 2;
            this._asset.x = this.stage.stageWidth / 2 - this._background.width / 2;
         }
      }
      
      private function prepareLoadAsset() : void
      {
         if(this.currentViewVo == null)
         {
            this.loadAsset();
         }
         else if(this._currentView != this._viewState)
         {
            this.initAsset();
         }
         else
         {
            this.centerCity();
            this.visible = true;
            this._isInit = true;
         }
      }
      
      public function initAsset() : void
      {
         var _loc1_:ManagmentBuilding = null;
         var _loc2_:ManagmentCenterBuildingViewVo = null;
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         var _loc5_:ManagmentCenterBuildingViewVo = null;
         this.clearAsset();
         this.buildBackgroundTiles();
         this._asset = this.currentViewVo.asset;
         this._buildings = new Vector.<ManagmentBuilding>();
         if(this._managmentCenterDataVo)
         {
            for each(_loc4_ in MANAGMENTCENTER.MC_ASSET_BUILDS)
            {
               if(this._asset[_loc4_ + "_mc"])
               {
                  _loc3_ = this._asset[_loc4_ + "_mc"] as MovieClip;
               }
               if(_loc3_)
               {
                  _loc2_ = new ManagmentCenterBuildingViewVo();
                  _loc2_.id = _loc4_;
                  for each(_loc5_ in this._managmentCenterDataVo.buildingViewVo)
                  {
                     if(_loc5_.id == _loc4_)
                     {
                        _loc2_ = _loc5_;
                        break;
                     }
                  }
                  if(_loc2_.id == MANAGMENTCENTER.MC_BUILDING_EXITCITY)
                  {
                     _loc2_.level = 1;
                     _loc2_.viewState = 1;
                  }
                  _loc1_ = new ManagmentBuilding(_loc3_,_loc2_);
                  _loc1_.addEventListener(BuildingEvent.CLICK_BUILDING,this.onBuildingClick);
                  this._buildings.push(_loc1_);
               }
            }
            this._circusBoxes = new ManagmentCirusBoxes(this._asset["circusboxes_mc"]);
            this._circusBoxes.addEventListener(CircusBoxEvent.CIRCUS_OPEN_BOX,this.openBox);
            this._circusBoxes.updateView(this._circusBoxStoreData);
            this._background = this._asset["background_mc"];
            this._dragPlate = this._asset["dragPlate_mc"];
            this._dragPlate.alpha = 0;
            this.stopDragCity();
            addChild(this._asset);
            this.visible = true;
            this._isVisible = true;
            this._isInit = true;
            this.centerCity();
         }
      }
      
      private function openBox(param1:CircusBoxEvent) : void
      {
         dispatchEvent(new CircusBoxEvent(CircusBoxEvent.CIRCUS_OPEN_BOX,param1.dataVo,param1.uniqueId));
      }
      
      public function buildBackgroundTiles() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(Boolean(this._backgroundtileMc) && this.getChildIndex(this._backgroundtileMc) >= 0)
         {
            this.removeChild(this._backgroundtileMc);
         }
         this._backgroundtileMc = new Sprite();
         if(this._backgroundtile)
         {
            _loc2_ = this._backgroundtile.width;
            _loc3_ = this._backgroundtile.height;
            _loc4_ = this.stage.stageWidth / _loc2_ + 1;
            _loc5_ = this.stage.stageHeight / _loc3_ + 1;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc4_)
               {
                  _loc1_ = new Bitmap(this._backgroundtile);
                  _loc1_.x = _loc6_;
                  _loc1_.y = _loc7_;
                  this._backgroundtileMc.addChild(_loc1_);
                  _loc6_ += _loc2_;
                  _loc9_++;
               }
               _loc7_ += _loc3_;
               _loc6_ = 0;
               _loc8_++;
            }
         }
         this.addChildAt(this._backgroundtileMc,0);
      }
      
      private function stopDragCity(param1:MouseEvent = null) : void
      {
         this._dragPlate.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragCity);
         this._dragPlate.removeEventListener(MouseEvent.MOUSE_OUT,this.startDragCity);
         this._dragPlate.removeEventListener(MouseEvent.ROLL_OUT,this.startDragCity);
         this._background.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragCity);
         this._dragPlate.visible = false;
         this._asset.stopDrag();
         var _loc2_:MouseModule = MouseModule.getInstance();
         _loc2_.show(MouseState.DEFAULT);
      }
      
      private function startDragCity(param1:MouseEvent) : void
      {
         var _loc6_:Rectangle = null;
         var _loc7_:MouseModule = null;
         this._background.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragCity);
         this._dragPlate.addEventListener(MouseEvent.MOUSE_UP,this.stopDragCity);
         this._dragPlate.addEventListener(MouseEvent.MOUSE_OUT,this.startDragCity);
         this._dragPlate.addEventListener(MouseEvent.ROLL_OUT,this.startDragCity);
         this._dragPlate.visible = true;
         var _loc2_:int = (this._background.width - this.stage.stageWidth) * -1;
         var _loc3_:int = (this._background.height - this.stage.stageHeight) * -1;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(_loc3_ > 0)
         {
            _loc3_ = 0;
            _loc5_ = this.stage.stageHeight / 2 - this._background.height / 2;
         }
         if(_loc2_ > 0)
         {
            _loc2_ = 0;
            _loc4_ = this.stage.stageWidth / 2 - this._background.width / 2;
         }
         if(_loc3_ == 0 && _loc2_ == 0)
         {
            this.centerCity();
         }
         else
         {
            _loc6_ = new Rectangle(_loc4_,_loc5_,_loc2_,_loc3_);
            this._asset.startDrag(false,_loc6_);
            _loc7_ = MouseModule.getInstance();
            _loc7_.show(MouseState.MOVE_SCREEN);
         }
      }
      
      private function onBuildingClick(param1:BuildingEvent) : void
      {
         dispatchEvent(new BuildingEvent(BuildingEvent.CLICK_BUILDING,param1.dataVo));
      }
      
      public function clearAsset() : void
      {
         var _loc1_:ManagmentBuilding = null;
         if(this._buildings)
         {
            for each(_loc1_ in this._buildings)
            {
               _loc1_.destroy();
               _loc1_.removeEventListener(BuildingEvent.CLICK_BUILDING,this.onBuildingClick);
            }
         }
         if(this._circusBoxes)
         {
            this._circusBoxes.destroy();
            this._circusBoxes.removeEventListener(CircusBoxEvent.CIRCUS_OPEN_BOX,this.openBox);
            this._circusBoxes = null;
         }
         if(Boolean(this._asset) && this.getChildIndex(this._asset) >= 0)
         {
            this.removeChild(this._asset);
            this._asset = null;
         }
         if(Boolean(this._backgroundtileMc) && this.getChildIndex(this._backgroundtileMc) >= 0)
         {
            this.removeChild(this._backgroundtileMc);
            this._backgroundtileMc = null;
         }
         if(this._dragPlate)
         {
            this._dragPlate.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragCity);
            this._dragPlate.removeEventListener(MouseEvent.MOUSE_OUT,this.startDragCity);
            this._dragPlate.removeEventListener(MouseEvent.ROLL_OUT,this.startDragCity);
         }
         if(this._background)
         {
            this._background.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragCity);
         }
         this._isVisible = false;
         this._isInit = false;
         this._buildings = new Vector.<ManagmentBuilding>();
      }
      
      public function updateBoxes(param1:Vector.<StoreData>) : void
      {
         this._circusBoxStoreData = param1;
         if(this._circusBoxes)
         {
            this._circusBoxes.updateView(this._circusBoxStoreData);
         }
      }
      
      private function loadAsset() : void
      {
         this._isInit = false;
         AssetLibrary.sendAssetToFunction(String(MANAGMENTCENTER.MC_ASSET_NAME + this._viewState),this.handleAssetLoaded);
      }
      
      private function handleAssetLoaded(param1:SWFAsset) : void
      {
         var _loc2_:ManagmentCenterViewVo = new ManagmentCenterViewVo();
         this._backgroundtile = param1.getEmbededBitmapData("backgroundtile");
         _loc2_.asset = param1.getEmbededSprite("asset");
         _loc2_.id = this._viewState;
         this._assetModes.push(_loc2_);
         this.initAsset();
      }
      
      public function set managmentCenterDataVo(param1:ManagmenCenterCityViewVo) : void
      {
         this._managmentCenterDataVo = param1;
      }
      
      public function get isVisible() : Boolean
      {
         return this._isVisible;
      }
      
      public function get currentViewVo() : ManagmentCenterViewVo
      {
         var _loc1_:ManagmentCenterViewVo = null;
         for each(_loc1_ in this._assetModes)
         {
            if(_loc1_.id == this._viewState)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get isInit() : Boolean
      {
         return this._isInit;
      }
   }
}

