package org.flintparticles.twoD.actions
{
   import flash.geom.Point;
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.initializers.Initializer;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.zones.Zone2D;
   
   public class TweenToZone extends ActionBase implements Initializer
   {
      private var _zone:Zone2D;
      
      public function TweenToZone(param1:Zone2D)
      {
         super();
         this._zone = param1;
         priority = -10;
      }
      
      public function get zone() : Zone2D
      {
         return this._zone;
      }
      
      public function set zone(param1:Zone2D) : void
      {
         this._zone = param1;
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         if(!param1.hasInitializer(this))
         {
            param1.addInitializer(this);
         }
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         param1.removeInitializer(this);
      }
      
      public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:Particle2D = Particle2D(param2);
         var _loc4_:Point = this._zone.getLocation();
         var _loc5_:TweenToZoneData = new TweenToZoneData(_loc3_.x,_loc3_.y,_loc4_.x,_loc4_.y);
         _loc3_.dictionary[this] = _loc5_;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc5_:TweenToZoneData = null;
         var _loc4_:Particle2D = Particle2D(param2);
         if(!_loc4_.dictionary[this])
         {
            this.initialize(param1,param2);
         }
         _loc5_ = _loc4_.dictionary[this];
         _loc4_.x = _loc5_.endX + _loc5_.diffX * _loc4_.energy;
         _loc4_.y = _loc5_.endY + _loc5_.diffY * _loc4_.energy;
      }
   }
}

class TweenToZoneData
{
   public var diffX:Number;
   
   public var diffY:Number;
   
   public var endX:Number;
   
   public var endY:Number;
   
   public function TweenToZoneData(param1:Number, param2:Number, param3:Number, param4:Number)
   {
      super();
      this.diffX = param1 - param3;
      this.diffY = param2 - param4;
      this.endX = param3;
      this.endY = param4;
   }
}
