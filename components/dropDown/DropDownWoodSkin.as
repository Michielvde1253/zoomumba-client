package components.dropDown
{
   import buttons.skin.ButtonShowBitmapSkin;
   import components.scroller.ScrollerWoodSkin;
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
   import mx.core.ClassFactory;
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
   import spark.components.Button;
   import spark.components.DataGroup;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.PopUpAnchor;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultItemRenderer;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class DropDownWoodSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _DropDownWoodSkin_BitmapImage6:BitmapImage;
      
      public var _DropDownWoodSkin_BitmapImage7:BitmapImage;
      
      private var _272784889_DropDownWoodSkin_Group3:Group;
      
      private var _1332194002background:Group;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _1184053038labelDisplay:Label;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _DropDownWoodSkin_StylesInit_done:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      private var _embed_mxml__general_Patterns_swf_TileBG2_1819943852:Class;
      
      private var _embed_mxml__components_Components_swf_ComboBoxArrowDown_450677301:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DropDownList;
      
      public function DropDownWoodSkin()
      {
         var watchers:Array;
         var _DropDownWoodSkin_BitmapImage7_factory:DeferredInstanceFromFunction;
         var _DropDownWoodSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = DropDownWoodSkin__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this._embed_mxml__general_Patterns_swf_TileBG2_1819943852 = DropDownWoodSkin__embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         this._embed_mxml__components_Components_swf_ComboBoxArrowDown_450677301 = DropDownWoodSkin__embed_mxml__components_Components_swf_ComboBoxArrowDown_450677301;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._DropDownWoodSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_dropDown_DropDownWoodSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DropDownWoodSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DropDownWoodSkin_Group3_i(),this._DropDownWoodSkin_Button1_i(),this._DropDownWoodSkin_Label1_i()];
         this.currentState = "normal";
         _DropDownWoodSkin_BitmapImage7_factory = new DeferredInstanceFromFunction(this._DropDownWoodSkin_BitmapImage7_i);
         _DropDownWoodSkin_PopUpAnchor1_factory = new DeferredInstanceFromFunction(this._DropDownWoodSkin_PopUpAnchor1_i,this._DropDownWoodSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DropDownWoodSkin_BitmapImage7_factory,
               "destination":"_DropDownWoodSkin_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DropDownWoodSkin_BitmapImage6"]
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_DropDownWoodSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DropDownWoodSkin_BitmapImage7_factory,
               "destination":"_DropDownWoodSkin_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DropDownWoodSkin_BitmapImage6"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         DropDownWoodSkin._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_DropDownWoodSkin_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _DropDownWoodSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUp = this._DropDownWoodSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_PopUpAnchor1_r() : void
      {
         this.popUp = null;
         this.dropDown = null;
         this.dropShadow = null;
         this.background = null;
         this.scroller = null;
         this.dataGroup = null;
      }
      
      private function _DropDownWoodSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.minHeight = 22;
         _loc1_.maxHeight = 134;
         _loc1_.mxmlContent = [this._DropDownWoodSkin_RectangularDropShadow1_i(),this._DropDownWoodSkin_Group2_i(),this._DropDownWoodSkin_Scroller1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 0.45;
         _loc1_.angle = 90;
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.color = 0;
         _loc1_.distance = 7;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DropDownWoodSkin_BitmapImage1_c(),this._DropDownWoodSkin_BitmapImage2_c(),this._DropDownWoodSkin_BitmapImage3_c(),this._DropDownWoodSkin_BitmapImage4_c()];
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.alpha = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.alpha = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage4_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.alpha = 0.7;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 10;
         _loc1_.right = 5;
         _loc1_.top = 10;
         _loc1_.bottom = 8;
         _loc1_.measuredSizeIncludesScrollBars = false;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._DropDownWoodSkin_DataGroup1_i();
         _loc1_.setStyle("skinClass",ScrollerWoodSkin);
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.styleName = "customStyle";
         _loc1_.itemRenderer = this._DropDownWoodSkin_ClassFactory1_c();
         _loc1_.layout = this._DropDownWoodSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultItemRenderer;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.height = 30;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._DropDownWoodSkin_BitmapImage5_c(),this._DropDownWoodSkin_BitmapImage6_i(),this._DropDownWoodSkin_BitmapImage8_c(),this._DropDownWoodSkin_BitmapImage9_c()];
         _loc1_.id = "_DropDownWoodSkin_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DropDownWoodSkin_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_DropDownWoodSkin_Group3",this._DropDownWoodSkin_Group3);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage5_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,"_DropDownWoodSkin_BitmapImage6");
         this._DropDownWoodSkin_BitmapImage6 = _loc1_;
         BindingManager.executeBindings(this,"_DropDownWoodSkin_BitmapImage6",this._DropDownWoodSkin_BitmapImage6);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage7_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,"_DropDownWoodSkin_BitmapImage7");
         this._DropDownWoodSkin_BitmapImage7 = _loc1_;
         BindingManager.executeBindings(this,"_DropDownWoodSkin_BitmapImage7",this._DropDownWoodSkin_BitmapImage7);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage8_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_BitmapImage9_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.content = this._embed_mxml__components_Components_swf_ComboBoxArrowDown_450677301;
         _loc1_.focusEnabled = false;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 12;
         _loc1_.right = 30;
         _loc1_.top = 10;
         _loc1_.bottom = 8;
         _loc1_.width = 75;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _DropDownWoodSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            labelDisplay.setStyle("color",param1);
         },"labelDisplay.color");
         return result;
      }
      
      mx_internal function _DropDownWoodSkin_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_DropDownWoodSkin_StylesInit_done)
         {
            return;
         }
         mx_internal::_DropDownWoodSkin_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","customStyle");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".customStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.borderStyle = "none";
               this.color = 4466958;
               this.rollOverColor = 13348218;
               this.selectionColor = 12290893;
            };
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DropDownWoodSkin_Group3() : Group
      {
         return this._272784889_DropDownWoodSkin_Group3;
      }
      
      public function set _DropDownWoodSkin_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._272784889_DropDownWoodSkin_Group3;
         if(_loc2_ !== param1)
         {
            this._272784889_DropDownWoodSkin_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DropDownWoodSkin_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Group
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Group) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : Button
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:Button) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DropDownList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DropDownList) : void
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

