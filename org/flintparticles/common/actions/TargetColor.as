package org.flintparticles.common.actions
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class TargetColor extends ActionBase
   {
      private var _red:uint;
      
      private var _green:uint;
      
      private var _blue:uint;
      
      private var _alpha:uint;
      
      private var _rate:Number;
      
      public function TargetColor(param1:uint = 16777215, param2:Number = 0.1)
      {
         super();
         this._red = param1 >>> 16 & 0xFF;
         this._green = param1 >>> 8 & 0xFF;
         this._blue = param1 & 0xFF;
         this._alpha = param1 >>> 24 & 0xFF;
         this._rate = param2;
      }
      
      public function get targetColor() : Number
      {
         return this._alpha << 24 | this._red << 16 | this._green << 8 | this._blue;
      }
      
      public function set targetColor(param1:Number) : void
      {
         this._red = param1 >>> 16 & 0xFF;
         this._green = param1 >>> 8 & 0xFF;
         this._blue = param1 & 0xFF;
         this._alpha = param1 >>> 24 & 0xFF;
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
         if(!param2.dictionary[this])
         {
            param2.dictionary[this] = new ColorFloat(param2.color);
         }
         var _loc4_:ColorFloat = ColorFloat(param2.dictionary[this]);
         var _loc5_:Number = this._rate * param3;
         if(_loc5_ > 1)
         {
            _loc5_ = 1;
         }
         var _loc6_:Number = 1 - _loc5_;
         _loc4_.red = _loc4_.red * _loc6_ + this._red * _loc5_;
         _loc4_.green = _loc4_.green * _loc6_ + this._green * _loc5_;
         _loc4_.blue = _loc4_.blue * _loc6_ + this._blue * _loc5_;
         _loc4_.alpha = _loc4_.alpha * _loc6_ + this._alpha * _loc5_;
         param2.color = _loc4_.getColor();
      }
   }
}

class ColorFloat
{
   public var red:Number;
   
   public var green:Number;
   
   public var blue:Number;
   
   public var alpha:Number;
   
   public function ColorFloat(param1:uint)
   {
      super();
      this.red = param1 >>> 16 & 0xFF;
      this.green = param1 >>> 8 & 0xFF;
      this.blue = param1 & 0xFF;
      this.alpha = param1 >>> 24 & 0xFF;
   }
   
   public function getColor() : uint
   {
      return Math.round(this.alpha) << 24 | Math.round(this.red) << 16 | Math.round(this.green) << 8 | Math.round(this.blue);
   }
}
