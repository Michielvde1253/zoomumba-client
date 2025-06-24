package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class TweenPosition extends ActionBase
   {
      private var _diffX:Number = 0;
      
      private var _endX:Number = 0;
      
      private var _diffY:Number = 0;
      
      private var _endY:Number = 0;
      
      public function TweenPosition(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.startX = param1;
         this.endX = param3;
         this.startY = param2;
         this.endY = param4;
      }
      
      public function get startX() : Number
      {
         return this._endX + this._diffX;
      }
      
      public function set startX(param1:Number) : void
      {
         this._diffX = param1 - this._endX;
      }
      
      public function get endX() : Number
      {
         return this._endX;
      }
      
      public function set endX(param1:Number) : void
      {
         this._diffX = this._endX + this._diffX - param1;
         this._endX = param1;
      }
      
      public function get startY() : Number
      {
         return this._endY + this._diffY;
      }
      
      public function set startY(param1:Number) : void
      {
         this._diffY = param1 - this._endY;
      }
      
      public function get endY() : Number
      {
         return this._endY;
      }
      
      public function set endY(param1:Number) : void
      {
         this._diffY = this._endY + this._diffY - param1;
         this._endY = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         _loc4_.x = this._endX + this._diffX * _loc4_.energy;
         _loc4_.y = this._endY + this._diffY * _loc4_.energy;
      }
   }
}

