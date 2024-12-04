package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.zones.Zone2D;
   
   public class Jet extends ActionBase
   {
      private var _x:Number;
      
      private var _y:Number;
      
      private var _zone:Zone2D;
      
      private var _invert:Boolean;
      
      public function Jet(param1:Number = 0, param2:Number = 0, param3:Zone2D = null, param4:Boolean = false)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.zone = param3;
         this.invertZone = param4;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function get zone() : Zone2D
      {
         return this._zone;
      }
      
      public function set zone(param1:Zone2D) : void
      {
         this._zone = param1;
      }
      
      public function get invertZone() : Boolean
      {
         return this._invert;
      }
      
      public function set invertZone(param1:Boolean) : void
      {
         this._invert = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         if(this._zone.contains(_loc4_.x,_loc4_.y))
         {
            if(!this._invert)
            {
               _loc4_.velX += this._x * param3;
               _loc4_.velY += this._y * param3;
            }
         }
         else if(this._invert)
         {
            _loc4_.velX += this._x * param3;
            _loc4_.velY += this._y * param3;
         }
      }
   }
}

