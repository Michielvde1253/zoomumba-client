package fr.kapit.util
{
   import mx.containers.Canvas;
   
   public class DashedLine
   {
      public function DashedLine()
      {
         super();
      }
      
      public function drawHorizontal(param1:*, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint, param7:uint) : void
      {
         this.drawDashedLine(param1,param2,param4,param3,param4,param5,param6,param7);
      }
      
      public function drawVertical(param1:*, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint, param7:uint) : void
      {
         this.drawDashedLine(param1,param4,param2,param4,param3,param5,param6,param7);
      }
      
      private function drawDashedLine(param1:*, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint, param7:uint, param8:uint) : void
      {
         var tempVal:uint;
         var c:Canvas = null;
         var target:* = param1;
         var x1:uint = param2;
         var y1:uint = param3;
         var x2:uint = param4;
         var y2:uint = param5;
         var lineLength:uint = param6;
         var lineThickness:uint = param7;
         var lineColor:uint = param8;
         var drawLine:Function = function():void
         {
            if(y1 == y2)
            {
               c.graphics.lineTo(x1 + lineLength,y1);
               x1 += lineLength;
            }
            else
            {
               c.graphics.lineTo(x1,y1 + lineLength);
               y1 += lineLength;
            }
         };
         var drawSpace:Function = function():void
         {
            if(y1 == y2)
            {
               c.graphics.moveTo(x1 + 5,y1);
               x1 += 5;
            }
            else
            {
               c.graphics.moveTo(x1,y1 + 5);
               y1 += 5;
            }
         };
         var complete:Boolean = false;
         c = new Canvas();
         c.width = target.width;
         c.height = target.height;
         c.horizontalScrollPolicy = "off";
         c.verticalScrollPolicy = "off";
         c.graphics.lineStyle(lineThickness,lineColor,1);
         tempVal = 0;
         if(y1 == y2)
         {
            if(x1 > x2)
            {
               tempVal = x1;
               x1 = x2;
               x2 = tempVal;
            }
         }
         else if(y1 > y2)
         {
            tempVal = y1;
            y1 = y2;
            y2 = tempVal;
         }
         c.graphics.moveTo(x1,y1);
         while(!complete)
         {
            if(y1 == y2)
            {
               if(x1 + lineLength >= x2)
               {
                  lineLength -= x1 + lineLength - x2;
                  complete = true;
               }
            }
            else if(y1 + lineLength >= y2)
            {
               lineLength -= y1 + lineLength - y2;
               complete = true;
            }
            drawLine();
            drawSpace();
         }
         target.addChild(c);
      }
   }
}

