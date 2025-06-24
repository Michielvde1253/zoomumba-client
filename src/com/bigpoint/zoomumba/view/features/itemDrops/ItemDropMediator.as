package com.bigpoint.zoomumba.view.features.itemDrops
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.itemDrops.ItemDropProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.events.DropItemEvent;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.ItemDropVO;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.view.itemDrop.items.DropItem;
   import com.bigpoint.zoorama.view.itemDrop.items.DropNumber;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ItemDropMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "ItemDropMediator";
      
      private const AUTO_COLLECT_TIMER:int = 5;
      
      private const FLY_AWAY_DELAY:int = 0;
      
      private const FLY_TIME:int = 2;
      
      private var curentZoomLevel:int = 2;
      
      private var activeDroppedItems:Vector.<DropItem> = new Vector.<DropItem>();
      
      private var playFieldManager:PlayFieldManager;
      
      private var itemDropProxy:ItemDropProxy;
      
      private var uniqueId:int = 0;
      
      private var _runningAnimations:int = 0;
      
      private var _collSetProxy:CollectionSetsConfigProxy;
      
      public function ItemDropMediator(param1:Sprite)
      {
         super(NAME,param1);
      }
      
      private function get dropLayer() : Sprite
      {
         return this.viewComponent as Sprite;
      }
      
      public function get collSetProxy() : CollectionSetsConfigProxy
      {
         if(this._collSetProxy == null)
         {
            this._collSetProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         }
         return this._collSetProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.MENU_ZOOM_IN_BUTTON_CLICKED,GUINote.MENU_ZOOM_OUT_BUTTON_CLICKED,Note.ZOOM_IN,Note.ZOOM_OUT,Note.SHOW_DROP,Note.ANIMATE_OUT_DROP];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         if(!this.playFieldManager)
         {
            this.playFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         }
         switch(param1.getName())
         {
            case GUINote.MENU_ZOOM_IN_BUTTON_CLICKED:
            case Note.ZOOM_IN:
            case GUINote.MENU_ZOOM_OUT_BUTTON_CLICKED:
            case Note.ZOOM_OUT:
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  this.curentZoomLevel = this.playFieldManager.currentZoomLevel;
                  this.updateZoom();
               }
               break;
            case Note.SHOW_DROP:
               this.createDrop(param1.getBody() as ItemDropVO);
               break;
            case Note.ANIMATE_OUT_DROP:
               this.addAnim();
               this.flyAwayCollectableDrop(param1.getBody() as DropItem);
         }
      }
      
      private function addAnim() : void
      {
         ++this._runningAnimations;
      }
      
      private function remAnim() : void
      {
         --this._runningAnimations;
         if(this._runningAnimations < 1)
         {
            this.itemDropProxy.currentRunning = -1;
            sendNotification(Note.COLLECT_DROP);
         }
      }
      
      private function createDrop(param1:ItemDropVO) : void
      {
         var _loc2_:DropItem = new DropItem();
         _loc2_.cellPosition = param1.position;
         _loc2_.position = this.getRealPosition(param1.position);
         _loc2_.asset = this.getAssetGraphics(param1.dropId);
         _loc2_.dropId = param1.dropId;
         _loc2_.count = this.getDropCount(param1);
         _loc2_.flyTo = param1.flyTo;
         _loc2_.currentZoomLevel = this.curentZoomLevel;
         _loc2_.autoCollectTimer = this.AUTO_COLLECT_TIMER;
         _loc2_.uniqueId = this.uniqueId;
         ++this.uniqueId;
         this.activeDroppedItems.push(_loc2_);
         this.dropLayer.addChild(_loc2_);
         _loc2_.init();
         _loc2_.addEventListener(DropItemEvent.DROP_CLICKED,this.handleDropClicked);
         _loc2_.addEventListener(DropItemEvent.DROP_TIMER_EXPIRED,this.handleDropExpired);
      }
      
      private function getDropCount(param1:ItemDropVO) : int
      {
         var _loc2_:PowerupProxy = facade.getProxy(PowerupProxy);
         var _loc3_:Number = 0;
         switch(param1.dropId)
         {
            case 140:
            case 141:
            case 142:
               _loc3_ = _loc2_.getMultiplierByAffectedProperty(Categories.COLLECTIBLE,param1.dropId);
         }
         return param1.count + param1.count * _loc3_;
      }
      
      private function flyAwayCollectableDrop(param1:DropItem) : void
      {
         this.activeDroppedItems.splice(this.activeDroppedItems.indexOf(param1),1);
         TweenLite.to(param1,this.FLY_TIME,{
            "delay":this.FLY_AWAY_DELAY,
            "x":param1.flyTo.x,
            "y":param1.flyTo.y,
            "onComplete":this.animationComplete,
            "onCompleteParams":[param1,true]
         });
         TweenLite.to(param1,0.2,{
            "delay":this.FLY_TIME + this.FLY_AWAY_DELAY - 0.5,
            "alpha":0
         });
      }
      
      private function flyAwayDrop(param1:DropItem) : void
      {
         this.activeDroppedItems.splice(this.activeDroppedItems.indexOf(param1),1);
         TweenLite.to(param1,0.5,{
            "x":param1.flyTo.x - this.dropLayer.x,
            "y":param1.flyTo.y - this.dropLayer.y,
            "alpha":0,
            "onComplete":this.animationComplete,
            "onCompleteParams":[param1,false]
         });
      }
      
      private function animationComplete(param1:DropItem, param2:Boolean) : void
      {
         if(param2)
         {
            this.remAnim();
         }
         sendNotification(Note.INCREASE_COLLECTABLE_AMOUNT,param1);
         this.disposeDrop(param1);
      }
      
      private function disposeDrop(param1:DropItem) : void
      {
         if(this.dropLayer.contains(param1))
         {
            this.dropLayer.removeChild(param1);
         }
         param1.dispose();
         param1 = null;
      }
      
      private function handleDropClicked(param1:DropItemEvent) : void
      {
         var _loc2_:CollectionSetConfigVO = this.collSetProxy.getCollectionSetByMemberId(param1.dropItem.dropId);
         if(_loc2_ == null)
         {
            this.flyAwayDrop(param1.dropItem);
         }
         else
         {
            this.itemDropProxy.addToQueue(param1.dropItem);
            sendNotification(Note.COLLECT_DROP);
         }
         this.addCountNumber(param1.dropItem.count,param1.dropItem);
      }
      
      private function addCountNumber(param1:int, param2:DropItem) : void
      {
         var _loc3_:DropNumber = new DropNumber(param1);
         _loc3_.mouseEnabled = false;
         _loc3_.mouseChildren = false;
         this.dropLayer.addChild(_loc3_);
         _loc3_.x = param2.x;
         _loc3_.y = param2.y;
         TweenLite.to(_loc3_,1,{
            "delay":1,
            "scaleX":2,
            "scaleY":2,
            "alpha":0,
            "ease":Strong.easeOut,
            "onComplete":this.handleItemRemove,
            "onCompleteParams":[_loc3_]
         });
      }
      
      private function handleItemRemove(param1:Sprite) : void
      {
         this.dropLayer.removeChild(param1);
         param1 = null;
      }
      
      private function handleDropExpired(param1:DropItemEvent) : void
      {
         var _loc2_:CollectionSetConfigVO = this.collSetProxy.getCollectionSetByMemberId(param1.dropItem.dropId);
         if(_loc2_ == null)
         {
            this.flyAwayDrop(param1.dropItem);
         }
         else
         {
            this.itemDropProxy.addToQueue(param1.dropItem);
            sendNotification(Note.COLLECT_DROP);
         }
      }
      
      private function getRealPosition(param1:Point) : Point
      {
         this.playFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         return this.playFieldManager.playField.getCordinatePossition(param1.x,param1.y);
      }
      
      private function getAssetGraphics(param1:int) : Vector.<Sprite>
      {
         var _loc2_:* = "d" + param1 + "_";
         var _loc3_:String = "";
         var _loc4_:Sprite = new Sprite();
         return this.itemDropProxy.getCollectionIconsById(param1);
      }
      
      public function updateZoom() : void
      {
         this.dropLayer.x = this.playFieldManager.playField.fieldSprite.x;
         this.dropLayer.y = this.playFieldManager.playField.fieldSprite.y;
         this.repositionDrops();
      }
      
      private function repositionDrops() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.activeDroppedItems.length)
         {
            this.activeDroppedItems[_loc1_].zoomHappened(this.getRealPosition(this.activeDroppedItems[_loc1_].cellPosition),this.curentZoomLevel);
            _loc1_++;
         }
      }
      
      override public function onRegister() : void
      {
         this.playFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         this.itemDropProxy = facade.retrieveProxy(ItemDropProxy.NAME) as ItemDropProxy;
         this.dropLayer.mouseEnabled = false;
      }
   }
}

