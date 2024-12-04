package org.flintparticles.twoD.zones
{
   import flash.geom.Point;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class RectangleZone implements Zone2D
   {
      private var _left:Number;
      
      private var _top:Number;
      
      private var _right:Number;
      
      private var _bottom:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function RectangleZone(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this._left = param1;
         this._top = param2;
         this._right = param3;
         this._bottom = param4;
         this._width = param3 - param1;
         this._height = param4 - param2;
      }
      
      public function get left() : Number
      {
         return this._left;
      }
      
      public function set left(param1:Number) : void
      {
         this._left = param1;
         if(!isNaN(this._right) && !isNaN(this._left))
         {
            this._width = this.right - this.left;
         }
      }
      
      public function get right() : Number
      {
         return this._right;
      }
      
      public function set right(param1:Number) : void
      {
         this._right = param1;
         if(!isNaN(this._right) && !isNaN(this._left))
         {
            this._width = this.right - this.left;
         }
      }
      
      public function get top() : Number
      {
         return this._top;
      }
      
      public function set top(param1:Number) : void
      {
         this._top = param1;
         if(!isNaN(this._top) && !isNaN(this._bottom))
         {
            this._height = this.bottom - this.top;
         }
      }
      
      public function get bottom() : Number
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         this._bottom = param1;
         if(!isNaN(this._top) && !isNaN(this._bottom))
         {
            this._height = this.bottom - this.top;
         }
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         return param1 >= this._left && param1 <= this._right && param2 >= this._top && param2 <= this._bottom;
      }
      
      public function getLocation() : Point
      {
         return new Point(this._left + Math.random() * this._width,this._top + Math.random() * this._height);
      }
      
      public function getArea() : Number
      {
         return this._width * this._height;
      }
      
      public function collideParticle(param1:Particle2D, param2:Number = 1) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         if(param1.velX > 0)
         {
            _loc3_ = param1.x + param1.collisionRadius;
            _loc4_ = param1.previousX + param1.collisionRadius;
            if(_loc4_ < this._left && _loc3_ >= this._left)
            {
               _loc5_ = param1.previousY + (param1.y - param1.previousY) * (this._left - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._top - param1.collisionRadius && _loc5_ <= this._bottom + param1.collisionRadius)
               {
                  param1.velX = -param1.velX * param2;
                  param1.x += 2 * (this._left - _loc3_);
                  _loc6_ = true;
               }
            }
            else if(_loc4_ <= this._right && _loc3_ > this._right)
            {
               _loc5_ = param1.previousY + (param1.y - param1.previousY) * (this._right - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._top - param1.collisionRadius && _loc5_ <= this._bottom + param1.collisionRadius)
               {
                  param1.velX = -param1.velX * param2;
                  param1.x += 2 * (this._right - _loc3_);
                  _loc6_ = true;
               }
            }
         }
         else if(param1.velX < 0)
         {
            _loc3_ = param1.x - param1.collisionRadius;
            _loc4_ = param1.previousX - param1.collisionRadius;
            if(_loc4_ > this._right && _loc3_ <= this._right)
            {
               _loc5_ = param1.previousY + (param1.y - param1.previousY) * (this._right - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._top - param1.collisionRadius && _loc5_ <= this._bottom + param1.collisionRadius)
               {
                  param1.velX = -param1.velX * param2;
                  param1.x += 2 * (this._right - _loc3_);
                  _loc6_ = true;
               }
            }
            else if(_loc4_ >= this._left && _loc3_ < this._left)
            {
               _loc5_ = param1.previousY + (param1.y - param1.previousY) * (this._left - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._top - param1.collisionRadius && _loc5_ <= this._bottom + param1.collisionRadius)
               {
                  param1.velX = -param1.velX * param2;
                  param1.x += 2 * (this._left - _loc3_);
                  _loc6_ = true;
               }
            }
         }
         if(param1.velY > 0)
         {
            _loc3_ = param1.y + param1.collisionRadius;
            _loc4_ = param1.previousY + param1.collisionRadius;
            if(_loc4_ < this._top && _loc3_ >= this._top)
            {
               _loc5_ = param1.previousX + (param1.x - param1.previousX) * (this._top - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._left - param1.collisionRadius && _loc5_ <= this._right + param1.collisionRadius)
               {
                  param1.velY = -param1.velY * param2;
                  param1.y += 2 * (this._top - _loc3_);
                  _loc6_ = true;
               }
            }
            else if(_loc4_ <= this._bottom && _loc3_ > this._bottom)
            {
               _loc5_ = param1.previousX + (param1.x - param1.previousX) * (this._bottom - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._left - param1.collisionRadius && _loc5_ <= this._right + param1.collisionRadius)
               {
                  param1.velY = -param1.velY * param2;
                  param1.y += 2 * (this._bottom - _loc3_);
                  _loc6_ = true;
               }
            }
         }
         else if(param1.velY < 0)
         {
            _loc3_ = param1.y - param1.collisionRadius;
            _loc4_ = param1.previousY - param1.collisionRadius;
            if(_loc4_ > this._bottom && _loc3_ <= this._bottom)
            {
               _loc5_ = param1.previousX + (param1.x - param1.previousX) * (this._bottom - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._left - param1.collisionRadius && _loc5_ <= this._right + param1.collisionRadius)
               {
                  param1.velY = -param1.velY * param2;
                  param1.y += 2 * (this._bottom - _loc3_);
                  _loc6_ = true;
               }
            }
            else if(_loc4_ >= this._top && _loc3_ < this._top)
            {
               _loc5_ = param1.previousX + (param1.x - param1.previousX) * (this._top - _loc4_) / (_loc3_ - _loc4_);
               if(_loc5_ >= this._left - param1.collisionRadius && _loc5_ <= this._right + param1.collisionRadius)
               {
                  param1.velY = -param1.velY * param2;
                  param1.y += 2 * (this._top - _loc3_);
                  _loc6_ = true;
               }
            }
         }
         return _loc6_;
      }
   }
}

