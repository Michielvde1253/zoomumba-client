package com.bigpoint.zoorama.view.gui.btn
{
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class SimpleButtonController
   {
      private var item:SimpleButton;
      
      private var toolTipText:String;
      
      private var useMousePossition:Boolean;
      
      private var mouseEventsSet:Boolean = false;
      
      private var useToolTip:Boolean = false;
      
      private var useContrastEffect:Boolean = false;
      
      public function SimpleButtonController(param1:SimpleButton)
      {
         super();
         this.item = param1;
      }
      
      public function addTooltip(param1:String, param2:Boolean) : void
      {
         this.useMousePossition = param2;
         this.toolTipText = param1;
         this.useToolTip = true;
         if(!this.mouseEventsSet)
         {
            this.setMouseEvents();
         }
      }
      
      public function addContrastEffect() : void
      {
         this.useContrastEffect = true;
         if(!this.mouseEventsSet)
         {
            this.setMouseEvents();
         }
      }
      
      private function setMouseEvents() : void
      {
         this.mouseEventsSet = true;
         this.item.addEventListener(MouseEvent.ROLL_OVER,this.handleMouseOver);
         this.item.addEventListener(MouseEvent.ROLL_OUT,this.handleMouseOut);
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         if(this.useToolTip)
         {
            TooltipNewManager.setToolTip(this.item,this.toolTipText,this.useMousePossition);
         }
         if(this.useContrastEffect)
         {
            TweenLite.to(this.item,0.3,{"colorMatrixFilter":{
               "contrast":1.4,
               "brightness":1.4
            }});
         }
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         if(this.useToolTip)
         {
            TooltipNewManager.removeToolTip();
         }
         if(this.useContrastEffect)
         {
            TweenLite.to(this.item,0.3,{"colorMatrixFilter":{
               "contrast":1,
               "brightness":1,
               "remove":true
            }});
         }
      }
      
      public function clearEvents() : void
      {
         if(this.item.hasEventListener(MouseEvent.ROLL_OVER))
         {
            this.item.removeEventListener(MouseEvent.ROLL_OVER,this.handleMouseOver);
         }
         if(this.item.hasEventListener(MouseEvent.ROLL_OUT))
         {
            this.item.removeEventListener(MouseEvent.ROLL_OUT,this.handleMouseOut);
         }
      }
   }
}

