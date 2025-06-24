package custom.card.component
{
   import buttons.simpleButton.InInventoryButtonSkin;
   import buttons.simpleButton.InfoButtonSkin;
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.counter.CounterRectSmallSkin;
   import components.textfield.gradientText.GradientText;
   import components.toggle.ActiveToggleSkin;
   import custom.card.events.CardEvent;
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
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.ToggleButton;
   
   use namespace mx_internal;
   
   public class CardTop extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1422950650active:ToggleButton;
      
      private var _957830652counter:Counter;
      
      private var _140387767inInventory:Button;
      
      private var _3237038info:Button;
      
      private var _3540562star:Image;
      
      private var _1274527050starAmount:GradientText;
      
      private var _321545849userLevel:Counter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1854503479startAmountValue:String;
      
      private var _embed_mxml__components_ComponentIcons_swf_CardIconStar_2065124620:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardTop()
      {
         var watchers:Array;
         var _CardTop_Button1_factory:DeferredInstanceFromFunction;
         var _CardTop_Button2_factory:DeferredInstanceFromFunction;
         var _CardTop_GradientText1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var _CardTop_Counter1_factory:DeferredInstanceFromFunction = null;
         var _CardTop_Counter2_factory:DeferredInstanceFromFunction = null;
         var _CardTop_Image1_factory:DeferredInstanceFromFunction = null;
         var _CardTop_ToggleButton1_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentIcons_swf_CardIconStar_2065124620 = CardTop__embed_mxml__components_ComponentIcons_swf_CardIconStar_2065124620;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardTop_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardTopWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardTop[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "none";
         _CardTop_Button1_factory = new DeferredInstanceFromFunction(this._CardTop_Button1_i);
         _CardTop_Button2_factory = new DeferredInstanceFromFunction(this._CardTop_Button2_i);
         _CardTop_Counter1_factory = new DeferredInstanceFromFunction(this._CardTop_Counter1_i);
         _CardTop_Counter2_factory = new DeferredInstanceFromFunction(this._CardTop_Counter2_i);
         _CardTop_GradientText1_factory = new DeferredInstanceFromFunction(this._CardTop_GradientText1_i);
         _CardTop_Image1_factory = new DeferredInstanceFromFunction(this._CardTop_Image1_i);
         _CardTop_ToggleButton1_factory = new DeferredInstanceFromFunction(this._CardTop_ToggleButton1_i);
         states = [new State({
            "name":"none",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"inInventory",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"counter",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Counter1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"active",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_ToggleButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"friends",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Counter2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"boardGame",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Counter1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_GradientText1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"recycling",
            "overrides":[]
         }),new State({
            "name":"recyclingChoose",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Counter1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"recyclingProduce",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Counter1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardTop_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         _CardTop_Image1_factory.getInstance();
         _CardTop_Counter1_factory.getInstance();
         _CardTop_ToggleButton1_factory.getInstance();
         _CardTop_Counter2_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CardTop._watcherSetupUtil = param1;
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
      
      private function _CardTop_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = -16;
         _loc1_.top = -15;
         _loc1_.setStyle("skinClass",InfoButtonSkin);
         _loc1_.addEventListener("click",this.__info_click);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      public function __info_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardEvent(CardEvent.INFO_BUTTON_CLICKED));
      }
      
      private function _CardTop_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_CardIconStar_2065124620;
         _loc1_.right = -16;
         _loc1_.top = -20;
         _loc1_.id = "star";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.star = _loc1_;
         BindingManager.executeBindings(this,"star",this.star);
         return _loc1_;
      }
      
      private function _CardTop_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.right = -6;
         _loc1_.top = -15;
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.id = "starAmount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starAmount = _loc1_;
         BindingManager.executeBindings(this,"starAmount",this.starAmount);
         return _loc1_;
      }
      
      private function _CardTop_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = -10;
         _loc1_.top = -17;
         _loc1_.setStyle("skinClass",InInventoryButtonSkin);
         _loc1_.addEventListener("click",this.__inInventory_click);
         _loc1_.id = "inInventory";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inInventory = _loc1_;
         BindingManager.executeBindings(this,"inInventory",this.inInventory);
         return _loc1_;
      }
      
      public function __inInventory_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardEvent(CardEvent.IN_INVENTORY_BUTTON_CLICKED));
      }
      
      private function _CardTop_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.left = -10;
         _loc1_.top = -16;
         _loc1_.setStyle("skinClass",CounterRectSmallSkin);
         _loc1_.id = "counter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counter = _loc1_;
         BindingManager.executeBindings(this,"counter",this.counter);
         return _loc1_;
      }
      
      private function _CardTop_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.left = -13;
         _loc1_.top = -18;
         _loc1_.setStyle("skinClass",ActiveToggleSkin);
         _loc1_.id = "active";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.active = _loc1_;
         BindingManager.executeBindings(this,"active",this.active);
         return _loc1_;
      }
      
      private function _CardTop_Counter2_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.left = -8;
         _loc1_.top = -15;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "userLevel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userLevel = _loc1_;
         BindingManager.executeBindings(this,"userLevel",this.userLevel);
         return _loc1_;
      }
      
      private function _CardTop_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"starAmount.text","startAmountValue");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get active() : ToggleButton
      {
         return this._1422950650active;
      }
      
      public function set active(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1422950650active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counter() : Counter
      {
         return this._957830652counter;
      }
      
      public function set counter(param1:Counter) : void
      {
         var _loc2_:Object = this._957830652counter;
         if(_loc2_ !== param1)
         {
            this._957830652counter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inInventory() : Button
      {
         return this._140387767inInventory;
      }
      
      public function set inInventory(param1:Button) : void
      {
         var _loc2_:Object = this._140387767inInventory;
         if(_loc2_ !== param1)
         {
            this._140387767inInventory = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inInventory",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : Button
      {
         return this._3237038info;
      }
      
      public function set info(param1:Button) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get star() : Image
      {
         return this._3540562star;
      }
      
      public function set star(param1:Image) : void
      {
         var _loc2_:Object = this._3540562star;
         if(_loc2_ !== param1)
         {
            this._3540562star = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"star",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starAmount() : GradientText
      {
         return this._1274527050starAmount;
      }
      
      public function set starAmount(param1:GradientText) : void
      {
         var _loc2_:Object = this._1274527050starAmount;
         if(_loc2_ !== param1)
         {
            this._1274527050starAmount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starAmount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userLevel() : Counter
      {
         return this._321545849userLevel;
      }
      
      public function set userLevel(param1:Counter) : void
      {
         var _loc2_:Object = this._321545849userLevel;
         if(_loc2_ !== param1)
         {
            this._321545849userLevel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userLevel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startAmountValue() : String
      {
         return this._1854503479startAmountValue;
      }
      
      public function set startAmountValue(param1:String) : void
      {
         var _loc2_:Object = this._1854503479startAmountValue;
         if(_loc2_ !== param1)
         {
            this._1854503479startAmountValue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startAmountValue",_loc2_,param1));
            }
         }
      }
   }
}

