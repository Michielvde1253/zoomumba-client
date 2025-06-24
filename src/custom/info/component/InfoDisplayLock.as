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
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   
   use namespace mx_internal;
   
   public class InfoDisplayLock extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _InfoDisplayLock_BackgroundImage1:BackgroundImage;
      
      public var _InfoDisplayLock_Counter1:Counter;
      
      public var _InfoDisplayLock_Image1:Image;
      
      public var _InfoDisplayLock_Image2:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _102865796level:int = 0;
      
      private var _embed_mxml__general_Decorations_swf_LockOpenSPR_1834136911:Class;
      
      private var _embed_mxml__general_Decorations_swf_LockClosedSPR_555374237:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoDisplayLock()
      {
         var bindings:Array;
         var watchers:Array;
         var _InfoDisplayLock_Image1_factory:DeferredInstanceFromFunction;
         var _InfoDisplayLock_Image2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LockOpenSPR_1834136911 = InfoDisplayLock__embed_mxml__general_Decorations_swf_LockOpenSPR_1834136911;
         this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237 = InfoDisplayLock__embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoDisplayLock_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_component_InfoDisplayLockWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoDisplayLock[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxHeight = 60;
         this.maxWidth = 60;
         this.mxmlContent = [this._InfoDisplayLock_BackgroundImage1_i(),this._InfoDisplayLock_Counter1_i()];
         this.currentState = "unlocked";
         _InfoDisplayLock_Image1_factory = new DeferredInstanceFromFunction(this._InfoDisplayLock_Image1_i);
         _InfoDisplayLock_Image2_factory = new DeferredInstanceFromFunction(this._InfoDisplayLock_Image2_i);
         states = [new State({
            "name":"unlocked",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayLock_Image2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayLock_BackgroundImage1"]
            })]
         }),new State({
            "name":"locked",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplayLock_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_InfoDisplayLock_BackgroundImage1"]
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
         InfoDisplayLock._watcherSetupUtil = param1;
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
      
      public function set locked(param1:Boolean) : void
      {
         currentState = param1 ? "locked" : "unlocked";
      }
      
      private function _InfoDisplayLock_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.6;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_InfoDisplayLock_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLock_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLock_BackgroundImage1",this._InfoDisplayLock_BackgroundImage1);
         return _loc1_;
      }
      
      private function _InfoDisplayLock_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockClosedSPR_555374237;
         _loc1_.x = 3;
         _loc1_.y = 3;
         _loc1_.id = "_InfoDisplayLock_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLock_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLock_Image1",this._InfoDisplayLock_Image1);
         return _loc1_;
      }
      
      private function _InfoDisplayLock_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockOpenSPR_1834136911;
         _loc1_.x = 3;
         _loc1_.y = 3;
         _loc1_.id = "_InfoDisplayLock_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLock_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLock_Image2",this._InfoDisplayLock_Image2);
         return _loc1_;
      }
      
      private function _InfoDisplayLock_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.bottom = -5;
         _loc1_.left = -5;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "_InfoDisplayLock_Counter1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayLock_Counter1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayLock_Counter1",this._InfoDisplayLock_Counter1);
         return _loc1_;
      }
      
      private function _InfoDisplayLock_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_InfoDisplayLock_Counter1.value","level");
         return _loc1_;
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
   }
}

