package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents
{
   import com.bigpoint.utils.BmpUtil;
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.GAMEBOARD;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameFieldVo;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.event.BoardgameItemEvent;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BoardgameStepItemComponent extends EventDispatcher
   {
      public static const ON_CLICK_STEP_EVENT:String = "ON_CLICK_STEP_EVENT";
      
      public static const SIZE_IMAGE_WIDTH:int = 20;
      
      public static const SIZE_IMAGE_HEIGHT:int = 20;
      
      private var _progressAmount:int;
      
      private var _neededAmount:int;
      
      private var _instantAmount:int;
      
      private var _stepId:String;
      
      private var _tooltipTxt:String;
      
      private var _asset:MovieClip;
      
      private var _icon:Sprite;
      
      private var _iconHolder:Sprite;
      
      private var _fieldItemVo:BoardgameFieldVo;
      
      private var _viewState:String = "";
      
      private var _tween:TweenLite;
      
      private var _externalAnimationRunning:Boolean;
      
      private var _amountTxt:TextField;
      
      private var _bmpUtil:BmpUtil;
      
      private var _isInit:Boolean = false;
      
      public function BoardgameStepItemComponent(param1:String, param2:MovieClip, param3:BoardgameFieldVo = null)
      {
         super();
         this._stepId = param1;
         this._asset = param2;
         this._fieldItemVo = param3;
         this._bmpUtil = new BmpUtil();
         this.init();
         this.initIcon();
         this.refreshState();
      }
      
      public function destory() : void
      {
         this._asset.removeEventListener(MouseEvent.CLICK,this.onClickEvent);
      }
      
      private function initIcon() : void
      {
         if(this._fieldItemVo)
         {
            this._icon = new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._fieldItemVo.putDropType),this._fieldItemVo.putDropId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NONE,SIZE_IMAGE_WIDTH,SIZE_IMAGE_HEIGHT,1,this.updateDropIcon);
         }
      }
      
      private function init() : void
      {
         this._asset.buttonMode = false;
         this._asset.useHandCursor = false;
         this._asset.mouseEnabled = false;
      }
      
      private function enableMouse(param1:Boolean) : void
      {
         this._asset.mouseEnabled = param1;
         this._asset.mouseChildren = false;
         if(param1)
         {
            if(!this._asset.hasEventListener(MouseEvent.CLICK))
            {
               this._asset.addEventListener(MouseEvent.CLICK,this.onClickEvent,false,0,true);
               this._asset.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
               this._asset.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
            }
         }
         else if(this._asset.hasEventListener(MouseEvent.CLICK))
         {
            this._asset.removeEventListener(MouseEvent.CLICK,this.onClickEvent);
            this._asset.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            this._asset.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(!this.isTweenPlaying)
         {
            this.showViewState();
            if(this._fieldItemVo.state != GAMEBOARD.FIELD_STATE_INACTIVE && this._fieldItemVo.state != GAMEBOARD.FIELD_STATE_FINISHED)
            {
               this.updateDropIcon();
               this.updateAmountView(String(this._neededAmount));
            }
            dispatchEvent(new BoardgameItemEvent(BoardgameItemEvent.ITEM_OUT,this._neededAmount,this._stepId));
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         if(!this.isTweenPlaying)
         {
            dispatchEvent(new BoardgameItemEvent(BoardgameItemEvent.ITEM_OVER,this._neededAmount,this._stepId));
         }
      }
      
      private function onClickEvent(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(ON_CLICK_STEP_EVENT));
      }
      
      private function updateAmountView(param1:String) : void
      {
         if(this._asset.getChildByName("amount_txt"))
         {
            this._amountTxt = this._asset.getChildByName("amount_txt") as TextField;
            this._amountTxt.text = param1;
         }
      }
      
      private function updateDropIcon() : void
      {
         if(Boolean(this._asset.getChildByName("iconHolder_mc")) && Boolean(this._icon))
         {
            this._iconHolder = this._asset.getChildByName("iconHolder_mc") as Sprite;
            this._iconHolder.addChild(this._icon);
         }
      }
      
      private function refreshState() : void
      {
         var _loc1_:String = null;
         if(this._fieldItemVo == null)
         {
            this._asset.visible = false;
         }
         else
         {
            if(this._fieldItemVo.state == GAMEBOARD.FIELD_STATE_FINISHED || this._fieldItemVo.state == GAMEBOARD.FIELD_STATE_INACTIVE)
            {
               if(this._viewState != this._fieldItemVo.state)
               {
                  this._viewState = this._fieldItemVo.state;
                  this.animateViewStateTo(this._viewState);
               }
               this.enableMouse(false);
            }
            else
            {
               if(this._fieldItemVo.progress == 0)
               {
                  this._viewState = "1";
               }
               else
               {
                  this._viewState = String(this._fieldItemVo.progress);
               }
               this.animateViewStateTo(this._viewState);
               this.enableMouse(true);
               this.updateDropIcon();
            }
            this._asset.visible = true;
            if(this._progressAmount != -1)
            {
               this._neededAmount = Math.round((this._progressAmount - this._fieldItemVo.putAmount) * -1);
               _loc1_ = TextResourceModule.getText("zoo.collectableItems.name." + this._fieldItemVo.putDropId);
               this._tooltipTxt = TextResourceModule.getText("zoo.tooltip.frogAmount") + "<br>(" + this._fieldItemVo.progress + "%)";
               this._tooltipTxt = this._tooltipTxt.split("%amount%").join(this._neededAmount);
               this._tooltipTxt = this._tooltipTxt.split("%collectable%").join(_loc1_);
            }
            this.updateAmountView(String(this._neededAmount));
         }
      }
      
      private function animateViewStateTo(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(!this.isTweenPlaying)
         {
            this.killTween();
            if(param1 == GAMEBOARD.FIELD_STATE_FINISHED)
            {
               param1 = "101";
            }
            if(!isNaN(Number(param1)) && this._isInit)
            {
               _loc2_ = parseInt(param1);
               if(this._asset.currentFrame < 100 && this._asset.currentFrame != _loc2_)
               {
                  _loc3_ = (_loc2_ - this._asset.currentFrame) * 0.02;
                  this._tween = new TweenLite(this._asset,_loc3_,{"frame":_loc2_});
               }
               else
               {
                  this.showViewState();
               }
            }
            else
            {
               this.showViewState();
            }
         }
      }
      
      private function get isTweenPlaying() : Boolean
      {
         if(this._tween)
         {
            return this._tween.active;
         }
         return false;
      }
      
      private function killTween() : void
      {
         if(this._tween)
         {
            this._tween.kill();
            this._tween = null;
         }
      }
      
      public function showViewState() : void
      {
         this.killTween();
         this._asset.gotoAndStop(this._viewState);
      }
      
      public function showState() : void
      {
         if(this.externalAnimationRunning || this.state == null)
         {
            return;
         }
         this._asset.gotoAndStop(this.state);
         if(this.state == GAMEBOARD.FIELD_STATE_INSTANTBUY)
         {
            this.updateAmountView(String(this._instantAmount));
         }
         else
         {
            this.updateDropIcon();
            this.updateAmountView(String(this._neededAmount));
         }
      }
      
      public function destroy() : void
      {
         this.killTween();
         this.enableMouse(false);
         this._fieldItemVo = null;
         this._asset = null;
      }
      
      public function get asset() : Sprite
      {
         return this._asset;
      }
      
      public function get viewState() : String
      {
         return this._viewState;
      }
      
      public function get state() : String
      {
         if(this._fieldItemVo != null)
         {
            return this._fieldItemVo.state;
         }
         return null;
      }
      
      public function get fieldItemVo() : BoardgameFieldVo
      {
         return this._fieldItemVo;
      }
      
      public function set fieldItemVo(param1:BoardgameFieldVo) : void
      {
         this._fieldItemVo = param1;
         this.initIcon();
         this.refreshState();
         this._isInit = true;
      }
      
      public function get stepId() : String
      {
         return this._stepId;
      }
      
      public function get progressAmount() : int
      {
         return this._progressAmount;
      }
      
      public function set progressAmount(param1:int) : void
      {
         if(this._progressAmount != param1)
         {
            this._progressAmount = param1;
            this.refreshState();
         }
      }
      
      public function get neededAmount() : int
      {
         return this._neededAmount;
      }
      
      public function set neededAmount(param1:int) : void
      {
         this._neededAmount = param1;
      }
      
      public function get externalAnimationRunning() : Boolean
      {
         return this._externalAnimationRunning;
      }
      
      public function set externalAnimationRunning(param1:Boolean) : void
      {
         this._externalAnimationRunning = param1;
      }
      
      public function get instantAmount() : int
      {
         return this._instantAmount;
      }
      
      public function set instantAmount(param1:int) : void
      {
         this._instantAmount = param1;
      }
   }
}

