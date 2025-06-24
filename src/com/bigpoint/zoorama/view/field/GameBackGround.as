package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.vo.GridItemVo;
   import com.bigpoint.zoorama.view.field.vo.GridVo;
   import com.bigpoint.zoorama.view.field.vo.GridZoomVo;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.IBitmapDrawable;
   import flash.display.InterpolationMethod;
   import flash.display.MovieClip;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class GameBackGround extends Bitmap
   {
      private static const MIN_HORIZONTAL_BIGGEST_ZOO:int = 84;
      
      private static const MIN_HORIZONTAL_SMALLEST_ZOO:int = 100;
      
      private static const ROAD_PREFIX:String = "road_";
      
      private var playField:PlayField;
      
      internal var currentTileWidth:int;
      
      internal var currentTileHeight:int;
      
      private var _savedGridBgs:GridVo;
      
      private var savedBgs:Dictionary;
      
      private var savedBgWidths:Dictionary;
      
      private var savedBgHeights:Dictionary;
      
      private var savedBgType:Dictionary;
      
      private var fieldOriginalSize:Point;
      
      internal var zeroCellCordinate:Point;
      
      internal var fieldCurrentSize:Point;
      
      private var currentFieldZeroPoint:Point;
      
      private var grassTile:MovieClip;
      
      private var waterTile:MovieClip;
      
      private var grassTileSpecial:MovieClip;
      
      private var waterTileSpecial:MovieClip;
      
      private var _corneryBouy:MovieClip;
      
      private var roadClips:Vector.<MovieClip>;
      
      private var outsidesTiles:Vector.<MovieClip>;
      
      private var grassCornerTile:MovieClip;
      
      private var waterCornerTile:MovieClip;
      
      private var _grid:MovieClip;
      
      private var _gridStripes:Sprite;
      
      private var _gridCircle:Sprite;
      
      private var _gridFocus:Sprite;
      
      private var _gridGlowItem:GridItemVo;
      
      private var roadTable:RoadItemTable;
      
      private var deletedRoadsForZoom:Vector.<Vector.<Point>>;
      
      private var zoomIndex:int = 2;
      
      private var currentFieldType:int = 0;
      
      private var playfieldSettings:PlayfieldSettingsVO;
      
      private var _backgroundAssetName:String = "background";
      
      public function GameBackGround(param1:PlayField, param2:Point, param3:RoadItemTable)
      {
         var _loc7_:RoadShopData = null;
         var _loc8_:int = 0;
         this._savedGridBgs = new GridVo();
         this.savedBgs = new Dictionary();
         this.savedBgWidths = new Dictionary();
         this.savedBgHeights = new Dictionary();
         this.savedBgType = new Dictionary();
         this.fieldOriginalSize = new Point();
         this.zeroCellCordinate = new Point();
         this.fieldCurrentSize = new Point();
         this.currentFieldZeroPoint = new Point();
         this.roadClips = new Vector.<MovieClip>();
         this._grid = new MovieClip();
         this._gridStripes = new Sprite();
         this._gridCircle = new Sprite();
         this._gridFocus = new Sprite();
         this._gridGlowItem = new GridItemVo();
         this.deletedRoadsForZoom = new Vector.<Vector.<Point>>(MainConfig.ZOOM_LEVELS.length);
         super();
         this.playField = param1;
         this.fieldOriginalSize = param2;
         this.roadTable = param3;
         this.initBackgroundAssetLib();
         var _loc4_:Vector.<ShopItemData> = ConfigurationModule.getInstance().getAllShopRoadsAsVector();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc5_] as RoadShopData;
            _loc8_ = int(this.roadClips.length);
            while(_loc8_ <= _loc7_.itemId)
            {
               if(this.roadClips.length < _loc8_)
               {
                  this.roadClips.push(null);
               }
               _loc8_++;
            }
            this.roadClips[_loc7_.itemId] = AssetLibrary.getMovieClip(AssetIds.getFieldAssetId(Categories.ROAD,_loc7_.itemId),"ObjectMC");
            _loc5_++;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.deletedRoadsForZoom.length)
         {
            this.deletedRoadsForZoom[_loc6_] = new Vector.<Point>();
            _loc6_++;
         }
         this._grid.mouseChildren = false;
         this._grid.mouseEnabled = false;
         this._gridCircle.mouseEnabled = false;
         this._gridCircle.mouseEnabled = false;
         this._gridCircle.cacheAsBitmap = true;
         this._gridStripes.cacheAsBitmap = true;
         this._gridStripes.mouseEnabled = false;
         this._gridStripes.mouseEnabled = false;
         this._gridFocus.mouseEnabled = false;
         this._gridFocus.mouseEnabled = false;
         this._gridFocus.mouseEnabled = false;
         this._gridCircle.mask = this._gridStripes;
         this._grid.addChild(this._gridStripes);
         this._grid.addChild(this._gridCircle);
         this._grid.addChild(this._gridFocus);
      }
      
      private function initBackgroundAssetLib() : void
      {
         this.grassTile = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_TILE_GRASS);
         this.waterTile = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_TILE_WATER);
         this.grassTileSpecial = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_SPECIAL_TILE_GRASS);
         this.waterTileSpecial = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_SPECIAL_TILE_WATER);
         this.outsidesTiles = new Vector.<MovieClip>();
         this.outsidesTiles.push(null);
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides1MC"));
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides2MC"));
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides2MC"));
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides2MC"));
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides1MC"));
         this.outsidesTiles.push(AssetLibrary.getMovieClip(this._backgroundAssetName,"ZooOutsides3MC"));
         this.grassCornerTile = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_TILE_OUTSIDES_CORNERS);
         this.waterCornerTile = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.BG_TILE_OUTSIDES_CORNERS_2);
         this._corneryBouy = AssetLibrary.getMovieClip(this._backgroundAssetName,AssetConfig.CORNER_BUOY);
      }
      
      private function drawGridMask(param1:int) : void
      {
         while(this._gridCircle.numChildren > 0)
         {
            this._gridCircle.removeChildAt(0);
         }
         var _loc2_:String = GradientType.RADIAL;
         var _loc3_:Array = [16777215,16777215];
         var _loc4_:Array = [1,0];
         var _loc5_:Array = [0,param1 / 3];
         var _loc6_:String = SpreadMethod.PAD;
         var _loc7_:String = InterpolationMethod.LINEAR_RGB;
         var _loc8_:Number = 0;
         var _loc9_:Matrix = new Matrix();
         var _loc10_:Number = param1;
         var _loc11_:Number = param1;
         var _loc12_:Number = Math.PI / 2;
         var _loc13_:Number = param1 / 2;
         var _loc14_:Number = param1 / 2;
         var _loc15_:Sprite = new Sprite();
         _loc15_.graphics.beginGradientFill(_loc2_,_loc3_,_loc4_,_loc5_,_loc9_,_loc6_,_loc7_,_loc8_);
         _loc15_.graphics.drawCircle(0,0,param1);
         _loc15_.graphics.endFill();
         this._gridCircle.addChild(_loc15_);
         this._gridCircle.x = _loc15_.width / 2;
         this._gridCircle.y = _loc15_.height / 2;
      }
      
      public function showGrid(param1:Boolean) : void
      {
         this._grid.visible = param1;
         if(param1 == true)
         {
            this._gridCircle.addEventListener(Event.EXIT_FRAME,this.onExitFrame,false,0,true);
         }
         else
         {
            this.killColorInGrid();
            this._gridCircle.removeEventListener(Event.EXIT_FRAME,this.onExitFrame);
         }
      }
      
      private function onExitFrame(param1:Event) : void
      {
         this._gridCircle.x = this.playField.fieldSprite.mouseX;
         this._gridCircle.y = this.playField.fieldSprite.mouseY;
      }
      
      public function removeCellRoad(param1:Number, param2:Number, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         if(!param3)
         {
            _loc4_ = 0;
            while(_loc4_ < this.deletedRoadsForZoom.length)
            {
               this.deletedRoadsForZoom[_loc4_].push(new Point(param1,param2));
               _loc4_++;
            }
         }
         this.redrawBgCellsAt(param1,param2);
      }
      
      public function renderField(param1:PlayfieldSettingsVO, param2:int, param3:Boolean = true) : void
      {
         this.playfieldSettings = param1;
         if(param1.zooGatePosX != this.playField.zooGatePosX || param1.zooGatePosY != this.playField.zooGatePosY)
         {
            this.playField.zooGatePosX = param1.zooGatePosX;
            this.playField.zooGatePosY = param1.zooGatePosY;
         }
         if(param1.minHorizontal != this.playField.minHorizontal || param1.maxHorizontal != this.playField.maxHorizontal || param1.minVertical != this.playField.minVertical || param1.maxVertical != this.playField.maxVertical)
         {
            if(param1.minHorizontal != int.MIN_VALUE)
            {
               this.playField.minHorizontal = param1.minHorizontal;
            }
            if(param1.maxHorizontal != int.MIN_VALUE)
            {
               this.playField.maxHorizontal = param1.maxHorizontal;
            }
            if(param1.minVertical != int.MIN_VALUE)
            {
               this.playField.minVertical = param1.minVertical;
            }
            if(param1.maxVertical != int.MIN_VALUE)
            {
               this.playField.maxVertical = param1.maxVertical;
            }
            this.zeroCellCordinate.x = 3370 - Math.floor(380 / (MIN_HORIZONTAL_SMALLEST_ZOO - MIN_HORIZONTAL_BIGGEST_ZOO) * (MIN_HORIZONTAL_SMALLEST_ZOO - param1.minHorizontal));
            this.zeroCellCordinate.y = -1550 + 70;
         }
         this.currentFieldType = param2;
         if(param3)
         {
            this.updateBackGround(this.playField.zoomLevel,param2);
         }
      }
      
      public function updateBackGround(param1:Number, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < MainConfig.ZOOM_LEVELS.length)
         {
            if(param1 == MainConfig.ZOOM_LEVELS[_loc3_])
            {
               this.zoomIndex = _loc3_;
               break;
            }
            _loc3_++;
         }
         this.recalculateFieldParams();
         this.fieldCurrentSize.x = this.fieldOriginalSize.x * this.playField.zoomLevel;
         this.fieldCurrentSize.y = this.fieldOriginalSize.y * this.playField.zoomLevel;
         var _loc4_:int = this.playField.maxHorizontal - this.playField.minHorizontal;
         var _loc5_:int = this.playField.maxVertical - this.playField.minVertical;
         var _loc6_:GridZoomVo = this.getZoomBgLevel(param1);
         if(!this.savedBgs[param1] || this.savedBgWidths[param1] != _loc4_ || this.savedBgHeights[param1] != _loc5_ || this.savedBgType[param1] != param2)
         {
            _loc6_ = new GridZoomVo(this.fieldCurrentSize.x,this.fieldCurrentSize.y);
            _loc6_.zoomLevel = param1;
            if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO == this.playField.fieldType)
            {
               this.savedBgs[param1] = new BitmapData(this.fieldCurrentSize.x,this.fieldCurrentSize.y,false,6728155);
            }
            else
            {
               this.savedBgs[param1] = new BitmapData(this.fieldCurrentSize.x,this.fieldCurrentSize.y,false,0);
            }
            this.createBackground(this.savedBgs[param1],param2,_loc6_);
            this.savedBgWidths[param1] = _loc4_;
            this.savedBgHeights[param1] = _loc5_;
            this.savedBgType[param1] = param2;
            this.setZoomBgLevel(param1,_loc6_);
         }
         while(this._gridStripes.numChildren > 0)
         {
            this._gridStripes.removeChildAt(0);
         }
         this.drawGridMask(150 * (this.zoomIndex + 1));
         this._gridStripes.addChild(_loc6_.viewSpriteArea);
         this.bitmapData = this.savedBgs[param1];
      }
      
      private function getZoomBgLevel(param1:Number) : GridZoomVo
      {
         var _loc2_:GridZoomVo = null;
         for each(_loc2_ in this._savedGridBgs.zoomLevel)
         {
            if(_loc2_.zoomLevel == param1)
            {
               return _loc2_;
            }
         }
         _loc2_ = new GridZoomVo(this.fieldCurrentSize.x,this.fieldCurrentSize.y);
         _loc2_.zoomLevel = param1;
         return _loc2_;
      }
      
      private function setZoomBgLevel(param1:Number, param2:GridZoomVo) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this._savedGridBgs.zoomLevel.length)
         {
            if(this._savedGridBgs.zoomLevel[_loc3_].zoomLevel == param1)
            {
               this._savedGridBgs.zoomLevel[_loc3_] = param2;
            }
            _loc3_++;
         }
         this._savedGridBgs.zoomLevel.push(param2);
      }
      
      public function deleteAllOutdatedRoads() : void
      {
         var _loc2_:Point = null;
         var _loc1_:Vector.<Point> = this.deletedRoadsForZoom[this.zoomIndex];
         while(_loc1_.length)
         {
            _loc2_ = _loc1_.pop();
            this.redrawBgCellsAt(_loc2_.x,_loc2_.y);
         }
      }
      
      internal function createBackground(param1:BitmapData, param2:int, param3:GridZoomVo) : void
      {
         var _loc7_:uint = 0;
         var _loc8_:Point = null;
         var _loc9_:Boolean = false;
         var _loc18_:MovieClip = null;
         var _loc19_:GridItemVo = null;
         var _loc4_:String = AssetConfig.ASSET_BACKGROUND;
         if(param2 == PlayFieldsTypes.FIELD_TYPE_FOREIGN || param2 == PlayFieldsTypes.FIELD_TYPE_NOT_SET)
         {
            param2 = 1;
         }
         this.drowPlayFieldGrass(param1,param3);
         var _loc5_:PlayFieldPoint = new PlayFieldPoint();
         if(AssetLibrary.haveMovieClip(this._backgroundAssetName) == true)
         {
            _loc4_ = this._backgroundAssetName;
         }
         var _loc6_:MovieClip = AssetLibrary.getMovieClip(_loc4_,"ForrestMegaTileMC");
         if(this.playField.zoomLevel == 0.5)
         {
            _loc6_.gotoAndStop("zoom_" + "05" + "_" + param2);
         }
         else
         {
            _loc6_.gotoAndStop("zoom_" + this.playField.zoomLevel + "_" + param2);
         }
         _loc5_.x = this.playField.zooGatePosX;
         _loc5_.y = this.playField.zooGatePosY;
         _loc5_.moveLeft(13);
         _loc5_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2);
         _loc5_.moveUp(12);
         _loc9_ = true;
         if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
         {
            _loc7_ = 70;
         }
         else
         {
            _loc7_ = 500;
         }
         while(_loc9_)
         {
            if(_loc6_.BuoysLineMC != null)
            {
               _loc6_.BuoysLineMC.visible = true;
            }
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveUp(11);
            if(_loc6_.BuoysLineMC != null)
            {
               _loc6_.BuoysLineMC.visible = false;
            }
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveDown(11);
            _loc5_.moveRight(6);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.x > param1.width + _loc7_)
            {
               _loc9_ = false;
            }
         }
         if(_loc6_.BuoysLineMC != null)
         {
            _loc6_.BuoysLineMC.visible = true;
         }
         _loc9_ = true;
         _loc5_.x = this.playField.zooGatePosX;
         _loc5_.y = this.playField.zooGatePosY;
         _loc5_.moveLeft(7);
         _loc5_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2 + 1);
         while(_loc9_)
         {
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveLeft(6);
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveDown(11);
            _loc5_.moveRight(6);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.y > param1.height)
            {
               _loc9_ = false;
            }
         }
         _loc9_ = true;
         _loc5_.x = this.playField.zooGatePosX;
         _loc5_.y = this.playField.zooGatePosY;
         _loc5_.moveLeft(2);
         _loc5_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2);
         while(_loc9_)
         {
            if(_loc5_.x + _loc5_.y < this.playField.maxHorizontal + 1)
            {
               if(_loc5_.x >= 13)
               {
                  if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
                  {
                     this.placeForestTile(param1,_loc5_.x,_loc5_.y - 1,param2,true,-1);
                  }
                  if(_loc5_.x >= 14)
                  {
                     this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,true,1,true);
                  }
               }
               this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,true,-1,true);
               if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
               {
                  this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,false,0.85);
               }
            }
            _loc5_.moveDown(1);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.y > param1.height)
            {
               _loc9_ = false;
            }
         }
         var _loc10_:PlayFieldPoint = new PlayFieldPoint();
         if(param2 == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            _loc10_.x = this.playField.zooGatePosX;
            _loc10_.y = this.playField.zooGatePosY;
            _loc10_.moveLeft(2);
            _loc10_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2);
            this._corneryBouy.gotoAndStop(1);
            this.drawToBitmap(param1,this._corneryBouy,_loc10_.x + 1,_loc10_.y + 1);
         }
         var _loc11_:int = 29;
         var _loc12_:int = 94;
         var _loc13_:* = true;
         _loc5_.x = _loc11_;
         _loc5_.y = _loc12_;
         var _loc14_:Boolean = true;
         while(_loc14_)
         {
            _loc5_.moveRight(1);
            this.placeGrassTile(param1,_loc5_.x,_loc5_.y);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.x > param1.width)
            {
               if(!_loc13_)
               {
                  _loc5_.x = ++_loc11_;
                  _loc5_.y = _loc12_;
               }
               else
               {
                  _loc5_.x = _loc11_;
                  _loc5_.y = ++_loc12_;
               }
               _loc13_ = !_loc13_;
            }
            if(_loc8_.y >= param1.height)
            {
               _loc14_ = false;
            }
         }
         _loc5_.x = 31;
         _loc5_.y = 95;
         _loc9_ = true;
         while(_loc9_)
         {
            this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,false,1,false,2);
            _loc5_.moveDown(1);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.y > param1.height)
            {
               _loc9_ = false;
            }
         }
         if(param2 != PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            this.drowEntranceRoad(param1,"road_1010",this.playField.zooGatePosX,this.playField.zooGatePosY + 1);
            this.drowEntranceRoad(param1,"road_1010",this.playField.zooGatePosX,this.playField.zooGatePosY + 2);
         }
         if(param2 == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
         {
            _loc18_ = AssetLibrary.getMovieClip(_loc4_,"ForgottenZooRoadMC");
            _loc18_.gotoAndStop("zoom_" + this.playField.zoomLevel);
            this.drawToBitmap(param1,_loc18_,43,83,false);
         }
         _loc5_.x = this.playField.zooGatePosX;
         _loc5_.y = this.playField.zooGatePosY;
         _loc5_.moveRight(Math.ceil((this.playField.maxHorizontal - this.playField.minHorizontal) / 2) + 1);
         _loc5_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2 + 1);
         _loc9_ = true;
         while(_loc9_)
         {
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveRight(6);
            this.drawToBitmap(param1,_loc6_,_loc5_.x,_loc5_.y,false);
            _loc5_.moveLeft(6);
            _loc5_.moveDown(11);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.y > param1.height)
            {
               _loc9_ = false;
            }
         }
         _loc9_ = true;
         _loc5_.x = this.playField.zooGatePosX;
         _loc5_.y = this.playField.zooGatePosY;
         _loc5_.moveRight(Math.ceil((this.playField.maxHorizontal - this.playField.minHorizontal) / 2));
         _loc5_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2);
         while(_loc9_)
         {
            this.placeGrassTile(param1,_loc5_.x,_loc5_.y,0);
            this.placeGrassTile(param1,_loc5_.x,_loc5_.y + 1);
            this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,true,-1,true);
            if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
            {
               this.placeForestTile(param1,_loc5_.x,_loc5_.y + 1,param2,true);
               this.placeForestTile(param1,_loc5_.x,_loc5_.y,param2,false,0.85);
            }
            _loc5_.moveDown(1);
            _loc8_ = this.getCordinatePossition(_loc5_.x,_loc5_.y);
            if(_loc8_.y > param1.height)
            {
               _loc9_ = false;
            }
         }
         if(param2 == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            _loc10_ = new PlayFieldPoint();
            _loc10_.x = this.playField.zooGatePosX;
            _loc10_.y = this.playField.zooGatePosY;
            _loc10_.moveRight(Math.ceil((this.playField.maxHorizontal - this.playField.minHorizontal) / 2));
            _loc10_.moveUp(Math.ceil(this.playField.maxVertical - this.playField.minVertical) / 2 - 1);
            this._corneryBouy.gotoAndStop(2);
            this.drawToBitmap(param1,this._corneryBouy,_loc10_.x,_loc10_.y);
         }
         var _loc15_:MovieClip = AssetLibrary.getMovieClip(_loc4_,"ParkingLotMC");
         if(this.playField.zoomLevel == 0.5)
         {
            _loc15_.gotoAndStop("zoom_" + "05" + "_" + param2);
         }
         else
         {
            _loc15_.gotoAndStop("zoom_" + this.playField.zoomLevel + "_" + param2);
         }
         this.drawToBitmap(param1,_loc15_,31,92,false);
         var _loc16_:Number = 0;
         param3.viewSpriteArea.alpha = 0.3;
         var _loc17_:int = 0;
         while(_loc17_ < param3.items.length)
         {
            _loc19_ = param3.items[_loc17_];
            this.drawToSprite(param3.viewSpriteArea,_loc19_.gridTile,_loc19_.coodX,_loc19_.coodY);
            _loc17_++;
         }
      }
      
      private function recalculateFieldParams() : void
      {
         this.currentTileWidth = MainConfig.TILE_WIDTH * this.playField.zoomLevel;
         this.currentTileHeight = MainConfig.TILE_HEIGHT * this.playField.zoomLevel;
         this.currentFieldZeroPoint.x = this.zeroCellCordinate.x * this.playField.zoomLevel;
         this.currentFieldZeroPoint.y = this.zeroCellCordinate.y * this.playField.zoomLevel;
      }
      
      private function drowPlayFieldGrass(param1:BitmapData, param2:GridZoomVo) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(Settings.DEBUG_ITEM_MODE)
         {
            this.placeDebugTile(param1,this.playField.zooGatePosX,this.playField.zooGatePosY);
         }
         var _loc3_:int = 30;
         var _loc4_:int = 93;
         var _loc5_:Boolean = false;
         while(_loc3_ - _loc4_ <= this.playField.maxVertical)
         {
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc3_ - _loc8_ + (_loc4_ - _loc7_) >= this.playField.minHorizontal - 1)
            {
               this.placeGrassTile(param1,_loc3_ - _loc8_,_loc4_ - _loc7_);
               this.placeGridTile(param2,_loc3_ - _loc8_,_loc4_ - _loc7_);
               if(Settings.DEBUG_ITEM_MODE)
               {
                  this.placeDebugTile(param1,_loc3_ - _loc7_,_loc4_ - _loc8_);
               }
               _loc7_++;
               _loc8_++;
            }
            _loc7_ = 0;
            _loc8_ = 1;
            while(_loc3_ - _loc8_ + (_loc4_ - _loc7_) >= this.playField.minHorizontal - 1)
            {
               this.placeGrassTile(param1,_loc3_ - _loc7_,_loc4_ - _loc8_);
               this.placeGridTile(param2,_loc3_ - _loc8_,_loc4_ - _loc7_);
               _loc7_++;
               _loc8_++;
            }
            _loc3_ += 1;
            _loc4_--;
         }
         var _loc6_:int = 12;
         while(_loc6_ < 49)
         {
            _loc9_ = 48;
            while(_loc9_ < 88)
            {
               this.placeGridTile(param2,_loc6_,_loc9_);
               _loc9_++;
            }
            _loc6_++;
         }
         if(Settings.DEBUG_ITEM_MODE)
         {
            _loc10_ = 0;
            while(_loc10_ < 20)
            {
               _loc11_ = 0;
               while(_loc11_ < 20)
               {
                  this.placeDebugTile(param1,_loc10_ * 10,_loc11_ * 10);
                  _loc11_++;
               }
               _loc10_++;
            }
         }
      }
      
      private function placeGridTile(param1:GridZoomVo, param2:int, param3:int) : void
      {
         var _loc4_:GridItemVo = null;
         var _loc5_:GridItemVo = null;
         var _loc6_:GridTile = null;
         var _loc7_:Boolean = false;
         if(param1 != null)
         {
            _loc7_ = false;
         }
         for each(_loc4_ in param1.items)
         {
            if(_loc4_.coodX == param2 && _loc4_.coodY == param3)
            {
               _loc5_ = _loc4_;
            }
         }
         if(_loc5_ == null && this.testCellOutOfFieldBonuds(param2,param3) == false)
         {
            _loc5_ = new GridItemVo();
            _loc7_ = true;
            _loc5_.coodX = param2;
            _loc5_.coodY = param3;
            _loc6_ = new GridTile();
            _loc5_.width = 1;
            _loc5_.height = 1;
            _loc6_.graphics.lineStyle(1,16777215,1);
            _loc6_.graphics.moveTo(0,0);
            _loc6_.graphics.lineTo(MainConfig.TILE_WIDTH * _loc5_.width / 2,MainConfig.TILE_HEIGHT * _loc5_.width / 2);
            _loc6_.graphics.lineTo(MainConfig.TILE_WIDTH * _loc5_.width / 2 - MainConfig.TILE_WIDTH * _loc5_.height / 2,MainConfig.TILE_HEIGHT * _loc5_.width / 2 + MainConfig.TILE_HEIGHT * _loc5_.height / 2);
            _loc6_.graphics.lineTo(-MainConfig.TILE_WIDTH * _loc5_.height / 2,MainConfig.TILE_HEIGHT * _loc5_.height / 2);
            _loc6_.graphics.lineTo(0,0);
            _loc5_.gridTile = _loc6_;
            _loc6_.cacheAsBitmap = true;
            param1.items.push(_loc5_);
         }
      }
      
      private function testCellOutOfFieldBonuds(param1:int, param2:int) : Boolean
      {
         return param1 + param2 < this.playfieldSettings.minHorizontal || param1 + param2 > this.playfieldSettings.maxHorizontal || param1 - param2 < this.playfieldSettings.minVertical || param1 - param2 > this.playfieldSettings.maxVertical;
      }
      
      public function killColorInGrid() : void
      {
         while(this._gridFocus.numChildren > 0)
         {
            this._gridFocus.removeChildAt(0);
         }
         this._gridGlowItem = null;
      }
      
      public function colorInGrid(param1:Point, param2:Point) : void
      {
         var _loc4_:GridTile = null;
         var _loc3_:Boolean = false;
         if(this._gridGlowItem == null)
         {
            _loc3_ = true;
         }
         else if(this._gridGlowItem.coodX != param1.x || this._gridGlowItem.coodY != param1.y || this._gridGlowItem.width != param2.x || this._gridGlowItem.height != param2.x)
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.killColorInGrid();
            this._gridGlowItem = new GridItemVo();
            this._gridGlowItem.coodX = param1.x;
            this._gridGlowItem.coodY = param1.y;
            _loc4_ = new GridTile();
            this._gridGlowItem.width = param2.x;
            this._gridGlowItem.height = param2.y;
            _loc4_.graphics.lineStyle(1,16777215,1);
            _loc4_.graphics.moveTo(0,0);
            _loc4_.graphics.beginFill(16777215,0.5);
            _loc4_.graphics.lineTo(MainConfig.TILE_WIDTH * this._gridGlowItem.width / 2,MainConfig.TILE_HEIGHT * this._gridGlowItem.width / 2);
            _loc4_.graphics.lineTo(MainConfig.TILE_WIDTH * this._gridGlowItem.width / 2 - MainConfig.TILE_WIDTH * this._gridGlowItem.height / 2,MainConfig.TILE_HEIGHT * this._gridGlowItem.width / 2 + MainConfig.TILE_HEIGHT * this._gridGlowItem.height / 2);
            _loc4_.graphics.lineTo(-MainConfig.TILE_WIDTH * this._gridGlowItem.height / 2,MainConfig.TILE_HEIGHT * this._gridGlowItem.height / 2);
            _loc4_.graphics.lineTo(0,0);
            _loc4_.graphics.endFill();
            this._gridGlowItem.gridTile = _loc4_;
            this.drawToSprite(this._gridFocus,this._gridGlowItem.gridTile,this._gridGlowItem.coodX,this._gridGlowItem.coodY);
         }
      }
      
      private function placeGrassTile(param1:BitmapData, param2:int, param3:int, param4:int = -1) : void
      {
         var _loc5_:IBitmapDrawable = null;
         if(param4 == -1)
         {
            if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
            {
               this.grassTile.gotoAndStop(Math.floor(Math.random() * (this.grassTile.totalFrames - 1)) + 1);
               _loc5_ = this.grassTile;
            }
            else
            {
               this.waterTile.gotoAndStop(Math.floor(Math.random() * (this.grassTile.totalFrames - 1)) + 1);
               _loc5_ = this.waterTile;
            }
         }
         else if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
         {
            this.grassTileSpecial.gotoAndStop(param4);
            _loc5_ = this.grassTileSpecial;
         }
         else
         {
            this.waterTileSpecial.gotoAndStop(param4);
            _loc5_ = this.waterTileSpecial;
         }
         this.drawToBitmap(param1,_loc5_,param2,param3);
      }
      
      private function drawToBitmap(param1:BitmapData, param2:IBitmapDrawable, param3:int, param4:int, param5:Boolean = true, param6:int = 0, param7:int = 0, param8:Number = 1, param9:Number = 1) : Point
      {
         var _loc10_:Point = this.getCordinatePossition(param3,param4);
         var _loc11_:Matrix = new Matrix();
         if(param5)
         {
            _loc11_.scale(this.playField.zoomLevel * param8,this.playField.zoomLevel * param9);
         }
         _loc11_.translate(_loc10_.x + param6,_loc10_.y + param7);
         param1.draw(param2,_loc11_);
         return _loc10_;
      }
      
      private function drawToSprite(param1:Sprite, param2:Sprite, param3:int, param4:int, param5:Boolean = true, param6:int = 0, param7:int = 0, param8:Number = 1, param9:Number = 1) : Point
      {
         var _loc10_:Point = this.getCordinatePossition(param3,param4);
         var _loc11_:Matrix = new Matrix();
         if(param5)
         {
            _loc11_.scale(this.playField.zoomLevel * param8,this.playField.zoomLevel * param9);
         }
         _loc11_.translate(_loc10_.x + param6,_loc10_.y + param7);
         param2.transform.matrix = _loc11_;
         param1.addChild(param2);
         return _loc10_;
      }
      
      public function placeDebugTile(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:Sprite = null;
         if(Settings.DEBUG_ITEM_MODE)
         {
            _loc4_ = AssetLibrary.getSprite(this._backgroundAssetName,"DebugTileSPR");
            if((Boolean(_loc4_)) && Boolean(_loc4_["debug_txt"]))
            {
               (_loc4_["debug_txt"] as TextField).text = "" + param2 + ":" + param3;
            }
            this.drawToBitmap(param1,_loc4_,param2,param3);
         }
      }
      
      internal function redrawBgCellsAt(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:GridZoomVo = null;
         var _loc4_:int = -1;
         while(_loc4_ < 2)
         {
            _loc5_ = -1;
            while(_loc5_ < 2)
            {
               _loc6_ = this.roadTable.getCellRoadType(param1 + _loc4_,param2 + _loc5_);
               if(_loc6_ >= 0 || _loc4_ == 0 && _loc5_ == 0)
               {
                  this.placeGrassTile(this.bitmapData,param1 + _loc4_,param2 + _loc5_);
                  this.drowRoad(_loc6_,param1 + _loc4_,param2 + _loc5_);
               }
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function drowRoad(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 > 0)
         {
            _loc4_ = this.roadTable.getCellRoadType(param2,param3 - 1) > 0 ? 1 : 0;
            _loc5_ = this.roadTable.getCellRoadType(param2,param3 + 1) > 0 ? 1 : 0;
            _loc6_ = this.roadTable.getCellRoadType(param2 + 1,param3) > 0 ? 1 : 0;
            _loc7_ = this.roadTable.getCellRoadType(param2 - 1,param3) > 0 ? 1 : 0;
            if(this.roadClips.length >= param1)
            {
               this.roadClips[param1].gotoAndStop(ROAD_PREFIX + _loc4_ + _loc6_ + _loc5_ + _loc7_);
               this.drawToBitmap(this.bitmapData,this.roadClips[param1],param2,param3,true,-1,-1,1.05,1.05);
            }
         }
      }
      
      public function drawAllRoads() : void
      {
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         var _loc1_:Vector.<int> = this.roadTable.getAllRoadsIds();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc1_[_loc2_] >= 0)
            {
               _loc3_ = this.roadTable.getRoadCords(_loc1_[_loc2_]);
               _loc4_ = this.roadTable.getCellRoadType(_loc3_.x,_loc3_.y);
               this.drowRoad(_loc4_,_loc3_.x,_loc3_.y);
            }
            _loc2_++;
         }
      }
      
      private function drowEntranceRoad(param1:BitmapData, param2:String, param3:int, param4:int) : void
      {
         if(this.roadClips.length > 0)
         {
            this.roadClips[1].gotoAndStop(param2);
            this.drawToBitmap(param1,this.roadClips[1],param3,param4,true,-1,-1,1.05,1.05);
         }
      }
      
      private function placeForestTile(param1:BitmapData, param2:int, param3:int, param4:int, param5:Boolean = false, param6:Number = 1, param7:Boolean = false, param8:int = -1) : void
      {
         var _loc9_:MovieClip = null;
         var _loc10_:int = 0;
         if(param5)
         {
            if(PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO != this.playField.fieldType)
            {
               _loc9_ = this.grassCornerTile;
            }
            else
            {
               _loc9_ = this.waterCornerTile;
            }
            if(param7)
            {
               _loc10_ = _loc9_.totalFrames;
            }
            else
            {
               _loc10_ = Math.floor(Math.random() * _loc9_.totalFrames);
            }
         }
         else
         {
            if(param4 == PlayFieldsTypes.FIELD_TYPE_FOREIGN || param4 == PlayFieldsTypes.FIELD_TYPE_NOT_SET)
            {
               _loc9_ = this.outsidesTiles[1];
            }
            else
            {
               _loc9_ = this.outsidesTiles[param4];
            }
            _loc10_ = Math.floor(Math.random() * _loc9_.totalFrames) + 1;
         }
         _loc9_.gotoAndStop(param8 == -1 ? _loc10_ : param8);
         _loc9_.scaleX = param6;
         this.drawToBitmap(param1,_loc9_,param2,param3,true,0,0,param6);
      }
      
      public function getStageToFieldCords(param1:Point) : Point
      {
         var _loc2_:Point = this.playField.stageToField(param1);
         var _loc3_:int = _loc2_.x - this.zeroCellCordinate.x * this.playField.zoomLevel;
         var _loc4_:int = _loc2_.y - this.zeroCellCordinate.y * this.playField.zoomLevel;
         var _loc5_:Number = this.currentTileWidth / this.currentTileHeight;
         var _loc6_:Number = _loc4_ + _loc3_ / _loc5_;
         var _loc7_:Number = _loc4_ - _loc3_ / _loc5_;
         var _loc8_:int = Math.floor(_loc6_ / this.currentTileHeight);
         var _loc9_:int = Math.floor(_loc7_ / this.currentTileHeight);
         return new Point(_loc8_,_loc9_);
      }
      
      public function getCordinatePossition(param1:int, param2:int) : Point
      {
         return new Point(this.currentTileWidth / 2 * param1 - this.currentTileWidth / 2 * param2 + this.currentFieldZeroPoint.x,this.currentTileHeight / 2 * param1 + this.currentTileHeight / 2 * param2 + this.currentFieldZeroPoint.y);
      }
      
      public function getCordinatePositionRenew(param1:int, param2:int) : Point
      {
         return new Point(this.currentTileWidth / 2 * param1 - this.currentTileWidth / 2 * param2 + this.currentFieldZeroPoint.x,this.currentTileHeight / 2 * param1 - this.currentTileHeight / 2 * param2 + this.currentFieldZeroPoint.y);
      }
      
      public function get savedGridBgs() : GridVo
      {
         return this._savedGridBgs;
      }
      
      public function get grid() : MovieClip
      {
         return this._grid;
      }
      
      public function get backgroundAssetName() : String
      {
         return this._backgroundAssetName;
      }
      
      public function set backgroundAssetName(param1:String) : void
      {
         this._backgroundAssetName = param1;
         this.initBackgroundAssetLib();
         this.updateBackGround(this.zoomIndex,this.currentFieldType);
      }
   }
}

