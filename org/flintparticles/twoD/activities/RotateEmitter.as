package org.flintparticles.twoD.activities
{
   import org.flintparticles.common.activities.ActivityBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.twoD.emitters.Emitter2D;
   
   public class RotateEmitter extends ActivityBase
   {
      private var _angularVelocity:Number;
      
      public function RotateEmitter(param1:Number = 0)
      {
         super();
         this.angularVelocity = param1;
      }
      
      public function get angularVelocity() : Number
      {
         return this._angularVelocity;
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         this._angularVelocity = param1;
      }
      
      override public function update(param1:Emitter, param2:Number) : void
      {
         var _loc3_:Emitter2D = Emitter2D(param1);
         _loc3_.rotRadians += this._angularVelocity * param2;
      }
   }
}

