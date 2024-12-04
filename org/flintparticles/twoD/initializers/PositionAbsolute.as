package org.flintparticles.twoD.initializers
{
   import flash.geom.Point;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.initializers.InitializerBase;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.zones.Zone2D;
   
   public class PositionAbsolute extends InitializerBase
   {
      private var _zone:Zone2D;
      
      public function PositionAbsolute(param1:Zone2D = null)
      {
         super();
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
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:Particle2D = null;
         _loc3_ = Particle2D(param2);
         var _loc4_:Point = this._zone.getLocation();
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.previousX = _loc3_.x;
         _loc3_.previousY = _loc3_.y;
      }
   }
}

