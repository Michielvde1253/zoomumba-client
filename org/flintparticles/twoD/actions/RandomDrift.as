package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class RandomDrift extends ActionBase
   {
      private var _sizeX:Number;
      
      private var _sizeY:Number;
      
      public function RandomDrift(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.driftX = param1;
         this.driftY = param2;
      }
      
      public function get driftX() : Number
      {
         return this._sizeX / 2;
      }
      
      public function set driftX(param1:Number) : void
      {
         this._sizeX = param1 * 2;
      }
      
      public function get driftY() : Number
      {
         return this._sizeY / 2;
      }
      
      public function set driftY(param1:Number) : void
      {
         this._sizeY = param1 * 2;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = null;
         _loc4_ = Particle2D(param2);
         _loc4_.velX += (Math.random() - 0.5) * this._sizeX * param3;
         _loc4_.velY += (Math.random() - 0.5) * this._sizeY * param3;
      }
   }
}

