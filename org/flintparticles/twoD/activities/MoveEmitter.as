package org.flintparticles.twoD.activities
{
   import org.flintparticles.common.activities.ActivityBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.twoD.emitters.Emitter2D;
   
   public class MoveEmitter extends ActivityBase
   {
      private var _velX:Number;
      
      private var _velY:Number;
      
      public function MoveEmitter(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
      }
      
      public function get x() : Number
      {
         return this._velX;
      }
      
      public function set x(param1:Number) : void
      {
         this._velX = param1;
      }
      
      public function get y() : Number
      {
         return this._velY;
      }
      
      public function set y(param1:Number) : void
      {
         this._velY = param1;
      }
      
      override public function update(param1:Emitter, param2:Number) : void
      {
         var _loc3_:Emitter2D = Emitter2D(param1);
         _loc3_.x += this._velX * param2;
         _loc3_.y += this._velY * param2;
      }
   }
}

