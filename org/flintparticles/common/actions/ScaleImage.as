package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class ScaleImage extends ActionBase
   {
      private var _diffScale:Number;
      
      private var _endScale:Number;
      
      public function ScaleImage(param1:Number = 1, param2:Number = 1)
      {
         super();
         this._diffScale = param1 - param2;
         this._endScale = param2;
      }
      
      public function get startScale() : Number
      {
         return this._endScale + this._diffScale;
      }
      
      public function set startScale(param1:Number) : void
      {
         this._diffScale = param1 - this._endScale;
      }
      
      public function get endScale() : Number
      {
         return this._endScale;
      }
      
      public function set endScale(param1:Number) : void
      {
         this._diffScale = this._endScale + this._diffScale - param1;
         this._endScale = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         param2.scale = this._endScale + this._diffScale * param2.energy;
      }
   }
}

