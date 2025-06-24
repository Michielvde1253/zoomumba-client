package com.bigpoint.zoomumba.view.features.map.components
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.zoomumba.view.features.map.config.vo.MapZooConfigVo;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class MapArea extends EventDispatcher
   {
      public static const CLICK:String = "MAPAREA_CLICK";
      
      private var _asset:Sprite;
      
      private var _lock:Sprite;
      
      private var _clickarea:Sprite;
      
      private var _pinguArea:Sprite;
      
      private var _background:Sprite;
      
      private var _hoverTween:TweenLite;
      
      private var _config:MapZooConfigVo;
      
      private var _tooltipText:String;
      
      private var _glowFilter:TweenMax;
      
      private var _locked:Boolean;
      
      private var _enabled:Boolean;
      
      public function MapArea(param1:Sprite, param2:MapZooConfigVo, param3:String)
      {
         super();
         this._asset = param1;
         this._config = param2;
         this._tooltipText = param3;
         this._pinguArea = this._asset.getChildByName("pinguplacer_mc") as Sprite;
         this._pinguArea.visible = false;
         this.locked = false;
         this._enabled = false;
         this.init();
      }
      
      private function init() : void
      {
         this._background = this._asset.getChildByName("background_mc") as Sprite;
         this._lock = this._asset.getChildByName("lock_mc") as Sprite;
         this._clickarea = this._asset.getChildByName("clickarea_mc") as Sprite;
         this._background.mouseChildren = false;
         this._background.mouseEnabled = false;
         this._lock.mouseChildren = false;
         this._lock.mouseEnabled = false;
         this._asset.mouseEnabled = false;
         this._clickarea.alpha = 0;
         this._clickarea.mouseEnabled = true;
         this._clickarea.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
         this._clickarea.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
         this._clickarea.addEventListener(MouseEvent.CLICK,this.onMouseClick,false,0,true);
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(MapArea.CLICK));
         this.showGlow(false);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.disableTween();
         TooltipNewManager.setToolTipCrop(this._asset as DisplayObject,this._tooltipText,true);
         this._hoverTween = TweenLite.to(this._background,0.2,{
            "scaleX":1.05,
            "scaleY":1.05
         });
         this.showGlow(true);
      }
      
      private function onMouseOut(param1:MouseEvent = null) : void
      {
         this.disableTween();
         TooltipNewManager.removeToolTip();
         this._hoverTween = TweenLite.to(this._background,0.2,{
            "scaleX":1,
            "scaleY":1
         });
         this.showGlow(false);
      }
      
      private function disableTween() : void
      {
         if(this._hoverTween)
         {
            this._hoverTween.kill();
            this._hoverTween = null;
         }
      }
      
      public function destroy() : void
      {
         this.showGlow(false);
         this._asset.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._asset.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._asset.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         TooltipNewManager.removeToolTip();
         this.disableTween();
      }
      
      public function disable() : void
      {
      }
      
      private function showGlow(param1:Boolean) : void
      {
         if(this._glowFilter)
         {
            this._glowFilter.kill();
            this._glowFilter = null;
         }
         if(param1)
         {
            this._glowFilter = TweenMax.to(this._background,0.5,{"glowFilter":{
               "color":16750848,
               "alpha":1,
               "blurX":7,
               "blurY":7,
               "strength":3
            }});
         }
         else
         {
            this._glowFilter = TweenMax.to(this._background,0.5,{"glowFilter":{
               "alpha":0,
               "remove":true
            }});
         }
      }
      
      public function set locked(param1:Boolean) : void
      {
         if(this._lock)
         {
            this._lock.visible = param1;
         }
         this._locked = param1;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._background)
         {
            if(this._enabled != param1)
            {
               this._clickarea.buttonMode = param1;
               this._clickarea.useHandCursor = param1;
            }
         }
         this._enabled = param1;
      }
      
      public function grayOut(param1:Boolean) : void
      {
         if(param1)
         {
            ColorHelper.applyColor(this._background,ColorHelper.GRAYSCALE);
         }
         else
         {
            ColorHelper.removeColor(this._background);
         }
      }
      
      public function get config() : MapZooConfigVo
      {
         return this._config;
      }
      
      public function get tooltipText() : String
      {
         return this._tooltipText;
      }
      
      public function set tooltipText(param1:String) : void
      {
         this._tooltipText = param1;
         TooltipNewManager.removeToolTip();
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function get pinguX() : Number
      {
         return this._asset.x + this._pinguArea.x;
      }
      
      public function get pinguY() : Number
      {
         return this._asset.y + this._pinguArea.y;
      }
   }
}

