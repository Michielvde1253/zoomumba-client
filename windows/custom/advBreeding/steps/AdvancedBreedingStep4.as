package windows.custom.advBreeding.steps
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.generic.FillableSpot;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class AdvancedBreedingStep4 extends Group
   {
      private var _244057963btnGoBack:Button;
      
      private var _2097344358btnStart:Button;
      
      private var _1378241396bubble:StandardImage;
      
      private var _491821181gradientText:GradientText;
      
      private var _1675582086labelClock:LabelDisplay;
      
      private var _1663403339labelPrice:LabelDisplay;
      
      private var _109620778sonia:StandardImage;
      
      private var _1320618578spotAnimal0:FillableSpot;
      
      private var _1320618579spotAnimal1:FillableSpot;
      
      private var _1378472934spotChance0:FillableSpot;
      
      private var _1378472933spotChance1:FillableSpot;
      
      private var _1378472932spotChance2:FillableSpot;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AdvancedBreedingStep4()
      {
         super();
         this.mxmlContent = [this._AdvancedBreedingStep4_InnerGroup1_c(),this._AdvancedBreedingStep4_OuterGroup1_c()];
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
      
      private function _AdvancedBreedingStep4_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep4_BackgroundImage1_c(),this._AdvancedBreedingStep4_StandardImage1_i(),this._AdvancedBreedingStep4_StandardText1_i(),this._AdvancedBreedingStep4_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.3;
         _loc1_.y = 75;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 165;
         _loc1_.y = 60;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.x = 225;
         _loc1_.y = 96;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textBubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBubble = _loc1_;
         BindingManager.executeBindings(this,"textBubble",this.textBubble);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.top = 210;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep4_GradientText1_i(),this._AdvancedBreedingStep4_HGroup1_c(),this._AdvancedBreedingStep4_LabelDisplay1_i(),this._AdvancedBreedingStep4_LabelDisplay2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "BLablabalbalbalb";
         _loc1_.width = 410;
         _loc1_.height = 70;
         _loc1_.id = "gradientText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradientText = _loc1_;
         BindingManager.executeBindings(this,"gradientText",this.gradientText);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.paddingLeft = -8;
         _loc1_.paddingTop = -8;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep4_FillableSpot1_i(),this._AdvancedBreedingStep4_FillableSpot2_i(),this._AdvancedBreedingStep4_FillableSpot3_i(),this._AdvancedBreedingStep4_FillableSpot4_i(),this._AdvancedBreedingStep4_FillableSpot5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_FillableSpot1_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotAnimal0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotAnimal0 = _loc1_;
         BindingManager.executeBindings(this,"spotAnimal0",this.spotAnimal0);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_FillableSpot2_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotAnimal1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotAnimal1 = _loc1_;
         BindingManager.executeBindings(this,"spotAnimal1",this.spotAnimal1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_FillableSpot3_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance0 = _loc1_;
         BindingManager.executeBindings(this,"spotChance0",this.spotChance0);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_FillableSpot4_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance1 = _loc1_;
         BindingManager.executeBindings(this,"spotChance1",this.spotChance1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_FillableSpot5_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance2 = _loc1_;
         BindingManager.executeBindings(this,"spotChance2",this.spotChance2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.height = 30;
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "labelClock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelClock = _loc1_;
         BindingManager.executeBindings(this,"labelClock",this.labelClock);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "labelPrice";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelPrice = _loc1_;
         BindingManager.executeBindings(this,"labelPrice",this.labelPrice);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep4_StandardImage2_i(),this._AdvancedBreedingStep4_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 34;
         _loc1_.y = 63;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 22;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep4_Button1_i(),this._AdvancedBreedingStep4_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep4_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "go back to 3";
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnGoBack_click);
         _loc1_.id = "btnGoBack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnGoBack = _loc1_;
         BindingManager.executeBindings(this,"btnGoBack",this.btnGoBack);
         return _loc1_;
      }
      
      public function __btnGoBack_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("goBackClicked"));
      }
      
      private function _AdvancedBreedingStep4_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "start";
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnStart_click);
         _loc1_.id = "btnStart";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnStart = _loc1_;
         BindingManager.executeBindings(this,"btnStart",this.btnStart);
         return _loc1_;
      }
      
      public function __btnStart_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("startClicked"));
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoBack() : Button
      {
         return this._244057963btnGoBack;
      }
      
      public function set btnGoBack(param1:Button) : void
      {
         var _loc2_:Object = this._244057963btnGoBack;
         if(_loc2_ !== param1)
         {
            this._244057963btnGoBack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoBack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStart() : Button
      {
         return this._2097344358btnStart;
      }
      
      public function set btnStart(param1:Button) : void
      {
         var _loc2_:Object = this._2097344358btnStart;
         if(_loc2_ !== param1)
         {
            this._2097344358btnStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStart",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gradientText() : GradientText
      {
         return this._491821181gradientText;
      }
      
      public function set gradientText(param1:GradientText) : void
      {
         var _loc2_:Object = this._491821181gradientText;
         if(_loc2_ !== param1)
         {
            this._491821181gradientText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradientText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelClock() : LabelDisplay
      {
         return this._1675582086labelClock;
      }
      
      public function set labelClock(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1675582086labelClock;
         if(_loc2_ !== param1)
         {
            this._1675582086labelClock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelClock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelPrice() : LabelDisplay
      {
         return this._1663403339labelPrice;
      }
      
      public function set labelPrice(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1663403339labelPrice;
         if(_loc2_ !== param1)
         {
            this._1663403339labelPrice = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelPrice",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonia() : StandardImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109620778sonia;
         if(_loc2_ !== param1)
         {
            this._109620778sonia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotAnimal0() : FillableSpot
      {
         return this._1320618578spotAnimal0;
      }
      
      public function set spotAnimal0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1320618578spotAnimal0;
         if(_loc2_ !== param1)
         {
            this._1320618578spotAnimal0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotAnimal0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotAnimal1() : FillableSpot
      {
         return this._1320618579spotAnimal1;
      }
      
      public function set spotAnimal1(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1320618579spotAnimal1;
         if(_loc2_ !== param1)
         {
            this._1320618579spotAnimal1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotAnimal1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotChance0() : FillableSpot
      {
         return this._1378472934spotChance0;
      }
      
      public function set spotChance0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472934spotChance0;
         if(_loc2_ !== param1)
         {
            this._1378472934spotChance0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotChance1() : FillableSpot
      {
         return this._1378472933spotChance1;
      }
      
      public function set spotChance1(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472933spotChance1;
         if(_loc2_ !== param1)
         {
            this._1378472933spotChance1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotChance2() : FillableSpot
      {
         return this._1378472932spotChance2;
      }
      
      public function set spotChance2(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472932spotChance2;
         if(_loc2_ !== param1)
         {
            this._1378472932spotChance2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBubble() : StandardText
      {
         return this._1365610521textBubble;
      }
      
      public function set textBubble(param1:StandardText) : void
      {
         var _loc2_:Object = this._1365610521textBubble;
         if(_loc2_ !== param1)
         {
            this._1365610521textBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBubble",_loc2_,param1));
            }
         }
      }
   }
}

