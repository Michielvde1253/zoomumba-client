package components.stepper
{
   import buttons.simpleButton.MinusButtonSmallSkin;
   import buttons.simpleButton.PlusButtonSmallSkin;
   import components.textfield.textInput.TextInputNumericStepperAmmountSkin;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexMouseEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.NumericStepper;
   import spark.components.TextInput;
   import spark.skins.SparkSkin;
   
   public class NumericStepperAmmountSkin extends SparkSkin implements IStateClient2
   {
      private static const exclusions:Array = ["textDisplay","decrementButton","incrementButton"];
      
      private var _853009829decrementButton:Button;
      
      private var _454226047incrementButton:Button;
      
      private var _831827669textDisplay:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:NumericStepper;
      
      public function NumericStepperAmmountSkin()
      {
         super();
         this.minHeight = 23;
         this.minWidth = 80;
         this.mxmlContent = [this._NumericStepperAmmountSkin_TextInput1_i(),this._NumericStepperAmmountSkin_Button1_i(),this._NumericStepperAmmountSkin_Button2_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override public function get focusSkinExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = false;
         super.initializationComplete();
      }
      
      private function minMaxHandler(param1:Event) : void
      {
         this.hostComponent.value = Math.min(Math.max(int(this.textDisplay.text),this.hostComponent.minimum),this.hostComponent.maximum);
      }
      
      private function focusHandler(param1:Event) : void
      {
         this.hostComponent.value = int(this.textDisplay.text);
         this.textDisplay.focusManager.deactivate();
      }
      
      private function _NumericStepperAmmountSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 8;
         _loc1_.right = 8;
         _loc1_.editable = false;
         _loc1_.setStyle("skinClass",TextInputNumericStepperAmmountSkin);
         _loc1_.addEventListener("keyDown",this.__textDisplay_keyDown);
         _loc1_.addEventListener("keyUp",this.__textDisplay_keyUp);
         _loc1_.addEventListener("mouseDownOutside",this.__textDisplay_mouseDownOutside);
         _loc1_.addEventListener("focusOut",this.__textDisplay_focusOut);
         _loc1_.addEventListener("mouseFocusChange",this.__textDisplay_mouseFocusChange);
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      public function __textDisplay_keyDown(param1:KeyboardEvent) : void
      {
         this.minMaxHandler(param1);
      }
      
      public function __textDisplay_keyUp(param1:KeyboardEvent) : void
      {
         this.minMaxHandler(param1);
      }
      
      public function __textDisplay_mouseDownOutside(param1:FlexMouseEvent) : void
      {
         this.focusHandler(param1);
      }
      
      public function __textDisplay_focusOut(param1:FocusEvent) : void
      {
         this.focusHandler(param1);
      }
      
      public function __textDisplay_mouseFocusChange(param1:FocusEvent) : void
      {
         this.focusHandler(param1);
      }
      
      private function _NumericStepperAmmountSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",PlusButtonSmallSkin);
         _loc1_.id = "incrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.incrementButton = _loc1_;
         BindingManager.executeBindings(this,"incrementButton",this.incrementButton);
         return _loc1_;
      }
      
      private function _NumericStepperAmmountSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",MinusButtonSmallSkin);
         _loc1_.id = "decrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decrementButton = _loc1_;
         BindingManager.executeBindings(this,"decrementButton",this.decrementButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get decrementButton() : Button
      {
         return this._853009829decrementButton;
      }
      
      public function set decrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._853009829decrementButton;
         if(_loc2_ !== param1)
         {
            this._853009829decrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get incrementButton() : Button
      {
         return this._454226047incrementButton;
      }
      
      public function set incrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._454226047incrementButton;
         if(_loc2_ !== param1)
         {
            this._454226047incrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : TextInput
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:TextInput) : void
      {
         var _loc2_:Object = this._831827669textDisplay;
         if(_loc2_ !== param1)
         {
            this._831827669textDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : NumericStepper
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

