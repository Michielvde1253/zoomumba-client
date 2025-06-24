package custom.mainInterface.powerupPanel
{
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class PowerupPanel extends Group
   {
      private var _1785498138buttonClose:SpriteVisualElement;
      
      private var _358406300buttonOpen:SpriteVisualElement;
      
      private var _1770497418buttonStack:Group;
      
      private var _1290000376iconContainer:Group;
      
      private var _1649444434panelBackground:SpriteVisualElement;
      
      private var _858579475powerups:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const PANEL_CLOSED_Y:int = -350;
      
      private const BUTTON_CLOSED_Y:int = 50;
      
      public const ITEM_V_GAP:int = 67;
      
      public const ITEM_H_GAP:int = 145;
      
      private var lines:int;
      
      private var openPosition:Number = -350;
      
      private var panelOpen:Boolean = false;
      
      public var gt:PowerupItem;
      
      private var PanelBackground:Class = PowerupPanel_PanelBackground;
      
      private var ButtonOpen:Class = PowerupPanel_ButtonOpen;
      
      private var ButtonClose:Class = PowerupPanel_ButtonClose;
      
      public function PowerupPanel()
      {
         super();
         this.mxmlContent = [this._PowerupPanel_Group2_i(),this._PowerupPanel_Group12_i()];
         this.addEventListener("creationComplete",this.___PowerupPanel_Group1_creationComplete);
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
      
      protected function init(param1:FlexEvent) : void
      {
         this.panelBackground.addChild(new this.PanelBackground());
         this.buttonOpen.addChild(new this.ButtonOpen());
         this.buttonClose.addChild(new this.ButtonClose());
      }
      
      protected function handleCloseButtonClick(param1:MouseEvent) : void
      {
         TweenLite.to(this.powerups,0.4,{
            "y":this.PANEL_CLOSED_Y,
            "onComplete":this.showOpenButton
         });
         TweenLite.to(this.buttonStack,0.4,{"y":this.BUTTON_CLOSED_Y});
      }
      
      protected function handleOpenButtonClick(param1:MouseEvent) : void
      {
         TweenLite.to(this.powerups,0.4,{
            "y":this.openPosition,
            "onComplete":this.hideOpenButton
         });
         TweenLite.to(this.buttonStack,0.4,{"y":this.openPosition + 335});
      }
      
      private function hideOpenButton() : void
      {
         this.buttonOpen.visible = false;
         this.panelOpen = true;
      }
      
      private function showOpenButton() : void
      {
         this.buttonOpen.visible = true;
         this.panelOpen = false;
      }
      
      public function refreshDropPosition(param1:int) : void
      {
         this.lines = Math.ceil(param1 / 2);
         this.openPosition = this.lines * this.ITEM_V_GAP + this.PANEL_CLOSED_Y + 73;
         if(this.panelOpen)
         {
            this.handleOpenButtonClick(null);
         }
      }
      
      private function _PowerupPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.width = 300;
         _loc1_.y = -350;
         _loc1_.mxmlContent = [this._PowerupPanel_SpriteVisualElement1_i(),this._PowerupPanel_Group3_i()];
         _loc1_.id = "powerups";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.powerups = _loc1_;
         BindingManager.executeBindings(this,"powerups",this.powerups);
         return _loc1_;
      }
      
      private function _PowerupPanel_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 0;
         _loc1_.initialized(this,"panelBackground");
         this.panelBackground = _loc1_;
         BindingManager.executeBindings(this,"panelBackground",this.panelBackground);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 20;
         _loc1_.mxmlContent = [this._PowerupPanel_Group4_c(),this._PowerupPanel_Group5_c(),this._PowerupPanel_Group6_c(),this._PowerupPanel_Group7_c(),this._PowerupPanel_Group8_c(),this._PowerupPanel_Group9_c(),this._PowerupPanel_Group10_c(),this._PowerupPanel_Group11_c()];
         _loc1_.id = "iconContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconContainer = _loc1_;
         BindingManager.executeBindings(this,"iconContainer",this.iconContainer);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 230;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 140;
         _loc1_.y = 230;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 165;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 140;
         _loc1_.y = 165;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 140;
         _loc1_.y = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group10_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 35;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group11_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 140;
         _loc1_.y = 35;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PowerupPanel_Group12_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 160;
         _loc1_.y = 50;
         _loc1_.mxmlContent = [this._PowerupPanel_SpriteVisualElement2_i(),this._PowerupPanel_SpriteVisualElement3_i()];
         _loc1_.id = "buttonStack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonStack = _loc1_;
         BindingManager.executeBindings(this,"buttonStack",this.buttonStack);
         return _loc1_;
      }
      
      private function _PowerupPanel_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__buttonClose_click);
         _loc1_.initialized(this,"buttonClose");
         this.buttonClose = _loc1_;
         BindingManager.executeBindings(this,"buttonClose",this.buttonClose);
         return _loc1_;
      }
      
      public function __buttonClose_click(param1:MouseEvent) : void
      {
         this.handleCloseButtonClick(param1);
      }
      
      private function _PowerupPanel_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__buttonOpen_click);
         _loc1_.initialized(this,"buttonOpen");
         this.buttonOpen = _loc1_;
         BindingManager.executeBindings(this,"buttonOpen",this.buttonOpen);
         return _loc1_;
      }
      
      public function __buttonOpen_click(param1:MouseEvent) : void
      {
         this.handleOpenButtonClick(param1);
      }
      
      public function ___PowerupPanel_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonClose() : SpriteVisualElement
      {
         return this._1785498138buttonClose;
      }
      
      public function set buttonClose(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1785498138buttonClose;
         if(_loc2_ !== param1)
         {
            this._1785498138buttonClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonOpen() : SpriteVisualElement
      {
         return this._358406300buttonOpen;
      }
      
      public function set buttonOpen(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._358406300buttonOpen;
         if(_loc2_ !== param1)
         {
            this._358406300buttonOpen = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonOpen",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonStack() : Group
      {
         return this._1770497418buttonStack;
      }
      
      public function set buttonStack(param1:Group) : void
      {
         var _loc2_:Object = this._1770497418buttonStack;
         if(_loc2_ !== param1)
         {
            this._1770497418buttonStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconContainer() : Group
      {
         return this._1290000376iconContainer;
      }
      
      public function set iconContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1290000376iconContainer;
         if(_loc2_ !== param1)
         {
            this._1290000376iconContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panelBackground() : SpriteVisualElement
      {
         return this._1649444434panelBackground;
      }
      
      public function set panelBackground(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1649444434panelBackground;
         if(_loc2_ !== param1)
         {
            this._1649444434panelBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get powerups() : Group
      {
         return this._858579475powerups;
      }
      
      public function set powerups(param1:Group) : void
      {
         var _loc2_:Object = this._858579475powerups;
         if(_loc2_ !== param1)
         {
            this._858579475powerups = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"powerups",_loc2_,param1));
            }
         }
      }
   }
}

