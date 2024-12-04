package custom.features.settings
{
   import components.radioButton.RadioButtonCheckSkin;
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
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class RadioButtonMainBuilding extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1504430277_RadioButtonMainBuilding_Image2:Image;
      
      private var _1504430276_RadioButtonMainBuilding_Image3:Image;
      
      private var _1166424888_RadioButtonMainBuilding_RadioButton1:RadioButton;
      
      private var _1516630206_RadioButtonMainBuilding_SetProperty1:SetProperty;
      
      private var _1516630207_RadioButtonMainBuilding_SetProperty2:SetProperty;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _24234172radioGroup:RadioButtonGroup;
      
      private var _227977622spriteImage:Object;
      
      private var _2011217960preloaderVisibility:Boolean = true;
      
      private var _111972721value:int = -1;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RadioButtonMainBuilding()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497 = RadioButtonMainBuilding__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210 = RadioButtonMainBuilding__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RadioButtonMainBuilding_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_settings_RadioButtonMainBuildingWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RadioButtonMainBuilding[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 100;
         this.height = 100;
         this.mxmlContent = [this._RadioButtonMainBuilding_Image1_c(),this._RadioButtonMainBuilding_Image2_i(),this._RadioButtonMainBuilding_Image3_i(),this._RadioButtonMainBuilding_RadioButton1_i()];
         this.currentState = "enabled";
         states = [new State({
            "name":"enabled",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[this._RadioButtonMainBuilding_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_RadioButtonMainBuilding_Image2",
               "name":"filters",
               "value":undefined
            })),this._RadioButtonMainBuilding_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_RadioButtonMainBuilding_Image3",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_RadioButtonMainBuilding_RadioButton1",
               "name":"visible",
               "value":false
            })]
         })];
         BindingManager.executeBindings(this,"_RadioButtonMainBuilding_SetProperty1",this._RadioButtonMainBuilding_SetProperty1);
         BindingManager.executeBindings(this,"_RadioButtonMainBuilding_SetProperty2",this._RadioButtonMainBuilding_SetProperty2);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RadioButtonMainBuilding._watcherSetupUtil = param1;
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
      
      private function _RadioButtonMainBuilding_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210;
         _loc1_.scaleX = 0.57;
         _loc1_.scaleY = 0.57;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RadioButtonMainBuilding_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.horizontalCenter = 22;
         _loc1_.verticalCenter = 22;
         _loc1_.id = "_RadioButtonMainBuilding_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonMainBuilding_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonMainBuilding_Image2",this._RadioButtonMainBuilding_Image2);
         return _loc1_;
      }
      
      private function _RadioButtonMainBuilding_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.verticalCenter = -4;
         _loc1_.horizontalCenter = -6;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "_RadioButtonMainBuilding_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonMainBuilding_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonMainBuilding_Image3",this._RadioButtonMainBuilding_Image3);
         return _loc1_;
      }
      
      private function _RadioButtonMainBuilding_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.right = 10;
         _loc1_.bottom = 10;
         _loc1_.setStyle("skinClass",RadioButtonCheckSkin);
         _loc1_.id = "_RadioButtonMainBuilding_RadioButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonMainBuilding_RadioButton1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonMainBuilding_RadioButton1",this._RadioButtonMainBuilding_RadioButton1);
         return _loc1_;
      }
      
      private function _RadioButtonMainBuilding_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_RadioButtonMainBuilding_Image2.source","spriteImage");
         result[1] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.GRAYSCALE)];
         },null,"_RadioButtonMainBuilding_SetProperty1.value");
         result[2] = new Binding(this,null,null,"_RadioButtonMainBuilding_Image3.visible","preloaderVisibility");
         result[3] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.GRAYSCALE)];
         },null,"_RadioButtonMainBuilding_SetProperty2.value");
         result[4] = new Binding(this,null,null,"_RadioButtonMainBuilding_RadioButton1.value","value");
         result[5] = new Binding(this,null,null,"_RadioButtonMainBuilding_RadioButton1.group","radioGroup");
         result[6] = new Binding(this,function():Boolean
         {
            return !preloaderVisibility;
         },null,"_RadioButtonMainBuilding_RadioButton1.enabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonMainBuilding_Image2() : Image
      {
         return this._1504430277_RadioButtonMainBuilding_Image2;
      }
      
      public function set _RadioButtonMainBuilding_Image2(param1:Image) : void
      {
         var _loc2_:Object = this._1504430277_RadioButtonMainBuilding_Image2;
         if(_loc2_ !== param1)
         {
            this._1504430277_RadioButtonMainBuilding_Image2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonMainBuilding_Image2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonMainBuilding_Image3() : Image
      {
         return this._1504430276_RadioButtonMainBuilding_Image3;
      }
      
      public function set _RadioButtonMainBuilding_Image3(param1:Image) : void
      {
         var _loc2_:Object = this._1504430276_RadioButtonMainBuilding_Image3;
         if(_loc2_ !== param1)
         {
            this._1504430276_RadioButtonMainBuilding_Image3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonMainBuilding_Image3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonMainBuilding_RadioButton1() : RadioButton
      {
         return this._1166424888_RadioButtonMainBuilding_RadioButton1;
      }
      
      public function set _RadioButtonMainBuilding_RadioButton1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1166424888_RadioButtonMainBuilding_RadioButton1;
         if(_loc2_ !== param1)
         {
            this._1166424888_RadioButtonMainBuilding_RadioButton1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonMainBuilding_RadioButton1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonMainBuilding_SetProperty1() : SetProperty
      {
         return this._1516630206_RadioButtonMainBuilding_SetProperty1;
      }
      
      public function set _RadioButtonMainBuilding_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1516630206_RadioButtonMainBuilding_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1516630206_RadioButtonMainBuilding_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonMainBuilding_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonMainBuilding_SetProperty2() : SetProperty
      {
         return this._1516630207_RadioButtonMainBuilding_SetProperty2;
      }
      
      public function set _RadioButtonMainBuilding_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1516630207_RadioButtonMainBuilding_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1516630207_RadioButtonMainBuilding_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonMainBuilding_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get radioGroup() : RadioButtonGroup
      {
         return this._24234172radioGroup;
      }
      
      public function set radioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._24234172radioGroup;
         if(_loc2_ !== param1)
         {
            this._24234172radioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteImage() : Object
      {
         return this._227977622spriteImage;
      }
      
      public function set spriteImage(param1:Object) : void
      {
         var _loc2_:Object = this._227977622spriteImage;
         if(_loc2_ !== param1)
         {
            this._227977622spriteImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloaderVisibility() : Boolean
      {
         return this._2011217960preloaderVisibility;
      }
      
      public function set preloaderVisibility(param1:Boolean) : void
      {
         var _loc2_:Object = this._2011217960preloaderVisibility;
         if(_loc2_ !== param1)
         {
            this._2011217960preloaderVisibility = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloaderVisibility",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get value() : int
      {
         return this._111972721value;
      }
      
      public function set value(param1:int) : void
      {
         var _loc2_:Object = this._111972721value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
   }
}

