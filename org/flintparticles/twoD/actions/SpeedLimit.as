package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class SpeedLimit extends ActionBase
   {
      private var _limit:Number;
      
      private var _limitSq:Number;
      
      private var _isMinimum:Boolean;
      
      public function SpeedLimit(param1:Number = 1.7976931348623157e+308, param2:Boolean = false)
      {
         super();
         priority = -5;
         this.limit = param1;
         this.isMinimum = param2;
      }
      
      public function get limit() : Number
      {
         return this._limit;
      }
      
      public function set limit(param1:Number) : void
      {
         this._limit = param1;
         this._limitSq = param1 * param1;
      }
      
      public function get isMinimum() : Boolean
      {
         return this._isMinimum;
      }
      
      public function set isMinimum(param1:Boolean) : void
      {
         this._isMinimum = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = _loc4_.velX * _loc4_.velX + _loc4_.velY * _loc4_.velY;
         if(this._isMinimum && _loc5_ < this._limitSq || !this._isMinimum && _loc5_ > this._limitSq)
         {
            _loc6_ = this._limit / Math.sqrt(_loc5_);
            _loc4_.velX *= _loc6_;
            _loc4_.velY *= _loc6_;
         }
      }
   }
}

