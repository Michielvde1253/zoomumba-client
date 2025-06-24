package com.bigpoint.zoorama.view.itemDrop.items
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.model.features.itemDrops.events.DropItemEvent;
   import com.greensock.TweenMax;
   import com.greensock.easing.Cubic;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class DropItem extends Sprite
   {
      private static const MAX_DISTANCES:Array = [70,140,280];
      
      private var autoCollectTimeTrack:TimeTrack;
      
      public var position:Point;
      
      public var asset:Vector.<Sprite>;
      
      public var count:int;
      
      public var flyTo:Point;
      
      public var currentZoomLevel:int;
      
      public var cellPosition:Point;
      
      public var dropId:int;
      
      public var autoCollectTimer:int;
      
      public var uniqueId:int;
      
      private var randomDropPoint:Point;
      
      private var deltaX:int = 0;
      
      private var deltaY:int = 0;
      
      private var skin:Sprite;
      
      private var isDisabled:Boolean = false;
      
      public var collectAction:int = 0;
      
      public function DropItem()
      {
         this.autoCollectTimeTrack = TimeManager.creatEmptyTrack(this.handleAutoCollect);
         super();
         this.addEventListener(MouseEvent.CLICK,this.handle_mouseDown);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.handle_mouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.handle_mouseOut);
      }
      
      public function init() : void
      {
         this.initSkin();
         this.positionInit();
         this.setDeltas();
         this.animateIn();
         this.setAutoCollectTimer();
      }
      
      private function setAutoCollectTimer() : void
      {
         var _loc1_:int = TimeManager.currentTime + this.autoCollectTimer;
         TimeManager.updateTrackTime(this.autoCollectTimeTrack,_loc1_);
      }
      
      private function initSkin() : void
      {
         if(!this.skin)
         {
            this.skin = this.asset[this.currentZoomLevel];
         }
         else if(this.contains(this.skin))
         {
            this.removeChild(this.skin);
            this.skin = null;
            this.skin = this.asset[this.currentZoomLevel];
         }
         this.addChild(this.skin);
      }
      
      private function setDeltas() : void
      {
         this.deltaX = this.position.x - this.randomDropPoint.x;
         this.deltaY = this.position.y - this.randomDropPoint.y;
         if(this.currentZoomLevel == 2)
         {
            this.deltaX /= 2;
            this.deltaY /= 2;
         }
         if(this.currentZoomLevel == 0)
         {
            this.deltaX *= 2;
            this.deltaY *= 2;
         }
      }
      
      public function positionInit() : void
      {
         this.x = this.position.x;
         this.y = this.position.y;
         this.randomDropPoint = this.getRandomPoint();
      }
      
      public function animateIn() : void
      {
         this.x = this.position.x;
         this.y = this.position.y;
         this.alpha = 0;
         TweenMax.to(this,0.3,{"alpha":1});
         TweenMax.to(this,0.7,{
            "bezierThrough":[{
               "x":(this.position.x + this.itemPosition.x) / 2,
               "y":(this.position.y + this.itemPosition.y) / 2 - 100
            },{
               "x":this.itemPosition.x,
               "y":this.itemPosition.y
            }],
            "ease":Cubic.easeIn
         });
      }
      
      public function zoomHappened(param1:Point, param2:int) : void
      {
         this.position = param1;
         this.currentZoomLevel = param2;
         this.initSkin();
         this.x = this.itemPosition.x;
         this.y = this.itemPosition.y;
      }
      
      public function disable() : void
      {
         this.isDisabled = true;
         this.removeEventListener(MouseEvent.CLICK,this.handle_mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.handle_mouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.handle_mouseOut);
      }
      
      public function destroy() : void
      {
         TweenMax.killTweensOf(this);
         TweenMax.killDelayedCallsTo(this.remove);
      }
      
      public function remove() : void
      {
      }
      
      private function handleAutoCollect() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.handle_mouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.handle_mouseOut);
         this.collectAction = 2;
         dispatchEvent(new DropItemEvent(DropItemEvent.DROP_TIMER_EXPIRED,this));
         this.unsetTimer();
      }
      
      public function unsetTimer() : void
      {
         TimeManager.removeTrack(this.autoCollectTimeTrack);
      }
      
      public function handle_mouseDown(param1:MouseEvent) : void
      {
         this.collectAction = 1;
         this.unsetTimer();
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.handle_mouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.handle_mouseOut);
         dispatchEvent(new DropItemEvent(DropItemEvent.DROP_CLICKED,this));
      }
      
      public function handle_mouseOver(param1:MouseEvent) : void
      {
         TweenMax.to(this.skin,0.5,{"colorMatrixFilter":{
            "contrast":1.3,
            "brightness":1.2,
            "saturation":1.4
         }});
      }
      
      public function handle_mouseOut(param1:MouseEvent) : void
      {
         TweenMax.to(this.skin,0.3,{"colorMatrixFilter":{
            "contrast":1,
            "brightness":1,
            "saturation":1
         }});
      }
      
      public function get xPos() : int
      {
         return this.x;
      }
      
      public function get yPos() : int
      {
         return this.y;
      }
      
      private function get itemPosition() : Point
      {
         var _loc1_:Point = new Point();
         _loc1_.x = this.position.x - this.deltaX * this.zoomMultiplier;
         _loc1_.y = this.position.y - this.deltaY * this.zoomMultiplier;
         return _loc1_;
      }
      
      private function get zoomMultiplier() : Number
      {
         var _loc1_:Number = NaN;
         switch(this.currentZoomLevel)
         {
            case 0:
               _loc1_ = 0.5;
               break;
            case 1:
               _loc1_ = 1;
               break;
            case 2:
               _loc1_ = 2;
         }
         return _loc1_;
      }
      
      private function getRandomPoint() : Point
      {
         var _loc1_:int = int(MAX_DISTANCES[this.currentZoomLevel]);
         var _loc2_:Point = new Point(this.x - _loc1_,this.y);
         var _loc3_:Point = new Point(this.x + _loc1_,this.y);
         var _loc4_:Point = new Point(this.x,this.y + _loc1_);
         var _loc5_:Number = Math.random();
         var _loc6_:Number = Math.random();
         if(_loc5_ + _loc6_ > 1)
         {
            _loc5_ = 1 - _loc5_;
            _loc6_ = 1 - _loc6_;
         }
         var _loc7_:Number = 1 - _loc5_ - _loc6_;
         var _loc8_:Number = _loc5_ * _loc2_.x + _loc6_ * _loc3_.x + _loc7_ * _loc4_.x;
         var _loc9_:Number = _loc5_ * _loc2_.y + _loc6_ * _loc3_.y + _loc7_ * _loc4_.y;
         return new Point(_loc8_,_loc9_);
      }
      
      public function dispose() : void
      {
         this.position = null;
         this.asset = null;
         this.flyTo = null;
         this.cellPosition = null;
         this.randomDropPoint = null;
         this.skin = null;
         TimeManager.removeTrack(this.autoCollectTimeTrack);
         this.autoCollectTimeTrack = null;
      }
   }
}

