package custom.info.component
{
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.image.BackgroundImage;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class InfoDisplayLevelXP extends VGroup implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _501334979_InfoDisplayLevelXP_BitmapImage1:BitmapImage;
      
      public var _InfoDisplayLevelXP_Counter1:Counter;
      
      public var _InfoDisplayLevelXP_GradientText1:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _102865796level:int = 0;
      
      private var _13400142xpPercentage:int = 0;
      
      private var _embed_mxml__general_Decorations_swf_LevelUp_341789924:Class;
      
      private var _embed_mxml__general_Decorations_swf_LevelUpOcean_1993402084:Class;
      
      private var _embed_mxml__general_Decorations_swf_XpIcon_1230327042:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoDisplayLevelXP()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LevelUp_341789924 = InfoDisplayLevelXP__embed_mxml__general_Decorations_swf_LevelUp_341789924;
         this._embed_mxml__general_Decorations_swf_LevelUpOcean_1993402084 = InfoDisplayLevelXP__embed_mxml__general_Decorations_swf_LevelUpOcean_1993402084;
         this._embed_mxml__general_Decorations_swf_XpIcon_1230327042 = InfoDisplayLevelXP__embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoDisplayLevelXP_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_component_InfoDisplayLevelXPWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoDisplayLevelXP[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxHeight = 60;
         this.maxWidth = 60;
         this.gap = -2;
         this.mxmlContent = [this._InfoDisplayLevelXP_Group1_c(),this._InfoDisplayLevelXP_HGroup1_c()];
         this.currentState = "petPaw";
         states = [new State({
            "name":"petPaw",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_InfoDisplayLevelXP_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_LevelUp_341789924
            })]
         }),new State({
            "name":"pearls",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_InfoDisplayLevelXP_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_LevelUpOcean_1993402084
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
         InfoDisplayLevelXP._watcherSetupUtil = param1;
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
      
      private function _InfoDisplayLevelXP_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxHeight = 60;
         _loc1_.maxWidth = 60;
         _loc1_.mxmlContent = [this._InfoDisplayLevelXP_BackgroundImage1_c(),this._InfoDisplayLevelXP_BitmapImage1_i(),this._InfoDisplayLevelXP_Counter1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.6;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = -2;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_InfoDisplayLevelXP_BitmapImage1");
         this._InfoDisplayLevelXP_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLevelXP_BitmapImage1",this._InfoDisplayLevelXP_BitmapImage1);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.bottom = -5;
         _loc1_.left = -5;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "_InfoDisplayLevelXP_Counter1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLevelXP_Counter1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLevelXP_Counter1",this._InfoDisplayLevelXP_Counter1);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -2;
         _loc1_.maxWidth = 60;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._InfoDisplayLevelXP_GradientText1_i(),this._InfoDisplayLevelXP_Image1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 16;
         _loc1_.id = "_InfoDisplayLevelXP_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLevelXP_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLevelXP_GradientText1",this._InfoDisplayLevelXP_GradientText1);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayLevelXP_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_InfoDisplayLevelXP_Counter1.value","level");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = xpPercentage + "%";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_InfoDisplayLevelXP_GradientText1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayLevelXP_BitmapImage1() : BitmapImage
      {
         return this._501334979_InfoDisplayLevelXP_BitmapImage1;
      }
      
      public function set _InfoDisplayLevelXP_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._501334979_InfoDisplayLevelXP_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._501334979_InfoDisplayLevelXP_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayLevelXP_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get level() : int
      {
         return this._102865796level;
      }
      
      public function set level(param1:int) : void
      {
         var _loc2_:Object = this._102865796level;
         if(_loc2_ !== param1)
         {
            this._102865796level = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"level",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xpPercentage() : int
      {
         return this._13400142xpPercentage;
      }
      
      public function set xpPercentage(param1:int) : void
      {
         var _loc2_:Object = this._13400142xpPercentage;
         if(_loc2_ !== param1)
         {
            this._13400142xpPercentage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xpPercentage",_loc2_,param1));
            }
         }
      }
   }
}

