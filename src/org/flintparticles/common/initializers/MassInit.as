package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class MassInit extends InitializerBase
   {
      private var _mass:Number;
      
      public function MassInit(param1:Number = 1)
      {
         super();
         this._mass = param1;
      }
      
      public function get mass() : Number
      {
         return this._mass;
      }
      
      public function set mass(param1:Number) : void
      {
         this._mass = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.mass = this._mass;
      }
   }
}

