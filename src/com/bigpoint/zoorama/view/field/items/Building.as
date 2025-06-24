package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.fieldItems.commandIds.BuildingCommandIds;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Building extends ItemAbstract
   {
      protected var _sellable:int;
      
      protected var _sellVirtual:int;
      
      protected var _sellReal:int;
      
      protected var _buildTime:int;
      
      protected var _directBuildReal:int;
      
      protected var _alias:String;
      
      protected var multyStates:int = -1;
      
      protected var _currentStateId:int = 0;
      
      public var isMouseOver:Boolean = false;
      
      protected var itemHolder:Sprite;
      
      private var _active:int;
      
      private var _buildTimeStamp:int = -1;
      
      private var buildTrack:TimeTrack;
      
      protected var activeZone:Sprite;
      
      private var site_front:MovieClip;
      
      private var site_back:MovieClip;
      
      private var isDragged:Boolean = false;
      
      protected var inactiveIcons:Vector.<Sprite> = new Vector.<Sprite>(MainConfig.ZOOM_LEVELS.length);
      
      protected var lastInactiveIcon:Sprite;
      
      protected var higlightable:Boolean = true;
      
      public var markedForDelete:Boolean = false;
      
      public var buildingCommandIds:BuildingCommandIds = new BuildingCommandIds();
      
      protected var zoomIndex:int = MainConfig.ZOOM_DEFAULT_ID;
      
      protected var _isBuilt:Boolean = false;
      
      public function Building(param1:Notifier, param2:Sprite, param3:int)
      {
         this.buildTrack = TimeManager.creatEmptyTrack(this.handleBuildDane);
         super(param1,param3);
         this._itemFamily = ItemAbstract.ITEM_FAMILY_BUILDING;
         if(!canConstruct)
         {
            throw Error("This class is not ment to be constructed directly. ItemFactory.as has this responsibility.");
         }
         this.itemHolder = param2;
         var _loc4_:int = 0;
         while(_loc4_ < MainConfig.ZOOM_LEVELS.length)
         {
            this.inactiveIcons[_loc4_] = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,"InactiveIcon_" + 100 * MainConfig.ZOOM_LEVELS[_loc4_] + "_SPR");
            this.inactiveIcons[_loc4_].mouseChildren = false;
            this.inactiveIcons[_loc4_].mouseEnabled = false;
            _loc4_++;
         }
         param2.addChild(this);
      }
      
      public function renewActiveZone() : void
      {
         this.createActiveZone();
      }
      
      protected function createActiveZone() : void
      {
         if(this.activeZone)
         {
            this.activeZone.graphics.clear();
         }
         else
         {
            this.activeZone = new Sprite();
         }
         if(Settings.DEBUG_ITEM_MODE)
         {
            this.activeZone.graphics.beginFill(16711680,0.2);
         }
         else
         {
            this.activeZone.graphics.beginFill(16711680,0);
         }
         this.activeZone.graphics.moveTo(0,0);
         this.activeZone.graphics.lineTo(MainConfig.TILE_WIDTH * this.itemWidth / 2,MainConfig.TILE_HEIGHT * itemWidth / 2);
         this.activeZone.graphics.lineTo(MainConfig.TILE_WIDTH * this.itemWidth / 2 - MainConfig.TILE_WIDTH * this.itemHeight / 2,MainConfig.TILE_HEIGHT * itemWidth / 2 + MainConfig.TILE_HEIGHT * this.itemHeight / 2);
         this.activeZone.graphics.lineTo(-MainConfig.TILE_WIDTH * this.itemHeight / 2,MainConfig.TILE_HEIGHT * this.itemHeight / 2);
         this.activeZone.graphics.lineTo(0,0);
         this.activeZone.addEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown,false,0,true);
         this.activeZone.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut,false,0,true);
         this.activeZone.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver,false,0,true);
         this.activeZone.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp,false,0,true);
         this.activeZone.useHandCursor = false;
         this.activeZone.mouseEnabled = _enabled;
         if(!this.contains(this.activeZone))
         {
            this.addChild(this.activeZone);
         }
      }
      
      protected function checkIfMouseIsOver(param1:Array) : Boolean
      {
         var _loc4_:Point = null;
         var _loc5_:* = undefined;
         var _loc6_:Sprite = null;
         var _loc2_:Boolean = false;
         var _loc3_:Point = new Point(mouseX,mouseY);
         for each(_loc5_ in param1)
         {
            for each(_loc6_ in _loc5_)
            {
               _loc4_ = _loc6_.localToGlobal(_loc3_);
               _loc2_ ||= _loc6_.hitTestPoint(_loc4_.x - _loc6_.x,_loc4_.y - _loc6_.y,true);
            }
         }
         return _loc2_;
      }
      
      public function get isMouseOverInfIcon() : Boolean
      {
         return this.checkIfMouseIsOver([this.inactiveIcons]);
      }
      
      protected function handleMouseUp(param1:MouseEvent) : void
      {
         notifier.dispatchNotice(new ItemNotice(ItemNotice.MOUSE_UP,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
      }
      
      protected function handleMouseOut(param1:MouseEvent) : void
      {
         this.markType = ItemMarkType.DEFAULT;
         if(!this.isDragged)
         {
            if(isMousePressed)
            {
               this.startDragAction();
            }
         }
         notifier.dispatchNotice(new ItemNotice(ItemNotice.MOUSE_OUT,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
         TooltipNewManager.removeToolTip();
      }
      
      public function startDragAction() : void
      {
         notifier.dispatchNotice(new ItemNotice(ItemNotice.DRAG_START,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
         this.isDragged = true;
      }
      
      public function stopDragAction() : void
      {
         this.isDragged = false;
      }
      
      protected function handleMouseOver(param1:MouseEvent) : void
      {
         if(this.enabled)
         {
            this.markType = ItemMarkType.MOUSE_OVER;
            notifier.dispatchNotice(new ItemNotice(ItemNotice.MOUSE_OVER,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
         }
      }
      
      protected function handleMouseDown(param1:MouseEvent) : void
      {
         if(this.enabled)
         {
            isMousePressed = true;
            if(this.isDragged)
            {
               this.startDragAction();
            }
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleStageMouseUp);
         }
      }
      
      private function handleStageMouseUp(param1:MouseEvent) : void
      {
         isMousePressed = false;
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleStageMouseUp);
            if(param1.target == this.activeZone)
            {
               notifier.dispatchNotice(new ItemNotice(ItemNotice.CLICK,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
            }
            else
            {
               notifier.dispatchNotice(new ItemNotice(ItemNotice.DRAG_DROP_OUTSIDE,category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this.itemWidth,this.itemHeight)));
            }
         }
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         if(param1.uniqueId != -1)
         {
            this.uniqueId = param1.uniqueId;
         }
         if(param1.posX != int.MIN_VALUE && param1.posY != int.MIN_VALUE)
         {
            if(this.buildingCommandIds.move <= param2)
            {
               updateCords(new Point(param1.posX,param1.posY));
            }
         }
         if(param1.active != -1)
         {
            this.active = param1.active;
         }
         if(param1.category != -1)
         {
            this._category = param1.category;
         }
         if(param1.buildTimeStamp != -1 && this._buildTime > 0)
         {
            this.buildTimeStamp = param1.buildTimeStamp;
            TimeManager.updateTrackTime(this.buildTrack,this._buildTimeStamp);
         }
         if(param1.rotatePos != -1)
         {
            if(this.buildingCommandIds.move <= param2)
            {
               this.rotatePos = param1.rotatePos;
               this.renewActiveZone();
            }
         }
         super.updateState(param1,param2);
         this.updateView();
      }
      
      protected function handleBuildDane() : void
      {
         this.buildTimeStamp = 0;
         this.updateView();
      }
      
      protected function updateView() : void
      {
         if(this._buildTimeStamp > TimeManager.currentTime && !this._isBuilt)
         {
            if(Boolean(this.site_front) && Boolean(this.site_back))
            {
               if(!this.contains(this.site_back))
               {
                  this.addChild(this.site_back);
               }
               if(!this.contains(this.site_front))
               {
                  this.addChild(this.site_front);
               }
               this.site_front.gotoAndStop("zoom_" + String(_zoomlevel));
               this.site_back.gotoAndStop("zoom_" + String(_zoomlevel));
               if(skin)
               {
                  this.setChildIndex(this.site_back,0);
                  this.setChildIndex(skin,1);
                  this.setChildIndex(this.site_front,2);
               }
               else
               {
                  this.setChildIndex(this.site_back,0);
                  this.setChildIndex(this.site_front,1);
               }
               if(_rotatePos == ItemAbstract.ROTATION_0)
               {
                  this.site_front.scaleX = 1;
                  this.site_back.scaleX = 1;
               }
               else if(_rotatePos == ItemAbstract.ROTATION_270)
               {
                  this.site_front.scaleX = -1;
                  this.site_back.scaleX = -1;
               }
            }
         }
         else
         {
            if(skin)
            {
               this.setChildIndex(skin,0);
            }
            if(this.site_front)
            {
               if(this.contains(this.site_front))
               {
                  this.removeChild(this.site_front);
               }
            }
            if(this.site_back)
            {
               if(this.contains(this.site_back))
               {
                  this.removeChild(this.site_back);
               }
            }
         }
         this.updateInactiveIcon();
         if(this.activeZone)
         {
            if(_rotatePos == ItemAbstract.ROTATION_0)
            {
               this.activeZone.scaleX = _zoomlevel;
            }
            else if(_rotatePos == ItemAbstract.ROTATION_270)
            {
               this.activeZone.scaleX = -_zoomlevel;
            }
            this.activeZone.scaleX = _zoomlevel;
            this.activeZone.scaleY = _zoomlevel;
         }
      }
      
      protected function updateInactiveIcon(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.removeLastInactiveIcon();
         }
         if(this._active == 1)
         {
            this.removeLastInactiveIcon();
         }
         else
         {
            if(!this.lastInactiveIcon || !this.contains(this.lastInactiveIcon))
            {
               this.lastInactiveIcon = this.inactiveIcons[this.zoomIndex];
               this.addChild(this.lastInactiveIcon);
               this.lastInactiveIcon.y = MainConfig.TILE_HEIGHT * _zoomlevel * 0.5;
            }
            if(this.itemWidth == 2 && this.itemHeight == 2)
            {
               this.lastInactiveIcon.y = _zoomlevel * MainConfig.TILE_HEIGHT * 1.3;
            }
            else
            {
               this.lastInactiveIcon.y = _zoomlevel * MainConfig.TILE_HEIGHT * 0.5;
            }
         }
      }
      
      private function removeLastInactiveIcon() : void
      {
         if(this.lastInactiveIcon)
         {
            if(this.contains(this.lastInactiveIcon))
            {
               this.removeChild(this.lastInactiveIcon);
            }
            this.lastInactiveIcon = null;
         }
      }
      
      private function hadleCanstructionAsset(param1:SWFAsset) : void
      {
         if(!this.site_front)
         {
            this.site_front = param1.getEmbededMovieClip("ObjectMC");
            this.site_front.mouseEnabled = false;
            this.site_front.mouseChildren = false;
            this.updateView();
         }
      }
      
      private function hadleCanstructionAssetback(param1:SWFAsset) : void
      {
         if(!this.site_back)
         {
            this.site_back = param1.getEmbededMovieClip("ObjectMC");
            this.site_back.mouseEnabled = false;
            this.site_back.mouseChildren = false;
            this.updateView();
         }
      }
      
      override public function set zoomlevel(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < MainConfig.ZOOM_LEVELS.length)
         {
            if(param1 == MainConfig.ZOOM_LEVELS[_loc2_])
            {
               this.zoomIndex = _loc2_;
               break;
            }
            _loc2_++;
         }
         super.zoomlevel = param1;
         this.updateView();
         this.updateInactiveIcon(true);
      }
      
      override public function set markType(param1:int) : void
      {
         if(this.higlightable)
         {
            if(_markType != param1)
            {
               _markType = param1;
               if(this.skin)
               {
                  switch(_markType)
                  {
                     case ItemMarkType.DEFAULT:
                        TweenLite.to(this.skin,0.0001,{"glowFilter":{"remove":true}});
                        this.alpha = 1;
                        break;
                     case ItemMarkType.GRAY_OUT:
                        this.alpha = 0.4;
                        break;
                     case ItemMarkType.MOUSE_OVER:
                        TweenLite.to(this.skin,0.3,{"glowFilter":{
                           "color":16750848,
                           "blurX":10,
                           "blurY":10,
                           "strength":3,
                           "alpha":1,
                           "quality":1
                        }});
                        break;
                     case ItemMarkType.PLACEMENT_MISTAKE:
                        TweenLite.to(this.skin,0.1,{"glowFilter":{
                           "color":16711680,
                           "blurX":10,
                           "blurY":10,
                           "strength":3,
                           "alpha":1,
                           "quality":1
                        }});
                  }
               }
            }
         }
      }
      
      public function get active() : int
      {
         return this._active;
      }
      
      public function set active(param1:int) : void
      {
         this._active = param1;
         this.updateView();
      }
      
      public function get buildTimeStamp() : int
      {
         return this._buildTimeStamp;
      }
      
      public function set buildTimeStamp(param1:int) : void
      {
         this._buildTimeStamp = param1;
         if(this._buildTimeStamp > 0)
         {
            if(!this.site_front)
            {
               AssetLibrary.sendAssetToFunction("site_" + this.itemWidth + "x" + this.itemHeight + "_front",this.hadleCanstructionAsset);
            }
            if(!this.site_back)
            {
               AssetLibrary.sendAssetToFunction("site_" + this.itemWidth + "x" + this.itemHeight + "_back",this.hadleCanstructionAssetback);
            }
         }
         else
         {
            this._isBuilt = true;
         }
         this.updateView();
      }
      
      public function get sellable() : int
      {
         return this._sellable;
      }
      
      public function get sellVirtual() : int
      {
         return this._sellVirtual;
      }
      
      public function get sellReal() : int
      {
         return this._sellReal;
      }
      
      public function set sellable(param1:int) : void
      {
         this._sellable = param1;
      }
      
      public function set sellVirtual(param1:int) : void
      {
         this._sellVirtual = param1;
      }
      
      public function set sellReal(param1:int) : void
      {
         this._sellReal = param1;
      }
      
      public function get buildTime() : int
      {
         return this._buildTime;
      }
      
      public function get directBuildReal() : int
      {
         return this._directBuildReal;
      }
      
      public function get alias() : String
      {
         return this._alias;
      }
      
      override public function dispose() : void
      {
         TimeManager.removeTrack(this.buildTrack);
         this.buildTrack = null;
         this.buildingCommandIds = null;
         if(this.activeZone)
         {
            this.activeZone.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
            this.activeZone.removeEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
            this.activeZone.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
            this.activeZone.removeEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
            DisplayObjectHelper.removeChild(this,this.activeZone);
            this.activeZone = null;
         }
         this.site_front = null;
         this.site_back = null;
         this.removeLastInactiveIcon();
         this.inactiveIcons = null;
         super.dispose();
         DisplayObjectHelper.removeChild(this.itemHolder,this);
         this.itemHolder = null;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(this.activeZone)
         {
            this.activeZone.mouseEnabled = _enabled;
         }
      }
   }
}

