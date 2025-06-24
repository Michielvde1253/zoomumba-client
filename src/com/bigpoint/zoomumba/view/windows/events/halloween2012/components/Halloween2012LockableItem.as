package com.bigpoint.zoomumba.view.windows.events.halloween2012.components
{
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.generic.GenericCircularCounter;
   import flash.display.Sprite;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import utils.Color;
   
   public class Halloween2012LockableItem extends Group
   {
      public static const STATE_LOCKED:uint = 1;
      
      public static const STATE_UNLOCKED:uint = 2;
      
      public static const STATE_USED:uint = 3;
      
      private var _204076967lockedState:SpriteVisualElement;
      
      private var _934326481reward:GenericCircularCounter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _displayImage:WrapedSprite;
      
      private var _itemSate:uint;
      
      private var _step:uint;
      
      private var _lockedSpr:Class = Halloween2012LockableItem__lockedSpr;
      
      private var _unlockedSpr:Class = Halloween2012LockableItem__unlockedSpr;
      
      private var _doneSpr:Class = Halloween2012LockableItem__doneSpr;
      
      public function Halloween2012LockableItem()
      {
         super();
         this.mxmlContent = [this._Halloween2012LockableItem_Group2_c()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Sprite = null;
         this.reward.counter.visible = false;
         if(this.reward.button.displayImg.spriteClassDisplay != this._displayImage)
         {
            this.reward.button.backgroundScale = 0.6;
            this.reward.button.displayImg.maskRectBottom = 0;
            this.reward.button.displayImg.automaticCentralize = false;
            this.reward.button.displayImg.spriteClassDisplay = this._displayImage;
         }
         if(this.lockedState.numChildren > 0)
         {
            this.lockedState.removeChildAt(0);
         }
         switch(this._itemSate)
         {
            case STATE_LOCKED:
               this.filters = [Color.getColorMatrixFilter(Color.GRAYSCALE_LIGHT)];
               this.lockedState.addChild(Sprite(new this._lockedSpr()));
               this.lockedState.visible = true;
               this.reward.button.enabled = false;
               break;
            case STATE_UNLOCKED:
               this.filters = [];
               this.lockedState.addChild(Sprite(new this._unlockedSpr()));
               this.lockedState.visible = true;
               this.reward.button.enabled = true;
               break;
            case STATE_USED:
               this.filters = [];
               _loc1_ = Sprite(new this._doneSpr());
               _loc1_.scaleX = 0.5;
               _loc1_.scaleY = 0.5;
               this.lockedState.addChild(_loc1_);
               this.lockedState.visible = true;
               this.reward.button.enabled = false;
         }
      }
      
      public function get displayImage() : WrapedSprite
      {
         return this._displayImage;
      }
      
      public function set displayImage(param1:WrapedSprite) : void
      {
         if(this._displayImage != param1)
         {
            this._displayImage = param1;
            this.invalidateProperties();
         }
      }
      
      public function get itemSate() : uint
      {
         return this._itemSate;
      }
      
      public function set itemSate(param1:uint) : void
      {
         if(this._itemSate != param1)
         {
            this._itemSate = param1;
            this.invalidateProperties();
         }
      }
      
      public function get step() : uint
      {
         return this._step;
      }
      
      public function set step(param1:uint) : void
      {
         this._step = param1;
      }
      
      private function _Halloween2012LockableItem_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._Halloween2012LockableItem_GenericCircularCounter1_i(),this._Halloween2012LockableItem_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Halloween2012LockableItem_GenericCircularCounter1_i() : GenericCircularCounter
      {
         var _loc1_:GenericCircularCounter = new GenericCircularCounter();
         _loc1_.id = "reward";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reward = _loc1_;
         BindingManager.executeBindings(this,"reward",this.reward);
         return _loc1_;
      }
      
      private function _Halloween2012LockableItem_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.visible = false;
         _loc1_.x = 20;
         _loc1_.y = 10;
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.8;
         _loc1_.initialized(this,"lockedState");
         this.lockedState = _loc1_;
         BindingManager.executeBindings(this,"lockedState",this.lockedState);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get lockedState() : SpriteVisualElement
      {
         return this._204076967lockedState;
      }
      
      public function set lockedState(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._204076967lockedState;
         if(_loc2_ !== param1)
         {
            this._204076967lockedState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lockedState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reward() : GenericCircularCounter
      {
         return this._934326481reward;
      }
      
      public function set reward(param1:GenericCircularCounter) : void
      {
         var _loc2_:Object = this._934326481reward;
         if(_loc2_ !== param1)
         {
            this._934326481reward = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reward",_loc2_,param1));
            }
         }
      }
   }
}

