package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class ScaleAll extends ActionBase
   {
      private var _diffScale:Number = 0;
      
      private var _endScale:Number = 1;
      
      public function ScaleAll(param1:Number = 1, param2:Number = 1)
      {
         super();
         this.startScale = param1;
         this.endScale = param2;
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
         var _loc4_:Number = this._endScale + this._diffScale * param2.energy;
         var _loc5_:Number = _loc4_ / param2.scale;
         param2.scale = _loc4_;
         param2.mass *= _loc5_ * _loc5_;
         param2.collisionRadius *= _loc5_;
      }
   }
}

