package custom.features.collectable.book.component
{
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
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
   
   public class CollBookPageIcon extends Group implements IBindingClient, IStateClient2
   {
      public static var _66236601$paper15Source:*;
      
      public static var _789070053$paper24Source:*;
      
      public static var _302474566$paper3Source:*;
      
      public static var _1438773850$tape1Source:*;
      
      public static var _551270169$tape2Source:*;
      
      public static var _336233512$tape3Source:*;
      
      public static var _18742514$questionMarkSource:*;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _CollBookPageIcon_BitmapImage1:BitmapImage;
      
      public var _CollBookPageIcon_BitmapImage2:BitmapImage;
      
      public var _CollBookPageIcon_BitmapImage3:BitmapImage;
      
      public var _CollBookPageIcon_BitmapImage4:BitmapImage;
      
      private var _704995700_CollBookPageIcon_BitmapImage5:BitmapImage;
      
      private var _704995699_CollBookPageIcon_BitmapImage6:BitmapImage;
      
      public var _CollBookPageIcon_BitmapImage7:BitmapImage;
      
      public var _CollBookPageIcon_Counter1:Counter;
      
      public var _CollBookPageIcon_Image1:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _count:int = 0;
      
      private var _1883491145collected:Boolean = false;
      
      private var _1605867799surprise:Boolean = false;
      
      private var _896505829source:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookPageIcon()
      {
         var bindings:Array;
         var watchers:Array;
         var _CollBookPageIcon_BitmapImage1_factory:DeferredInstanceFromFunction;
         var _CollBookPageIcon_BitmapImage2_factory:DeferredInstanceFromFunction;
         var _CollBookPageIcon_BitmapImage3_factory:DeferredInstanceFromFunction;
         var _CollBookPageIcon_BitmapImage4_factory:DeferredInstanceFromFunction;
         var _CollBookPageIcon_BitmapImage5_factory:DeferredInstanceFromFunction;
         var _CollBookPageIcon_BitmapImage6_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollBookPageIcon_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_CollBookPageIconWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookPageIcon[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 80;
         this.height = 80;
         this.mxmlContent = [this._CollBookPageIcon_Image1_i(),this._CollBookPageIcon_BitmapImage7_i(),this._CollBookPageIcon_Counter1_i()];
         this.currentState = "type1";
         _CollBookPageIcon_BitmapImage1_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage1_i);
         _CollBookPageIcon_BitmapImage2_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage2_i);
         _CollBookPageIcon_BitmapImage3_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage3_i);
         _CollBookPageIcon_BitmapImage4_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage4_i);
         _CollBookPageIcon_BitmapImage5_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage5_i);
         _CollBookPageIcon_BitmapImage6_factory = new DeferredInstanceFromFunction(this._CollBookPageIcon_BitmapImage6_i);
         states = [new State({
            "name":"type1",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"type2",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage6_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage5",
               "name":"x",
               "value":54
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage5",
               "name":"y",
               "value":-8
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage6",
               "name":"x",
               "value":-10
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage6",
               "name":"y",
               "value":54
            })]
         }),new State({
            "name":"type3",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"type4",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage6_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage5",
               "name":"x",
               "value":-6
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage5",
               "name":"y",
               "value":55
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage6",
               "name":"x",
               "value":52
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageIcon_BitmapImage6",
               "name":"y",
               "value":-10
            })]
         }),new State({
            "name":"type5",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageIcon_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
         CollBookPageIcon._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get $paper15Source() : *
      {
         return CollBookPageIcon._66236601$paper15Source;
      }
      
      public static function set $paper15Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._66236601$paper15Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$paper15Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $paper24Source() : *
      {
         return CollBookPageIcon._789070053$paper24Source;
      }
      
      public static function set $paper24Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._789070053$paper24Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$paper24Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $paper3Source() : *
      {
         return CollBookPageIcon._302474566$paper3Source;
      }
      
      public static function set $paper3Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._302474566$paper3Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$paper3Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $tape1Source() : *
      {
         return CollBookPageIcon._1438773850$tape1Source;
      }
      
      public static function set $tape1Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._1438773850$tape1Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$tape1Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $tape2Source() : *
      {
         return CollBookPageIcon._551270169$tape2Source;
      }
      
      public static function set $tape2Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._551270169$tape2Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$tape2Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $tape3Source() : *
      {
         return CollBookPageIcon._336233512$tape3Source;
      }
      
      public static function set $tape3Source(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._336233512$tape3Source;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$tape3Source",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $questionMarkSource() : *
      {
         return CollBookPageIcon._18742514$questionMarkSource;
      }
      
      public static function set $questionMarkSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageIcon._18742514$questionMarkSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageIcon,"$questionMarkSource",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
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
      
      [Bindable(event="valueChanged")]
      public function set count(param1:int) : void
      {
         if(this._count != param1)
         {
            this._count = param1;
            dispatchEvent(new Event("valueChanged"));
         }
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      private function _CollBookPageIcon_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage1");
         this._CollBookPageIcon_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage1",this._CollBookPageIcon_BitmapImage1);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage2");
         this._CollBookPageIcon_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage2",this._CollBookPageIcon_BitmapImage2);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage3");
         this._CollBookPageIcon_BitmapImage3 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage3",this._CollBookPageIcon_BitmapImage3);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 12;
         _loc1_.y = -6;
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage4");
         this._CollBookPageIcon_BitmapImage4 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage4",this._CollBookPageIcon_BitmapImage4);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage5");
         this._CollBookPageIcon_BitmapImage5 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage5",this._CollBookPageIcon_BitmapImage5);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage6");
         this._CollBookPageIcon_BitmapImage6 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage6",this._CollBookPageIcon_BitmapImage6);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 40;
         _loc1_.y = 40;
         _loc1_.id = "_CollBookPageIcon_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageIcon_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_Image1",this._CollBookPageIcon_Image1);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_BitmapImage7_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_CollBookPageIcon_BitmapImage7");
         this._CollBookPageIcon_BitmapImage7 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_BitmapImage7",this._CollBookPageIcon_BitmapImage7);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.right = -5;
         _loc1_.bottom = -5;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "_CollBookPageIcon_Counter1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageIcon_Counter1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageIcon_Counter1",this._CollBookPageIcon_Counter1);
         return _loc1_;
      }
      
      private function _CollBookPageIcon_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return $paper15Source;
         },null,"_CollBookPageIcon_BitmapImage1.source");
         result[1] = new Binding(this,function():Object
         {
            return $paper24Source;
         },null,"_CollBookPageIcon_BitmapImage2.source");
         result[2] = new Binding(this,function():Object
         {
            return $paper3Source;
         },null,"_CollBookPageIcon_BitmapImage3.source");
         result[3] = new Binding(this,function():Object
         {
            return $tape1Source;
         },null,"_CollBookPageIcon_BitmapImage4.source");
         result[4] = new Binding(this,function():Object
         {
            return $tape2Source;
         },null,"_CollBookPageIcon_BitmapImage5.source");
         result[5] = new Binding(this,function():Object
         {
            return $tape3Source;
         },null,"_CollBookPageIcon_BitmapImage6.source");
         result[6] = new Binding(this,null,null,"_CollBookPageIcon_Image1.source","source");
         result[7] = new Binding(this,function():Number
         {
            return collected ? 1 : 0.2;
         },null,"_CollBookPageIcon_Image1.alpha");
         result[8] = new Binding(this,function():Array
         {
            var _loc1_:* = collected ? [] : [Color.getColorMatrixFilter(Color.GRAYSCALE)];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_CollBookPageIcon_Image1.filters");
         result[9] = new Binding(this,function():Boolean
         {
            return !surprise;
         },null,"_CollBookPageIcon_Image1.visible");
         result[10] = new Binding(this,function():Object
         {
            return $questionMarkSource;
         },null,"_CollBookPageIcon_BitmapImage7.source");
         result[11] = new Binding(this,null,null,"_CollBookPageIcon_BitmapImage7.visible","surprise");
         result[12] = new Binding(this,null,null,"_CollBookPageIcon_Counter1.value","count");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookPageIcon_BitmapImage5() : BitmapImage
      {
         return this._704995700_CollBookPageIcon_BitmapImage5;
      }
      
      public function set _CollBookPageIcon_BitmapImage5(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._704995700_CollBookPageIcon_BitmapImage5;
         if(_loc2_ !== param1)
         {
            this._704995700_CollBookPageIcon_BitmapImage5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookPageIcon_BitmapImage5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookPageIcon_BitmapImage6() : BitmapImage
      {
         return this._704995699_CollBookPageIcon_BitmapImage6;
      }
      
      public function set _CollBookPageIcon_BitmapImage6(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._704995699_CollBookPageIcon_BitmapImage6;
         if(_loc2_ !== param1)
         {
            this._704995699_CollBookPageIcon_BitmapImage6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookPageIcon_BitmapImage6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get collected() : Boolean
      {
         return this._1883491145collected;
      }
      
      public function set collected(param1:Boolean) : void
      {
         var _loc2_:Object = this._1883491145collected;
         if(_loc2_ !== param1)
         {
            this._1883491145collected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get surprise() : Boolean
      {
         return this._1605867799surprise;
      }
      
      public function set surprise(param1:Boolean) : void
      {
         var _loc2_:Object = this._1605867799surprise;
         if(_loc2_ !== param1)
         {
            this._1605867799surprise = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"surprise",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get source() : Object
      {
         return this._896505829source;
      }
      
      public function set source(param1:Object) : void
      {
         var _loc2_:Object = this._896505829source;
         if(_loc2_ !== param1)
         {
            this._896505829source = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"source",_loc2_,param1));
            }
         }
      }
   }
}

