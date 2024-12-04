package windows.custom.cageUpgrade
{
   import buttons.simpleButton.BuyButtonNormalSkin;
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayBigSkin;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   
   public class CageUpgradeContent extends Group
   {
      private var _1262587272arrowContainer:SpriteVisualElement;
      
      private var _1440711785bonusFrom:GradientText;
      
      private var _1986146539bonusPic:SpriteVisualElement;
      
      private var _64069370bonusTo:GradientText;
      
      private var _1271589544buyButton:Button;
      
      private var _2079343717cageFromContainer:SpriteVisualElement;
      
      private var _2069061902cageLevelFrom:Counter;
      
      private var _1962818572cageLevelPicFrom:SpriteVisualElement;
      
      private var _292545373cageLevelPicTo:SpriteVisualElement;
      
      private var _788907971cageLevelTo:Counter;
      
      private var _2055698666cageToContainer:SpriteVisualElement;
      
      private var _756388539extraGraphics:SpriteVisualElement;
      
      private var _1006495386imageContainer:SpriteVisualElement;
      
      private var _197610141resourceNeeded:LabelDisplay;
      
      private var _1853802620upgradeCurrency1:LabelDisplay;
      
      private var _1853802619upgradeCurrency2:LabelDisplay;
      
      private var _1943332908upgradeCurrencyPic1:SpriteVisualElement;
      
      private var _1943332907upgradeCurrencyPic2:SpriteVisualElement;
      
      private var _1427097289upgradeInfoText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CageUpgradeContent()
      {
         super();
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._CageUpgradeContent_InnerGroup1_c()];
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
      
      private function _CageUpgradeContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 30;
         _loc1_.y = 70;
         _loc1_.mxmlContent = [this._CageUpgradeContent_SpriteVisualElement1_i(),this._CageUpgradeContent_SpriteVisualElement2_i(),this._CageUpgradeContent_SpriteVisualElement3_i(),this._CageUpgradeContent_SpriteVisualElement4_i(),this._CageUpgradeContent_SpriteVisualElement5_i(),this._CageUpgradeContent_SpriteVisualElement6_i(),this._CageUpgradeContent_SpriteVisualElement7_i(),this._CageUpgradeContent_GradientText1_i(),this._CageUpgradeContent_GradientText2_i(),this._CageUpgradeContent_LabelDisplay1_i(),this._CageUpgradeContent_VGroup1_c(),this._CageUpgradeContent_SpriteVisualElement8_i(),this._CageUpgradeContent_SpriteVisualElement9_i(),this._CageUpgradeContent_Button1_i(),this._CageUpgradeContent_Counter1_i(),this._CageUpgradeContent_Counter2_i(),this._CageUpgradeContent_StandardText1_i(),this._CageUpgradeContent_SpriteVisualElement10_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"imageContainer");
         this.imageContainer = _loc1_;
         BindingManager.executeBindings(this,"imageContainer",this.imageContainer);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 30;
         _loc1_.y = 200;
         _loc1_.initialized(this,"arrowContainer");
         this.arrowContainer = _loc1_;
         BindingManager.executeBindings(this,"arrowContainer",this.arrowContainer);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"cageFromContainer");
         this.cageFromContainer = _loc1_;
         BindingManager.executeBindings(this,"cageFromContainer",this.cageFromContainer);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"cageToContainer");
         this.cageToContainer = _loc1_;
         BindingManager.executeBindings(this,"cageToContainer",this.cageToContainer);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement5_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 90;
         _loc1_.y = 285;
         _loc1_.initialized(this,"bonusPic");
         this.bonusPic = _loc1_;
         BindingManager.executeBindings(this,"bonusPic",this.bonusPic);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement6_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 130;
         _loc1_.y = 140;
         _loc1_.scaleX = 2;
         _loc1_.scaleY = 2;
         _loc1_.initialized(this,"cageLevelPicFrom");
         this.cageLevelPicFrom = _loc1_;
         BindingManager.executeBindings(this,"cageLevelPicFrom",this.cageLevelPicFrom);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement7_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 250;
         _loc1_.y = 220;
         _loc1_.scaleX = 2;
         _loc1_.scaleY = 2;
         _loc1_.initialized(this,"cageLevelPicTo");
         this.cageLevelPicTo = _loc1_;
         BindingManager.executeBindings(this,"cageLevelPicTo",this.cageLevelPicTo);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 90;
         _loc1_.y = 188;
         _loc1_.fontSize = 20;
         _loc1_.depth = 999;
         _loc1_.id = "bonusFrom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bonusFrom = _loc1_;
         BindingManager.executeBindings(this,"bonusFrom",this.bonusFrom);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 230;
         _loc1_.y = 290;
         _loc1_.fontSize = 20;
         _loc1_.depth = 999;
         _loc1_.id = "bonusTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bonusTo = _loc1_;
         BindingManager.executeBindings(this,"bonusTo",this.bonusTo);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.x = 350;
         _loc1_.y = 130;
         _loc1_.setStyle("skinClass",LabelDisplayBigSkin);
         _loc1_.id = "resourceNeeded";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.resourceNeeded = _loc1_;
         BindingManager.executeBindings(this,"resourceNeeded",this.resourceNeeded);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 440;
         _loc1_.y = 215;
         _loc1_.gap = 5;
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._CageUpgradeContent_LabelDisplay2_i(),this._CageUpgradeContent_LabelDisplay3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "upgradeCurrency2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.upgradeCurrency2 = _loc1_;
         BindingManager.executeBindings(this,"upgradeCurrency2",this.upgradeCurrency2);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_LabelDisplay3_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "upgradeCurrency1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.upgradeCurrency1 = _loc1_;
         BindingManager.executeBindings(this,"upgradeCurrency1",this.upgradeCurrency1);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement8_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"upgradeCurrencyPic1");
         this.upgradeCurrencyPic1 = _loc1_;
         BindingManager.executeBindings(this,"upgradeCurrencyPic1",this.upgradeCurrencyPic1);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement9_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"upgradeCurrencyPic2");
         this.upgradeCurrencyPic2 = _loc1_;
         BindingManager.executeBindings(this,"upgradeCurrencyPic2",this.upgradeCurrencyPic2);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 404;
         _loc1_.y = 290;
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
      
      private function _CageUpgradeContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.backgroundScale = 0.34;
         _loc1_.x = 170;
         _loc1_.y = 90;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "cageLevelFrom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cageLevelFrom = _loc1_;
         BindingManager.executeBindings(this,"cageLevelFrom",this.cageLevelFrom);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_Counter2_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.backgroundScale = 0.34;
         _loc1_.x = 290;
         _loc1_.y = 170;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "cageLevelTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cageLevelTo = _loc1_;
         BindingManager.executeBindings(this,"cageLevelTo",this.cageLevelTo);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 372;
         _loc1_.y = 10;
         _loc1_.width = 185;
         _loc1_.height = 155;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "upgradeInfoText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.upgradeInfoText = _loc1_;
         BindingManager.executeBindings(this,"upgradeInfoText",this.upgradeInfoText);
         return _loc1_;
      }
      
      private function _CageUpgradeContent_SpriteVisualElement10_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"extraGraphics");
         this.extraGraphics = _loc1_;
         BindingManager.executeBindings(this,"extraGraphics",this.extraGraphics);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowContainer() : SpriteVisualElement
      {
         return this._1262587272arrowContainer;
      }
      
      public function set arrowContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1262587272arrowContainer;
         if(_loc2_ !== param1)
         {
            this._1262587272arrowContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bonusFrom() : GradientText
      {
         return this._1440711785bonusFrom;
      }
      
      public function set bonusFrom(param1:GradientText) : void
      {
         var _loc2_:Object = this._1440711785bonusFrom;
         if(_loc2_ !== param1)
         {
            this._1440711785bonusFrom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bonusFrom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bonusPic() : SpriteVisualElement
      {
         return this._1986146539bonusPic;
      }
      
      public function set bonusPic(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1986146539bonusPic;
         if(_loc2_ !== param1)
         {
            this._1986146539bonusPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bonusPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bonusTo() : GradientText
      {
         return this._64069370bonusTo;
      }
      
      public function set bonusTo(param1:GradientText) : void
      {
         var _loc2_:Object = this._64069370bonusTo;
         if(_loc2_ !== param1)
         {
            this._64069370bonusTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bonusTo",_loc2_,param1));
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
      public function get cageFromContainer() : SpriteVisualElement
      {
         return this._2079343717cageFromContainer;
      }
      
      public function set cageFromContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._2079343717cageFromContainer;
         if(_loc2_ !== param1)
         {
            this._2079343717cageFromContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageFromContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cageLevelFrom() : Counter
      {
         return this._2069061902cageLevelFrom;
      }
      
      public function set cageLevelFrom(param1:Counter) : void
      {
         var _loc2_:Object = this._2069061902cageLevelFrom;
         if(_loc2_ !== param1)
         {
            this._2069061902cageLevelFrom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageLevelFrom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cageLevelPicFrom() : SpriteVisualElement
      {
         return this._1962818572cageLevelPicFrom;
      }
      
      public function set cageLevelPicFrom(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1962818572cageLevelPicFrom;
         if(_loc2_ !== param1)
         {
            this._1962818572cageLevelPicFrom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageLevelPicFrom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cageLevelPicTo() : SpriteVisualElement
      {
         return this._292545373cageLevelPicTo;
      }
      
      public function set cageLevelPicTo(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._292545373cageLevelPicTo;
         if(_loc2_ !== param1)
         {
            this._292545373cageLevelPicTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageLevelPicTo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cageLevelTo() : Counter
      {
         return this._788907971cageLevelTo;
      }
      
      public function set cageLevelTo(param1:Counter) : void
      {
         var _loc2_:Object = this._788907971cageLevelTo;
         if(_loc2_ !== param1)
         {
            this._788907971cageLevelTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageLevelTo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cageToContainer() : SpriteVisualElement
      {
         return this._2055698666cageToContainer;
      }
      
      public function set cageToContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._2055698666cageToContainer;
         if(_loc2_ !== param1)
         {
            this._2055698666cageToContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cageToContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraGraphics() : SpriteVisualElement
      {
         return this._756388539extraGraphics;
      }
      
      public function set extraGraphics(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._756388539extraGraphics;
         if(_loc2_ !== param1)
         {
            this._756388539extraGraphics = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraGraphics",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageContainer() : SpriteVisualElement
      {
         return this._1006495386imageContainer;
      }
      
      public function set imageContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1006495386imageContainer;
         if(_loc2_ !== param1)
         {
            this._1006495386imageContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get resourceNeeded() : LabelDisplay
      {
         return this._197610141resourceNeeded;
      }
      
      public function set resourceNeeded(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._197610141resourceNeeded;
         if(_loc2_ !== param1)
         {
            this._197610141resourceNeeded = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"resourceNeeded",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upgradeCurrency1() : LabelDisplay
      {
         return this._1853802620upgradeCurrency1;
      }
      
      public function set upgradeCurrency1(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1853802620upgradeCurrency1;
         if(_loc2_ !== param1)
         {
            this._1853802620upgradeCurrency1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeCurrency1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upgradeCurrency2() : LabelDisplay
      {
         return this._1853802619upgradeCurrency2;
      }
      
      public function set upgradeCurrency2(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1853802619upgradeCurrency2;
         if(_loc2_ !== param1)
         {
            this._1853802619upgradeCurrency2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeCurrency2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upgradeCurrencyPic1() : SpriteVisualElement
      {
         return this._1943332908upgradeCurrencyPic1;
      }
      
      public function set upgradeCurrencyPic1(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1943332908upgradeCurrencyPic1;
         if(_loc2_ !== param1)
         {
            this._1943332908upgradeCurrencyPic1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeCurrencyPic1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upgradeCurrencyPic2() : SpriteVisualElement
      {
         return this._1943332907upgradeCurrencyPic2;
      }
      
      public function set upgradeCurrencyPic2(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1943332907upgradeCurrencyPic2;
         if(_loc2_ !== param1)
         {
            this._1943332907upgradeCurrencyPic2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeCurrencyPic2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upgradeInfoText() : StandardText
      {
         return this._1427097289upgradeInfoText;
      }
      
      public function set upgradeInfoText(param1:StandardText) : void
      {
         var _loc2_:Object = this._1427097289upgradeInfoText;
         if(_loc2_ !== param1)
         {
            this._1427097289upgradeInfoText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeInfoText",_loc2_,param1));
            }
         }
      }
   }
}

