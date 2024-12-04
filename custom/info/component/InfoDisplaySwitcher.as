package custom.info.component
{
   import buttons.skin.sign.ButtonArrowSkin;
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
   import general.paginator.Paginator;
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
   import spark.components.Button;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   use namespace mx_internal;
   
   public class InfoDisplaySwitcher extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1899870462_container:SpriteVisualElement;
      
      private var _91112402_next:Button;
      
      private var _91183890_prev:Button;
      
      private var _103668165match:InfoDisplayCagesSpeciesMatch;
      
      private var _1011692561paginator:Paginator;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InfoDisplaySwitcher()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var _InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._InfoDisplaySwitcher_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_info_component_InfoDisplaySwitcherWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InfoDisplaySwitcher[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxWidth = 60;
         this.maxHeight = 60;
         this.mxmlContent = [this._InfoDisplaySwitcher_BackgroundImage1_c(),this._InfoDisplaySwitcher_SpriteVisualElement1_i(),this._InfoDisplaySwitcher_Button1_i(),this._InfoDisplaySwitcher_Button2_i()];
         this.currentState = "none";
         this._InfoDisplaySwitcher_Paginator1_i();
         _InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_factory = new DeferredInstanceFromFunction(this._InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"speciesMatches",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_container"]
            })]
         })];
         _InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InfoDisplaySwitcher._watcherSetupUtil = param1;
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
      
      public function addContent(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this._container.numChildren)
            {
               _loc3_ = this._container.getChildAt(_loc2_);
               this._container.removeChild(_loc3_);
               _loc2_++;
            }
            this._container.addChild(param1);
         }
      }
      
      private function _InfoDisplaySwitcher_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         _loc1_.entriesPerPage = 1;
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _InfoDisplaySwitcher_BackgroundImage1_c() : BackgroundImage
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
      
      private function _InfoDisplaySwitcher_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_container");
         this._container = _loc1_;
         BindingManager.executeBindings(this,"_container",this._container);
         return _loc1_;
      }
      
      private function _InfoDisplaySwitcher_InfoDisplayCagesSpeciesMatch1_i() : InfoDisplayCagesSpeciesMatch
      {
         var _loc1_:InfoDisplayCagesSpeciesMatch = new InfoDisplayCagesSpeciesMatch();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -25;
         _loc1_.id = "match";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.match = _loc1_;
         BindingManager.executeBindings(this,"match",this.match);
         return _loc1_;
      }
      
      private function _InfoDisplaySwitcher_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -0.38;
         _loc1_.scaleY = 0.38;
         _loc1_.left = -42;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_prev";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._prev = _loc1_;
         BindingManager.executeBindings(this,"_prev",this._prev);
         return _loc1_;
      }
      
      private function _InfoDisplaySwitcher_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.38;
         _loc1_.scaleY = 0.38;
         _loc1_.right = -42;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_next";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._next = _loc1_;
         BindingManager.executeBindings(this,"_next",this._next);
         return _loc1_;
      }
      
      private function _InfoDisplaySwitcher_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"paginator.prevButton","_prev");
         _loc1_[1] = new Binding(this,null,null,"paginator.nextButton","_next");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _container() : SpriteVisualElement
      {
         return this._1899870462_container;
      }
      
      public function set _container(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1899870462_container;
         if(_loc2_ !== param1)
         {
            this._1899870462_container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _next() : Button
      {
         return this._91112402_next;
      }
      
      public function set _next(param1:Button) : void
      {
         var _loc2_:Object = this._91112402_next;
         if(_loc2_ !== param1)
         {
            this._91112402_next = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_next",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _prev() : Button
      {
         return this._91183890_prev;
      }
      
      public function set _prev(param1:Button) : void
      {
         var _loc2_:Object = this._91183890_prev;
         if(_loc2_ !== param1)
         {
            this._91183890_prev = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prev",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get match() : InfoDisplayCagesSpeciesMatch
      {
         return this._103668165match;
      }
      
      public function set match(param1:InfoDisplayCagesSpeciesMatch) : void
      {
         var _loc2_:Object = this._103668165match;
         if(_loc2_ !== param1)
         {
            this._103668165match = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"match",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paginator() : Paginator
      {
         return this._1011692561paginator;
      }
      
      public function set paginator(param1:Paginator) : void
      {
         var _loc2_:Object = this._1011692561paginator;
         if(_loc2_ !== param1)
         {
            this._1011692561paginator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paginator",_loc2_,param1));
            }
         }
      }
   }
}

