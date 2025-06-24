package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class RotationalQuadraticDrag extends ActionBase
   {
      private var _drag:Number;
      
      public function RotationalQuadraticDrag(param1:Number = 0)
      {
         super();
         this.drag = param1;
      }
      
      public function get drag() : Number
      {
         return this._drag;
      }
      
      public function set drag(param1:Number) : void
      {
         this._drag = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         if(_loc4_.angVelocity == 0)
         {
            return;
         }
         var _loc5_:Number = 1 - this._drag * param3 * _loc4_.angVelocity / _loc4_.inertia;
         if(_loc5_ < 0)
         {
            _loc4_.angVelocity = 0;
         }
         else
         {
            _loc4_.angVelocity *= _loc5_;
         }
      }
   }
}

