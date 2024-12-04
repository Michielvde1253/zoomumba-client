package com.bigpoint.zoomumba.view.features.map.components
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class Pinguin extends EventDispatcher
   {
      public static const MOVE_FINISHED_EVENT:String = "MOVE_FINISHED_EVENT";
      
      public static const MOVE_FRAME_IDLE:String = "idle";
      
      public static const MOVE_FRAME_WALK:String = "walk";
      
      public static const WALK_TIME:Number = 0.4;
      
      private var _asset:MovieClip;
      
      private var _tweener:TweenLite;
      
      private var _tweenY:Number;
      
      private var _tweenX:Number;
      
      public function Pinguin(param1:MovieClip)
      {
         super();
         this._asset = param1;
         this.idleMode();
         this.disableMouse();
      }
      
      private function disableMouse() : void
      {
         this._asset.mouseEnabled = false;
         this._asset.mouseChildren = false;
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this.killTween();
         this._tweenY = param2;
         this._tweenX = param1;
         var _loc3_:int = this.x - this._tweenX;
         if(_loc3_ < 0)
         {
            this._asset.scaleX = -1;
         }
         else
         {
            this._asset.scaleX = 1;
         }
         this._asset.gotoAndStop(MOVE_FRAME_WALK);
         this._tweener = TweenLite.delayedCall(0.01,this.movePingu);
      }
      
      public function idleMode() : void
      {
         this.killTween();
         this._asset.gotoAndStop(MOVE_FRAME_IDLE);
         this._tweener = TweenLite.delayedCall(0.01,this.idlePingu);
      }
      
      private function movePingu() : void
      {
         if(this._asset)
         {
            (this._asset.getChildByName("move_mc") as MovieClip).play();
            this._tweener = new TweenLite(this._asset,WALK_TIME,{
               "x":this._tweenX,
               "y":this._tweenY,
               "onComplete":this.onMoveComplete
            });
            this.disableMouse();
         }
      }
      
      private function idlePingu() : void
      {
         if(this._asset)
         {
            this.disableMouse();
            (this._asset.getChildByName("move_mc") as MovieClip).play();
         }
      }
      
      private function onMoveComplete() : void
      {
         this.idleMode();
         dispatchEvent(new Event(Pinguin.MOVE_FINISHED_EVENT));
      }
      
      public function killTween() : void
      {
         if(this._tweener)
         {
            this._tweener.kill();
            this._tweener = null;
         }
      }
      
      public function stopMoving() : void
      {
         this.killTween();
         this._asset.stop();
         if(this._asset)
         {
            (this._asset.getChildByName("move_mc") as MovieClip).stop();
         }
      }
      
      public function set x(param1:Number) : void
      {
         this._asset.x = param1;
      }
      
      public function get x() : Number
      {
         return this._asset.x;
      }
      
      public function set y(param1:Number) : void
      {
         this._asset.y = param1;
      }
      
      public function get y() : Number
      {
         return this._asset.y;
      }
   }
}

