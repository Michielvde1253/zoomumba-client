package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class CollisionRadiusInit extends InitializerBase
   {
      private var _radius:Number;
      
      public function CollisionRadiusInit(param1:Number = 1)
      {
         super();
         this._radius = param1;
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set radius(param1:Number) : void
      {
         this._radius = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.collisionRadius = this._radius;
      }
   }
}

