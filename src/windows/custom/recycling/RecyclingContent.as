package windows.custom.recycling
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.counter.Counter;
   import components.counter.CounterRectBigSkin;
   import components.image.StandardImage;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class RecyclingContent extends Group
   {
      private var _1332194002background:StandardImage;
      
      private var _39931229buttonUpdateTrash:Button;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _957830652counter:Counter;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _1302741632infoButton:SpriteVisualElement;
      
      private var _676065800superFilterRarSymbol:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function RecyclingContent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._RecyclingContent_InnerGroup1_c(),this._RecyclingContent_OuterGroup1_c()];
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
      
      private function _RecyclingContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._RecyclingContent_VGroup1_c(),this._RecyclingContent_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.y = 20;
         _loc1_.mxmlContent = [this._RecyclingContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingContent_StandardImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _RecyclingContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      private function _RecyclingContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._RecyclingContent_Group3_c(),this._RecyclingContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._RecyclingContent_SpriteVisualElement1_i(),this._RecyclingContent_Counter1_i(),this._RecyclingContent_Group4_c(),this._RecyclingContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 75;
         _loc1_.y = 150;
         _loc1_.initialized(this,"superFilterRarSymbol");
         this.superFilterRarSymbol = _loc1_;
         BindingManager.executeBindings(this,"superFilterRarSymbol",this.superFilterRarSymbol);
         return _loc1_;
      }
      
      private function _RecyclingContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 85;
         _loc1_.y = 390;
         _loc1_.setStyle("skinClass",CounterRectBigSkin);
         _loc1_.id = "counter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counter = _loc1_;
         BindingManager.executeBindings(this,"counter",this.counter);
         return _loc1_;
      }
      
      private function _RecyclingContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 30;
         _loc1_.y = 425;
         _loc1_.mxmlContent = [this._RecyclingContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 110;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "buttonUpdateTrash";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonUpdateTrash = _loc1_;
         BindingManager.executeBindings(this,"buttonUpdateTrash",this.buttonUpdateTrash);
         return _loc1_;
      }
      
      private function _RecyclingContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.x = 230;
         _loc1_.y = 190;
         _loc1_.height = 175;
         _loc1_.width = 390;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _RecyclingContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 250;
         _loc1_.y = 113;
         _loc1_.initialized(this,"infoButton");
         this.infoButton = _loc1_;
         BindingManager.executeBindings(this,"infoButton",this.infoButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : StandardImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonUpdateTrash() : Button
      {
         return this._39931229buttonUpdateTrash;
      }
      
      public function set buttonUpdateTrash(param1:Button) : void
      {
         var _loc2_:Object = this._39931229buttonUpdateTrash;
         if(_loc2_ !== param1)
         {
            this._39931229buttonUpdateTrash = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonUpdateTrash",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardGroupHolder() : CardGroupHolder
      {
         return this._171849691cardGroupHolder;
      }
      
      public function set cardGroupHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._171849691cardGroupHolder;
         if(_loc2_ !== param1)
         {
            this._171849691cardGroupHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardGroupHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counter() : Counter
      {
         return this._957830652counter;
      }
      
      public function set counter(param1:Counter) : void
      {
         var _loc2_:Object = this._957830652counter;
         if(_loc2_ !== param1)
         {
            this._957830652counter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header_bg() : BitmapImage
      {
         return this._213293257header_bg;
      }
      
      public function set header_bg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._213293257header_bg;
         if(_loc2_ !== param1)
         {
            this._213293257header_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoButton() : SpriteVisualElement
      {
         return this._1302741632infoButton;
      }
      
      public function set infoButton(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1302741632infoButton;
         if(_loc2_ !== param1)
         {
            this._1302741632infoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superFilterRarSymbol() : SpriteVisualElement
      {
         return this._676065800superFilterRarSymbol;
      }
      
      public function set superFilterRarSymbol(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._676065800superFilterRarSymbol;
         if(_loc2_ !== param1)
         {
            this._676065800superFilterRarSymbol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superFilterRarSymbol",_loc2_,param1));
            }
         }
      }
   }
}

