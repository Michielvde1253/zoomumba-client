package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.view.field.CellData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ItemAbstract extends Sprite
   {
      public static const ITEM_FAMILY_NOT_DEFINED:int = 0;
      
      public static const ITEM_FAMILY_BUILDING:int = 1;
      
      public static const ITEM_FAMILY_GROWND:int = 2;
      
      public static const ITEM_FAMILY_VEHICLE:int = 3;
      
      protected static var canConstruct:Boolean = false;
      
      public static const ROTATION_0:int = 0;
      
      public static const ROTATION_90:int = 1;
      
      public static const ROTATION_180:int = 2;
      
      public static const ROTATION_270:int = 3;
      
      public static const GROUND_ANY:int = 0;
      
      public static const GROUND_GRASS:int = 1;
      
      public static const GROUND_ROAD:int = 2;
      
      protected var notifier:Notifier;
      
      public var uniqueId:int = -1;
      
      protected var _itemId:int = -1;
      
      protected var _level:int = 0;
      
      protected var _posX:int = -2147483648;
      
      protected var _posY:int = -2147483648;
      
      private var _vertical:int;
      
      private var _horizontal:int;
      
      protected var _rotatePos:int = 0;
      
      protected var _groundRequired:int = 0;
      
      protected var _systemItem:Boolean = false;
      
      protected var _deleteFlag:int = -1;
      
      protected var _itemFamily:int = 0;
      
      private var _itemWidth:int = -1;
      
      private var _itemHeight:int = -1;
      
      protected var defaultItemWidth:int = -1;
      
      protected var defaultItemHeight:int = -1;
      
      protected var _category:int;
      
      protected var _zoomlevel:Number = 1;
      
      protected var isMousePressed:Boolean = false;
      
      protected var _markType:int = 0;
      
      public var listOfCells:Vector.<CellData> = new Vector.<CellData>();
      
      protected var skin:MovieClip;
      
      protected var nextLevelSkin:MovieClip;
      
      public var zDepth:int;
      
      protected var _enabled:Boolean = true;
      
      protected var _dragable:Boolean = true;
      
      protected var zSortShift:int = 0;
      
      protected var _isDisposed:Boolean = false;
      
      public function ItemAbstract(param1:Notifier, param2:int)
      {
         super();
         this.notifier = new Notifier(param1);
         if(param2 >= 0)
         {
            this._itemId = param2;
         }
         this.mouseEnabled = false;
      }
      
      public function updateState(param1:FieldItemData, param2:int) : void
      {
         this.visible = param1.visible;
         if(param1.del != -1)
         {
            this._deleteFlag = param1.del;
         }
      }
      
      public function set markType(param1:int) : void
      {
      }
      
      public function updatePosition(param1:Point) : void
      {
         this.x = int(param1.x);
         this.y = int(param1.y);
         this.zDepth = this.y + this.zSortShift;
      }
      
      public function get posX() : int
      {
         return this._posX;
      }
      
      public function get posY() : int
      {
         return this._posY;
      }
      
      public function get itemId() : int
      {
         return this._itemId;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get deleteFlag() : int
      {
         return this._deleteFlag;
      }
      
      public function get rotatePos() : int
      {
         return this._rotatePos;
      }
      
      public function set rotatePos(param1:int) : void
      {
         this._rotatePos = param1;
         if(this.defaultItemWidth > 0 && this.defaultItemHeight > 0)
         {
            if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this._itemWidth = this.defaultItemWidth;
               this._itemHeight = this.defaultItemHeight;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this._itemWidth = this.defaultItemHeight;
               this._itemHeight = this.defaultItemWidth;
            }
         }
         this.notifier.dispatchNotice(new ItemNotice(ItemNotice.POSITION_UPDATE,this._category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this._itemWidth,this._itemHeight)));
      }
      
      public function get itemWidth() : int
      {
         return this._itemWidth;
      }
      
      public function get itemHeight() : int
      {
         return this._itemHeight;
      }
      
      public function get dragable() : Boolean
      {
         return this._dragable;
      }
      
      public function set dragable(param1:Boolean) : void
      {
         this._dragable = param1;
      }
      
      public function get itemFamily() : int
      {
         return this._itemFamily;
      }
      
      public function set itemWidth(param1:int) : void
      {
         this._itemWidth = param1;
         this.recalculateZSortShift();
      }
      
      public function set itemHeight(param1:int) : void
      {
         this._itemHeight = param1;
         this.recalculateZSortShift();
      }
      
      public function set zoomlevel(param1:Number) : void
      {
         this._zoomlevel = param1;
         this.recalculateZSortShift();
      }
      
      public function get markType() : int
      {
         return this._markType;
      }
      
      public function get systemItem() : Boolean
      {
         return this._systemItem;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get isDisposed() : Boolean
      {
         return this._isDisposed;
      }
      
      public function get vertical() : int
      {
         return this._vertical;
      }
      
      public function get horizontal() : int
      {
         return this._horizontal;
      }
      
      public function get groundRequired() : int
      {
         return this._groundRequired;
      }
      
      protected function recalculateZSortShift() : void
      {
         if(this._itemWidth >= 0 && this._itemHeight >= 0)
         {
            if(this._rotatePos == ItemAbstract.ROTATION_270 || this._rotatePos == ItemAbstract.ROTATION_0)
            {
               if(this._itemWidth > this._itemHeight)
               {
                  if(this._itemWidth / 2 == this._itemHeight)
                  {
                     this.zSortShift = this._itemWidth * MainConfig.TILE_HEIGHT * this._zoomlevel / 2;
                  }
                  else
                  {
                     this.zSortShift = this._itemHeight * MainConfig.TILE_HEIGHT * this._zoomlevel / 2;
                  }
               }
               else
               {
                  this.zSortShift = this._itemWidth * MainConfig.TILE_HEIGHT * this._zoomlevel / 2;
               }
            }
            else if(this._itemWidth > this._itemHeight)
            {
               this.zSortShift = this._itemWidth * MainConfig.TILE_HEIGHT * this._zoomlevel / 2;
            }
            else
            {
               this.zSortShift = this._itemHeight * MainConfig.TILE_HEIGHT * this._zoomlevel / 2;
            }
         }
         this.zDepth = this.y + this.zSortShift;
      }
      
      protected function dispatchPositionUpdateNotification() : void
      {
         this.notifier.dispatchNotice(new ItemNotice(ItemNotice.POSITION_UPDATE,this._category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this._itemWidth,this._itemHeight)));
      }
      
      public function updateCords(param1:Point) : void
      {
         this._posX = param1.x;
         this._posY = param1.y;
         this._vertical = this._posX - this._posY;
         this._horizontal = this._posX + this._posY;
         this.recalculateZSortShift();
         this.notifier.dispatchNotice(new ItemNotice(ItemNotice.POSITION_UPDATE,this._category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(this._itemWidth,this._itemHeight)));
      }
      
      public function getDemoSkin() : Sprite
      {
         return this;
      }
      
      public function dispose() : void
      {
         this.notifier = null;
         if(this.skin)
         {
            if(this.contains(this.skin))
            {
               this.removeChild(this.skin);
            }
         }
         this.skin = null;
         this.nextLevelSkin = null;
         this.listOfCells = null;
         this._isDisposed = true;
      }
   }
}

