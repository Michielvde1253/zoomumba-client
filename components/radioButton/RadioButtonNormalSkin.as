package components.radioButton
{
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
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.RadioButton;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class RadioButtonNormalSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static const exclusions:Array = ["labelDisplay","textLabel"];
      
      private static const focusExclusions:Array = ["labelDisplay","textLabel"];
      
      private var _1635571890_RadioButtonNormalSkin_BitmapImage1:BitmapImage;
      
      private var _1055687225textLabel:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_Components_swf_RadioButtonOFF_1434384953:Class;
      
      private var _embed_mxml__components_Components_swf_RadioButtonON_66919949:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:RadioButton;
      
      public function RadioButtonNormalSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_Components_swf_RadioButtonOFF_1434384953 = RadioButtonNormalSkin__embed_mxml__components_Components_swf_RadioButtonOFF_1434384953;
         this._embed_mxml__components_Components_swf_RadioButtonON_66919949 = RadioButtonNormalSkin__embed_mxml__components_Components_swf_RadioButtonON_66919949;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RadioButtonNormalSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_radioButton_RadioButtonNormalSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RadioButtonNormalSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._RadioButtonNormalSkin_VGroup1_c()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___RadioButtonNormalSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonNormalSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_RadioButtonON_66919949
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonNormalSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_RadioButtonON_66919949
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonNormalSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_RadioButtonON_66919949
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonNormalSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_RadioButtonON_66919949
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RadioButtonNormalSkin._watcherSetupUtil = param1;
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
         return focusExclusions;
      }
      
      protected function config(param1:FlexEvent) : void
      {
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      private function _RadioButtonNormalSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = -4;
         _loc1_.horizontalAlign = "center";
         _loc1_.width = 20;
         _loc1_.mxmlContent = [this._RadioButtonNormalSkin_BitmapImage1_i(),this._RadioButtonNormalSkin_Text1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RadioButtonNormalSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Components_swf_RadioButtonOFF_1434384953;
         _loc1_.initialized(this,"_RadioButtonNormalSkin_BitmapImage1");
         this._RadioButtonNormalSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonNormalSkin_BitmapImage1",this._RadioButtonNormalSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _RadioButtonNormalSkin_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textLabel = _loc1_;
         BindingManager.executeBindings(this,"textLabel",this.textLabel);
         return _loc1_;
      }
      
      public function ___RadioButtonNormalSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _RadioButtonNormalSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"textLabel.text");
         result[1] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            textLabel.setStyle("color",param1);
         },"textLabel.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonNormalSkin_BitmapImage1() : BitmapImage
      {
         return this._1635571890_RadioButtonNormalSkin_BitmapImage1;
      }
      
      public function set _RadioButtonNormalSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1635571890_RadioButtonNormalSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1635571890_RadioButtonNormalSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonNormalSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textLabel() : Text
      {
         return this._1055687225textLabel;
      }
      
      public function set textLabel(param1:Text) : void
      {
         var _loc2_:Object = this._1055687225textLabel;
         if(_loc2_ !== param1)
         {
            this._1055687225textLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RadioButton) : void
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
