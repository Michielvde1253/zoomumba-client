package buttons.tabs
{
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
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
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.primitives.BitmapImage;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class TabButtonSmallSkin extends TabButtonMasterSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _TabButtonSmallSkin_BitmapImage1:BitmapImage;
      
      public var _TabButtonSmallSkin_GradientText1:GradientText;
      
      public var _TabButtonSmallSkin_StandardText1:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__windows_Tabs_swf_TabSmallActive_1831813671:Class;
      
      private var _embed_mxml__windows_Tabs_swf_TabSmallInactive_1136097078:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TabButtonSmallSkin()
      {
         var watchers:Array;
         var _TabButtonSmallSkin_GradientText1_factory:DeferredInstanceFromFunction;
         var _TabButtonSmallSkin_StandardText1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__windows_Tabs_swf_TabSmallActive_1831813671 = TabButtonSmallSkin__embed_mxml__windows_Tabs_swf_TabSmallActive_1831813671;
         this._embed_mxml__windows_Tabs_swf_TabSmallInactive_1136097078 = TabButtonSmallSkin__embed_mxml__windows_Tabs_swf_TabSmallInactive_1136097078;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._TabButtonSmallSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_tabs_TabButtonSmallSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TabButtonSmallSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.y = -37;
         this.width = 132;
         this.mxmlContent = [this._TabButtonSmallSkin_BitmapImage1_i()];
         this.currentState = "up";
         _TabButtonSmallSkin_GradientText1_factory = new DeferredInstanceFromFunction(this._TabButtonSmallSkin_GradientText1_i);
         _TabButtonSmallSkin_StandardText1_factory = new DeferredInstanceFromFunction(this._TabButtonSmallSkin_StandardText1_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonSmallSkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonSmallSkin_BitmapImage1"]
            })]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonSmallSkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonSmallSkin_BitmapImage1"]
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonSmallSkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonSmallSkin_BitmapImage1"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonSmallSkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonSmallSkin_BitmapImage1"]
            })]
         }),new State({
            "name":"active",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonSmallSkin_StandardText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonSmallSkin_BitmapImage1"]
            }),new SetProperty().initializeFromObject({
               "target":"_TabButtonSmallSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__windows_Tabs_swf_TabSmallInactive_1136097078
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
         TabButtonSmallSkin._watcherSetupUtil = param1;
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
      
      private function _TabButtonSmallSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__windows_Tabs_swf_TabSmallActive_1831813671;
         _loc1_.initialized(this,"_TabButtonSmallSkin_BitmapImage1");
         this._TabButtonSmallSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonSmallSkin_BitmapImage1",this._TabButtonSmallSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _TabButtonSmallSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.height = 40;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontSize = 12;
         _loc1_.fontWeight = "bold";
         _loc1_.mouseEnabled = false;
         _loc1_.textAlign = "center";
         _loc1_.id = "_TabButtonSmallSkin_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TabButtonSmallSkin_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonSmallSkin_GradientText1",this._TabButtonSmallSkin_GradientText1);
         return _loc1_;
      }
      
      private function _TabButtonSmallSkin_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -2;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "_TabButtonSmallSkin_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TabButtonSmallSkin_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonSmallSkin_StandardText1",this._TabButtonSmallSkin_StandardText1);
         return _loc1_;
      }
      
      private function _TabButtonSmallSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_TabButtonSmallSkin_GradientText1.width","width");
         result[1] = new Binding(this,function():uint
         {
            return Color.PRICE_TXT_COLOR_ENABLE_BROWN;
         },null,"_TabButtonSmallSkin_GradientText1.color");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TabButtonSmallSkin_GradientText1.text");
         result[3] = new Binding(this,null,null,"_TabButtonSmallSkin_StandardText1.width","width");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TabButtonSmallSkin_StandardText1.text");
         return result;
      }
   }
}

