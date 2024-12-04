package windows.custom.events.babyEvent
{
   import buttons.customButtons.CustomizableCircularButton;
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonOKCircularSkin;
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.slider.HSilderCustomSkin;
   import components.slider.HSliderCustom;
   import components.stepper.NumericStepperAmmountSkin;
   import components.textfield.StandardText;
   import custom.generic.GenericCircularBuyItem;
   import custom.generic.GenericCircularCounter;
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
   import spark.components.HGroup;
   import spark.components.NumericStepper;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class BabyEventContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _279234211_buttonsGroup:HGroup;
      
      private var _510426948_displayGroup:HGroup;
      
      private var _93506456barBG:StandardImage;
      
      private var _1692847533barBubbleL:StandardImage;
      
      private var _1692847539barBubbleR:StandardImage;
      
      private var _1778032265barFluid:StandardImage;
      
      private var _1079358656barScroll:StandardImage;
      
      private var _1378241396bubble:StandardImage;
      
      private var _1714093033displayLeft:CustomizableCircularButton;
      
      private var _1602937466displayRight:CustomizableCircularButton;
      
      private var _3091780draw:Group;
      
      private var _1410965406iconImage:StandardImage;
      
      private var _177936123infoText:StandardText;
      
      private var _1226627274leftStepper:NumericStepper;
      
      private var _1166276399leftTradeButton:ButtonCircularZoomable;
      
      private var _3496420rect:Group;
      
      private var _145106197rightStepper:NumericStepper;
      
      private var _1269310970rightTradeButton:ButtonCircularZoomable;
      
      private var _899647263slider:HSliderCustom;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _buttons:Dictionary;
      
      private var _displays:Dictionary;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BabyEventContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._buttons = new Dictionary(true);
         this._displays = new Dictionary(true);
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._BabyEventContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_babyEvent_BabyEventContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BabyEventContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._BabyEventContent_InnerGroup1_c(),this._BabyEventContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BabyEventContent._watcherSetupUtil = param1;
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
      
      public function get displays() : Dictionary
      {
         return this._displays;
      }
      
      public function get buttons() : Dictionary
      {
         return this._buttons;
      }
      
      public function destroy() : void
      {
         if(Boolean(this._buttonsGroup) && Boolean(this._displayGroup))
         {
            this._buttonsGroup.removeAllElements();
            this._displayGroup.removeAllElements();
            this._buttons = new Dictionary(true);
            this._displays = new Dictionary(true);
         }
      }
      
      public function getButton(param1:String) : GenericCircularBuyItem
      {
         return this._buttons[param1];
      }
      
      public function getDisplay(param1:String) : GenericCircularCounter
      {
         return this._displays[param1];
      }
      
      public function addButton(param1:String) : GenericCircularBuyItem
      {
         var _loc2_:GenericCircularBuyItem = null;
         if(this._buttonsGroup)
         {
            _loc2_ = new GenericCircularBuyItem();
            _loc2_.id = param1;
            this._buttonsGroup.addElement(_loc2_);
            this._buttons[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function addDisplay(param1:String) : GenericCircularCounter
      {
         var _loc2_:GenericCircularCounter = null;
         if(this._buttonsGroup)
         {
            _loc2_ = new GenericCircularCounter();
            _loc2_.id = param1;
            _loc2_.button.backgroundScale = 0.5;
            this._displayGroup.addElement(_loc2_);
            this._displays[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function _BabyEventContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BabyEventContent_StandardImage1_i(),this._BabyEventContent_BackgroundImage1_c(),this._BabyEventContent_StandardText1_i(),this._BabyEventContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.top = 70;
         _loc1_.left = 160;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _BabyEventContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.top = 70;
         _loc1_.scale = 1.5;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.left = 195;
         _loc1_.top = 105;
         _loc1_.width = 395;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "infoText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoText = _loc1_;
         BindingManager.executeBindings(this,"infoText",this.infoText);
         return _loc1_;
      }
      
      private function _BabyEventContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 60;
         _loc1_.right = 50;
         _loc1_.top = 240;
         _loc1_.gap = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._BabyEventContent_HGroup1_i(),this._BabyEventContent_Group2_c(),this._BabyEventContent_HGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 50;
         _loc1_.height = 45;
         _loc1_.horizontalAlign = "center";
         _loc1_.id = "_displayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._displayGroup = _loc1_;
         BindingManager.executeBindings(this,"_displayGroup",this._displayGroup);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 65;
         _loc1_.right = 60;
         _loc1_.height = 70;
         _loc1_.mxmlContent = [this._BabyEventContent_StandardImage2_i(),this._BabyEventContent_Group3_c(),this._BabyEventContent_Group6_i(),this._BabyEventContent_HSliderCustom1_i(),this._BabyEventContent_Group7_c(),this._BabyEventContent_Group8_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageCentered";
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -2;
         _loc1_.id = "barBG";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.barBG = _loc1_;
         BindingManager.executeBindings(this,"barBG",this.barBG);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -1;
         _loc1_.maxWidth = 400;
         _loc1_.mxmlContent = [this._BabyEventContent_Group4_c(),this._BabyEventContent_StandardImage4_i(),this._BabyEventContent_StandardImage5_i(),this._BabyEventContent_Group5_i(),this._BabyEventContent_StandardImage6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 400;
         _loc1_.height = 21;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._BabyEventContent_StandardImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "barFluid";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.barFluid = _loc1_;
         BindingManager.executeBindings(this,"barFluid",this.barFluid);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.left = -16;
         _loc1_.rotation = -90;
         _loc1_.scaleX = -1;
         _loc1_.id = "barBubbleL";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.barBubbleL = _loc1_;
         BindingManager.executeBindings(this,"barBubbleL",this.barBubbleL);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage5_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.right = -20;
         _loc1_.rotation = 90;
         _loc1_.id = "barBubbleR";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.barBubbleR = _loc1_;
         BindingManager.executeBindings(this,"barBubbleR",this.barBubbleR);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.blendMode = "invert";
         _loc1_.horizontalCenter = 2;
         _loc1_.id = "rect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rect = _loc1_;
         BindingManager.executeBindings(this,"rect",this.rect);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage6_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageCentered";
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "barScroll";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.barScroll = _loc1_;
         BindingManager.executeBindings(this,"barScroll",this.barScroll);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "draw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.draw = _loc1_;
         BindingManager.executeBindings(this,"draw",this.draw);
         return _loc1_;
      }
      
      private function _BabyEventContent_HSliderCustom1_i() : HSliderCustom
      {
         var _loc1_:HSliderCustom = new HSliderCustom();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.width = 390;
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 33;
         _loc1_.setStyle("skinClass",HSilderCustomSkin);
         _loc1_.id = "slider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.slider = _loc1_;
         BindingManager.executeBindings(this,"slider",this.slider);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 10;
         _loc1_.y = 8;
         _loc1_.mxmlContent = [this._BabyEventContent_CustomizableCircularButton1_i(),this._BabyEventContent_NumericStepper1_i(),this._BabyEventContent_ButtonCircularZoomable1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.enabled = false;
         _loc1_.backgroundScale = 0.7;
         _loc1_.id = "displayLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayLeft = _loc1_;
         BindingManager.executeBindings(this,"displayLeft",this.displayLeft);
         return _loc1_;
      }
      
      private function _BabyEventContent_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = -20;
         _loc1_.y = 45;
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.id = "leftStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.leftStepper = _loc1_;
         BindingManager.executeBindings(this,"leftStepper",this.leftStepper);
         return _loc1_;
      }
      
      private function _BabyEventContent_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.x = 9;
         _loc1_.y = 70;
         _loc1_.bgScale = 0.3;
         _loc1_.setStyle("skinClass",ButtonOKCircularSkin);
         _loc1_.id = "leftTradeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.leftTradeButton = _loc1_;
         BindingManager.executeBindings(this,"leftTradeButton",this.leftTradeButton);
         return _loc1_;
      }
      
      private function _BabyEventContent_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = -14;
         _loc1_.y = 8;
         _loc1_.mxmlContent = [this._BabyEventContent_CustomizableCircularButton2_i(),this._BabyEventContent_NumericStepper2_i(),this._BabyEventContent_ButtonCircularZoomable2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_CustomizableCircularButton2_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.enabled = false;
         _loc1_.backgroundScale = 0.7;
         _loc1_.id = "displayRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayRight = _loc1_;
         BindingManager.executeBindings(this,"displayRight",this.displayRight);
         return _loc1_;
      }
      
      private function _BabyEventContent_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = -20;
         _loc1_.y = 45;
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.id = "rightStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rightStepper = _loc1_;
         BindingManager.executeBindings(this,"rightStepper",this.rightStepper);
         return _loc1_;
      }
      
      private function _BabyEventContent_ButtonCircularZoomable2_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.x = 9;
         _loc1_.y = 70;
         _loc1_.bgScale = 0.3;
         _loc1_.setStyle("skinClass",ButtonOKCircularSkin);
         _loc1_.id = "rightTradeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rightTradeButton = _loc1_;
         BindingManager.executeBindings(this,"rightTradeButton",this.rightTradeButton);
         return _loc1_;
      }
      
      private function _BabyEventContent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.id = "_buttonsGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._buttonsGroup = _loc1_;
         BindingManager.executeBindings(this,"_buttonsGroup",this._buttonsGroup);
         return _loc1_;
      }
      
      private function _BabyEventContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BabyEventContent_StandardImage7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BabyEventContent_StandardImage7_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.displayScale = 0.4;
         _loc1_.top = 67;
         _loc1_.left = 42;
         _loc1_.currentState = "imageFree";
         _loc1_.id = "iconImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconImage = _loc1_;
         BindingManager.executeBindings(this,"iconImage",this.iconImage);
         return _loc1_;
      }
      
      private function _BabyEventContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.3,0.4];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"leftTradeButton.iconScales");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.3,0.4];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"rightTradeButton.iconScales");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _buttonsGroup() : HGroup
      {
         return this._279234211_buttonsGroup;
      }
      
      public function set _buttonsGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._279234211_buttonsGroup;
         if(_loc2_ !== param1)
         {
            this._279234211_buttonsGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_buttonsGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _displayGroup() : HGroup
      {
         return this._510426948_displayGroup;
      }
      
      public function set _displayGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._510426948_displayGroup;
         if(_loc2_ !== param1)
         {
            this._510426948_displayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get barBG() : StandardImage
      {
         return this._93506456barBG;
      }
      
      public function set barBG(param1:StandardImage) : void
      {
         var _loc2_:Object = this._93506456barBG;
         if(_loc2_ !== param1)
         {
            this._93506456barBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get barBubbleL() : StandardImage
      {
         return this._1692847533barBubbleL;
      }
      
      public function set barBubbleL(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1692847533barBubbleL;
         if(_loc2_ !== param1)
         {
            this._1692847533barBubbleL = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barBubbleL",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get barBubbleR() : StandardImage
      {
         return this._1692847539barBubbleR;
      }
      
      public function set barBubbleR(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1692847539barBubbleR;
         if(_loc2_ !== param1)
         {
            this._1692847539barBubbleR = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barBubbleR",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get barFluid() : StandardImage
      {
         return this._1778032265barFluid;
      }
      
      public function set barFluid(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1778032265barFluid;
         if(_loc2_ !== param1)
         {
            this._1778032265barFluid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barFluid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get barScroll() : StandardImage
      {
         return this._1079358656barScroll;
      }
      
      public function set barScroll(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1079358656barScroll;
         if(_loc2_ !== param1)
         {
            this._1079358656barScroll = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barScroll",_loc2_,param1));
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
      public function get displayLeft() : CustomizableCircularButton
      {
         return this._1714093033displayLeft;
      }
      
      public function set displayLeft(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1714093033displayLeft;
         if(_loc2_ !== param1)
         {
            this._1714093033displayLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayRight() : CustomizableCircularButton
      {
         return this._1602937466displayRight;
      }
      
      public function set displayRight(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1602937466displayRight;
         if(_loc2_ !== param1)
         {
            this._1602937466displayRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get draw() : Group
      {
         return this._3091780draw;
      }
      
      public function set draw(param1:Group) : void
      {
         var _loc2_:Object = this._3091780draw;
         if(_loc2_ !== param1)
         {
            this._3091780draw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"draw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconImage() : StandardImage
      {
         return this._1410965406iconImage;
      }
      
      public function set iconImage(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1410965406iconImage;
         if(_loc2_ !== param1)
         {
            this._1410965406iconImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoText() : StandardText
      {
         return this._177936123infoText;
      }
      
      public function set infoText(param1:StandardText) : void
      {
         var _loc2_:Object = this._177936123infoText;
         if(_loc2_ !== param1)
         {
            this._177936123infoText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leftStepper() : NumericStepper
      {
         return this._1226627274leftStepper;
      }
      
      public function set leftStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1226627274leftStepper;
         if(_loc2_ !== param1)
         {
            this._1226627274leftStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leftTradeButton() : ButtonCircularZoomable
      {
         return this._1166276399leftTradeButton;
      }
      
      public function set leftTradeButton(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._1166276399leftTradeButton;
         if(_loc2_ !== param1)
         {
            this._1166276399leftTradeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftTradeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rect() : Group
      {
         return this._3496420rect;
      }
      
      public function set rect(param1:Group) : void
      {
         var _loc2_:Object = this._3496420rect;
         if(_loc2_ !== param1)
         {
            this._3496420rect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightStepper() : NumericStepper
      {
         return this._145106197rightStepper;
      }
      
      public function set rightStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._145106197rightStepper;
         if(_loc2_ !== param1)
         {
            this._145106197rightStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightTradeButton() : ButtonCircularZoomable
      {
         return this._1269310970rightTradeButton;
      }
      
      public function set rightTradeButton(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._1269310970rightTradeButton;
         if(_loc2_ !== param1)
         {
            this._1269310970rightTradeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightTradeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slider() : HSliderCustom
      {
         return this._899647263slider;
      }
      
      public function set slider(param1:HSliderCustom) : void
      {
         var _loc2_:Object = this._899647263slider;
         if(_loc2_ !== param1)
         {
            this._899647263slider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slider",_loc2_,param1));
            }
         }
      }
   }
}

