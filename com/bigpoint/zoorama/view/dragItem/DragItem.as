package com.bigpoint.zoorama.view.dragItem
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.field.items.TrashBin;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class DragItem extends Mediator
   {
      public static const NAME:String = "DragItem";
      
      private var skin:Sprite;
      
      private var objectHolder:Sprite;
      
      private var _zoomLevel:Number = MainConfig.ZOOM_LEVELS[MainConfig.ZOOM_DEFAULT_ID];
      
      private var dragItem:*;
      
      private var constructionItem:MovieClip;
      
      private var notifier:Notifier;
      
      private var noticeOnPress:Boolean;
      
      private var noticeOnRelese:Boolean;
      
      private var _dragPoint:Point = new Point();
      
      private var _dragCategoryId:int = -1;
      
      private var _dragitemId:int = -1;
      
      private var _dragitemLevel:int;
      
      private var _dragUniqueId:int = -1;
      
      private var _dragGroundRequired:int = 0;
      
      private var _rotatePos:int = 0;
      
      private var activeZone:Sprite;
      
      private var _shopItemDraged:Boolean = false;
      
      private var _isMoveStreet:Boolean = false;
      
      private var dragCancel:DragCancelButton;
      
      private var realMoney:Boolean = false;
      
      private var _isDragging:Boolean = false;
      
      private var _eventId:int = -1;
      
      private var _size:Point = new Point();
      
      private var cageLevel:int = 0;
      
      private var statusId:int = -1;
      
      private var gameContainer:UIComponent;
      
      private var useInventory:Boolean = false;
      
      private var uniqueId:int = -1;
      
      public function DragItem(param1:Notifier, param2:UIComponent)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.skin = new Sprite();
         this.objectHolder = new Sprite();
         this.skin.addChild(this.objectHolder);
         param2.addChild(this.skin);
         this.gameContainer = param2;
         this.activeZone = new Sprite();
         this.activeZone.graphics.beginFill(16711680,0);
         this.activeZone.graphics.moveTo(0,0);
         this.activeZone.graphics.lineTo(50,0);
         this.activeZone.graphics.lineTo(50,100);
         this.activeZone.graphics.lineTo(-50,100);
         this.activeZone.graphics.lineTo(-50,0);
         this.activeZone.y = -25;
         this.dragCancel = new DragCancelButton(this.notifier);
         this.skin.addChild(this.dragCancel);
         this.dragCancel.visible = false;
         this.dragCancel.x = MainConfig.STAGE_WIDTH / 2;
         this.dragCancel.y = -50;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      public function startDragFieldItem(param1:Boolean = true, param2:Boolean = true, param3:int = -1, param4:int = -1, param5:int = -1, param6:int = -1, param7:int = 0, param8:Point = null, param9:int = -1, param10:int = -1, param11:int = -1) : void
      {
         var _loc12_:DecorShopData = null;
         this.stopDragItem();
         this.useInventory = false;
         this.noticeOnPress = param1;
         this.noticeOnRelese = param2;
         this._dragCategoryId = param3;
         this._dragitemId = param4;
         this._dragitemLevel = param5;
         this._dragUniqueId = param6;
         this._rotatePos = param7;
         this._shopItemDraged = false;
         this._isDragging = true;
         this._eventId = param11;
         this._size = param8;
         this.statusId = param10;
         switch(param3)
         {
            case Categories.CAGE:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.CAGE,param4,param5,this._eventId),this.hadleCageAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.STORE:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.STORE,param4),this.hadleStoreAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.NURSERY:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.NURSERY,param4),this.hadleNurseryAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.BREEDING_LAB:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.BREEDING_LAB,param4),this.hadleBreedingLabAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.DECOR:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.DECOR,param4),this.hadleDecorAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_ANY;
               _loc12_ = ConfigurationModule.getInstance().getDecorationData(param4);
               if(_loc12_)
               {
                  this._dragGroundRequired = _loc12_.groundRequired;
               }
               break;
            case Categories.TRASHBIN:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.TRASHBIN,param4),this.hadleTrashBinAsset);
               this._dragGroundRequired = ItemAbstract.GROUND_ROAD;
         }
         this.activeZone.addEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         this.gameContainer.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleStageRelease);
         sendNotification(Note.SHOW_GRID);
      }
      
      public function startDragShopItem(param1:ShopItemData, param2:Boolean) : void
      {
         var _loc4_:CageShopData = null;
         this.useInventory = false;
         this.realMoney = param2;
         var _loc3_:int = 0;
         if(param1)
         {
            if(param1.categoryId == Categories.CAGE)
            {
               _loc4_ = ConfigurationModule.getInstance().getCageData(param1.itemId);
               _loc3_ = _loc4_.baseLevel;
            }
            this.startDragGeneralItem(param1.categoryId,param1.itemId,_loc3_);
            this.gameContainer.stage.focus = this.gameContainer.stage;
         }
      }
      
      public function startDragAnimalShopItem(param1:AnimalSpeciesVO, param2:Boolean) : void
      {
         this.useInventory = false;
         this.realMoney = param2;
         this.startDragGeneralItem(Categories.SPECIES,param1.selectedId);
         this.gameContainer.stage.focus = this.gameContainer.stage;
      }
      
      public function startDragInventoryItem(param1:ShopItemData) : void
      {
         this.useInventory = true;
         this.startDragGeneralItem(param1.categoryId,param1.itemId,param1.level,param1.uniqueId,true);
      }
      
      public function startDragGeneralItem(param1:int, param2:int, param3:int = 0, param4:int = -1, param5:Boolean = false, param6:Boolean = false) : void
      {
         var _loc7_:CageShopData = null;
         var _loc8_:AnimalShopData = null;
         var _loc9_:StoreShopData = null;
         var _loc10_:BreedingLabShopData = null;
         var _loc11_:NurseryShopData = null;
         var _loc12_:DecorShopData = null;
         this._shopItemDraged = true;
         this._isMoveStreet = param6;
         this.noticeOnPress = true;
         this.noticeOnRelese = false;
         this._dragCategoryId = param1;
         this._dragitemId = param2;
         this.uniqueId = param4;
         this.useInventory = param5;
         this._isDragging = true;
         this.emptyObjecHolder();
         switch(param1)
         {
            case Categories.CAGE:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.CAGE,param2,param3),this.hadleCageAsset);
               _loc7_ = ConfigurationModule.getInstance().getCageData(param2);
               this._size.x = _loc7_.width;
               this._size.y = _loc7_.height;
               this.cageLevel = param3;
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.ANIMAL:
               _loc8_ = ConfigurationModule.getInstance().getAnimalData(param2);
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc8_.itemId),this.hadleSpecieAsset);
               break;
            case Categories.SPECIES:
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.ANIMAL,param2),this.hadleSpecieAsset);
               break;
            case Categories.STORE:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.STORE,param2),this.hadleStoreAsset);
               _loc9_ = ConfigurationModule.getInstance().getStoreData(param2);
               this._size.x = _loc9_.width;
               this._size.y = _loc9_.height;
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.BREEDING_LAB:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.BREEDING_LAB,param2),this.hadleBreedingLabAsset);
               _loc10_ = ConfigurationModule.getInstance().getBreedingLabData();
               this._size.x = _loc10_.width;
               this._size.y = _loc10_.height;
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.NURSERY:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.NURSERY,param2),this.hadleNurseryAsset);
               _loc11_ = ConfigurationModule.getInstance().getNurseryData();
               this._size.x = _loc11_.width;
               this._size.y = _loc11_.height;
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.PREMIUM:
            case Categories.STORAGE:
            case Categories.DECOR:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.DECOR,param2),this.hadleDecorAsset);
               _loc12_ = ConfigurationModule.getInstance().getDecorationData(param2);
               if(_loc12_)
               {
                  this._size.x = _loc12_.width;
                  this._size.y = _loc12_.height;
                  this._dragGroundRequired = _loc12_.groundRequired;
               }
               break;
            case Categories.ROAD:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.ROAD,param2),this.hadleRoadAsset);
               this._size.x = 1;
               this._size.y = 1;
               this._dragGroundRequired = ItemAbstract.GROUND_GRASS;
               break;
            case Categories.TRASHBIN:
               AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.TRASHBIN,param2),this.hadleTrashBinAsset);
               this._size.x = 1;
               this._size.y = 1;
               this._dragGroundRequired = ItemAbstract.GROUND_ROAD;
         }
         this.activeZone.addEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.showCancelButton();
         }
         sendNotification(Note.SHOW_GRID);
      }
      
      private function handleDragRelease(param1:MouseEvent = null) : void
      {
         var _loc2_:int = 0;
         if(this._dragCategoryId != Categories.ROAD)
         {
            this.activeZone.removeEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
            if(!this.gameContainer.stage.hasEventListener(MouseEvent.MOUSE_UP))
            {
               this.gameContainer.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleStageRelease);
               return;
            }
            this.gameContainer.stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleStageRelease);
         }
         if(this.noticeOnPress)
         {
            this.updateDragPoint();
            if(this._dragCategoryId == Categories.CAGE)
            {
               this.notifier.dispatchNotice(new DragNotice(DragNotice.PRESS_ITEM,this.dragPoint,this._dragCategoryId,this._dragitemId,this._dragitemLevel,this.uniqueId,this.dragGroundRequired,this._rotatePos,this._size,this.realMoney,this.useInventory,this.cageLevel,this._isMoveStreet));
            }
            else
            {
               this.notifier.dispatchNotice(new DragNotice(DragNotice.PRESS_ITEM,this.dragPoint,this._dragCategoryId,this._dragitemId,this._dragitemLevel,this.uniqueId,this.dragGroundRequired,this._rotatePos,this._size,this.realMoney,this.useInventory,0,this._isMoveStreet));
            }
            return;
         }
         if(this.uniqueId > -1)
         {
            _loc2_ = this.uniqueId;
         }
         else
         {
            _loc2_ = this._dragUniqueId;
         }
         if(this.noticeOnRelese)
         {
            this.updateDragPoint();
            this.notifier.dispatchNotice(new DragNotice(DragNotice.DROP_ITEM,this.dragPoint,this._dragCategoryId,this._dragitemId,this._dragitemLevel,_loc2_,this._dragGroundRequired,this._rotatePos,this._size,this.realMoney,this.useInventory,0,this._isMoveStreet));
         }
         this.uniqueId = -1;
         this._dragUniqueId = -1;
         TweenLite.killDelayedCallsTo(this.handleDragRelease);
      }
      
      private function handleStageRelease(param1:MouseEvent = null) : void
      {
         TweenLite.delayedCall(0.1,this.handleDragRelease);
      }
      
      private function showCancelButton() : void
      {
         this.dragCancel.visible = true;
         TweenLite.to(this.dragCancel,1,{
            "y":100,
            "ease":Strong.easeOut
         });
      }
      
      private function hideCancelButton() : void
      {
         TweenLite.to(this.dragCancel,1,{
            "y":-50,
            "ease":Strong.easeOut,
            "onComplete":this.makeCancelButtonNotVisible
         });
      }
      
      private function makeCancelButtonNotVisible() : void
      {
         this.dragCancel.visible = false;
      }
      
      private function emptyObjecHolder() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.objectHolder.numChildren)
         {
            this.objectHolder.removeChild(this.objectHolder.getChildAt(_loc1_));
            _loc1_++;
         }
      }
      
      public function stopDragItem(param1:Notice = null) : void
      {
         this._shopItemDraged = false;
         this._isDragging = false;
         if(this.activeZone.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.activeZone.removeEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         }
         if(this.gameContainer.stage.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.gameContainer.stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleStageRelease);
         }
         if(this.dragItem)
         {
            if(this.objectHolder.contains(this.dragItem))
            {
               this.objectHolder.removeChild(this.dragItem);
            }
         }
         if(this.constructionItem)
         {
            if(this.objectHolder.contains(this.constructionItem))
            {
               this.objectHolder.removeChild(this.constructionItem);
            }
         }
         this.objectHolder.removeEventListener(Event.ENTER_FRAME,this.handleDragMove);
         TweenLite.killDelayedCallsTo(this.handleDragRelease);
         this.dragItem = null;
         this.constructionItem = null;
         this.objectHolder.stopDrag();
         this.hideCancelButton();
         this._dragCategoryId = -1;
         this._dragitemId = -1;
         this._dragUniqueId = -1;
         this._rotatePos = ItemAbstract.ROTATION_0;
         this._size.x = 2;
         this._size.y = 2;
         sendNotification(Note.HIDE_GRID);
      }
      
      private function updateDragPoint() : void
      {
         this._dragPoint.x = this.objectHolder.x;
         this._dragPoint.y = this.objectHolder.y;
      }
      
      private function hadleCageAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      private function hadleStoreAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      private function hadleBreedingLabAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      private function hadleNurseryAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      private function hadleDecorAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      private function hadleTrashBinAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
            switch(this.statusId)
            {
               case TrashBin.STATUS_ID_USED:
                  this.dragItem.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_USED);
                  break;
               case TrashBin.STATUS_ID_FULL:
                  this.dragItem.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_FULL);
                  break;
               case TrashBin.STATUS_ID_EMPTY:
               default:
                  this.dragItem.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_EMPTY);
            }
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.initDragItem();
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         }
      }
      
      public function hadleConstructionAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.constructionItem = param1.getEmbededMovieClip("ObjectMC");
            this.constructionItem.gotoAndStop("zoom_" + this._zoomLevel);
            this.objectHolder.addChild(this.constructionItem);
         }
      }
      
      private function hadleSpecieAsset(param1:SWFAsset) : void
      {
         this.dragItem = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         this.objectHolder.addChild(this.dragItem);
         this.objectHolder.startDrag(true);
         this.dragItem.addChild(this.activeZone);
         this.activeZone.useHandCursor = false;
         this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
         this.showRotation();
      }
      
      private function hadleRoadAsset(param1:SWFAsset) : void
      {
         if(this.isDragging)
         {
            this.dragItem = param1.getEmbededMovieClip("ObjectMC");
            this.dragItem.gotoAndStop("road_0000");
            this.objectHolder.addChild(this.dragItem);
            this.objectHolder.startDrag(true);
            this.dragItem.addChild(this.activeZone);
            this.activeZone.useHandCursor = false;
            this.objectHolder.addEventListener(Event.ENTER_FRAME,this.handleDragMove);
            this.scaleDragItem();
            this.centerDragItem();
         }
      }
      
      private function initDragItem() : void
      {
         this.scaleDragItem();
         this.centerDragItem();
         this.showRotation();
      }
      
      private function handleDragMove(param1:Event) : void
      {
         this.updateDragPoint();
         this.notifier.dispatchNotice(new DragNotice(DragNotice.DRAG,this.dragPoint,this._dragCategoryId,this._dragitemId,this._dragitemLevel,this._dragUniqueId,this._dragGroundRequired,this._rotatePos,this._size,this.realMoney,this.useInventory,0,this.isMoveStreet));
      }
      
      private function centerDragItem() : void
      {
         if(this.dragItem)
         {
            this.dragItem.y = -(MainConfig.TILE_HEIGHT * this._zoomLevel) / 2;
         }
         if(this.constructionItem)
         {
            this.constructionItem.x = -(MainConfig.TILE_HEIGHT * this._zoomLevel) / 2;
         }
      }
      
      public function set zoomLevel(param1:Number) : void
      {
         this._zoomLevel = param1;
         if(this._isDragging)
         {
            if(this.dragItem)
            {
               this.scaleDragItem();
               this.centerDragItem();
            }
         }
      }
      
      private function scaleDragItem() : void
      {
         this.dragItem.scaleX = 1;
         this.dragItem.scaleY = 1;
         if(this._dragCategoryId == Categories.ROAD)
         {
            this.dragItem.scaleX = this._zoomLevel;
            this.dragItem.scaleY = this._zoomLevel;
         }
         else if(this.dragItem is MovieClip)
         {
            this.dragItem.gotoAndStop("zoom_" + this._zoomLevel);
         }
      }
      
      public function rotate() : void
      {
         if(this._rotatePos != -1)
         {
            if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this._rotatePos = ItemAbstract.ROTATION_270;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this._rotatePos = ItemAbstract.ROTATION_0;
               this.dragItem.scaleX = 1;
            }
            this.showRotation();
         }
      }
      
      private function showRotation() : void
      {
         if(this._rotatePos == ItemAbstract.ROTATION_270)
         {
            this.dragItem.scaleX = -1;
         }
         else
         {
            this.dragItem.scaleX = 1;
         }
      }
      
      public function get dragPoint() : Point
      {
         this.updateDragPoint();
         return this._dragPoint;
      }
      
      public function get isDragging() : Boolean
      {
         return this._isDragging;
      }
      
      public function get dragCategoryId() : int
      {
         return this._dragCategoryId;
      }
      
      public function get dragitemId() : int
      {
         return this._dragitemId;
      }
      
      public function get dragUniqueId() : int
      {
         return this._dragUniqueId;
      }
      
      public function get rotatePos() : int
      {
         return this._rotatePos;
      }
      
      public function get size() : Point
      {
         return this._size;
      }
      
      public function get shopItemDraged() : Boolean
      {
         return this._shopItemDraged;
      }
      
      public function get dragGroundRequired() : int
      {
         return this._dragGroundRequired;
      }
      
      public function get isMoveStreet() : Boolean
      {
         return this._isMoveStreet;
      }
      
      public function showColisionState(param1:Boolean) : void
      {
         if(this.objectHolder)
         {
            if(param1)
            {
               TweenLite.to(this.objectHolder,0.2,{"glowFilter":{
                  "color":16711680,
                  "blurX":10,
                  "blurY":10,
                  "strength":3,
                  "alpha":1,
                  "quality":1
               }});
            }
            else
            {
               TweenLite.to(this.objectHolder,0.0001,{"glowFilter":{"remove":true}});
            }
         }
      }
   }
}

