package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class ChangeMass extends ActionBase
   {
      private var _diffMass:Number;
      
      private var _endMass:Number;
      
      public function ChangeMass(param1:Number = 1, param2:Number = 1)
      {
         super();
         this._diffMass = param1 - param2;
         this._endMass = param2;
      }
      
      public function get startMass() : Number
      {
         return this._endMass + this._diffMass;
      }
      
      public function set startMass(param1:Number) : void
      {
         this._diffMass = param1 - this._endMass;
      }
      
      public function get endMass() : Number
      {
         return this._endMass;
      }
      
      public function set endMass(param1:Number) : void
      {
         this._diffMass = this._endMass + this._diffMass - param1;
         this._endMass = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         param2.mass = this._endMass + this._diffMass * param2.energy;
      }
   }
}

