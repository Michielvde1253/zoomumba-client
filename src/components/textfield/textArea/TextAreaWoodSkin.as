package components.textfield.textArea
{
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
   import spark.components.Label;
   import spark.components.RichEditableText;
   import spark.components.Scroller;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class TextAreaWoodSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _94436_bg:BitmapImage;
      
      private var _263438014promptDisplay:Label;
      
      private var _402164678scroller:Scroller;
      
      private var _831827669textDisplay:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      private var _embed_mxml__general_Patterns_swf_TileBG2_1819943852:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:StandardTextArea;
      
      public function TextAreaWoodSkin()
      {
         var watchers:Array;
         var _TextAreaWoodSkin_Label1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = TextAreaWoodSkin__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this._embed_mxml__general_Patterns_swf_TileBG2_1819943852 = TextAreaWoodSkin__embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._TextAreaWoodSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_textfield_textArea_TextAreaWoodSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TextAreaWoodSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 150;
         this.mxmlContent = [this._TextAreaWoodSkin_BitmapImage1_i(),this._TextAreaWoodSkin_BitmapImage2_c(),this._TextAreaWoodSkin_BitmapImage3_c(),this._TextAreaWoodSkin_BitmapImage4_c(),this._TextAreaWoodSkin_BitmapImage5_c(),this._TextAreaWoodSkin_Scroller1_i()];
         this.currentState = "normal";
         _TextAreaWoodSkin_Label1_factory = new DeferredInstanceFromFunction(this._TextAreaWoodSkin_Label1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"prompting",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TextAreaWoodSkin_Label1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["scroller"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
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
         TextAreaWoodSkin._watcherSetupUtil = param1;
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
      
      private function _TextAreaWoodSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         _loc1_.initialized(this,"_bg");
         this._bg = _loc1_;
         BindingManager.executeBindings(this,"_bg",this._bg);
         return _loc1_;
      }
      
      private function _TextAreaWoodSkin_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TextAreaWoodSkin_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TextAreaWoodSkin_BitmapImage4_c() : BitmapImage
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
      
      private function _TextAreaWoodSkin_BitmapImage5_c() : BitmapImage
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
      
      private function _TextAreaWoodSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 12;
         _loc1_.right = 0;
         _loc1_.top = 10;
         _loc1_.bottom = 12;
         _loc1_.hasFocusableChildren = false;
         _loc1_.measuredSizeIncludesScrollBars = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._TextAreaWoodSkin_RichEditableText1_i();
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
      
      private function _TextAreaWoodSkin_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.editable = true;
         _loc1_.heightInLines = 10;
         _loc1_.widthInChars = 15;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      private function _TextAreaWoodSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 12;
         _loc1_.right = 12;
         _loc1_.top = 10;
         _loc1_.bottom = 12;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _TextAreaWoodSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            textDisplay.setStyle("color",param1);
         },"textDisplay.color");
         result[1] = new Binding(this,function():uint
         {
            return hostComponent.promptColor;
         },function(param1:uint):void
         {
            promptDisplay.setStyle("color",param1);
         },"promptDisplay.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bg() : BitmapImage
      {
         return this._94436_bg;
      }
      
      public function set _bg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._94436_bg;
         if(_loc2_ !== param1)
         {
            this._94436_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptDisplay() : Label
      {
         return this._263438014promptDisplay;
      }
      
      public function set promptDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._263438014promptDisplay;
         if(_loc2_ !== param1)
         {
            this._263438014promptDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
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
      public function get textDisplay() : RichEditableText
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:RichEditableText) : void
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
      public function get hostComponent() : StandardTextArea
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:StandardTextArea) : void
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

