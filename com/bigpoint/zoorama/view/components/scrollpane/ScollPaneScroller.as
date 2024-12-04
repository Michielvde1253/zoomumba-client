package com.bigpoint.zoorama.view.components.scrollpane
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class ScollPaneScroller extends ScollPaneContent
   {
      private var offset:Number;
      
      private var moveY:Number;
      
      public function ScollPaneScroller()
      {
         super();
      }
      
      public function init() : void
      {
         bottomArrow.y = paneHeight - bottomArrow.height;
         back.height = paneHeight - bottomArrow.height - topArrow.height;
         this.offset = bar.height >> 1;
         bar.y = this.offset;
         this.setLimits();
      }
      
      public function setLimits() : void
      {
         this.moveY = back.height - (this.offset >> 1);
         scrollRectangle = new Rectangle(0,this.offset,0,this.moveY);
         this.addScrollerListeners();
      }
      
      public function addScrollerListeners() : void
      {
         bar.addEventListener(MouseEvent.MOUSE_DOWN,this.handleDragClick);
         bar.buttonMode = true;
         bar.useHandCursor = true;
      }
      
      private function handleDragClick(param1:MouseEvent) : void
      {
         bar.startDrag(false,scrollRectangle);
         bar.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         bar.addEventListener(Event.ENTER_FRAME,this.scrollMoveEvent);
      }
      
      private function handleDragRelease(param1:MouseEvent) : void
      {
         bar.removeEventListener(Event.ENTER_FRAME,this.scrollMoveEvent);
         bar.stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         bar.stopDrag();
      }
      
      private function scrollMoveEvent(param1:Event) : void
      {
         var _loc2_:Number = (target.height - paneHeight) / this.moveY;
         var _loc3_:Number = bar.y - this.offset;
         target.y = -_loc2_ * _loc3_;
      }
      
      public function update() : void
      {
         super.target.y = 0;
         bar.y = this.offset;
         if(target.height <= paneHeight + 5)
         {
            scrollbar.visible = false;
         }
         else
         {
            scrollbar.visible = true;
         }
      }
   }
}

