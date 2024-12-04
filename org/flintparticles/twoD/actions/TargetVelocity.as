package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class TargetVelocity extends ActionBase
   {
      private var _velX:Number;
      
      private var _velY:Number;
      
      private var _rate:Number;
      
      public function TargetVelocity(param1:Number = 0, param2:Number = 0, param3:Number = 0.1)
      {
         super();
         this.targetVelocityX = param1;
         this.targetVelocityY = param2;
         this.rate = param3;
      }
      
      public function get targetVelocityY() : Number
      {
         return this._velY;
      }
      
      public function set targetVelocityY(param1:Number) : void
      {
         this._velY = param1;
      }
      
      public function get targetVelocityX() : Number
      {
         return this._velX;
      }
      
      public function set targetVelocityX(param1:Number) : void
      {
         this._velX = param1;
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
         _loc4_.velX += (this._velX - _loc4_.velX) * this._rate * param3;
         _loc4_.velY += (this._velY - _loc4_.velY) * this._rate * param3;
      }
   }
}

