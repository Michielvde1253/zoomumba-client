package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   
   public class Dot extends Shape
   {
      private var _radius:Number;
      
      private var _color:uint;
      
      public function Dot(param1:Number = 1, param2:uint = 16777215, param3:String = "normal")
      {
         super();
         this._radius = param1;
         this._color = param2;
         this.draw();
         blendMode = param3;
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(this._color);
         graphics.drawCircle(0,0,this._radius);
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

