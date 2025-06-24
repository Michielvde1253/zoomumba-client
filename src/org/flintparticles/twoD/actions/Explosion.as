package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.activities.FrameUpdatable;
   import org.flintparticles.common.activities.UpdateOnFrame;
   import org.flintparticles.common.behaviours.Resetable;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class Explosion extends ActionBase implements Resetable, FrameUpdatable
   {
      private static const POWER_FACTOR:Number = 100000;
      
      private var _updateActivity:UpdateOnFrame;
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _power:Number;
      
      private var _depth:Number;
      
      private var _invDepth:Number;
      
      private var _epsilonSq:Number;
      
      private var _oldRadius:Number = 0;
      
      private var _radius:Number = 0;
      
      private var _radiusChange:Number = 0;
      
      private var _expansionRate:Number = 500;
      
      public function Explosion(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 300, param5:Number = 10, param6:Number = 1)
      {
         super();
         this.power = param1;
         this.x = param2;
         this.y = param3;
         this.expansionRate = param4;
         this.depth = param5;
         this.epsilon = param6;
      }
      
      public function get power() : Number
      {
         return this._power / POWER_FACTOR;
      }
      
      public function set power(param1:Number) : void
      {
         this._power = param1 * POWER_FACTOR;
      }
      
      public function get expansionRate() : Number
      {
         return this._expansionRate;
      }
      
      public function set expansionRate(param1:Number) : void
      {
         this._expansionRate = param1;
      }
      
      public function get depth() : Number
      {
         return this._depth * 2;
      }
      
      public function set depth(param1:Number) : void
      {
         this._depth = param1 * 0.5;
         this._invDepth = 1 / this._depth;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
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
         this._updateActivity = new UpdateOnFrame(this);
         param1.addActivity(this._updateActivity);
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         if(this._updateActivity)
         {
            param1.removeActivity(this._updateActivity);
         }
      }
      
      public function reset() : void
      {
         this._radius = 0;
         this._oldRadius = 0;
         this._radiusChange = 0;
      }
      
      public function frameUpdate(param1:Emitter, param2:Number) : void
      {
         this._oldRadius = this._radius;
         this._radiusChange = this._expansionRate * param2;
         this._radius += this._radiusChange;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = _loc4_.x - this._x;
         var _loc6_:Number = _loc4_.y - this._y;
         var _loc7_:Number = _loc5_ * _loc5_ + _loc6_ * _loc6_;
         if(_loc7_ == 0)
         {
            _loc7_ = 0.02;
            _loc5_ = 0.1;
            _loc6_ = 0.1;
         }
         var _loc8_:Number = Math.sqrt(_loc7_);
         if(_loc8_ < this._oldRadius - this._depth)
         {
            return;
         }
         if(_loc8_ > this._radius + this._depth)
         {
            return;
         }
         var _loc9_:Number = _loc8_ < this._radius ? this._depth - this._radius + _loc8_ : this._depth - _loc8_ + this._radius;
         var _loc10_:Number = _loc8_ < this._oldRadius ? this._depth - this._oldRadius + _loc8_ : this._depth - _loc8_ + this._oldRadius;
         _loc9_ *= this._invDepth;
         _loc10_ *= this._invDepth;
         if(_loc9_ < 0)
         {
            param3 = param3 * (this._radiusChange + _loc9_) / this._radiusChange;
            _loc9_ = 0;
         }
         if(_loc10_ < 0)
         {
            param3 = param3 * (this._radiusChange + _loc10_) / this._radiusChange;
            _loc10_ = 0;
         }
         if(_loc8_ < this._oldRadius || _loc8_ > this._radius)
         {
            _loc11_ = param3 * this._power * (_loc9_ + _loc10_) / (this._radius * 2 * _loc8_ * _loc4_.mass);
         }
         else
         {
            _loc12_ = (1 - _loc10_) / this._radiusChange;
            _loc13_ = _loc12_ * param3 * this._power * (_loc10_ + 1);
            _loc14_ = (1 - _loc12_) * param3 * this._power * (_loc9_ + 1);
            _loc11_ = (_loc13_ + _loc14_) / (this._radius * 2 * _loc8_ * _loc4_.mass);
         }
         _loc4_.velX += _loc5_ * _loc11_;
         _loc4_.velY += _loc6_ * _loc11_;
      }
   }
}

