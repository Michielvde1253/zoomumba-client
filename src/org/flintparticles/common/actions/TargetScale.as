package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class TargetScale extends ActionBase
   {
      private var _scale:Number;
      
      private var _rate:Number;
      
      public function TargetScale(param1:Number = 1, param2:Number = 0.1)
      {
         super();
         this._scale = param1;
         this._rate = param2;
      }
      
      public function get targetScale() : Number
      {
         return this._scale;
      }
      
      public function set targetScale(param1:Number) : void
      {
         this._scale = param1;
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
         param2.scale += (this._scale - param2.scale) * this._rate * param3;
      }
   }
}

