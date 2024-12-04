package org.flintparticles.common.displayObjects
{
   import flash.display.Shape;
   
   public class Ring extends Shape
   {
      private var _outerRadius:Number;
      
      private var _innerRadius:Number;
      
      private var _color:uint;
      
      public function Ring(param1:Number = 1, param2:Number = 2, param3:uint = 16777215, param4:String = "normal")
      {
         super();
         this._outerRadius = param2;
         this._innerRadius = param1;
         this._color = param3;
         this.draw();
         blendMode = param4;
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(this._color);
         graphics.drawCircle(0,0,this._outerRadius);
         graphics.drawCircle(0,0,this._innerRadius);
         graphics.endFill();
      }
      
      public function get outerRadius() : Number
      {
         return this._outerRadius;
      }
      
      public function set outerRadius(param1:Number) : void
      {
         this._outerRadius = param1;
         this.draw();
      }
      
      public function get innerRadius() : Number
      {
         return this._innerRadius;
      }
      
      public function set innerRadius(param1:Number) : void
      {
         this._innerRadius = param1;
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

