package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class TargetRotateVelocity extends ActionBase
   {
      private var _vel:Number;
      
      private var _rate:Number;
      
      public function TargetRotateVelocity(param1:Number = 0, param2:Number = 0.1)
      {
         super();
         this.targetVelocity = param1;
         this.rate = param2;
      }
      
      public function get targetVelocity() : Number
      {
         return this._vel;
      }
      
      public function set targetVelocity(param1:Number) : void
      {
         this._vel = param1;
      }
      
      public function get rate() : Number
      {
         return this._rate;
      }
      
      public function set rate(param1:Number) : void
      {
         this._rate = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         _loc4_.angVelocity += (this._vel - _loc4_.angVelocity) * this._rate * param3;
      }
   }
}

