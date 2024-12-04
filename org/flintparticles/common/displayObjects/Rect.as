package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   
   public class Rect extends Shape
   {
      private var _width:Number;
      
      private var _height:Number;
      
      private var _color:uint;
      
      public function Rect(param1:Number = 1, param2:Number = 1, param3:uint = 16777215, param4:String = "normal")
      {
         super();
         this._width = param1;
         this._height = param2;
         this._color = param3;
         this.draw();
         blendMode = param4;
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(this._color);
         graphics.drawRect(-this._width * 0.5,-this._height * 0.5,this._width,this._height);
         graphics.endFill();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
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

