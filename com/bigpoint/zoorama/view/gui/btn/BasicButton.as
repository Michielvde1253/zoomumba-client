package com.bigpoint.zoorama.view.gui.btn
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.tooltip.Tooltip;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class BasicButton extends Coreponent
   {
      public var notifier:Notifier;
      
      public var notice:Notice;
      
      public var disableNotice:Notice;
      
      public var _toolText:String;
      
      public var isEnabled:Boolean = true;
      
      protected var s0:Sprite;
      
      protected var s1:Sprite;
      
      protected var s2:Sprite;
      
      protected var s0_disabled:Sprite;
      
      protected var _tooltip:Tooltip;
      
      protected var _soundNames:Array = [];
      
      public var tweenMouseOverParams:Array;
      
      public var tweenMouseOutParams:Array;
      
      public var tweenMouseDownParams:Array;
      
      public var tweenMouseUpParams:Array;
      
      protected var currentTween:TweenLite;
      
      private var hitSpr:Sprite;
      
      public function BasicButton(param1:Notifier = null, param2:Sprite = null)
      {
         super();
         if(param1)
         {
            this.notifier = new Notifier(param1);
         }
         if(param2)
         {
            this.skin = param2;
         }
      }
      
      protected function init() : void
      {
      }
      
      public function enable() : void
      {
         this.isEnabled = true;
      }
      
      public function disable() : void
      {
         this.isEnabled = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.isEnabled = param1;
      }
      
      override public function set skin(param1:Sprite) : void
      {
         super.skin = param1;
         hit = skin.getChildByName("hit") as Sprite;
         if(hit)
         {
            hit.alpha = 0;
            this.setHitEventListener(hit);
         }
         else
         {
            this.setHitEventListener(this);
         }
         this.s0 = skin.getChildByName("s0") as Sprite;
         this.s1 = skin.getChildByName("s1") as Sprite;
         this.s2 = skin.getChildByName("s2") as Sprite;
         this.s0_disabled = skin.getChildByName("s0_disabled") as Sprite;
      }
      
      protected function setHitEventListener(param1:Sprite) : void
      {
         this.hitSpr = param1;
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
         param1.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
         param1.addEventListener(MouseEvent.CLICK,this.handleMouseClickHit);
         param1.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOverHit);
         param1.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOutHit);
         param1.buttonMode = true;
         param1.useHandCursor = true;
      }
      
      override protected function onAddedToStage(param1:Event) : void
      {
         super.onAddedToStage(param1);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
      }
      
      protected function handleMouseDown(param1:MouseEvent) : void
      {
         if(this.tweenMouseDownParams)
         {
            this.currentTween = new TweenLite(this.tweenMouseDownParams[0] == null ? this : this.tweenMouseDownParams[0],this.tweenMouseDownParams[1],this.tweenMouseDownParams[2]);
         }
      }
      
      protected function handleMouseUp(param1:MouseEvent) : void
      {
         if(this.tweenMouseUpParams)
         {
            this.currentTween = new TweenLite(this.tweenMouseUpParams[0] == null ? this : this.tweenMouseUpParams[0],this.tweenMouseUpParams[1],this.tweenMouseUpParams[2]);
         }
      }
      
      protected function handleMouseClickHit(param1:MouseEvent) : void
      {
         var _loc2_:String = this.randomSound;
         if(_loc2_)
         {
            SoundManager.getInstance().playSoundEffect(_loc2_);
         }
         if(this.isEnabled)
         {
            if(Boolean(this.notifier) && Boolean(this.notice))
            {
               this.notifier.dispatchNotice(this.notice);
            }
         }
      }
      
      protected function handleMouseOutHit(param1:MouseEvent) : void
      {
         if(!this.tooltip)
         {
         }
         if(this._toolText)
         {
            TooltipNewManager.removeToolTip();
         }
         if(this.tweenMouseOutParams)
         {
            this.currentTween = new TweenLite(this.tweenMouseOutParams[0] == null ? this : this.tweenMouseOutParams[0],this.tweenMouseOutParams[1],this.tweenMouseOutParams[2]);
         }
      }
      
      protected function handleMouseOverHit(param1:MouseEvent) : void
      {
         if(this._toolText)
         {
            TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText(this._toolText),false);
         }
         if(!this.tooltip)
         {
         }
         if(this.tweenMouseOverParams)
         {
            this.currentTween = new TweenLite(this.tweenMouseOverParams[0] == null ? this : this.tweenMouseOverParams[0],this.tweenMouseOverParams[1],this.tweenMouseOverParams[2]);
         }
      }
      
      public function set tooltip(param1:Tooltip) : void
      {
         this._tooltip = param1;
         this._tooltip.target = this;
      }
      
      public function get tooltip() : Tooltip
      {
         return this._tooltip;
      }
      
      public function set sound(param1:String) : void
      {
         this._soundNames = [param1];
      }
      
      protected function get randomSound() : String
      {
         var _loc1_:Number = Math.random() * (this._soundNames.length - 1);
         var _loc2_:int = Math.round(_loc1_);
         var _loc3_:String = this._soundNames[_loc2_];
         if(_loc3_)
         {
            return _loc3_;
         }
         return null;
      }
      
      public function addSound(param1:String) : void
      {
         this._soundNames.push(param1);
      }
      
      public function set sounds(param1:Array) : void
      {
         this._soundNames = param1;
      }
      
      public function get sounds() : Array
      {
         return this._soundNames;
      }
      
      public function set toolTextData(param1:String) : void
      {
         this._toolText = param1;
      }
      
      public function removeAllListeners() : void
      {
         this.hitSpr.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
         this.hitSpr.removeEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
         this.hitSpr.removeEventListener(MouseEvent.CLICK,this.handleMouseClickHit);
         this.hitSpr.removeEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOverHit);
         this.hitSpr.removeEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOutHit);
         this.hitSpr.buttonMode = false;
         this.hitSpr.useHandCursor = false;
      }
      
      public function addListeners() : void
      {
         this.hitSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
         this.hitSpr.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
         this.hitSpr.addEventListener(MouseEvent.CLICK,this.handleMouseClickHit);
         this.hitSpr.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOverHit);
         this.hitSpr.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOutHit);
         this.hitSpr.buttonMode = true;
         this.hitSpr.useHandCursor = true;
      }
   }
}

