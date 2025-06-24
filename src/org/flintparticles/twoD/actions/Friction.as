package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class Friction extends ActionBase
   {
      private var _friction:Number;
      
      public function Friction(param1:Number = 0)
      {
         super();
         this.friction = param1;
      }
      
      public function get friction() : Number
      {
         return this._friction;
      }
      
      public function set friction(param1:Number) : void
      {
         this._friction = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = _loc4_.velX * _loc4_.velX + _loc4_.velY * _loc4_.velY;
         if(_loc5_ == 0)
         {
            return;
         }
         _loc6_ = 1 - this._friction * param3 / (Math.sqrt(_loc5_) * _loc4_.mass);
         if(_loc6_ < 0)
         {
            _loc4_.velX = 0;
            _loc4_.velY = 0;
         }
         else
         {
            _loc4_.velX *= _loc6_;
            _loc4_.velY *= _loc6_;
         }
      }
   }
}

