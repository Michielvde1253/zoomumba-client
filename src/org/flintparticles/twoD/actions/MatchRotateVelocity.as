package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.emitters.Emitter2D;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class MatchRotateVelocity extends ActionBase
   {
      private var _max:Number;
      
      private var _maxSq:Number;
      
      private var _acc:Number;
      
      public function MatchRotateVelocity(param1:Number = 0, param2:Number = 0)
      {
         super();
         priority = 10;
         this.maxDistance = param1;
         this.acceleration = param2;
      }
      
      public function get maxDistance() : Number
      {
         return this._max;
      }
      
      public function set maxDistance(param1:Number) : void
      {
         this._max = param1;
         this._maxSq = param1 * param1;
      }
      
      public function get acceleration() : Number
      {
         return this._acc;
      }
      
      public function set acceleration(param1:Number) : void
      {
         this._acc = param1;
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         Emitter2D(param1).spaceSort = true;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc7_:Particle2D = null;
         var _loc8_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Emitter2D = Emitter2D(param1);
         var _loc6_:Array = _loc5_.particlesArray;
         var _loc9_:int = int(_loc6_.length);
         var _loc13_:Number = 0;
         var _loc14_:int = 0;
         _loc8_ = _loc4_.sortID - 1;
         while(_loc8_ >= 0)
         {
            _loc7_ = _loc6_[_loc8_];
            _loc11_ = _loc4_.x - _loc7_.x;
            if(_loc11_ > this._max)
            {
               break;
            }
            _loc12_ = _loc7_.y - _loc4_.y;
            if(!(_loc12_ > this._max || _loc12_ < -this._max))
            {
               _loc10_ = _loc12_ * _loc12_ + _loc11_ * _loc11_;
               if(_loc10_ <= this._maxSq)
               {
                  _loc13_ += _loc7_.angVelocity;
                  _loc14_++;
               }
            }
            _loc8_--;
         }
         _loc8_ = _loc4_.sortID + 1;
         while(_loc8_ < _loc9_)
         {
            _loc7_ = _loc6_[_loc8_];
            _loc11_ = _loc7_.x - _loc4_.x;
            if(_loc11_ > this._max)
            {
               break;
            }
            _loc12_ = _loc7_.y - _loc4_.y;
            if(!(_loc12_ > this._max || _loc12_ < -this._max))
            {
               _loc10_ = _loc12_ * _loc12_ + _loc11_ * _loc11_;
               if(_loc10_ <= this._maxSq)
               {
                  _loc13_ += _loc7_.angVelocity;
                  _loc14_++;
               }
            }
            _loc8_++;
         }
         if(_loc14_ != 0)
         {
            _loc13_ = _loc13_ / _loc14_ - _loc4_.angVelocity;
            if(_loc13_ != 0)
            {
               _loc16_ = 1;
               if(_loc13_ < 0)
               {
                  _loc16_ = -1;
                  _loc13_ = -_loc13_;
               }
               _loc15_ = param3 * this._acc;
               if(_loc15_ > _loc13_)
               {
                  _loc15_ = _loc13_;
               }
               _loc4_.angVelocity += _loc15_ * _loc16_;
            }
         }
      }
   }
}

