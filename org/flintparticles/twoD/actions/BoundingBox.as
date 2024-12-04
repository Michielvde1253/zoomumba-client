package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.ParticleEvent;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class BoundingBox extends ActionBase
   {
      private var _left:Number;
      
      private var _top:Number;
      
      private var _right:Number;
      
      private var _bottom:Number;
      
      private var _bounce:Number;
      
      public function BoundingBox(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 1)
      {
         super();
         priority = -20;
         this.left = param1;
         this.top = param2;
         this.right = param3;
         this.bottom = param4;
         this.bounce = param5;
      }
      
      public function get left() : Number
      {
         return this._left;
      }
      
      public function set left(param1:Number) : void
      {
         this._left = param1;
      }
      
      public function get top() : Number
      {
         return this._top;
      }
      
      public function set top(param1:Number) : void
      {
         this._top = param1;
      }
      
      public function get right() : Number
      {
         return this._right;
      }
      
      public function set right(param1:Number) : void
      {
         this._right = param1;
      }
      
      public function get bottom() : Number
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         this._bottom = param1;
      }
      
      public function get bounce() : Number
      {
         return this._bounce;
      }
      
      public function set bounce(param1:Number) : void
      {
         this._bounce = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = param2.collisionRadius;
         if(_loc4_.velX > 0 && (_loc6_ = _loc4_.x + _loc5_) >= this._right)
         {
            _loc4_.velX = -_loc4_.velX * this._bounce;
            _loc4_.x += 2 * (this._right - _loc6_);
            if(param1.hasEventListener(ParticleEvent.BOUNDING_BOX_COLLISION))
            {
               param1.dispatchEvent(new ParticleEvent(ParticleEvent.BOUNDING_BOX_COLLISION,_loc4_));
            }
         }
         else if(_loc4_.velX < 0 && (_loc6_ = _loc4_.x - _loc5_) <= this._left)
         {
            _loc4_.velX = -_loc4_.velX * this._bounce;
            _loc4_.x += 2 * (this._left - _loc6_);
            if(param1.hasEventListener(ParticleEvent.BOUNDING_BOX_COLLISION))
            {
               param1.dispatchEvent(new ParticleEvent(ParticleEvent.BOUNDING_BOX_COLLISION,_loc4_));
            }
         }
         if(_loc4_.velY > 0 && (_loc6_ = _loc4_.y + _loc5_) >= this._bottom)
         {
            _loc4_.velY = -_loc4_.velY * this._bounce;
            _loc4_.y += 2 * (this._bottom - _loc6_);
            if(param1.hasEventListener(ParticleEvent.BOUNDING_BOX_COLLISION))
            {
               param1.dispatchEvent(new ParticleEvent(ParticleEvent.BOUNDING_BOX_COLLISION,_loc4_));
            }
         }
         else if(_loc4_.velY < 0 && (_loc6_ = _loc4_.y - _loc5_) <= this._top)
         {
            _loc4_.velY = -_loc4_.velY * this._bounce;
            _loc4_.y += 2 * (this._top - _loc6_);
            if(param1.hasEventListener(ParticleEvent.BOUNDING_BOX_COLLISION))
            {
               param1.dispatchEvent(new ParticleEvent(ParticleEvent.BOUNDING_BOX_COLLISION,_loc4_));
            }
         }
      }
   }
}

