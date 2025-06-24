package windows.custom.waterStoreHouse
{
   import buttons.simpleButton.BuyButtonNormalSkin;
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class WaterStoreHouseContent extends Group
   {
      private var _97299bar:Image;
      
      private var _1735640539bartitle:GradientText;
      
      private var _1271589544buyButton:Button;
      
      private var _1487138970capFromGra:GradientText;
      
      private var _79505495capToGra:GradientText;
      
      private var _1426572493haveLimit:StandardText;
      
      private var _319678496haveLimitBar:Group;
      
      private var _1680942313imageBackground:SpriteVisualElement;
      
      private var _1211109709infoImage:SpriteVisualElement;
      
      private var _872453529introtext:StandardText;
      
      private var _1599988714introtoptext:StandardText;
      
      private var _1656634034levelFrom:Counter;
      
      private var _1656229167levelText:StandardText;
      
      private var _69784863levelTo:Counter;
      
      private var _3343801main:VGroup;
      
      private var _449434492updateInfoBar:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _selectedValue:int;
      
      public function WaterStoreHouseContent()
      {
         super();
         this.mxmlContent = [this._WaterStoreHouseContent_InnerGroup1_c(),this._WaterStoreHouseContent_OuterGroup1_c()];
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
      
      public function get selectedValue() : int
      {
         return this._selectedValue;
      }
      
      private function _WaterStoreHouseContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_VGroup1_c(),this._WaterStoreHouseContent_VGroup3_c(),this._WaterStoreHouseContent_Group2_i(),this._WaterStoreHouseContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 220;
         _loc1_.y = 60;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 100;
         _loc1_.y = 80;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_StandardText1_i(),this._WaterStoreHouseContent_StandardText2_i()];
         _loc1_.id = "main";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.main = _loc1_;
         BindingManager.executeBindings(this,"main",this.main);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 410;
         _loc1_.setStyle("fontSize",18);
         _loc1_.id = "introtoptext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.introtoptext = _loc1_;
         BindingManager.executeBindings(this,"introtoptext",this.introtoptext);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 410;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "introtext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.introtext = _loc1_;
         BindingManager.executeBindings(this,"introtext",this.introtext);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 150;
         _loc1_.y = 165;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_VGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = -3;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_GradientText1_i(),this._WaterStoreHouseContent_Image1_i(),this._WaterStoreHouseContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "bartitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bartitle = _loc1_;
         BindingManager.executeBindings(this,"bartitle",this.bartitle);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.width = 398.75;
         _loc1_.height = 71.5;
         _loc1_.id = "bar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bar = _loc1_;
         BindingManager.executeBindings(this,"bar",this.bar);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "levelText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.levelText = _loc1_;
         BindingManager.executeBindings(this,"levelText",this.levelText);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 55;
         _loc1_.y = 320;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_StandardText4_i()];
         _loc1_.id = "haveLimitBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.haveLimitBar = _loc1_;
         BindingManager.executeBindings(this,"haveLimitBar",this.haveLimitBar);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_StandardText4_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 130;
         _loc1_.width = 410;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "haveLimit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.haveLimit = _loc1_;
         BindingManager.executeBindings(this,"haveLimit",this.haveLimit);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 55;
         _loc1_.y = 285;
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_SpriteVisualElement1_i(),this._WaterStoreHouseContent_GradientText2_i(),this._WaterStoreHouseContent_GradientText3_i(),this._WaterStoreHouseContent_Counter1_i(),this._WaterStoreHouseContent_Counter2_i(),this._WaterStoreHouseContent_Button1_i()];
         _loc1_.id = "updateInfoBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.updateInfoBar = _loc1_;
         BindingManager.executeBindings(this,"updateInfoBar",this.updateInfoBar);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 120;
         _loc1_.y = 0;
         _loc1_.initialized(this,"imageBackground");
         this.imageBackground = _loc1_;
         BindingManager.executeBindings(this,"imageBackground",this.imageBackground);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.x = 170;
         _loc1_.y = 122;
         _loc1_.id = "capFromGra";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.capFromGra = _loc1_;
         BindingManager.executeBindings(this,"capFromGra",this.capFromGra);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.x = 360;
         _loc1_.y = 122;
         _loc1_.id = "capToGra";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.capToGra = _loc1_;
         BindingManager.executeBindings(this,"capToGra",this.capToGra);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.backgroundScale = 0.34;
         _loc1_.x = 200;
         _loc1_.y = 30;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "levelFrom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.levelFrom = _loc1_;
         BindingManager.executeBindings(this,"levelFrom",this.levelFrom);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Counter2_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.backgroundScale = 0.34;
         _loc1_.x = 390;
         _loc1_.y = 30;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "levelTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.levelTo = _loc1_;
         BindingManager.executeBindings(this,"levelTo",this.levelTo);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 230;
         _loc1_.y = 140;
         _loc1_.setStyle("skinClass",BuyButtonNormalSkin);
         _loc1_.id = "buyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton = _loc1_;
         BindingManager.executeBindings(this,"buyButton",this.buyButton);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._WaterStoreHouseContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 20;
         _loc1_.y = 0;
         _loc1_.initialized(this,"infoImage");
         this.infoImage = _loc1_;
         BindingManager.executeBindings(this,"infoImage",this.infoImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bar() : Image
      {
         return this._97299bar;
      }
      
      public function set bar(param1:Image) : void
      {
         var _loc2_:Object = this._97299bar;
         if(_loc2_ !== param1)
         {
            this._97299bar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bartitle() : GradientText
      {
         return this._1735640539bartitle;
      }
      
      public function set bartitle(param1:GradientText) : void
      {
         var _loc2_:Object = this._1735640539bartitle;
         if(_loc2_ !== param1)
         {
            this._1735640539bartitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bartitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton() : Button
      {
         return this._1271589544buyButton;
      }
      
      public function set buyButton(param1:Button) : void
      {
         var _loc2_:Object = this._1271589544buyButton;
         if(_loc2_ !== param1)
         {
            this._1271589544buyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get capFromGra() : GradientText
      {
         return this._1487138970capFromGra;
      }
      
      public function set capFromGra(param1:GradientText) : void
      {
         var _loc2_:Object = this._1487138970capFromGra;
         if(_loc2_ !== param1)
         {
            this._1487138970capFromGra = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"capFromGra",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get capToGra() : GradientText
      {
         return this._79505495capToGra;
      }
      
      public function set capToGra(param1:GradientText) : void
      {
         var _loc2_:Object = this._79505495capToGra;
         if(_loc2_ !== param1)
         {
            this._79505495capToGra = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"capToGra",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get haveLimit() : StandardText
      {
         return this._1426572493haveLimit;
      }
      
      public function set haveLimit(param1:StandardText) : void
      {
         var _loc2_:Object = this._1426572493haveLimit;
         if(_loc2_ !== param1)
         {
            this._1426572493haveLimit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"haveLimit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get haveLimitBar() : Group
      {
         return this._319678496haveLimitBar;
      }
      
      public function set haveLimitBar(param1:Group) : void
      {
         var _loc2_:Object = this._319678496haveLimitBar;
         if(_loc2_ !== param1)
         {
            this._319678496haveLimitBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"haveLimitBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageBackground() : SpriteVisualElement
      {
         return this._1680942313imageBackground;
      }
      
      public function set imageBackground(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1680942313imageBackground;
         if(_loc2_ !== param1)
         {
            this._1680942313imageBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoImage() : SpriteVisualElement
      {
         return this._1211109709infoImage;
      }
      
      public function set infoImage(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1211109709infoImage;
         if(_loc2_ !== param1)
         {
            this._1211109709infoImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get introtext() : StandardText
      {
         return this._872453529introtext;
      }
      
      public function set introtext(param1:StandardText) : void
      {
         var _loc2_:Object = this._872453529introtext;
         if(_loc2_ !== param1)
         {
            this._872453529introtext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"introtext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get introtoptext() : StandardText
      {
         return this._1599988714introtoptext;
      }
      
      public function set introtoptext(param1:StandardText) : void
      {
         var _loc2_:Object = this._1599988714introtoptext;
         if(_loc2_ !== param1)
         {
            this._1599988714introtoptext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"introtoptext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get levelFrom() : Counter
      {
         return this._1656634034levelFrom;
      }
      
      public function set levelFrom(param1:Counter) : void
      {
         var _loc2_:Object = this._1656634034levelFrom;
         if(_loc2_ !== param1)
         {
            this._1656634034levelFrom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"levelFrom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get levelText() : StandardText
      {
         return this._1656229167levelText;
      }
      
      public function set levelText(param1:StandardText) : void
      {
         var _loc2_:Object = this._1656229167levelText;
         if(_loc2_ !== param1)
         {
            this._1656229167levelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"levelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get levelTo() : Counter
      {
         return this._69784863levelTo;
      }
      
      public function set levelTo(param1:Counter) : void
      {
         var _loc2_:Object = this._69784863levelTo;
         if(_loc2_ !== param1)
         {
            this._69784863levelTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"levelTo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get main() : VGroup
      {
         return this._3343801main;
      }
      
      public function set main(param1:VGroup) : void
      {
         var _loc2_:Object = this._3343801main;
         if(_loc2_ !== param1)
         {
            this._3343801main = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"main",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get updateInfoBar() : Group
      {
         return this._449434492updateInfoBar;
      }
      
      public function set updateInfoBar(param1:Group) : void
      {
         var _loc2_:Object = this._449434492updateInfoBar;
         if(_loc2_ !== param1)
         {
            this._449434492updateInfoBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"updateInfoBar",_loc2_,param1));
            }
         }
      }
   }
}

