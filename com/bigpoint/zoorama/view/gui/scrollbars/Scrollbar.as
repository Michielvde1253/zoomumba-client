package com.bigpoint.zoorama.view.gui.scrollbars
{
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class Scrollbar extends Coreponent
   {
      public static var EVENT_SLIDER_POSITION_CHANGED:String = "sliderPositionChanged";
      
      private var up:MovieClip;
      
      private var center:MovieClip;
      
      private var down:MovieClip;
      
      private var slider:Sprite;
      
      private var sliderTimer:Timer;
      
      public var percent:Number;
      
      private var minY:int;
      
      private var maxY:int;
      
      private var _target:Sprite;
      
      public function Scrollbar()
      {
         super();
         this.sliderTimer = new Timer(20);
         this.sliderTimer.addEventListener(TimerEvent.TIMER,this.handleSliderTimer);
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         this.up = skin.getChildByName("up") as MovieClip;
         this.center = skin.getChildByName("center") as MovieClip;
         this.down = skin.getChildByName("down") as MovieClip;
         this.slider = skin.getChildByName("slider") as MovieClip;
         if(this.slider)
         {
            this.slider.addEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
            this.slider.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
            this.slider.y = this.center.y;
         }
         this.minY = this.center.y;
         this.maxY = this.center.height - this.slider.height;
      }
      
      private function handleMouseDown(param1:MouseEvent) : void
      {
         this.minY = this.center.y;
         this.maxY = this.center.height - this.slider.height;
         var _loc2_:Rectangle = new Rectangle(0,this.minY,0,this.maxY);
         this.slider.startDrag(false,_loc2_);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
         this.sliderTimer.start();
      }
      
      private function handleMouseUp(param1:MouseEvent) : void
      {
         this.slider.stopDrag();
         this.sliderTimer.stop();
      }
      
      private function handleSliderTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = this.slider.y - this.minY;
         var _loc3_:Number = Math.round(_loc2_ * 100 / this.maxY) / 100;
         if(_loc3_ != this.percent)
         {
            this.percent = _loc3_;
            dispatchEvent(new Event(EVENT_SLIDER_POSITION_CHANGED));
         }
      }
      
      override public function set height(param1:Number) : void
      {
         var _loc2_:Number = this.up.height + this.down.height;
         if(param1 > _loc2_)
         {
            this.center.height = param1 - _loc2_;
            this.down.y = this.center.height + this.up.height;
         }
      }
      
      protected function checkVisibilty() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         var _loc3_:Number = NaN;
         if(this.target)
         {
            _loc1_ = this.target.getChildByName("content");
            _loc2_ = this.target.getChildByName("mask");
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               _loc3_ = _loc1_.height - _loc2_.height;
               if(_loc3_ > 0)
               {
                  this.visible = true;
               }
               else
               {
                  this.visible = false;
               }
            }
         }
      }
      
      public function set sliderPositionInPercent(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 >= 0 && param1 <= 1)
         {
            _loc2_ = this.minY + this.maxY * param1;
            this.slider.y = _loc2_;
            this.update();
         }
      }
      
      public function update() : void
      {
         this.checkVisibilty();
      }
      
      public function set target(param1:Sprite) : void
      {
         this._target = param1;
         this.checkVisibilty();
      }
      
      public function get target() : Sprite
      {
         return this._target;
      }
   }
}

