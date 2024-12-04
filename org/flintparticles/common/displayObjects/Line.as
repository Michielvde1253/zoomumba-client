package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   
   public class Line extends Shape
   {
      private var _length:Number;
      
      private var _color:uint;
      
      public function Line(param1:Number = 1, param2:uint = 16777215, param3:String = "normal")
      {
         super();
         this._length = param1;
         this._color = param2;
         this.draw();
         blendMode = param3;
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.lineStyle(1,this._color);
         graphics.moveTo(-this._length * 0.5,0);
         graphics.lineTo(this._length * 0.5,0);
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      public function set length(param1:Number) : void
      {
         this._length = param1;
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

