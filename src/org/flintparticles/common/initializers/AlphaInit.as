package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class AlphaInit extends InitializerBase
   {
      private var _min:Number;
      
      private var _max:Number;
      
      public function AlphaInit(param1:Number = 1, param2:Number = NaN)
      {
         super();
         priority = -10;
         this._min = param1;
         if(isNaN(param2))
         {
            this._max = this._min;
         }
         else
         {
            this._max = param2;
         }
      }
      
      public function get minAlpha() : Number
      {
         return this._min;
      }
      
      public function set minAlpha(param1:Number) : void
      {
         this._min = param1;
      }
      
      public function get maxAlpha() : Number
      {
         return this._max;
      }
      
      public function set maxAlpha(param1:Number) : void
      {
         this._max = param1;
      }
      
      public function get alpha() : Number
      {
         return this._min == this._max ? this._min : (this._max + this._min) / 2;
      }
      
      public function set alpha(param1:Number) : void
      {
         this._max = this._min = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:Number = NaN;
         if(this._max == this._min)
         {
            _loc3_ = this._min;
         }
         else
         {
            _loc3_ = this._min + Math.random() * (this._max - this._min);
         }
         param2.color = param2.color & 0xFFFFFF | Math.round(_loc3_ * 255) << 24;
      }
   }
}

