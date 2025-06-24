package custom.info.component
{
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
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class InfoDisplayCagesSpeciesMatch extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _InfoDisplayCagesSpeciesMatch_BackgroundImage1:BackgroundImage;
      
      public var _InfoDisplayCagesSpeciesMatch_BackgroundImage2:BackgroundImage;
      
      private var _1292627001_InfoDisplayCagesSpeciesMatch_BitmapImage1:BitmapImage;
      
      private var _1292627002_InfoDisplayCagesSpeciesMatch_BitmapImage2:BitmapImage;
      
      private var _1292627003_InfoDisplayCagesSpeciesMatch_BitmapImage3:BitmapImage;
      
      private var _1292627004_InfoDisplayCagesSpeciesMatch_BitmapImage4:BitmapImage;
      
      public var _InfoDisplayCagesSpeciesMatch_GradientText1:GradientText;
      
      private var _779242631_InfoDisplayCagesSpeciesMatch_Group2:Group;
      
      private var _779242632_InfoDisplayCagesSpeciesMatch_Group3:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _921832806percentage:int = 10;
      
      private var _embed_mxml__general_Decorations_swf_Love_897880423:Class;
      
      private var _embed_mxml__general_Decorations_swf_XpIcon_1230327042:Class;
      
      private var _embed_mxml__general_Decorations_swf_Attraction_1169780356:Class;
      
      private var _embed_mxml__general_Decorations_swf_Crazy_1004217666:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoDisplayCagesSpeciesMatch()
      {
         var bindings:Array;
         var watchers:Array;
         var _InfoDisplayCagesSpeciesMatch_BitmapImage1_factory:DeferredInstanceFromFunction;
         var _InfoDisplayCagesSpeciesMatch_BitmapImage2_factory:DeferredInstanceFromFunction;
         var _InfoDisplayCagesSpeciesMatch_BitmapImage3_factory:DeferredInstanceFromFunction;
         var _InfoDisplayCagesSpeciesMatch_BitmapImage4_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_Love_897880423 = InfoDisplayCagesSpeciesMatch__embed_mxml__general_Decorations_swf_Love_897880423;
         this._embed_mxml__general_Decorations_swf_XpIcon_1230327042 = InfoDisplayCagesSpeciesMatch__embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         this._embed_mxml__general_Decorations_swf_Attraction_1169780356 = InfoDisplayCagesSpeciesMatch__embed_mxml__general_Decorations_swf_Attraction_1169780356;
         this._embed_mxml__general_Decorations_swf_Crazy_1004217666 = InfoDisplayCagesSpeciesMatch__embed_mxml__general_Decorations_swf_Crazy_1004217666;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoDisplayCagesSpeciesMatch_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_component_InfoDisplayCagesSpeciesMatchWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoDisplayCagesSpeciesMatch[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._InfoDisplayCagesSpeciesMatch_HGroup1_c()];
         this.currentState = "love";
         _InfoDisplayCagesSpeciesMatch_BitmapImage1_factory = new DeferredInstanceFromFunction(this._InfoDisplayCagesSpeciesMatch_BitmapImage1_i);
         _InfoDisplayCagesSpeciesMatch_BitmapImage2_factory = new DeferredInstanceFromFunction(this._InfoDisplayCagesSpeciesMatch_BitmapImage2_i);
         _InfoDisplayCagesSpeciesMatch_BitmapImage3_factory = new DeferredInstanceFromFunction(this._InfoDisplayCagesSpeciesMatch_BitmapImage3_i);
         _InfoDisplayCagesSpeciesMatch_BitmapImage4_factory = new DeferredInstanceFromFunction(this._InfoDisplayCagesSpeciesMatch_BitmapImage4_i);
         states = [new State({
            "name":"love",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayCagesSpeciesMatch_BitmapImage3_factory,
               "destination":"_InfoDisplayCagesSpeciesMatch_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayCagesSpeciesMatch_BackgroundImage2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayCagesSpeciesMatch_BitmapImage2_factory,
               "destination":"_InfoDisplayCagesSpeciesMatch_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayCagesSpeciesMatch_BackgroundImage1"]
            }),new SetProperty().initializeFromObject({
               "target":"_InfoDisplayCagesSpeciesMatch_BitmapImage2",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Love_897880423
            }),new SetProperty().initializeFromObject({
               "target":"_InfoDisplayCagesSpeciesMatch_BitmapImage3",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_XpIcon_1230327042
            })]
         }),new State({
            "name":"crazy",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayCagesSpeciesMatch_BitmapImage4_factory,
               "destination":"_InfoDisplayCagesSpeciesMatch_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayCagesSpeciesMatch_BackgroundImage2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayCagesSpeciesMatch_BitmapImage1_factory,
               "destination":"_InfoDisplayCagesSpeciesMatch_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayCagesSpeciesMatch_BackgroundImage1"]
            }),new SetProperty().initializeFromObject({
               "target":"_InfoDisplayCagesSpeciesMatch_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Crazy_1004217666
            }),new SetProperty().initializeFromObject({
               "target":"_InfoDisplayCagesSpeciesMatch_BitmapImage4",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Attraction_1169780356
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
         InfoDisplayCagesSpeciesMatch._watcherSetupUtil = param1;
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
      
      private function _InfoDisplayCagesSpeciesMatch_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.maxHeight = 20;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._InfoDisplayCagesSpeciesMatch_Group2_i(),this._InfoDisplayCagesSpeciesMatch_GradientText1_i(),this._InfoDisplayCagesSpeciesMatch_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 27;
         _loc1_.mxmlContent = [this._InfoDisplayCagesSpeciesMatch_BackgroundImage1_i()];
         _loc1_.id = "_InfoDisplayCagesSpeciesMatch_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayCagesSpeciesMatch_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_Group2",this._InfoDisplayCagesSpeciesMatch_Group2);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.27;
         _loc1_.id = "_InfoDisplayCagesSpeciesMatch_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayCagesSpeciesMatch_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BackgroundImage1",this._InfoDisplayCagesSpeciesMatch_BackgroundImage1);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.x = 1;
         _loc1_.y = 3;
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.initialized(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage1");
         this._InfoDisplayCagesSpeciesMatch_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage1",this._InfoDisplayCagesSpeciesMatch_BitmapImage1);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.y = 2;
         _loc1_.x = 3;
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.initialized(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage2");
         this._InfoDisplayCagesSpeciesMatch_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage2",this._InfoDisplayCagesSpeciesMatch_BitmapImage2);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.width = 55;
         _loc1_.fontWeight = "bold";
         _loc1_.fontSize = 11;
         _loc1_.id = "_InfoDisplayCagesSpeciesMatch_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayCagesSpeciesMatch_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_GradientText1",this._InfoDisplayCagesSpeciesMatch_GradientText1);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 20;
         _loc1_.mxmlContent = [this._InfoDisplayCagesSpeciesMatch_BackgroundImage2_i()];
         _loc1_.id = "_InfoDisplayCagesSpeciesMatch_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayCagesSpeciesMatch_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_Group3",this._InfoDisplayCagesSpeciesMatch_Group3);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BackgroundImage2_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.21;
         _loc1_.id = "_InfoDisplayCagesSpeciesMatch_BackgroundImage2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayCagesSpeciesMatch_BackgroundImage2 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BackgroundImage2",this._InfoDisplayCagesSpeciesMatch_BackgroundImage2);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.x = 7;
         _loc1_.y = 6;
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.initialized(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage3");
         this._InfoDisplayCagesSpeciesMatch_BitmapImage3 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage3",this._InfoDisplayCagesSpeciesMatch_BitmapImage3);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.x = 3;
         _loc1_.y = 8;
         _loc1_.scaleX = 0.3;
         _loc1_.scaleY = 0.3;
         _loc1_.initialized(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage4");
         this._InfoDisplayCagesSpeciesMatch_BitmapImage4 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage4",this._InfoDisplayCagesSpeciesMatch_BitmapImage4);
         return _loc1_;
      }
      
      private function _InfoDisplayCagesSpeciesMatch_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = "+" + percentage + "%";
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_InfoDisplayCagesSpeciesMatch_GradientText1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_BitmapImage1() : BitmapImage
      {
         return this._1292627001_InfoDisplayCagesSpeciesMatch_BitmapImage1;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292627001_InfoDisplayCagesSpeciesMatch_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1292627001_InfoDisplayCagesSpeciesMatch_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_BitmapImage2() : BitmapImage
      {
         return this._1292627002_InfoDisplayCagesSpeciesMatch_BitmapImage2;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292627002_InfoDisplayCagesSpeciesMatch_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._1292627002_InfoDisplayCagesSpeciesMatch_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_BitmapImage3() : BitmapImage
      {
         return this._1292627003_InfoDisplayCagesSpeciesMatch_BitmapImage3;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_BitmapImage3(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292627003_InfoDisplayCagesSpeciesMatch_BitmapImage3;
         if(_loc2_ !== param1)
         {
            this._1292627003_InfoDisplayCagesSpeciesMatch_BitmapImage3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_BitmapImage4() : BitmapImage
      {
         return this._1292627004_InfoDisplayCagesSpeciesMatch_BitmapImage4;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_BitmapImage4(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292627004_InfoDisplayCagesSpeciesMatch_BitmapImage4;
         if(_loc2_ !== param1)
         {
            this._1292627004_InfoDisplayCagesSpeciesMatch_BitmapImage4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_BitmapImage4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_Group2() : Group
      {
         return this._779242631_InfoDisplayCagesSpeciesMatch_Group2;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._779242631_InfoDisplayCagesSpeciesMatch_Group2;
         if(_loc2_ !== param1)
         {
            this._779242631_InfoDisplayCagesSpeciesMatch_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _InfoDisplayCagesSpeciesMatch_Group3() : Group
      {
         return this._779242632_InfoDisplayCagesSpeciesMatch_Group3;
      }
      
      public function set _InfoDisplayCagesSpeciesMatch_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._779242632_InfoDisplayCagesSpeciesMatch_Group3;
         if(_loc2_ !== param1)
         {
            this._779242632_InfoDisplayCagesSpeciesMatch_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_InfoDisplayCagesSpeciesMatch_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get percentage() : int
      {
         return this._921832806percentage;
      }
      
      public function set percentage(param1:int) : void
      {
         var _loc2_:Object = this._921832806percentage;
         if(_loc2_ !== param1)
         {
            this._921832806percentage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentage",_loc2_,param1));
            }
         }
      }
   }
}

