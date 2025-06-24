package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class GravityWell extends ActionBase
   {
      private var _x:Number;
      
      private var _y:Number;
      
      private var _power:Number;
      
      private var _epsilonSq:Number;
      
      private var _gravityConst:Number = 10000;
      
      public function GravityWell(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 100)
      {
         super();
         this.power = param1;
         this.x = param2;
         this.y = param3;
         this.epsilon = param4;
      }
      
      public function get power() : Number
      {
         return this._power / this._gravityConst;
      }
      
      public function set power(param1:Number) : void
      {
         this._power = param1 * this._gravityConst;
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
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         if(param2.mass == 0)
         {
            return;
         }
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = this._x - _loc4_.x;
         var _loc6_:Number = this._y - _loc4_.y;
         var _loc7_:Number = _loc5_ * _loc5_ + _loc6_ * _loc6_;
         if(_loc7_ == 0)
         {
            return;
         }
         var _loc8_:Number = Math.sqrt(_loc7_);
         if(_loc7_ < this._epsilonSq)
         {
            _loc7_ = this._epsilonSq;
         }
         var _loc9_:Number = this._power * param3 / (_loc7_ * _loc8_);
         _loc4_.velX += _loc5_ * _loc9_;
         _loc4_.velY += _loc6_ * _loc9_;
      }
   }
}

