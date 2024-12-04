package com.bigpoint.zoorama.view.components.scrollpane
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class ScollPaneBaseAbstract extends Sprite
   {
      private var skin:Sprite;
      
      private var _target:Sprite;
      
      private var _mask:Sprite;
      
      private var _scrollbar:Sprite;
      
      private var scrollerTopButton:Sprite;
      
      private var scrollerBottomButton:Sprite;
      
      private var scrollerDragBar:Sprite;
      
      private var scrollerBack:Sprite;
      
      public var scrollRectangle:Rectangle;
      
      private var _width:int;
      
      private var _height:int;
      
      public function ScollPaneBaseAbstract()
      {
         super();
         this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_COMPONENTS_SYMBOLS,AssetConfig.COMPONENTS_SCROLLPANE);
         this.addChild(this.skin);
         this.setSkinItemReference();
      }
      
      private function setSkinItemReference() : void
      {
         this._target = this.skin.getChildByName("mcContainer") as Sprite;
         this._mask = this.skin.getChildByName("mcMask") as Sprite;
         this._target.removeChildAt(0);
         this._target.mask = this._mask;
         this._scrollbar = this.skin.getChildByName("mcScrollBar") as Sprite;
         this.scrollerTopButton = this._scrollbar.getChildByName("NSCROLLER_TOP") as Sprite;
         this.scrollerBottomButton = this._scrollbar.getChildByName("NSCROLLER_BOTTOM") as Sprite;
         this.scrollerDragBar = this._scrollbar.getChildByName("NSCROLLER_DRAG") as Sprite;
         this.scrollerBack = this._scrollbar.getChildByName("NSCROLLER_BACK") as Sprite;
      }
      
      public function setCoordinates(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function setPaneDimensions(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this._mask.height = param2;
         this._mask.width = param1;
         this._scrollbar.x = this._mask.width;
      }
      
      public function get paneWidth() : int
      {
         return this._width;
      }
      
      public function get paneHeight() : int
      {
         return this._height;
      }
      
      public function get target() : Sprite
      {
         return this._target;
      }
      
      public function get scrollbar() : Sprite
      {
         return this._scrollbar;
      }
      
      public function get topArrow() : Sprite
      {
         return this.scrollerTopButton;
      }
      
      public function get bottomArrow() : Sprite
      {
         return this.scrollerBottomButton;
      }
      
      public function get back() : Sprite
      {
         return this.scrollerBack;
      }
      
      public function get bar() : Sprite
      {
         return this.scrollerDragBar;
      }
   }
}

