package custom.generic
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonXCircularSkin;
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
   import components.radioButton.RadioButtonChildSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.RadioButton;
   import spark.primitives.Path;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class FillableSpot extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _FillableSpot_BackgroundImage1:BackgroundImage;
      
      public var _FillableSpot_ButtonCircularZoomable1:ButtonCircularZoomable;
      
      public var _FillableSpot_Group2:Group;
      
      private var _1155696517_FillableSpot_RadioButton1:RadioButton;
      
      private var _456215685_FillableSpot_SetProperty1:SetProperty;
      
      private var _1353698416circDisplayImage:CircularDisplayImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var value:Object = null;
      
      private var _946976881spriteClassDisplay:*;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FillableSpot()
      {
         var bindings:Array;
         var watchers:Array;
         var _FillableSpot_ButtonCircularZoomable1_factory:DeferredInstanceFromFunction;
         var _FillableSpot_Group2_factory:DeferredInstanceFromFunction;
         var _FillableSpot_RadioButton1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._FillableSpot_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_generic_FillableSpotWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FillableSpot[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 60;
         this.height = 60;
         this.maxWidth = 60;
         this.maxHeight = 60;
         this.mxmlContent = [this._FillableSpot_BackgroundImage1_i(),this._FillableSpot_CircularDisplayImage1_i()];
         this.currentState = "empty";
         _FillableSpot_ButtonCircularZoomable1_factory = new DeferredInstanceFromFunction(this._FillableSpot_ButtonCircularZoomable1_i);
         _FillableSpot_Group2_factory = new DeferredInstanceFromFunction(this._FillableSpot_Group2_i);
         _FillableSpot_RadioButton1_factory = new DeferredInstanceFromFunction(this._FillableSpot_RadioButton1_i);
         states = [new State({
            "name":"empty",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_Group2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            })]
         }),new State({
            "name":"onlyDisplay",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"mouseEnabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "name":"mouseChildren",
               "value":false
            })]
         }),new State({
            "name":"disabled",
            "overrides":[this._FillableSpot_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "name":"filters",
               "value":undefined
            }))]
         }),new State({
            "name":"filledDefault",
            "stateGroups":["filled"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_ButtonCircularZoomable1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["circDisplayImage"]
            })]
         }),new State({
            "name":"filledSpecieMale",
            "stateGroups":["filledSpecies","showMaleIcon","filled"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_ButtonCircularZoomable1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["circDisplayImage"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexMaleSkin
            })]
         }),new State({
            "name":"filledSpecieFemale",
            "stateGroups":["showFemaleIcon","filledSpecies","filled"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_ButtonCircularZoomable1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["circDisplayImage"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexFemaleSkin
            })]
         }),new State({
            "name":"filledSpecieBaby",
            "stateGroups":["filledSpecies","showBabyIcon","filled"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_ButtonCircularZoomable1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["circDisplayImage"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonChildSkin
            })]
         }),new State({
            "name":"onlyDisplaySpecieMale",
            "stateGroups":["filledSpecies","showMaleIcon"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexMaleSkin
            })]
         }),new State({
            "name":"onlyDisplaySpecieFemale",
            "stateGroups":["showFemaleIcon","filledSpecies"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexFemaleSkin
            })]
         }),new State({
            "name":"onlyDisplaySpecieBaby",
            "stateGroups":["filledSpecies","showBabyIcon"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FillableSpot_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FillableSpot_BackgroundImage1"]
            }),new SetStyle().initializeFromObject({
               "target":"_FillableSpot_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonChildSkin
            })]
         })];
         BindingManager.executeBindings(this,"_FillableSpot_SetProperty1",this._FillableSpot_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FillableSpot._watcherSetupUtil = param1;
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
      
      private function handleX(param1:MouseEvent) : void
      {
         this.circDisplayImage.dispose();
         currentState = "empty";
         dispatchEvent(new Event("spotDisposed",true));
      }
      
      private function _FillableSpot_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.6;
         _loc1_.id = "_FillableSpot_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FillableSpot_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FillableSpot_BackgroundImage1",this._FillableSpot_BackgroundImage1);
         return _loc1_;
      }
      
      private function _FillableSpot_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.scaleX = 0.3;
         _loc1_.scaleY = 0.3;
         _loc1_.verticalCenter = -5;
         _loc1_.horizontalCenter = 3;
         _loc1_.width = 1;
         _loc1_.height = 1;
         _loc1_.mxmlContent = [this._FillableSpot_Path1_c()];
         _loc1_.id = "_FillableSpot_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FillableSpot_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_FillableSpot_Group2",this._FillableSpot_Group2);
         return _loc1_;
      }
      
      private function _FillableSpot_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = -232.7;
         _loc1_.y = -100.95;
         _loc1_.data = "M245.45 189.5Q250.3 185.4 256.1 185.65 263.15 185.65 267.75 188.8 272.85 192.65 272.6 199.2 272.6 205.05 267.5 208.4 262.9 211.1 256.35 211.35 240.1 211.35 240.35 198 240.1 193.4 245.45 189.5M232.85 139.35Q232.6 139.1 232.85 138.9L234.55 103.25      Q234.3 103 234.55 103 234.8 102.75 235.05 102.75L252.45 101.1Q272.1 100.1 281.3 106.4 291 112.95 292.2 121.65 293.2 127 290.25 134.75 288.35 139.85 268.2 162.6 265.3 165.55 264.6 170.15 264.1 172.3 264.1 174 263.85 174.25 263.85 174.5 263.6      174.5 263.6 174.75L247.85 179.6 247.65 179.6Q247.4 179.35 247.15 179.35 245.2 177.4 244.5 173.05 242.55 165.05 248.85 154.85 254.65 145.2 252.7 140.55 251.5 138.15 248.85 137.65 243.5 136.7 238.2 137.9L233.55 139.6 233.35 139.6Q233.1 139.35      232.85 139.35";
         _loc1_.fill = this._FillableSpot_SolidColor1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FillableSpot_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12553286;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FillableSpot_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.x = 45;
         _loc1_.y = -4;
         _loc1_.enabled = false;
         _loc1_.id = "_FillableSpot_RadioButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FillableSpot_RadioButton1 = _loc1_;
         BindingManager.executeBindings(this,"_FillableSpot_RadioButton1",this._FillableSpot_RadioButton1);
         return _loc1_;
      }
      
      private function _FillableSpot_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.currentState = "maskCircle";
         _loc1_.maskScale = 0.6;
         _loc1_.paddingDisplayX = 0;
         _loc1_.paddingDisplayY = 0;
         _loc1_.automaticCentralize = false;
         _loc1_.id = "circDisplayImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.circDisplayImage = _loc1_;
         BindingManager.executeBindings(this,"circDisplayImage",this.circDisplayImage);
         return _loc1_;
      }
      
      private function _FillableSpot_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.x = 45;
         _loc1_.y = 49;
         _loc1_.backgroundState = "inner";
         _loc1_.bgScale = 0.2;
         _loc1_.setStyle("skinClass",ButtonXCircularSkin);
         _loc1_.addEventListener("click",this.___FillableSpot_ButtonCircularZoomable1_click);
         _loc1_.id = "_FillableSpot_ButtonCircularZoomable1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FillableSpot_ButtonCircularZoomable1 = _loc1_;
         BindingManager.executeBindings(this,"_FillableSpot_ButtonCircularZoomable1",this._FillableSpot_ButtonCircularZoomable1);
         return _loc1_;
      }
      
      public function ___FillableSpot_ButtonCircularZoomable1_click(param1:MouseEvent) : void
      {
         this.handleX(param1);
      }
      
      private function _FillableSpot_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.GRAYSCALE)];
         },null,"_FillableSpot_SetProperty1.value");
         result[1] = new Binding(this,null,null,"circDisplayImage.spriteClassDisplay","spriteClassDisplay");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.27,0.3];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_FillableSpot_ButtonCircularZoomable1.iconScales");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FillableSpot_RadioButton1() : RadioButton
      {
         return this._1155696517_FillableSpot_RadioButton1;
      }
      
      public function set _FillableSpot_RadioButton1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1155696517_FillableSpot_RadioButton1;
         if(_loc2_ !== param1)
         {
            this._1155696517_FillableSpot_RadioButton1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FillableSpot_RadioButton1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FillableSpot_SetProperty1() : SetProperty
      {
         return this._456215685_FillableSpot_SetProperty1;
      }
      
      public function set _FillableSpot_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._456215685_FillableSpot_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._456215685_FillableSpot_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FillableSpot_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get circDisplayImage() : CircularDisplayImage
      {
         return this._1353698416circDisplayImage;
      }
      
      public function set circDisplayImage(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._1353698416circDisplayImage;
         if(_loc2_ !== param1)
         {
            this._1353698416circDisplayImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circDisplayImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteClassDisplay() : *
      {
         return this._946976881spriteClassDisplay;
      }
      
      public function set spriteClassDisplay(param1:*) : void
      {
         var _loc2_:Object = this._946976881spriteClassDisplay;
         if(_loc2_ !== param1)
         {
            this._946976881spriteClassDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteClassDisplay",_loc2_,param1));
            }
         }
      }
   }
}

