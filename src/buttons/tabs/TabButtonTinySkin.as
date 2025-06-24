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
   import spark.primitives.BitmapImage;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class TabButtonTinySkin extends TabButtonMasterSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _TabButtonTinySkin_BitmapImage1:BitmapImage;
      
      public var _TabButtonTinySkin_GradientText1:GradientText;
      
      public var _TabButtonTinySkin_StandardText1:StandardText;
      
      private var _809612678contentGroup:Group;
      
      private var _109757537stars:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__windows_Tabs_swf_TabTinyInactive_1619578209:Class;
      
      private var _embed_mxml__general_Decorations_swf_Starts_1101718850:Class;
      
      private var _embed_mxml__windows_Tabs_swf_TabTinyActive_1378197656:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TabButtonTinySkin()
      {
         var bindings:Array;
         var watchers:Array;
         var _TabButtonTinySkin_GradientText1_factory:DeferredInstanceFromFunction;
         var _TabButtonTinySkin_StandardText1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__windows_Tabs_swf_TabTinyInactive_1619578209 = TabButtonTinySkin__embed_mxml__windows_Tabs_swf_TabTinyInactive_1619578209;
         this._embed_mxml__general_Decorations_swf_Starts_1101718850 = TabButtonTinySkin__embed_mxml__general_Decorations_swf_Starts_1101718850;
         this._embed_mxml__windows_Tabs_swf_TabTinyActive_1378197656 = TabButtonTinySkin__embed_mxml__windows_Tabs_swf_TabTinyActive_1378197656;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._TabButtonTinySkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_tabs_TabButtonTinySkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TabButtonTinySkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.y = -39;
         this.width = 70;
         this.mxmlContent = [this._TabButtonTinySkin_BitmapImage1_i(),this._TabButtonTinySkin_Group1_i(),this._TabButtonTinySkin_Group2_i()];
         this.currentState = "up";
         _TabButtonTinySkin_GradientText1_factory = new DeferredInstanceFromFunction(this._TabButtonTinySkin_GradientText1_i);
         _TabButtonTinySkin_StandardText1_factory = new DeferredInstanceFromFunction(this._TabButtonTinySkin_StandardText1_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonTinySkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonTinySkin_BitmapImage1"]
            })]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonTinySkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonTinySkin_BitmapImage1"]
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonTinySkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonTinySkin_BitmapImage1"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonTinySkin_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonTinySkin_BitmapImage1"]
            })]
         }),new State({
            "name":"active",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TabButtonTinySkin_StandardText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TabButtonTinySkin_BitmapImage1"]
            }),new SetProperty().initializeFromObject({
               "target":"_TabButtonTinySkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__windows_Tabs_swf_TabTinyInactive_1619578209
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
         TabButtonTinySkin._watcherSetupUtil = param1;
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
      
      private function _TabButtonTinySkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__windows_Tabs_swf_TabTinyActive_1378197656;
         _loc1_.initialized(this,"_TabButtonTinySkin_BitmapImage1");
         this._TabButtonTinySkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonTinySkin_BitmapImage1",this._TabButtonTinySkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.height = 40;
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontSize = 12;
         _loc1_.fontWeight = "bold";
         _loc1_.mouseEnabled = false;
         _loc1_.textAlign = "center";
         _loc1_.id = "_TabButtonTinySkin_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TabButtonTinySkin_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonTinySkin_GradientText1",this._TabButtonTinySkin_GradientText1);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -2;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "_TabButtonTinySkin_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TabButtonTinySkin_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_TabButtonTinySkin_StandardText1",this._TabButtonTinySkin_StandardText1);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._TabButtonTinySkin_Image1_c()];
         _loc1_.id = "stars";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stars = _loc1_;
         BindingManager.executeBindings(this,"stars",this.stars);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Starts_1101718850;
         _loc1_.x = 10;
         _loc1_.y = 15;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TabButtonTinySkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_TabButtonTinySkin_GradientText1.width","width");
         result[1] = new Binding(this,function():uint
         {
            return Color.PRICE_TXT_COLOR_ENABLE_BROWN;
         },null,"_TabButtonTinySkin_GradientText1.color");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TabButtonTinySkin_GradientText1.text");
         result[3] = new Binding(this,null,null,"_TabButtonTinySkin_StandardText1.width","width");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TabButtonTinySkin_StandardText1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stars() : Group
      {
         return this._109757537stars;
      }
      
      public function set stars(param1:Group) : void
      {
         var _loc2_:Object = this._109757537stars;
         if(_loc2_ !== param1)
         {
            this._109757537stars = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stars",_loc2_,param1));
            }
         }
      }
   }
}

