package com.bigpoint.zoorama.view.components.scrollbar
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ScollingComponent extends Sprite
   {
      private var scrollTarget:TextField;
      
      private var scrollerTopButton:Sprite;
      
      private var scrollerBottomButton:Sprite;
      
      private var scrollerDragBar:Sprite;
      
      private var scrollerBack:Sprite;
      
      private var skin:Sprite;
      
      private var scrollerHeight:int;
      
      private var scrollRectangle:Rectangle;
      
      private var maxVisibleLines:int;
      
      private var scrollContentStaticHeight:int;
      
      private var scrollRange:int;
      
      private var dragBarY:Number;
      
      public function ScollingComponent(param1:int, param2:int, param3:TextField, param4:int, param5:int, param6:int)
      {
         super();
         this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_COMPONENTS_SYMBOLS,AssetConfig.COMPONENTS_NSCROLLER);
         this.addChild(this.skin);
         this.x = param1;
         this.y = param2;
         this.scrollTarget = param3;
         this.scrollerHeight = param4;
         this.scrollContentStaticHeight = param5;
         this.maxVisibleLines = param6;
         this.setScrollElements();
      }
      
      private function setScrollElements() : void
      {
         this.scrollerTopButton = this.skin.getChildByName("NSCROLLER_TOP") as Sprite;
         this.scrollerBottomButton = this.skin.getChildByName("NSCROLLER_BOTTOM") as Sprite;
         this.scrollerDragBar = this.skin.getChildByName("NSCROLLER_DRAG") as Sprite;
         this.scrollerBack = this.skin.getChildByName("NSCROLLER_BACK") as Sprite;
         this.scrollerDragBar.y = this.scrollerBack.y;
         this.dragBarY = this.scrollerDragBar.y;
         this.setElementPositions();
         this.addItemListeners();
      }
      
      private function setElementPositions() : void
      {
         this.scrollerBottomButton.y = this.scrollerHeight - 21;
         this.scrollerBack.height = this.scrollerHeight - 41;
         this.setScrolLimits();
      }
      
      public function setScrolLimits() : void
      {
         this.scrollRectangle = new Rectangle(0,20,0,this.scrollerHeight - 65);
         this.scrollRange = this.scrollerBack.height - this.scrollerDragBar.height;
      }
      
      public function updateScroller() : void
      {
         var _loc1_:* = this.getNumLines(this.scrollTarget) > this.maxVisibleLines;
         visible = _loc1_;
      }
      
      private function getNumLines(param1:TextField) : int
      {
         var _loc2_:TextField = new TextField();
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.width = param1.width;
         _loc2_.text = param1.text;
         return _loc2_.numLines + 1;
      }
      
      private function addItemListeners() : void
      {
         this.scrollerDragBar.addEventListener(MouseEvent.MOUSE_DOWN,this.handleDragClick);
         this.scrollerDragBar.buttonMode = true;
         this.scrollerDragBar.useHandCursor = true;
         this.scrollTarget.addEventListener(Event.CHANGE,this.checkTextLength);
      }
      
      private function handleDragClick(param1:MouseEvent) : void
      {
         this.scrollerDragBar.startDrag(false,this.scrollRectangle);
         this.scrollerDragBar.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         this.scrollerDragBar.addEventListener(Event.ENTER_FRAME,this.scrollMoveEvent);
      }
      
      private function handleDragRelease(param1:MouseEvent) : void
      {
         this.scrollerDragBar.removeEventListener(Event.ENTER_FRAME,this.scrollMoveEvent);
         this.scrollerDragBar.stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleDragRelease);
         this.scrollerDragBar.stopDrag();
      }
      
      private function scrollMoveEvent(param1:Event) : void
      {
         var _loc2_:Number = (this.scrollerDragBar.y - this.scrollerBack.y) / this.scrollRange;
         this.setVTextScroll(_loc2_);
      }
      
      private function setVTextScroll(param1:Number) : void
      {
         this.scrollTarget.scrollV = Math.round((this.scrollTarget.maxScrollV - 1) * param1) + 1;
      }
      
      private function checkTextLength(param1:Event) : void
      {
         this.updateScroller();
         var _loc2_:Number = this.scrollerBack.height / this.scrollTarget.numLines;
         var _loc3_:Number = _loc2_ * this.scrollTarget.numLines;
         if(this.scrollTarget.visible == true)
         {
            this.scrollerDragBar.y = _loc3_;
         }
      }
   }
}

