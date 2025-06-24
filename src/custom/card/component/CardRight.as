package custom.card.component
{
   import components.radioButton.RadioButtonChildSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import components.toggle.AnimationToggleSkin;
   import custom.card.events.CardSexChangeEvent;
   import custom.card.events.CardToggleChangeEvent;
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
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class CardRight extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _991737194_CardRight_RadioButton1:RadioButton;
      
      public var _CardRight_VGroup1:VGroup;
      
      private var _1050812390radioButtonSexGroup:RadioButtonGroup;
      
      private var _715840898switchSexFemale:RadioButton;
      
      private var _550260289switchSexMale:RadioButton;
      
      private var _868304044toggle:ToggleButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardRight()
      {
         var watchers:Array;
         var _CardRight_RadioButton1_factory:DeferredInstanceFromFunction;
         var _CardRight_ToggleButton1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var _CardRight_VGroup1_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardRight_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardRightWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardRight[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "none";
         this._CardRight_RadioButtonGroup1_i();
         _CardRight_RadioButton1_factory = new DeferredInstanceFromFunction(this._CardRight_RadioButton1_i);
         _CardRight_ToggleButton1_factory = new DeferredInstanceFromFunction(this._CardRight_ToggleButton1_i);
         _CardRight_VGroup1_factory = new DeferredInstanceFromFunction(this._CardRight_VGroup1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"animation",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardRight_ToggleButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"switchSex",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardRight_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"inventoryFemale",
            "stateGroups":["inventory"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardRight_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"_CardRight_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexFemaleSkin
            })]
         }),new State({
            "name":"inventoryMale",
            "stateGroups":["inventory"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardRight_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"_CardRight_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonSexMaleSkin
            })]
         }),new State({
            "name":"inventoryBaby",
            "stateGroups":["inventory"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardRight_RadioButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"_CardRight_RadioButton1",
               "name":"skinClass",
               "value":RadioButtonChildSkin
            })]
         })];
         _CardRight_VGroup1_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CardRight._watcherSetupUtil = param1;
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
      
      protected function componentUpdateComplete(param1:FlexEvent) : void
      {
         dispatchEvent(new Event("componentUpdateComplete",true));
      }
      
      private function _CardRight_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.selectedValue = 1;
         _loc1_.addEventListener("change",this.__radioButtonSexGroup_change);
         _loc1_.initialized(this,"radioButtonSexGroup");
         this.radioButtonSexGroup = _loc1_;
         BindingManager.executeBindings(this,"radioButtonSexGroup",this.radioButtonSexGroup);
         return _loc1_;
      }
      
      public function __radioButtonSexGroup_change(param1:Event) : void
      {
         dispatchEvent(new CardSexChangeEvent(CardSexChangeEvent.CHANGED,this.radioButtonSexGroup.selectedValue == 1,true));
      }
      
      private function _CardRight_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.right = -15;
         _loc1_.setStyle("skinClass",AnimationToggleSkin);
         _loc1_.addEventListener("click",this.__toggle_click);
         _loc1_.id = "toggle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toggle = _loc1_;
         BindingManager.executeBindings(this,"toggle",this.toggle);
         return _loc1_;
      }
      
      public function __toggle_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardToggleChangeEvent(CardToggleChangeEvent.CHANGED,this.toggle.selected));
      }
      
      private function _CardRight_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.right = -20;
         _loc1_.enabled = false;
         _loc1_.id = "_CardRight_RadioButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardRight_RadioButton1 = _loc1_;
         BindingManager.executeBindings(this,"_CardRight_RadioButton1",this._CardRight_RadioButton1);
         return _loc1_;
      }
      
      private function _CardRight_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.right = -20;
         _loc1_.mxmlContent = [this._CardRight_RadioButton2_i(),this._CardRight_RadioButton3_i()];
         _loc1_.id = "_CardRight_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardRight_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CardRight_VGroup1",this._CardRight_VGroup1);
         return _loc1_;
      }
      
      private function _CardRight_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonSexFemaleSkin);
         _loc1_.addEventListener("updateComplete",this.__switchSexFemale_updateComplete);
         _loc1_.id = "switchSexFemale";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.switchSexFemale = _loc1_;
         BindingManager.executeBindings(this,"switchSexFemale",this.switchSexFemale);
         return _loc1_;
      }
      
      public function __switchSexFemale_updateComplete(param1:FlexEvent) : void
      {
         this.componentUpdateComplete(param1);
      }
      
      private function _CardRight_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonSexMaleSkin);
         _loc1_.addEventListener("updateComplete",this.__switchSexMale_updateComplete);
         _loc1_.id = "switchSexMale";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.switchSexMale = _loc1_;
         BindingManager.executeBindings(this,"switchSexMale",this.switchSexMale);
         return _loc1_;
      }
      
      public function __switchSexMale_updateComplete(param1:FlexEvent) : void
      {
         this.componentUpdateComplete(param1);
      }
      
      private function _CardRight_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"switchSexFemale.group","radioButtonSexGroup");
         _loc1_[1] = new Binding(this,null,null,"switchSexMale.group","radioButtonSexGroup");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardRight_RadioButton1() : RadioButton
      {
         return this._991737194_CardRight_RadioButton1;
      }
      
      public function set _CardRight_RadioButton1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._991737194_CardRight_RadioButton1;
         if(_loc2_ !== param1)
         {
            this._991737194_CardRight_RadioButton1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardRight_RadioButton1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get radioButtonSexGroup() : RadioButtonGroup
      {
         return this._1050812390radioButtonSexGroup;
      }
      
      public function set radioButtonSexGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1050812390radioButtonSexGroup;
         if(_loc2_ !== param1)
         {
            this._1050812390radioButtonSexGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioButtonSexGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get switchSexFemale() : RadioButton
      {
         return this._715840898switchSexFemale;
      }
      
      public function set switchSexFemale(param1:RadioButton) : void
      {
         var _loc2_:Object = this._715840898switchSexFemale;
         if(_loc2_ !== param1)
         {
            this._715840898switchSexFemale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"switchSexFemale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get switchSexMale() : RadioButton
      {
         return this._550260289switchSexMale;
      }
      
      public function set switchSexMale(param1:RadioButton) : void
      {
         var _loc2_:Object = this._550260289switchSexMale;
         if(_loc2_ !== param1)
         {
            this._550260289switchSexMale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"switchSexMale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toggle() : ToggleButton
      {
         return this._868304044toggle;
      }
      
      public function set toggle(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._868304044toggle;
         if(_loc2_ !== param1)
         {
            this._868304044toggle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toggle",_loc2_,param1));
            }
         }
      }
   }
}

