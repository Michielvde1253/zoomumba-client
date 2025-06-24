package custom.features.avatar
{
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
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
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.RadioButton;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class RadioButtonAvatarCatSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static const exclusions:Array = ["labelDisplay","textLabel"];
      
      private static const focusExclusions:Array = ["labelDisplay","textLabel"];
      
      private var _437881498_RadioButtonAvatarCatSkin_CircularDisplayImage1:CircularDisplayImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:RadioButton;
      
      public function RadioButtonAvatarCatSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RadioButtonAvatarCatSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_avatar_RadioButtonAvatarCatSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RadioButtonAvatarCatSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 35;
         this.height = 35;
         this.maxWidth = 35;
         this.maxHeight = 35;
         this.mxmlContent = [this._RadioButtonAvatarCatSkin_BackgroundImage1_c(),this._RadioButtonAvatarCatSkin_CircularDisplayImage1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___RadioButtonAvatarCatSkin_SparkSkin1_creationComplete);
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
               "target":"_RadioButtonAvatarCatSkin_CircularDisplayImage1",
               "name":"bitmapDisplayScale",
               "value":1
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonAvatarCatSkin_CircularDisplayImage1",
               "name":"bitmapDisplayScale",
               "value":1
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonAvatarCatSkin_CircularDisplayImage1",
               "name":"bitmapDisplayScale",
               "value":1
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonAvatarCatSkin_CircularDisplayImage1",
               "name":"bitmapDisplayScale",
               "value":1
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
         RadioButtonAvatarCatSkin._watcherSetupUtil = param1;
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
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            switch(param2)
            {
               case "upAndSelected":
               case "overAndSelected":
               case "downAndSelected":
               case "disabledAndSelected":
                  this.hostComponent.buttonMode = false;
                  this.hostComponent.useHandCursor = false;
                  break;
               default:
                  this.hostComponent.buttonMode = true;
                  this.hostComponent.useHandCursor = true;
            }
         }
      }
      
      private function _RadioButtonAvatarCatSkin_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.35;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RadioButtonAvatarCatSkin_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.width = 35;
         _loc1_.height = 35;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.paddingDisplayX = 1;
         _loc1_.paddingDisplayY = -6;
         _loc1_.bitmapDisplayScale = 0.8;
         _loc1_.maskScale = 0.35;
         _loc1_.id = "_RadioButtonAvatarCatSkin_CircularDisplayImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonAvatarCatSkin_CircularDisplayImage1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonAvatarCatSkin_CircularDisplayImage1",this._RadioButtonAvatarCatSkin_CircularDisplayImage1);
         return _loc1_;
      }
      
      public function ___RadioButtonAvatarCatSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _RadioButtonAvatarCatSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return hostComponent.content;
         },null,"_RadioButtonAvatarCatSkin_CircularDisplayImage1.spriteClassDisplay");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonAvatarCatSkin_CircularDisplayImage1() : CircularDisplayImage
      {
         return this._437881498_RadioButtonAvatarCatSkin_CircularDisplayImage1;
      }
      
      public function set _RadioButtonAvatarCatSkin_CircularDisplayImage1(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._437881498_RadioButtonAvatarCatSkin_CircularDisplayImage1;
         if(_loc2_ !== param1)
         {
            this._437881498_RadioButtonAvatarCatSkin_CircularDisplayImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonAvatarCatSkin_CircularDisplayImage1",_loc2_,param1));
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

