package windows.custom.advBreeding.steps
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import custom.card.component.CardGroupHolder;
   import custom.generic.FillableSpot;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class AdvancedBreedingStep3 extends Group
   {
      private var _1212609315btnContinue:Button;
      
      private var _244057963btnGoBack:Button;
      
      private var _1378241396bubble:StandardImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _109620778sonia:StandardImage;
      
      private var _109651822spot0:FillableSpot;
      
      private var _109651823spot1:FillableSpot;
      
      private var _109651824spot2:FillableSpot;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AdvancedBreedingStep3()
      {
         super();
         this.mxmlContent = [this._AdvancedBreedingStep3_InnerGroup1_c(),this._AdvancedBreedingStep3_OuterGroup1_c()];
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
      
      private function _AdvancedBreedingStep3_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep3_BackgroundImage1_c(),this._AdvancedBreedingStep3_StandardImage1_i(),this._AdvancedBreedingStep3_StandardText1_i(),this._AdvancedBreedingStep3_HGroup1_c(),this._AdvancedBreedingStep3_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_BackgroundImage1_c() : BackgroundImage
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
      
      private function _AdvancedBreedingStep3_StandardImage1_i() : StandardImage
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
      
      private function _AdvancedBreedingStep3_StandardText1_i() : StandardText
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
      
      private function _AdvancedBreedingStep3_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = -20;
         _loc1_.verticalCenter = -20;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep3_FillableSpot1_i(),this._AdvancedBreedingStep3_FillableSpot2_i(),this._AdvancedBreedingStep3_FillableSpot3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_FillableSpot1_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spot0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spot0 = _loc1_;
         BindingManager.executeBindings(this,"spot0",this.spot0);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_FillableSpot2_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spot1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spot1 = _loc1_;
         BindingManager.executeBindings(this,"spot1",this.spot1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_FillableSpot3_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spot2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spot2 = _loc1_;
         BindingManager.executeBindings(this,"spot2",this.spot2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = null;
         _loc1_ = new CardGroupHolder();
         _loc1_.horizontalTileCenter = 0;
         _loc1_.height = 170;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.left = 95;
         _loc1_.right = 110;
         _loc1_.y = 285;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingStep3_StandardImage2_i(),this._AdvancedBreedingStep3_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_StandardImage2_i() : StandardImage
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
      
      private function _AdvancedBreedingStep3_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 22;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._AdvancedBreedingStep3_Button1_i(),this._AdvancedBreedingStep3_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingStep3_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "go back to 2";
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
      
      private function _AdvancedBreedingStep3_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "go to 4";
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnContinue_click);
         _loc1_.id = "btnContinue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnContinue = _loc1_;
         BindingManager.executeBindings(this,"btnContinue",this.btnContinue);
         return _loc1_;
      }
      
      public function __btnContinue_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("continueClicked"));
      }
      
      [Bindable(event="propertyChange")]
      public function get btnContinue() : Button
      {
         return this._1212609315btnContinue;
      }
      
      public function set btnContinue(param1:Button) : void
      {
         var _loc2_:Object = this._1212609315btnContinue;
         if(_loc2_ !== param1)
         {
            this._1212609315btnContinue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnContinue",_loc2_,param1));
            }
         }
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
      public function get spot0() : FillableSpot
      {
         return this._109651822spot0;
      }
      
      public function set spot0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._109651822spot0;
         if(_loc2_ !== param1)
         {
            this._109651822spot0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spot0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spot1() : FillableSpot
      {
         return this._109651823spot1;
      }
      
      public function set spot1(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._109651823spot1;
         if(_loc2_ !== param1)
         {
            this._109651823spot1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spot1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spot2() : FillableSpot
      {
         return this._109651824spot2;
      }
      
      public function set spot2(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._109651824spot2;
         if(_loc2_ !== param1)
         {
            this._109651824spot2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spot2",_loc2_,param1));
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

