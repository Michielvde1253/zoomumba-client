package com.bigpoint.zoomumba.view.features.map.components
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.Sprite;
   
   public class Cloud
   {
      private var _cloud:Sprite;
      
      private var _tween:TweenLite;
      
      private var _isflying:Boolean;
      
      public function Cloud(param1:Sprite)
      {
         super();
         this._cloud = param1;
      }
      
      public function playTo(param1:Number, param2:int, param3:int) : void
      {
         this.killTween();
         this._cloud.visible = true;
         this._tween = TweenLite.to(this._cloud,param1,{
            "x":param2,
            "y":param3,
            "onComplete":this.disable,
            "ease":Linear.easeNone
         });
         this.isflying = true;
      }
      
      private function killTween() : void
      {
         if(this._tween)
         {
            this._tween.kill();
         }
      }
      
      public function set x(param1:Number) : void
      {
         this._cloud.x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this._cloud.y = param1;
      }
      
      public function get y() : Number
      {
         return this._cloud.y;
      }
      
      public function get x() : Number
      {
         return this._cloud.x;
      }
      
      public function set width(param1:Number) : void
      {
         this._cloud.width = param1;
      }
      
      public function set height(param1:Number) : void
      {
         this._cloud.height = param1;
      }
      
      public function get width() : Number
      {
         return this._cloud.width;
      }
      
      public function get height() : Number
      {
         return this._cloud.height;
      }
      
      public function get isflying() : Boolean
      {
         return this._isflying;
      }
      
      public function set isflying(param1:Boolean) : void
      {
         this._isflying = param1;
      }
      
      public function disable() : void
      {
         this.killTween();
         this._cloud.visible = false;
         this.isflying = false;
      }
   }
}

