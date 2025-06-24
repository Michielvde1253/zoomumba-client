package custom.info.component
{
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.image.BackgroundImage;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class InfoDisplayAttraction extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _InfoDisplayAttraction_Counter1:Counter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _111972721value:int = 0;
      
      private var _embed_mxml__general_Decorations_swf_Attraction_1169780356:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoDisplayAttraction()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_Attraction_1169780356 = InfoDisplayAttraction__embed_mxml__general_Decorations_swf_Attraction_1169780356;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoDisplayAttraction_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_component_InfoDisplayAttractionWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoDisplayAttraction[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxHeight = 60;
         this.maxWidth = 60;
         this.mxmlContent = [this._InfoDisplayAttraction_BackgroundImage1_c(),this._InfoDisplayAttraction_BitmapImage1_c(),this._InfoDisplayAttraction_Counter1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InfoDisplayAttraction._watcherSetupUtil = param1;
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
      
      private function _InfoDisplayAttraction_BackgroundImage1_c() : BackgroundImage
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
      
      private function _InfoDisplayAttraction_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 2;
         _loc1_.horizontalCenter = 6;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Attraction_1169780356;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayAttraction_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.bottom = -5;
         _loc1_.left = -5;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "_InfoDisplayAttraction_Counter1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayAttraction_Counter1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayAttraction_Counter1",this._InfoDisplayAttraction_Counter1);
         return _loc1_;
      }
      
      private function _InfoDisplayAttraction_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_InfoDisplayAttraction_Counter1.value","value");
         return _loc1_;
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

