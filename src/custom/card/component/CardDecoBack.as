package custom.card.component
{
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
   
   public class CardDecoBack extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _CardDecoBack_BackgroundImage1:BackgroundImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _109250890scale:Number = 1;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardDecoBack()
      {
         var watchers:Array;
         var _CardDecoBack_BackgroundImage1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardDecoBack_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardDecoBackWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardDecoBack[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [];
         this.currentState = "none";
         _CardDecoBack_BackgroundImage1_factory = new DeferredInstanceFromFunction(this._CardDecoBack_BackgroundImage1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"circle",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardDecoBack_BackgroundImage1_factory,
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
         CardDecoBack._watcherSetupUtil = param1;
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
      
      private function _CardDecoBack_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.id = "_CardDecoBack_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardDecoBack_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CardDecoBack_BackgroundImage1",this._CardDecoBack_BackgroundImage1);
         return _loc1_;
      }
      
      private function _CardDecoBack_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_CardDecoBack_BackgroundImage1.scale","scale");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get scale() : Number
      {
         return this._109250890scale;
      }
      
      public function set scale(param1:Number) : void
      {
         var _loc2_:Object = this._109250890scale;
         if(_loc2_ !== param1)
         {
            this._109250890scale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scale",_loc2_,param1));
            }
         }
      }
   }
}

