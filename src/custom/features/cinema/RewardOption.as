package custom.features.cinema
{
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.custom.questsWindow.components.RewardItemComponent;
   
   use namespace mx_internal;
   
   public class RewardOption extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1428992089checkContainer:SpriteVisualElement;
      
      private var _934326481reward:RewardItemComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var value:int = -1;
      
      private var _1413853096amount:String;
      
      private var SpriteClass:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RewardOption()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var _RewardOption_SpriteVisualElement1_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this.SpriteClass = RewardOption_SpriteClass;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RewardOption_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_cinema_RewardOptionWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RewardOption[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 70;
         this.height = 80;
         this.maxWidth = 70;
         this.maxHeight = 80;
         this.useHandCursor = true;
         this.buttonMode = true;
         this.mxmlContent = [this._RewardOption_RewardItemComponent1_i()];
         this.currentState = "default";
         this.addEventListener("click",this.___RewardOption_Group1_click);
         this.addEventListener("creationComplete",this.___RewardOption_Group1_creationComplete);
         _RewardOption_SpriteVisualElement1_factory = new DeferredInstanceFromFunction(this._RewardOption_SpriteVisualElement1_i);
         states = [new State({
            "name":"default",
            "overrides":[]
         }),new State({
            "name":"selected",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_RewardOption_SpriteVisualElement1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["reward"]
            })]
         })];
         _RewardOption_SpriteVisualElement1_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RewardOption._watcherSetupUtil = param1;
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
      
      private function config(param1:FlexEvent) : void
      {
         this.checkContainer.addChild(new this.SpriteClass() as Sprite);
      }
      
      private function clicked(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("rewardOptClicked",true));
      }
      
      private function _RewardOption_RewardItemComponent1_i() : RewardItemComponent
      {
         var _loc1_:RewardItemComponent = null;
         _loc1_ = new RewardItemComponent();
         _loc1_.currentState = "vertical";
         _loc1_.id = "reward";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.reward = _loc1_;
         BindingManager.executeBindings(this,"reward",this.reward);
         return _loc1_;
      }
      
      private function _RewardOption_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = -25;
         _loc1_.horizontalCenter = -10;
         _loc1_.scaleX = 0.4;
         _loc1_.scaleY = 0.4;
         _loc1_.initialized(this,"checkContainer");
         this.checkContainer = _loc1_;
         BindingManager.executeBindings(this,"checkContainer",this.checkContainer);
         return _loc1_;
      }
      
      public function ___RewardOption_Group1_click(param1:MouseEvent) : void
      {
         this.clicked(param1);
      }
      
      public function ___RewardOption_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _RewardOption_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"reward.amount","amount");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get checkContainer() : SpriteVisualElement
      {
         return this._1428992089checkContainer;
      }
      
      public function set checkContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1428992089checkContainer;
         if(_loc2_ !== param1)
         {
            this._1428992089checkContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reward() : RewardItemComponent
      {
         return this._934326481reward;
      }
      
      public function set reward(param1:RewardItemComponent) : void
      {
         var _loc2_:Object = this._934326481reward;
         if(_loc2_ !== param1)
         {
            this._934326481reward = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reward",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get amount() : String
      {
         return this._1413853096amount;
      }
      
      public function set amount(param1:String) : void
      {
         var _loc2_:Object = this._1413853096amount;
         if(_loc2_ !== param1)
         {
            this._1413853096amount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amount",_loc2_,param1));
            }
         }
      }
   }
}

