package fr.kapit.utils.capture
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import fr.kapit.utils.ApplicationUtils;
   import fr.kapit.utils.KapDebugConstants;
   import mx.core.UIComponent;
   import mx.events.MoveEvent;
   import mx.events.ResizeEvent;
   
   public class ObjectCaptured
   {
      private var _dObject:DisplayObject;
      
      private var _draw:Function;
      
      private var _myColor:uint;
      
      private var _region:Rectangle;
      
      private var _toolTip:ToolTipCaptured;
      
      private var _type:String;
      
      private var zeroPoint:Point = new Point(0,0);
      
      public function ObjectCaptured(param1:String)
      {
         super();
         this._region = new Rectangle();
         this._toolTip = new ToolTipCaptured(param1);
         ApplicationUtils.application.systemManager.addChildAt(this._toolTip,ApplicationUtils.application.systemManager.popUpChildren.numChildren + 1);
         this.type = param1;
      }
      
      public function cleanUp() : void
      {
         var _loc1_:UIComponent = ApplicationUtils.application;
         if(Boolean(this._toolTip) && Boolean(_loc1_.systemManager.contains(this._toolTip)))
         {
            _loc1_.systemManager.removeChild(this._toolTip);
         }
         if(Boolean(this._dObject) && this._dObject is UIComponent)
         {
            UIComponent(this._dObject).removeEventListener(MoveEvent.MOVE,this._onDObjectChanged);
            UIComponent(this._dObject).removeEventListener(ResizeEvent.RESIZE,this._onDObjectChanged);
            this._dObject = null;
         }
      }
      
      public function get dObject() : DisplayObject
      {
         return this._dObject;
      }
      
      public function set dObject(param1:DisplayObject) : void
      {
         var tot:int = 0;
         var iChild:int = 0;
         var child:Object = null;
         var d:DisplayObject = param1;
         try
         {
            if(!d)
            {
               return;
            }
            this._dObject = d;
            tot = 0;
            iChild = 0;
            while(iChild < ApplicationUtils.application.systemManager.rawChildren.numChildren)
            {
               child = ApplicationUtils.application.systemManager.rawChildren.getChildAt(iChild);
               if(child is DisplayObject)
               {
                  tot++;
               }
               iChild++;
            }
            if(!ApplicationUtils.application.systemManager.contains(this._toolTip))
            {
               ApplicationUtils.application.systemManager.addChild(this._toolTip);
            }
            this._toolTip.objectText = d;
            this._region.x = d.localToGlobal(this.zeroPoint).x;
            this._region.y = d.localToGlobal(this.zeroPoint).y;
            this._region.width = d.width;
            this._region.height = d.height;
            if(this._region.y < 20)
            {
               this._toolTip.y = this._region.y + this._region.height + this._toolTip.height;
            }
            else
            {
               this._toolTip.y = this._region.y - 26;
            }
            this._toolTip.x = this._region.x;
            if(Boolean(this._dObject) && this._dObject is UIComponent)
            {
               UIComponent(this._dObject).addEventListener(MoveEvent.MOVE,this._onDObjectChanged);
               UIComponent(this._dObject).addEventListener(ResizeEvent.RESIZE,this._onDObjectChanged);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function draw(param1:Graphics) : void
      {
         if(this._dObject)
         {
            this._draw(param1);
            this._toolTip.visible = true;
         }
      }
      
      public function drawHorizontal(param1:Graphics, param2:uint, param3:uint, param4:uint) : void
      {
         this.drawDashedLine(param1,param2,param4,param3,param4);
      }
      
      public function drawVertical(param1:Graphics, param2:uint, param3:uint, param4:uint) : void
      {
         this.drawDashedLine(param1,param4,param2,param4,param3);
      }
      
      public function get height() : int
      {
         return this._region.height;
      }
      
      public function set height(param1:int) : void
      {
         this._dObject.height += param1;
         this._region.height += param1;
      }
      
      public function refreshTooltip() : void
      {
         if(this._toolTip)
         {
            this._toolTip.objectText = this._dObject;
         }
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         switch(param1)
         {
            case KapDebugConstants.TYPE_OBJ_OVER:
               this._myColor = KapDebugConstants.COLOR_OBJ_OVER;
               this._draw = this._drawOver;
               break;
            case KapDebugConstants.TYPE_OBJ_PREVIEW:
               this._myColor = KapDebugConstants.COLOR_OBJ_PREVIEW;
               this._draw = this._drawPreview;
               break;
            case KapDebugConstants.TYPE_OBJ_MULTIPLE:
               this._myColor = KapDebugConstants.COLOR_OBJ_MULTIPLE;
               this._draw = this._drawMultiple;
               break;
            case KapDebugConstants.TYPE_OBJ_SELECTED:
               this._myColor = KapDebugConstants.COLOR_OBJ_SELECTED;
               this._draw = this._drawSelected;
         }
      }
      
      public function update(param1:DisplayObject) : void
      {
         this.dObject = param1;
      }
      
      public function get width() : int
      {
         return this._region.width;
      }
      
      public function set width(param1:int) : void
      {
         this._dObject.width += param1;
         this._region.width += param1;
      }
      
      public function get x() : int
      {
         return this._region.x;
      }
      
      public function set x(param1:int) : void
      {
         this._dObject.x += param1;
         this._region.x += param1;
      }
      
      public function get y() : int
      {
         return this._region.y;
      }
      
      public function set y(param1:int) : void
      {
         this._dObject.y += param1;
         this._region.y += param1;
      }
      
      private function _drawMultiple(param1:Graphics) : void
      {
      }
      
      private function _drawOver(param1:Graphics) : void
      {
         param1.lineStyle(2,this._myColor,1);
         param1.beginFill(this._myColor,0.1);
         param1.drawRect(this._region.x,this._region.y,this._region.width,this._region.height);
         param1.endFill();
      }
      
      private function _drawPreview(param1:Graphics) : void
      {
         var i:int = 0;
         var g:Graphics = param1;
         try
         {
            g.lineStyle(2,this._myColor,1);
            g.endFill();
            g.drawRect(this._region.x,this._region.y,this._region.width,this._region.height);
            g.lineStyle(1,this._myColor);
            i = this._region.x + 5;
            while(i < this._region.x + this._region.width)
            {
               g.moveTo(i,this._region.y);
               g.lineTo(i,this._region.y + 5);
               i += 5;
            }
            i = this._region.y + 5;
            while(i < this._region.y + this._region.height)
            {
               g.moveTo(this._region.x,i);
               g.lineTo(this._region.x + 5,i);
               i += 5;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function _drawSelected(param1:Graphics) : void
      {
         param1.lineStyle(2,this._myColor,1);
         param1.beginFill(this._myColor,0.1);
         param1.drawRect(this._region.x,this._region.y,this._region.width,this._region.height);
         param1.endFill();
      }
      
      private function _onDObjectChanged(param1:Event) : void
      {
         this.dObject = this._dObject;
      }
      
      private function drawDashedLine(param1:Graphics, param2:uint, param3:uint, param4:uint, param5:uint) : void
      {
         var lineLength:uint = 0;
         var g:Graphics = param1;
         var x1:uint = param2;
         var y1:uint = param3;
         var x2:uint = param4;
         var y2:uint = param5;
         var drawLine:Function = function():void
         {
            if(y1 == y2)
            {
               g.lineTo(x1 + lineLength,y1);
               x1 += lineLength;
            }
            else
            {
               g.lineTo(x1,y1 + lineLength);
               y1 += lineLength;
            }
         };
         var drawSpace:Function = function():void
         {
            if(y1 == y2)
            {
               g.moveTo(x1 + 5,y1);
               x1 += 5;
            }
            else
            {
               g.moveTo(x1,y1 + 5);
               y1 += 5;
            }
         };
         var complete:Boolean = false;
         var tempVal:uint = 0;
         lineLength = 5;
         g.lineStyle(3,this._myColor,1);
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
         g.moveTo(x1,y1);
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
            drawLine(g,lineLength,x1,y1,x2,y2);
            drawSpace(g,lineLength,x1,y1,x2,y2);
         }
      }
   }
}

