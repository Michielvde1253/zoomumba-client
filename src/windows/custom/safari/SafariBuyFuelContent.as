package windows.custom.safari
{
   import components.stepper.NumericStepperAmmountSkin;
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.card.events.CardNumericStepperChangeEvent;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.NumericStepper;
   import utils.GUIHelper;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderQuestionMarkSkin;
   
   use namespace mx_internal;
   
   public class SafariBuyFuelContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1798415527amountStepper:NumericStepper;
      
      private var _117207833canister:Image;
      
      private var _1130311556fuelInfo:StandardText;
      
      private var _1221270899header:WindowHeader;
      
      private var _1176951407priceTag:LabelDisplay;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SafariBuyFuelContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SafariBuyFuelContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_safari_SafariBuyFuelContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SafariBuyFuelContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._SafariBuyFuelContent_InnerGroup1_c(),this._SafariBuyFuelContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SafariBuyFuelContent._watcherSetupUtil = param1;
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
      
      private function _SafariBuyFuelContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SafariBuyFuelContent_StandardText1_i(),this._SafariBuyFuelContent_LabelDisplay1_i(),this._SafariBuyFuelContent_Image1_i(),this._SafariBuyFuelContent_NumericStepper1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 215;
         _loc1_.y = 120;
         _loc1_.width = 200;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "fuelInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fuelInfo = _loc1_;
         BindingManager.executeBindings(this,"fuelInfo",this.fuelInfo);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.value = 100;
         _loc1_.type = "zooDollar";
         _loc1_.x = 210;
         _loc1_.y = 250;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "priceTag";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.priceTag = _loc1_;
         BindingManager.executeBindings(this,"priceTag",this.priceTag);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 47;
         _loc1_.y = 130;
         _loc1_.id = "canister";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.canister = _loc1_;
         BindingManager.executeBindings(this,"canister",this.canister);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = 65;
         _loc1_.y = 255;
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.addEventListener("change",this.__amountStepper_change);
         _loc1_.id = "amountStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.amountStepper = _loc1_;
         BindingManager.executeBindings(this,"amountStepper",this.amountStepper);
         return _loc1_;
      }
      
      public function __amountStepper_change(param1:Event) : void
      {
         dispatchEvent(new CardNumericStepperChangeEvent(CardNumericStepperChangeEvent.CHANGED,this.amountStepper.value));
      }
      
      private function _SafariBuyFuelContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SafariBuyFuelContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
         _loc1_.setStyle("skinClass",WindowHeaderQuestionMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _SafariBuyFuelContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Function
         {
            return GUIHelper.getStringFormattedValue;
         },null,"amountStepper.valueFormatFunction");
         result[1] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get amountStepper() : NumericStepper
      {
         return this._1798415527amountStepper;
      }
      
      public function set amountStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1798415527amountStepper;
         if(_loc2_ !== param1)
         {
            this._1798415527amountStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amountStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canister() : Image
      {
         return this._117207833canister;
      }
      
      public function set canister(param1:Image) : void
      {
         var _loc2_:Object = this._117207833canister;
         if(_loc2_ !== param1)
         {
            this._117207833canister = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canister",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fuelInfo() : StandardText
      {
         return this._1130311556fuelInfo;
      }
      
      public function set fuelInfo(param1:StandardText) : void
      {
         var _loc2_:Object = this._1130311556fuelInfo;
         if(_loc2_ !== param1)
         {
            this._1130311556fuelInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fuelInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get priceTag() : LabelDisplay
      {
         return this._1176951407priceTag;
      }
      
      public function set priceTag(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1176951407priceTag;
         if(_loc2_ !== param1)
         {
            this._1176951407priceTag = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"priceTag",_loc2_,param1));
            }
         }
      }
   }
}

