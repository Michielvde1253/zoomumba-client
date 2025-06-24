package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.utils.interpolateColors;
   
   public class ColorChange extends ActionBase
   {
      private var _startColor:uint;
      
      private var _endColor:uint;
      
      public function ColorChange(param1:uint = 16777215, param2:uint = 16777215)
      {
         super();
         this._startColor = param1;
         this._endColor = param2;
      }
      
      public function get startColor() : uint
      {
         return this._startColor;
      }
      
      public function set startColor(param1:uint) : void
      {
         this._startColor = param1;
      }
      
      public function get endColor() : uint
      {
         return this._endColor;
      }
      
      public function set endColor(param1:uint) : void
      {
         this._endColor = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         param2.color = interpolateColors(this._startColor,this._endColor,param2.energy);
      }
   }
}

