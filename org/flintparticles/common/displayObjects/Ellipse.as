package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   
   public class Ellipse extends Shape
   {
      private var _ellipseWidth:Number;
      
      private var _ellipseHeight:Number;
      
      private var _color:uint;
      
      public function Ellipse(param1:Number = 1, param2:Number = 1, param3:uint = 16777215, param4:String = "normal")
      {
         super();
         this._ellipseWidth = param1;
         this._ellipseHeight = param2;
         this._color = param3;
         this.draw();
         blendMode = param4;
      }
      
      private function draw() : void
      {
         if(this._ellipseWidth > 0 && this._ellipseHeight > 0)
         {
            graphics.clear();
            graphics.beginFill(this._color);
            graphics.drawEllipse(0,0,this._ellipseWidth,this._ellipseHeight);
            graphics.endFill();
         }
      }
      
      public function get ellipseWidth() : Number
      {
         return this._ellipseWidth;
      }
      
      public function set ellipseWidth(param1:Number) : void
      {
         this._ellipseWidth = param1;
         this.draw();
      }
      
      public function get ellipseHeight() : Number
      {
         return this._ellipseHeight;
      }
      
      public function set ellipseHeight(param1:Number) : void
      {
         this._ellipseHeight = param1;
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

