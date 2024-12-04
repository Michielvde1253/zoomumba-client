package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   import flash.geom.Point;
   
   public class Star extends Shape
   {
      private var _radius:Number;
      
      private var _color:uint;
      
      public function Star(param1:Number, param2:uint = 16777215, param3:String = "normal")
      {
         super();
         this._radius = param1;
         this._color = param2;
         this.draw();
         blendMode = param3;
      }
      
      private function draw() : void
      {
         var _loc1_:Point = null;
         graphics.clear();
         var _loc2_:Number = Math.PI / 5;
         var _loc3_:Number = this._radius * Math.cos(_loc2_ * 2);
         var _loc4_:Number = Math.PI * 0.5;
         graphics.beginFill(this._color);
         graphics.moveTo(0,-this._radius);
         _loc1_ = Point.polar(_loc3_,_loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(this._radius,2 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(_loc3_,3 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(this._radius,4 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(_loc3_,5 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(this._radius,6 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(_loc3_,7 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(this._radius,8 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         _loc1_ = Point.polar(_loc3_,9 * _loc2_ - _loc4_);
         graphics.lineTo(_loc1_.x,_loc1_.y);
         graphics.lineTo(0,-this._radius);
         graphics.endFill();
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set radius(param1:Number) : void
      {
         this._radius = param1;
         this.draw();
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
         this.draw();
      }
   }
}

