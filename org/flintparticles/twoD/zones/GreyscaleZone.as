package org.flintparticles.twoD.zones
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import org.flintparticles.common.utils.FastWeightedArray;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class GreyscaleZone implements Zone2D
   {
      private var _bitmapData:BitmapData;
      
      private var _offsetX:Number;
      
      private var _offsetY:Number;
      
      private var _scaleX:Number;
      
      private var _scaleY:Number;
      
      private var _validPoints:FastWeightedArray;
      
      public function GreyscaleZone(param1:BitmapData = null, param2:Number = 0, param3:Number = 0, param4:Number = 1, param5:Number = 1)
      {
         super();
         this._bitmapData = param1;
         this._offsetX = param2;
         this._offsetY = param3;
         this._scaleX = param4;
         this._scaleY = param5;
         this.invalidate();
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this._bitmapData = param1;
         this.invalidate();
      }
      
      public function get offsetX() : Number
      {
         return this._offsetX;
      }
      
      public function set offsetX(param1:Number) : void
      {
         this._offsetX = param1;
      }
      
      public function get offsetY() : Number
      {
         return this._offsetY;
      }
      
      public function set offsetY(param1:Number) : void
      {
         this._offsetY = param1;
      }
      
      public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         this._scaleX = param1;
      }
      
      public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         this._scaleY = param1;
      }
      
      public function invalidate() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         if(!this._bitmapData)
         {
            return;
         }
         this._validPoints = new FastWeightedArray();
         var _loc1_:uint = 0;
         while(_loc1_ < this.bitmapData.width)
         {
            _loc2_ = 0;
            while(_loc2_ < this.bitmapData.height)
            {
               _loc3_ = this._bitmapData.getPixel32(_loc1_,_loc2_);
               _loc4_ = 0.11 * (_loc3_ & 0xFF) + 0.59 * (_loc3_ >>> 8 & 0xFF) + 0.3 * (_loc3_ >>> 16 & 0xFF);
               if(_loc4_ != 0)
               {
                  this._validPoints.add(new Point(_loc1_,_loc2_),_loc4_ / 255);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:uint = 0;
         if(param1 >= this._offsetX && param1 <= this._offsetX + this._bitmapData.width * this.scaleX && param2 >= this._offsetY && param2 <= this._offsetY + this._bitmapData.height * this.scaleY)
         {
            _loc3_ = this._bitmapData.getPixel32(Math.round((param1 - this._offsetX) / this._scaleX),Math.round((param2 - this._offsetY) / this._scaleY));
            return (_loc3_ & 0xFFFFFF) != 0;
         }
         return false;
      }
      
      public function getLocation() : Point
      {
         var _loc1_:Point = Point(this._validPoints.getRandomValue()).clone();
         _loc1_.x = _loc1_.x * this._scaleX + this._offsetX;
         _loc1_.y = _loc1_.y * this._scaleY + this._offsetY;
         return _loc1_;
      }
      
      public function getArea() : Number
      {
         return this._validPoints.totalRatios * this._scaleX * this._scaleY;
      }
      
      public function collideParticle(param1:Particle2D, param2:Number = 1) : Boolean
      {
         if(this.contains(param1.x,param1.y) != this.contains(param1.previousX,param1.previousY))
         {
            param1.x = param1.previousX;
            param1.y = param1.previousY;
            param1.velX = -param2 * param1.velX;
            param1.velY = -param2 * param1.velY;
            return true;
         }
         return false;
      }
   }
}

