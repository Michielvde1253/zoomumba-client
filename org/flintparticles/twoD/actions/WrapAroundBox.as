package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class WrapAroundBox extends ActionBase
   {
      private var _left:Number;
      
      private var _top:Number;
      
      private var _right:Number;
      
      private var _bottom:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function WrapAroundBox(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         priority = -20;
         this.left = param1;
         this.top = param2;
         this.right = param3;
         this.bottom = param4;
      }
      
      public function get left() : Number
      {
         return this._left;
      }
      
      public function set left(param1:Number) : void
      {
         this._left = param1;
         this._width = this._right - this._left;
      }
      
      public function get top() : Number
      {
         return this._top;
      }
      
      public function set top(param1:Number) : void
      {
         this._top = param1;
         this._height = this._bottom - this._top;
      }
      
      public function get right() : Number
      {
         return this._right;
      }
      
      public function set right(param1:Number) : void
      {
         this._right = param1;
         this._width = this._right - this._left;
      }
      
      public function get bottom() : Number
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         this._bottom = param1;
         this._height = this._bottom - this._top;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         if(_loc4_.velX > 0 && _loc4_.x >= this._right)
         {
            _loc4_.x -= this._width;
         }
         else if(_loc4_.velX < 0 && _loc4_.x <= this._left)
         {
            _loc4_.x += this._width;
         }
         if(_loc4_.velY > 0 && _loc4_.y >= this._bottom)
         {
            _loc4_.y -= this._height;
         }
         else if(_loc4_.velY < 0 && _loc4_.y <= this._top)
         {
            _loc4_.y += this._height;
         }
      }
   }
}

