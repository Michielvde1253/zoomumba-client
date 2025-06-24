package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameCollVo;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BoardgameCollectItemComponent extends EventDispatcher
   {
      public static const ON_CLICK_COLL_EVENT:String = "ON_CLICK_COLL_EVENT";
      
      private var _asset:MovieClip;
      
      private var _iconHolder:Sprite;
      
      private var _counterText:TextField;
      
      private var _toolTip:String;
      
      private var _tweenGray:TweenLite;
      
      private var _isGrayscale:Boolean;
      
      private var _isActive:Boolean;
      
      private var _icon:Sprite;
      
      private var _collVo:BoardgameCollVo;
      
      private var _id:int;
      
      private var _amount:int;
      
      public function BoardgameCollectItemComponent(param1:MovieClip, param2:int = 0, param3:BoardgameCollVo = null)
      {
         super();
         this._collVo = param3;
         this._asset = param1;
         this._id = param2;
         this.init();
         this.update();
      }
      
      public function destroy() : void
      {
         this.killTweenGray();
         this._iconHolder.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._iconHolder.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._iconHolder.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         this._iconHolder = null;
         this._collVo = null;
         this._asset = null;
      }
      
      private function init() : void
      {
         if(this._asset)
         {
            this._counterText = this._asset.getChildByName("counter_txt") as TextField;
            this._iconHolder = this._asset.getChildByName("iconHolder_mc") as Sprite;
            this._counterText.mouseEnabled = false;
            this._iconHolder.mouseChildren = false;
            this._asset.mouseEnabled = false;
            this._iconHolder.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
            this._iconHolder.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
            this._iconHolder.mouseEnabled = true;
            this._iconHolder.buttonMode = true;
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(ON_CLICK_COLL_EVENT));
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(this._iconHolder,this._toolTip,false);
      }
      
      public function set amount(param1:int) : void
      {
         this._amount = param1;
         this.update();
      }
      
      public function get collVo() : BoardgameCollVo
      {
         return this._collVo;
      }
      
      public function set collVo(param1:BoardgameCollVo) : void
      {
         this._collVo = param1;
         this.update();
      }
      
      private function update() : void
      {
         if(this._asset)
         {
            if(this._collVo)
            {
               this._toolTip = TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(this._collVo.itemType),this._collVo.itemId));
               this._asset.visible = true;
               if(this._icon == null)
               {
                  this._icon = new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._collVo.itemType),this._collVo.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NONE,17,17,1);
                  this._iconHolder.addChild(this._icon);
               }
               this._counterText.text = String(this._amount);
               this.enableButton = this.isActive && this.hasEnought;
            }
            else
            {
               this._asset.visible = false;
            }
         }
      }
      
      private function set enableButton(param1:Boolean) : void
      {
         this._iconHolder.useHandCursor = param1;
         if(param1)
         {
            if(!this._iconHolder.hasEventListener(MouseEvent.CLICK))
            {
               this._iconHolder.addEventListener(MouseEvent.CLICK,this.onMouseClick,false,0,true);
            }
         }
         else if(this._iconHolder.hasEventListener(MouseEvent.CLICK))
         {
            this._iconHolder.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         }
         if(this.isActive)
         {
            this.effectColor();
         }
         else
         {
            this.effectGray();
         }
      }
      
      public function get isActive() : Boolean
      {
         return this._isActive;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         this._isActive = param1;
         this.update();
      }
      
      public function get hasEnought() : Boolean
      {
         return this._amount > 0;
      }
      
      public function get asset() : MovieClip
      {
         return this._asset;
      }
      
      public function get amount() : int
      {
         return this._amount;
      }
      
      private function effectGray() : void
      {
         if(this._isGrayscale == false)
         {
            this.killTweenGray();
            this._tweenGray = TweenLite.to(this._asset,1,{"colorMatrixFilter":{"saturation":0}});
            this._isGrayscale = true;
         }
      }
      
      private function effectColor() : void
      {
         if(this._isGrayscale == true)
         {
            this.killTweenGray();
            this._tweenGray = TweenLite.to(this._asset,1,{"colorMatrixFilter":{"saturation":1}});
            this._isGrayscale = false;
         }
      }
      
      private function killTweenGray() : void
      {
         if(this._tweenGray)
         {
            this._tweenGray.pause();
            this._tweenGray.kill();
            this._tweenGray = null;
         }
      }
   }
}

