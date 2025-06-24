package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GAMEBOARD;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameRewardVo;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.event.BoardgameItemEvent;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class BoardgameRewardItemComponent extends EventDispatcher
   {
      public static const ON_CLICK_REWARD_EVENT:String = "ON_CLICK_REWARD_EVENT";
      
      private var _animalConfig:AnimalSpeciesVO;
      
      private var _currentRound:int;
      
      private var _fieldId:String;
      
      private var _asset:Sprite;
      
      private var _rewardCircle:MovieClip;
      
      private var _rewardProgress:MovieClip;
      
      private var _rewardItemVo:BoardgameRewardVo;
      
      private var _iconAsset:Sprite;
      
      private var _iconHolder:Sprite;
      
      private var _iconId:String;
      
      private var _roundId:int;
      
      private var _toolTip:String;
      
      private var _amountTextfield:TextField;
      
      private var _tweenlite:TweenLite;
      
      private var _isInit:Boolean;
      
      private var _clickground_mc:MovieClip;
      
      public function BoardgameRewardItemComponent(param1:String, param2:Sprite, param3:BoardgameRewardVo = null)
      {
         super();
         this._fieldId = param1;
         this._asset = param2;
         this._asset.mouseChildren = false;
         this._asset.useHandCursor = true;
         this._asset.buttonMode = true;
         this._isInit = true;
         this._rewardCircle = this.asset.getChildByName("rewardCircle_mc") as MovieClip;
         this._rewardProgress = this._rewardCircle.getChildByName("process_mc") as MovieClip;
         if(this._rewardCircle.getChildByName("nummeric_mc"))
         {
            this._amountTextfield = (this._rewardCircle.getChildByName("nummeric_mc") as MovieClip).getChildByName("count_txt") as TextField;
         }
         this._rewardProgress.gotoAndStop(1);
         this._rewardItemVo = param3;
         this.initIcon();
         this.initState();
      }
      
      private function initState() : void
      {
         if(this._rewardItemVo == null)
         {
            this._asset.visible = false;
         }
         else
         {
            this._asset.visible = true;
         }
      }
      
      public function get asset() : Sprite
      {
         return this._asset;
      }
      
      public function get rewardItemVo() : BoardgameRewardVo
      {
         return this._rewardItemVo;
      }
      
      public function set rewardItemVo(param1:BoardgameRewardVo) : void
      {
         this._rewardItemVo = param1;
         this.initState();
         this.initIcon();
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:Number = NaN;
         if(this._rewardItemVo)
         {
            if(ItemTypeHelper.typeToCategory(this._rewardItemVo.type) == Categories.SPECIES)
            {
               this._toolTip = this._rewardItemVo.amount * 2 + "x " + TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._rewardItemVo.id));
            }
            else if(ItemTypeHelper.typeToCategory(this._rewardItemVo.type) == Categories.ANIMAL)
            {
               if(this._animalConfig)
               {
                  this._toolTip = this._rewardItemVo.amount + "x " + TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._animalConfig.speciesId));
               }
            }
            else
            {
               this._toolTip = this._rewardItemVo.amount + "x " + TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._rewardItemVo.id));
            }
            if(ItemTypeHelper.typeToCategory(this._rewardItemVo.type) == Categories.SPECIES)
            {
               this._iconId = AssetIds.getPreviewAssetId(Categories.ANIMAL,this._rewardItemVo.displayId);
            }
            else
            {
               this._iconId = AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._rewardItemVo.id);
            }
            if(this._amountTextfield)
            {
               this._amountTextfield.text = String(this._rewardItemVo.putAmount);
            }
            if(this._rewardItemVo.progress == 0)
            {
               this._rewardItemVo.progress = 1;
            }
            if(this._rewardProgress.currentFrame != this._rewardItemVo.progress)
            {
               this.killTween();
               if(this._isInit)
               {
                  this._rewardProgress.gotoAndStop(this._rewardItemVo.progress);
               }
               else
               {
                  _loc1_ = (this._rewardItemVo.progress - this._rewardProgress.currentFrame) * 0.02;
                  this._tweenlite = new TweenLite(this._rewardProgress,_loc1_,{"frame":this._rewardItemVo.progress});
               }
            }
            if(this.isActive)
            {
               this._rewardCircle.gotoAndStop("active");
               this.enableMouse(true);
            }
            else
            {
               this._rewardCircle.gotoAndStop("normal");
               this.enableMouse(false);
            }
            TweenLite.delayedCall(0.5,this.deactiveFrames);
            this._isInit = false;
         }
      }
      
      private function deactiveFrames() : void
      {
         if(this._asset == null || this._rewardCircle == null)
         {
            return;
         }
         this._rewardCircle = this.asset.getChildByName("rewardCircle_mc") as MovieClip;
         this._rewardCircle.mouseEnabled = false;
         this._rewardCircle.mouseChildren = false;
         this._asset.mouseEnabled = false;
         this._asset.mouseChildren = false;
         if(this.clickground_mc != null)
         {
            this.clickground_mc.mouseEnabled = false;
         }
         if(this._rewardCircle.getChildByName("glow_mc"))
         {
            (this._rewardCircle.getChildByName("glow_mc") as MovieClip).mouseChildren = false;
            (this._rewardCircle.getChildByName("glow_mc") as MovieClip).mouseEnabled = false;
         }
      }
      
      public function killTween() : void
      {
         if(this._tweenlite)
         {
            this._tweenlite.kill();
            this._tweenlite = null;
         }
      }
      
      private function get isActive() : Boolean
      {
         return this._rewardItemVo.state != GAMEBOARD.FIELD_STATE_INACTIVE && this._rewardItemVo.state != GAMEBOARD.FIELD_STATE_FINISHED;
      }
      
      public function get id() : String
      {
         return this._fieldId;
      }
      
      public function get roundId() : int
      {
         return this._roundId;
      }
      
      public function set roundId(param1:int) : void
      {
         this._roundId = param1;
      }
      
      public function get currentRound() : int
      {
         return this._currentRound;
      }
      
      public function set currentRound(param1:int) : void
      {
         this._currentRound = param1;
      }
      
      public function get animalConfig() : AnimalSpeciesVO
      {
         return this._animalConfig;
      }
      
      public function set animalConfig(param1:AnimalSpeciesVO) : void
      {
         this._animalConfig = param1;
         if(this._animalConfig != null)
         {
            this.update();
         }
      }
      
      public function get clickground_mc() : MovieClip
      {
         this._clickground_mc = this._rewardCircle.getChildByName("clickground_mc") as MovieClip;
         return this._clickground_mc;
      }
      
      public function get fieldId() : String
      {
         return this._fieldId;
      }
      
      public function enableMouse(param1:Boolean) : void
      {
         if(this.clickground_mc == null)
         {
            return;
         }
         if(param1)
         {
            if(!this.clickground_mc.hasEventListener(MouseEvent.CLICK))
            {
               this.clickground_mc.addEventListener(MouseEvent.CLICK,this.onMouseClick,false,0,true);
            }
         }
         else if(this.clickground_mc.hasEventListener(MouseEvent.CLICK))
         {
            this.clickground_mc.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         }
         this.clickground_mc.useHandCursor = param1;
      }
      
      public function initIcon() : void
      {
         var _loc1_:String = null;
         if(this._iconHolder == null)
         {
            this._iconHolder = this._rewardCircle.getChildByName("iconHolder_mc") as Sprite;
            if(this.clickground_mc != null)
            {
               this.clickground_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
               this.clickground_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
               this.clickground_mc.buttonMode = true;
               this.clickground_mc.mouseEnabled = true;
               this.clickground_mc.mouseChildren = true;
            }
         }
         if(this._rewardItemVo != null)
         {
            if(ItemTypeHelper.typeToCategory(this._rewardItemVo.type) == Categories.SPECIES)
            {
               _loc1_ = AssetIds.getPreviewAssetId(Categories.ANIMAL,this._rewardItemVo.displayId);
            }
            else
            {
               _loc1_ = AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._rewardItemVo.id);
            }
            if(_loc1_ != this._iconId)
            {
               if(this._iconAsset)
               {
                  DisplayObjectHelper.removeChild(this._iconHolder,this._iconAsset);
               }
               this._iconId = _loc1_;
               this._iconAsset = new WrapedSprite(this._iconId,AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NONE,20,20,1);
               this._iconHolder.addChild(this._iconAsset);
            }
         }
      }
      
      public function destroy() : void
      {
         this._iconHolder.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._iconHolder.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._iconHolder.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         this.killTween();
         this._rewardItemVo = null;
         this._animalConfig = null;
         this._asset = null;
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(BoardgameRewardItemComponent.ON_CLICK_REWARD_EVENT));
      }
      
      public function showToolTip(param1:DisplayObject) : void
      {
         TooltipNewManager.setToolTip(param1,this._toolTip,true);
      }
      
      public function hideToolTip() : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function onMouseOut(param1:MouseEvent = null) : void
      {
         this.hideToolTip();
         if(this.isActive)
         {
            dispatchEvent(new BoardgameItemEvent(BoardgameItemEvent.ITEM_OUT,0,this._fieldId));
         }
      }
      
      private function onMouseOver(param1:MouseEvent = null) : void
      {
         this.showToolTip(this._iconHolder);
         if(this.isActive)
         {
            dispatchEvent(new BoardgameItemEvent(BoardgameItemEvent.ITEM_OVER,0,this._fieldId));
         }
      }
   }
}

