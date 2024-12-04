package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.effect
{
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TweenIcon extends Sprite
   {
      private var _tween:TweenLite;
      
      public function TweenIcon(param1:Sprite, param2:Point, param3:Point, param4:Number, param5:Number = 0)
      {
         super();
         visible = false;
         this.addChild(param1);
         this.x = param2.x;
         this.y = param2.y;
         this._tween = new TweenLite(this,param4,{
            "delay":param5,
            "x":param3.x,
            "y":param3.y,
            "onComplete":this.tweenFinished,
            "onStart":this.tweenStart
         });
      }
      
      private function tweenStart() : void
      {
         visible = true;
      }
      
      private function tweenFinished() : void
      {
         this._tween.kill();
         this._tween = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function destroy() : void
      {
         if(this._tween)
         {
            this._tween.kill();
            this._tween = null;
         }
      }
   }
}

