package custom.generic
{
   import buttons.customButtons.CustomizableCircularButton;
   import buttons.extended.ButtonBuy;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import custom.card.events.CardSexChangeEvent;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   import spark.filters.ShaderFilter;
   
   use namespace mx_internal;
   
   public class GenericCircularBuyItem extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _GenericCircularBuyItem_HGroup1:HGroup;
      
      public var _GenericCircularBuyItem_VGroup1:VGroup;
      
      private var _1377687758button:ButtonBuy;
      
      private var _570762516disabledFilter:ShaderFilter;
      
      private var _1671764162display:CustomizableCircularButton;
      
      private var _867809295femaleRadio:RadioButton;
      
      private var _100484996lockedImageSpr:Image;
      
      private var _2141249006maleRadio:RadioButton;
      
      private var _1050812390radioButtonSexGroup:RadioButtonGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var MyShaderClass:Class;
      
      private var _903579675shader:Shader;
      
      public var index:int = -1;
      
      private var lastState:String;
      
      private var _embed_mxml__general_Decorations_swf_LockClosedSPR_555374237:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GenericCircularBuyItem()
      {
         var watchers:Array;
         var _GenericCircularBuyItem_HGroup1_factory:DeferredInstanceFromFunction;
         var _GenericCircularBuyItem_Image1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.MyShaderClass = GenericCircularBuyItem_MyShaderClass;
         this._903579675shader = new Shader(new this.MyShaderClass());
         this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237 = GenericCircularBuyItem__embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GenericCircularBuyItem_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_generic_GenericCircularBuyItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GenericCircularBuyItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._GenericCircularBuyItem_VGroup1_i()];
         this.currentState = "normal";
         this._GenericCircularBuyItem_ShaderFilter1_i();
         this._GenericCircularBuyItem_RadioButtonGroup1_i();
         _GenericCircularBuyItem_HGroup1_factory = new DeferredInstanceFromFunction(this._GenericCircularBuyItem_HGroup1_i);
         _GenericCircularBuyItem_Image1_factory = new DeferredInstanceFromFunction(this._GenericCircularBuyItem_Image1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"normalSex",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericCircularBuyItem_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_GenericCircularBuyItem_VGroup1"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericCircularBuyItem_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_GenericCircularBuyItem_VGroup1"]
            }),new SetProperty().initializeFromObject({
               "name":"mouseChildren",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"button",
               "name":"enabled",
               "value":false
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
         GenericCircularBuyItem._watcherSetupUtil = param1;
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
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = true;
         if(currentState != "disabled")
         {
            this.lastState = currentState;
         }
         currentState = param1 ? this.lastState : "disabled";
         if(Boolean(this.display) && Boolean(this.display.displayImg))
         {
            this.display.displayImg.filters = param1 ? [] : [this.disabledFilter];
         }
      }
      
      private function _GenericCircularBuyItem_ShaderFilter1_i() : ShaderFilter
      {
         var _loc1_:ShaderFilter = new ShaderFilter();
         _loc1_.blue = 0;
         _loc1_.green = 0;
         _loc1_.red = 0;
         _loc1_.shader = null;
         this.disabledFilter = _loc1_;
         BindingManager.executeBindings(this,"disabledFilter",this.disabledFilter);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.selectedValue = 1;
         _loc1_.addEventListener("change",this.__radioButtonSexGroup_change);
         _loc1_.initialized(this,"radioButtonSexGroup");
         this.radioButtonSexGroup = _loc1_;
         BindingManager.executeBindings(this,"radioButtonSexGroup",this.radioButtonSexGroup);
         return _loc1_;
      }
      
      public function __radioButtonSexGroup_change(param1:Event) : void
      {
         dispatchEvent(new CardSexChangeEvent(CardSexChangeEvent.CHANGED,this.radioButtonSexGroup.selectedValue == 1,true));
      }
      
      private function _GenericCircularBuyItem_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 12;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._GenericCircularBuyItem_CustomizableCircularButton1_i(),this._GenericCircularBuyItem_ButtonBuy1_i()];
         _loc1_.id = "_GenericCircularBuyItem_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GenericCircularBuyItem_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_GenericCircularBuyItem_VGroup1",this._GenericCircularBuyItem_VGroup1);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.backgroundScale = 0.5;
         _loc1_.enabled = false;
         _loc1_.id = "display";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.display = _loc1_;
         BindingManager.executeBindings(this,"display",this.display);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_ButtonBuy1_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 70;
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 18;
         _loc1_.y = 5;
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         _loc1_.id = "lockedImageSpr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lockedImageSpr = _loc1_;
         BindingManager.executeBindings(this,"lockedImageSpr",this.lockedImageSpr);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -5;
         _loc1_.y = 25;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._GenericCircularBuyItem_RadioButton1_i(),this._GenericCircularBuyItem_RadioButton2_i()];
         _loc1_.id = "_GenericCircularBuyItem_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GenericCircularBuyItem_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_GenericCircularBuyItem_HGroup1",this._GenericCircularBuyItem_HGroup1);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonSexFemaleSkin);
         _loc1_.id = "femaleRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.femaleRadio = _loc1_;
         BindingManager.executeBindings(this,"femaleRadio",this.femaleRadio);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonSexMaleSkin);
         _loc1_.id = "maleRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maleRadio = _loc1_;
         BindingManager.executeBindings(this,"maleRadio",this.maleRadio);
         return _loc1_;
      }
      
      private function _GenericCircularBuyItem_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return shader;
         },null,"disabledFilter.shader");
         result[1] = new Binding(this,null,null,"femaleRadio.group","radioButtonSexGroup");
         result[2] = new Binding(this,null,null,"maleRadio.group","radioButtonSexGroup");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : ButtonBuy
      {
         return this._1377687758button;
      }
      
      public function set button(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get disabledFilter() : ShaderFilter
      {
         return this._570762516disabledFilter;
      }
      
      public function set disabledFilter(param1:ShaderFilter) : void
      {
         var _loc2_:Object = this._570762516disabledFilter;
         if(_loc2_ !== param1)
         {
            this._570762516disabledFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disabledFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get display() : CustomizableCircularButton
      {
         return this._1671764162display;
      }
      
      public function set display(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1671764162display;
         if(_loc2_ !== param1)
         {
            this._1671764162display = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"display",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get femaleRadio() : RadioButton
      {
         return this._867809295femaleRadio;
      }
      
      public function set femaleRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._867809295femaleRadio;
         if(_loc2_ !== param1)
         {
            this._867809295femaleRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"femaleRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lockedImageSpr() : Image
      {
         return this._100484996lockedImageSpr;
      }
      
      public function set lockedImageSpr(param1:Image) : void
      {
         var _loc2_:Object = this._100484996lockedImageSpr;
         if(_loc2_ !== param1)
         {
            this._100484996lockedImageSpr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lockedImageSpr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maleRadio() : RadioButton
      {
         return this._2141249006maleRadio;
      }
      
      public function set maleRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._2141249006maleRadio;
         if(_loc2_ !== param1)
         {
            this._2141249006maleRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maleRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get radioButtonSexGroup() : RadioButtonGroup
      {
         return this._1050812390radioButtonSexGroup;
      }
      
      public function set radioButtonSexGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1050812390radioButtonSexGroup;
         if(_loc2_ !== param1)
         {
            this._1050812390radioButtonSexGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioButtonSexGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get shader() : Shader
      {
         return this._903579675shader;
      }
      
      private function set shader(param1:Shader) : void
      {
         var _loc2_:Object = this._903579675shader;
         if(_loc2_ !== param1)
         {
            this._903579675shader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shader",_loc2_,param1));
            }
         }
      }
   }
}

