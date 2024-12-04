package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.ParticleEvent;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.zones.Zone2D;
   
   public class CollisionZone extends ActionBase
   {
      private var _bounce:Number;
      
      private var _zone:Zone2D;
      
      public function CollisionZone(param1:Zone2D = null, param2:Number = 1)
      {
         super();
         priority = -30;
         this.bounce = param2;
         this.zone = param1;
      }
      
      public function get zone() : Zone2D
      {
         return this._zone;
      }
      
      public function set zone(param1:Zone2D) : void
      {
         this._zone = param1;
      }
      
      public function get bounce() : Number
      {
         return this._bounce;
      }
      
      public function set bounce(param1:Number) : void
      {
         this._bounce = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc5_:ParticleEvent = null;
         var _loc4_:Boolean = this._zone.collideParticle(Particle2D(param2),this._bounce);
         if((_loc4_) && param1.hasEventListener(ParticleEvent.ZONE_COLLISION))
         {
            _loc5_ = new ParticleEvent(ParticleEvent.ZONE_COLLISION,param2);
            _loc5_.otherObject = this._zone;
            param1.dispatchEvent(_loc5_);
         }
      }
   }
}

