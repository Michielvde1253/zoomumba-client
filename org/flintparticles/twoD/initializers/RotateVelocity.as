package org.flintparticles.twoD.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.initializers.InitializerBase;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class RotateVelocity extends InitializerBase
   {
      private var _max:Number;
      
      private var _min:Number;
      
      public function RotateVelocity(param1:Number = 0, param2:Number = NaN)
      {
         super();
         this.minAngVelocity = param1;
         this.maxAngVelocity = param2;
      }
      
      public function get minAngVelocity() : Number
      {
         return this._min;
      }
      
      public function set minAngVelocity(param1:Number) : void
      {
         this._min = param1;
      }
      
      public function get maxAngVelocity() : Number
      {
         return this._max;
      }
      
      public function set maxAngVelocity(param1:Number) : void
      {
         this._max = param1;
      }
      
      public function get angVelocity() : Number
      {
         return this._min == this._max ? this._min : (this._max + this._min) / 2;
      }
      
      public function set angVelocity(param1:Number) : void
      {
         this._max = this._min = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:Particle2D = Particle2D(param2);
         if(isNaN(this._max))
         {
            _loc3_.angVelocity = this._min;
         }
         else
         {
            _loc3_.angVelocity = this._min + Math.random() * (this._max - this._min);
         }
      }
   }
}

