package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.emitters.Emitter2D;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class MutualGravity extends ActionBase
   {
      private var _power:Number;
      
      private var _maxDistance:Number;
      
      private var _maxDistanceSq:Number;
      
      private var _epsilonSq:Number;
      
      private var _gravityConst:Number = 1000;
      
      public function MutualGravity(param1:Number = 0, param2:Number = 0, param3:Number = 1)
      {
         super();
         priority = 10;
         this.power = param1;
         this.maxDistance = param2;
         this.epsilon = param3;
      }
      
      public function get power() : Number
      {
         return this._power / this._gravityConst;
      }
      
      public function set power(param1:Number) : void
      {
         this._power = param1 * this._gravityConst;
      }
      
      public function get maxDistance() : Number
      {
         return this._maxDistance;
      }
      
      public function set maxDistance(param1:Number) : void
      {
         this._maxDistance = param1;
         this._maxDistanceSq = param1 * param1;
      }
      
      public function get epsilon() : Number
      {
         return Math.sqrt(this._epsilonSq);
      }
      
      public function set epsilon(param1:Number) : void
      {
         this._epsilonSq = param1 * param1;
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
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(param2.mass == 0)
         {
            return;
         }
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Emitter2D = Emitter2D(param1);
         var _loc6_:Array = _loc5_.particlesArray;
         var _loc9_:int = int(_loc6_.length);
         _loc8_ = _loc4_.sortID + 1;
         while(_loc8_ < _loc9_)
         {
            _loc7_ = _loc6_[_loc8_];
            if(_loc7_.mass != 0)
            {
               _loc13_ = _loc7_.x - _loc4_.x;
               if(_loc13_ > this._maxDistance)
               {
                  break;
               }
               _loc14_ = _loc7_.y - _loc4_.y;
               if(!(_loc14_ > this._maxDistance || _loc14_ < -this._maxDistance))
               {
                  _loc12_ = _loc14_ * _loc14_ + _loc13_ * _loc13_;
                  if(_loc12_ <= this._maxDistanceSq && _loc12_ > 0)
                  {
                     _loc11_ = Math.sqrt(_loc12_);
                     if(_loc12_ < this._epsilonSq)
                     {
                        _loc12_ = this._epsilonSq;
                     }
                     _loc10_ = this._power * param3 / (_loc12_ * _loc11_);
                     _loc4_.velX += (_loc13_ = _loc13_ * _loc10_) * _loc7_.mass;
                     _loc4_.velY += (_loc14_ = _loc14_ * _loc10_) * _loc7_.mass;
                     _loc7_.velX -= _loc13_ * _loc4_.mass;
                     _loc7_.velY -= _loc14_ * _loc4_.mass;
                  }
               }
            }
            _loc8_++;
         }
      }
   }
}

