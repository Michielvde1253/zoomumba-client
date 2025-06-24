package windows.custom.assistants
{
   import components.stepper.NumericStepperAmmountSkin;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class AssistantRenewContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1798415527amountStepper:NumericStepper;
      
      private var _233398557assistantImage:SpriteVisualElement;
      
      private var _1221270899header:WindowHeader;
      
      private var _1949061436labelDisplay2:LabelDisplay;
      
      private var _954925063message:Label;
      
      private var _1176951407priceTag:LabelDisplay;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AssistantRenewContent()
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
         bindings = this._AssistantRenewContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_assistants_AssistantRenewContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AssistantRenewContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._AssistantRenewContent_InnerGroup1_c(),this._AssistantRenewContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AssistantRenewContent._watcherSetupUtil = param1;
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
      
      private function _AssistantRenewContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AssistantRenewContent_Label1_i(),this._AssistantRenewContent_VGroup1_c(),this._AssistantRenewContent_NumericStepper1_i(),this._AssistantRenewContent_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 170;
         _loc1_.y = 110;
         _loc1_.width = 225;
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 315;
         _loc1_.y = 184;
         _loc1_.gap = 2;
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._AssistantRenewContent_LabelDisplay1_i(),this._AssistantRenewContent_LabelDisplay2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "labelDisplay2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay2 = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay2",this.labelDisplay2);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
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
      
      private function _AssistantRenewContent_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = 290;
         _loc1_.y = 254;
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
      
      private function _AssistantRenewContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 100;
         _loc1_.y = 220;
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.initialized(this,"assistantImage");
         this.assistantImage = _loc1_;
         BindingManager.executeBindings(this,"assistantImage",this.assistantImage);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AssistantRenewContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 18;
         _loc1_.setStyle("skinClass",WindowHeaderExclamationMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _AssistantRenewContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
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
      public function get assistantImage() : SpriteVisualElement
      {
         return this._233398557assistantImage;
      }
      
      public function set assistantImage(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._233398557assistantImage;
         if(_loc2_ !== param1)
         {
            this._233398557assistantImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assistantImage",_loc2_,param1));
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
      public function get labelDisplay2() : LabelDisplay
      {
         return this._1949061436labelDisplay2;
      }
      
      public function set labelDisplay2(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1949061436labelDisplay2;
         if(_loc2_ !== param1)
         {
            this._1949061436labelDisplay2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : Label
      {
         return this._954925063message;
      }
      
      public function set message(param1:Label) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
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

