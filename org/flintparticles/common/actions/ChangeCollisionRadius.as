package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class ChangeCollisionRadius extends ActionBase
   {
      private var _diffRadius:Number;
      
      private var _endRadius:Number;
      
      public function ChangeCollisionRadius(param1:Number = 1, param2:Number = 1)
      {
         super();
         this._diffRadius = param1 - param2;
         this._endRadius = param2;
      }
      
      public function get startRadius() : Number
      {
         return this._endRadius + this._diffRadius;
      }
      
      public function set startRadius(param1:Number) : void
      {
         this._diffRadius = param1 - this._endRadius;
      }
      
      public function get endRadius() : Number
      {
         return this._endRadius;
      }
      
      public function set endRadius(param1:Number) : void
      {
         this._diffRadius = this._endRadius + this._diffRadius - param1;
         this._endRadius = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         param2.collisionRadius = this._endRadius + this._diffRadius * param2.energy;
      }
   }
}

