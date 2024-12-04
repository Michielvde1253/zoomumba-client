package org.flintparticles.twoD.zones
{
   import flash.geom.Point;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class DiscSectorZone implements Zone2D
   {
      private static var TWOPI:Number = Math.PI * 2;
      
      private var _center:Point;
      
      private var _innerRadius:Number;
      
      private var _outerRadius:Number;
      
      private var _innerSq:Number;
      
      private var _outerSq:Number;
      
      private var _minAngle:Number;
      
      private var _maxAngle:Number;
      
      private var _minAllowed:Number;
      
      private var _minNormal:Point;
      
      private var _maxNormal:Point;
      
      public function DiscSectorZone(param1:Point = null, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super();
         if(param2 < param3)
         {
            throw new Error("The outerRadius (" + param2 + ") can\'t be smaller than the innerRadius (" + param3 + ") in your DiscSectorZone. N.B. the outerRadius is the second argument in the constructor and the innerRadius is the third argument.");
         }
         this._center = !!param1 ? param1.clone() : new Point(0,0);
         this._innerRadius = param3;
         this._outerRadius = param2;
         this._innerSq = this._innerRadius * this._innerRadius;
         this._outerSq = this._outerRadius * this._outerRadius;
         this._minAngle = param4;
         this._maxAngle = param5;
         if(!isNaN(this._maxAngle))
         {
            while(this._maxAngle > TWOPI)
            {
               this._maxAngle -= TWOPI;
            }
            while(this._maxAngle < 0)
            {
               this._maxAngle += TWOPI;
            }
            this._minAllowed = this._maxAngle - TWOPI;
            if(!isNaN(this._minAngle))
            {
               if(param4 == param5)
               {
                  this._minAngle = this._maxAngle;
               }
               else
               {
                  this._minAngle = this.clamp(this._minAngle);
               }
            }
            this.calculateNormals();
         }
      }
      
      private function clamp(param1:Number) : Number
      {
         if(!isNaN(this._maxAngle))
         {
            while(param1 > this._maxAngle)
            {
               param1 -= TWOPI;
            }
            while(param1 < this._minAllowed)
            {
               param1 += TWOPI;
            }
         }
         return param1;
      }
      
      private function calculateNormals() : void
      {
         if(!isNaN(this._minAngle))
         {
            this._minNormal = new Point(Math.sin(this._minAngle),-Math.cos(this._minAngle));
            this._minNormal.normalize(1);
         }
         if(!isNaN(this._maxAngle))
         {
            this._maxNormal = new Point(-Math.sin(this._maxAngle),Math.cos(this._maxAngle));
            this._maxNormal.normalize(1);
         }
      }
      
      public function get center() : Point
      {
         return this._center;
      }
      
      public function set center(param1:Point) : void
      {
         this._center = param1;
      }
      
      public function get centerX() : Number
      {
         return this._center.x;
      }
      
      public function set centerX(param1:Number) : void
      {
         this._center.x = param1;
      }
      
      public function get centerY() : Number
      {
         return this._center.y;
      }
      
      public function set centerY(param1:Number) : void
      {
         this._center.y = param1;
      }
      
      public function get innerRadius() : Number
      {
         return this._innerRadius;
      }
      
      public function set innerRadius(param1:Number) : void
      {
         this._innerRadius = param1;
         this._innerSq = this._innerRadius * this._innerRadius;
      }
      
      public function get outerRadius() : Number
      {
         return this._outerRadius;
      }
      
      public function set outerRadius(param1:Number) : void
      {
         this._outerRadius = param1;
         this._outerSq = this._outerRadius * this._outerRadius;
      }
      
      public function get minAngle() : Number
      {
         return this._minAngle;
      }
      
      public function set minAngle(param1:Number) : void
      {
         this._minAngle = this.clamp(param1);
         this.calculateNormals();
      }
      
      public function get maxAngle() : Number
      {
         return this._maxAngle;
      }
      
      public function set maxAngle(param1:Number) : void
      {
         this._maxAngle = param1;
         while(this._maxAngle > TWOPI)
         {
            this._maxAngle -= TWOPI;
         }
         while(this._maxAngle < 0)
         {
            this._maxAngle += TWOPI;
         }
         this._minAllowed = this._maxAngle - TWOPI;
         this._minAngle = this.clamp(this._minAngle);
         this.calculateNormals();
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         param1 -= this._center.x;
         param2 -= this._center.y;
         var _loc3_:Number = param1 * param1 + param2 * param2;
         if(_loc3_ > this._outerSq || _loc3_ < this._innerSq)
         {
            return false;
         }
         var _loc4_:Number = Math.atan2(param2,param1);
         _loc4_ = this.clamp(_loc4_);
         return _loc4_ >= this._minAngle;
      }
      
      public function getLocation() : Point
      {
         var _loc1_:Number = Math.random();
         var _loc2_:Point = Point.polar(this._innerRadius + (1 - _loc1_ * _loc1_) * (this._outerRadius - this._innerRadius),this._minAngle + Math.random() * (this._maxAngle - this._minAngle));
         _loc2_.x += this._center.x;
         _loc2_.y += this._center.y;
         return _loc2_;
      }
      
      public function getArea() : Number
      {
         return Math.PI * this._outerSq - Math.PI * this._innerSq;
      }
      
      public function collideParticle(param1:Particle2D, param2:Number = 1) : Boolean
      {
         var _loc13_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc3_:Number = param1.x - this._center.x;
         var _loc4_:Number = param1.y - this._center.y;
         var _loc5_:Number = param1.previousX - this._center.x;
         var _loc6_:Number = param1.previousY - this._center.y;
         var _loc7_:Boolean = true;
         var _loc8_:Boolean = true;
         var _loc9_:Number = _loc5_ * _loc5_ + _loc6_ * _loc6_;
         var _loc10_:Number = _loc3_ * _loc3_ + _loc4_ * _loc4_;
         if(_loc9_ > this._outerSq || _loc9_ < this._innerSq)
         {
            _loc8_ = false;
         }
         if(_loc10_ > this._outerSq || _loc10_ < this._innerSq)
         {
            _loc7_ = false;
         }
         if(!_loc7_ && !_loc8_)
         {
            return false;
         }
         var _loc11_:Number = this.clamp(Math.atan2(_loc6_,_loc5_));
         var _loc12_:Number = this.clamp(Math.atan2(_loc4_,_loc3_));
         _loc8_ &&= _loc11_ >= this.minAngle;
         _loc7_ &&= _loc12_ >= this._minAngle;
         if(_loc7_ == _loc8_)
         {
            return false;
         }
         var _loc14_:Number = param1.velX * _loc3_ + param1.velY * _loc4_;
         if(_loc7_)
         {
            if(_loc9_ > this._outerSq)
            {
               _loc13_ = (1 + param2) * _loc14_ / _loc10_;
               param1.velX -= _loc13_ * _loc3_;
               param1.velY -= _loc13_ * _loc4_;
            }
            else if(_loc9_ < this._innerSq)
            {
               _loc13_ = (1 + param2) * _loc14_ / _loc10_;
               param1.velX -= _loc13_ * _loc3_;
               param1.velY -= _loc13_ * _loc4_;
            }
            if(_loc11_ < this._minAngle)
            {
               if(_loc11_ < (this._minAllowed + this._minAngle) / 2)
               {
                  _loc16_ = this._maxNormal.x * param1.velX + this._maxNormal.y * param1.velY;
                  _loc15_ = (1 + param2) * _loc16_;
                  param1.velX -= _loc15_ * this._maxNormal.x;
                  param1.velY -= _loc15_ * this._maxNormal.y;
               }
               else
               {
                  _loc16_ = this._minNormal.x * param1.velX + this._minNormal.y * param1.velY;
                  _loc15_ = (1 + param2) * _loc16_;
                  param1.velX -= _loc15_ * this._minNormal.x;
                  param1.velY -= _loc15_ * this._minNormal.y;
               }
            }
         }
         else
         {
            if(_loc10_ > this._outerSq)
            {
               _loc13_ = (1 + param2) * _loc14_ / _loc10_;
               param1.velX -= _loc13_ * _loc3_;
               param1.velY -= _loc13_ * _loc4_;
            }
            else if(_loc10_ < this._innerSq)
            {
               _loc13_ = (1 + param2) * _loc14_ / _loc10_;
               param1.velX -= _loc13_ * _loc3_;
               param1.velY -= _loc13_ * _loc4_;
            }
            if(_loc12_ < this._minAngle)
            {
               if(_loc12_ < (this._minAllowed + this._minAngle) / 2)
               {
                  _loc16_ = this._maxNormal.x * param1.velX + this._maxNormal.y * param1.velY;
                  _loc15_ = (1 + param2) * _loc16_;
                  param1.velX -= _loc15_ * this._maxNormal.x;
                  param1.velY -= _loc15_ * this._maxNormal.y;
               }
               else
               {
                  _loc16_ = this._minNormal.x * param1.velX + this._minNormal.y * param1.velY;
                  _loc15_ = (1 + param2) * _loc16_;
                  param1.velX -= _loc15_ * this._minNormal.x;
                  param1.velY -= _loc15_ * this._minNormal.y;
               }
            }
         }
         param1.x = param1.previousX;
         param1.y = param1.previousY;
         return true;
      }
   }
}

