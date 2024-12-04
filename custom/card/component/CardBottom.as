package custom.card.component
{
   import buttons.customButtons.CustomizableCircularButton;
   import buttons.extended.ButtonCircularZoomable;
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
   import buttons.skin.circularZoomable.ButtonOKCircularSkin;
   import buttons.skin.circularZoomable.ButtonXCircularSkin;
   import com.bigpoint.zoomumba.model.cards.events.CardBottomEvent;
   import components.stepper.NumericStepperAmmountSkin;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.card.events.CardNumericStepperChangeEvent;
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
   import spark.components.HGroup;
   import spark.components.NumericStepper;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class CardBottom extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _CardBottom_VGroup2:VGroup;
      
      public var _CardBottom_VGroup3:VGroup;
      
      public var _CardBottom_VGroup4:VGroup;
      
      private var _1798415527amountStepper:NumericStepper;
      
      private var _552589990amountStepperGroup:VGroup;
      
      private var _823306234btAccept:ButtonCircularZoomable;
      
      private var _1822306748btDecline:ButtonCircularZoomable;
      
      private var _1885236053btMessage:CustomizableCircularButton;
      
      private var _184693785btVisit:CustomizableCircularButton;
      
      private var _241352511button1:ButtonCircularZoomable;
      
      private var _241352512button2:ButtonCircularZoomable;
      
      private var _738939839chances:CardChances;
      
      private var _1048103124clockDisplay:LabelDisplay;
      
      private var _1012555253clockDisplayGroup:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_BoxOpened_1758673595:Class;
      
      private var _embed_mxml__components_ComponentIcons_swf_Sell_500987965:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardBottom()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var _CardBottom_CardChances1_factory:DeferredInstanceFromFunction = null;
         var _CardBottom_VGroup1_factory:DeferredInstanceFromFunction = null;
         var _CardBottom_VGroup2_factory:DeferredInstanceFromFunction = null;
         var _CardBottom_VGroup3_factory:DeferredInstanceFromFunction = null;
         var _CardBottom_VGroup4_factory:DeferredInstanceFromFunction = null;
         var _CardBottom_VGroup5_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentIcons_swf_BoxOpened_1758673595 = CardBottom__embed_mxml__components_ComponentIcons_swf_BoxOpened_1758673595;
         this._embed_mxml__components_ComponentIcons_swf_Sell_500987965 = CardBottom__embed_mxml__components_ComponentIcons_swf_Sell_500987965;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardBottom_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardBottomWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardBottom[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "none";
         _CardBottom_CardChances1_factory = new DeferredInstanceFromFunction(this._CardBottom_CardChances1_i);
         _CardBottom_VGroup1_factory = new DeferredInstanceFromFunction(this._CardBottom_VGroup1_i);
         _CardBottom_VGroup2_factory = new DeferredInstanceFromFunction(this._CardBottom_VGroup2_i);
         _CardBottom_VGroup3_factory = new DeferredInstanceFromFunction(this._CardBottom_VGroup3_i);
         _CardBottom_VGroup4_factory = new DeferredInstanceFromFunction(this._CardBottom_VGroup4_i);
         _CardBottom_VGroup5_factory = new DeferredInstanceFromFunction(this._CardBottom_VGroup5_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"amount",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"inventory",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"chance",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_CardChances1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"time",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"friendship",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"invitation_received",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"recyclingBuy",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"recyclingProduce",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"recyclingProducing",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardBottom_VGroup5_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         _CardBottom_CardChances1_factory.getInstance();
         _CardBottom_VGroup1_factory.getInstance();
         _CardBottom_VGroup2_factory.getInstance();
         _CardBottom_VGroup3_factory.getInstance();
         _CardBottom_VGroup4_factory.getInstance();
         _CardBottom_VGroup5_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CardBottom._watcherSetupUtil = param1;
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
      
      private function _CardBottom_CardChances1_i() : CardChances
      {
         var _loc1_:CardChances = new CardChances();
         _loc1_.bottom = 28;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "chances";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chances = _loc1_;
         BindingManager.executeBindings(this,"chances",this.chances);
         return _loc1_;
      }
      
      private function _CardBottom_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 14;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CardBottom_NumericStepper1_i()];
         _loc1_.id = "amountStepperGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.amountStepperGroup = _loc1_;
         BindingManager.executeBindings(this,"amountStepperGroup",this.amountStepperGroup);
         return _loc1_;
      }
      
      private function _CardBottom_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.addEventListener("change",this.__amountStepper_change);
         _loc1_.id = "amountStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.amountStepper = _loc1_;
         BindingManager.executeBindings(this,"amountStepper",this.amountStepper);
         return _loc1_;
      }
      
      public function __amountStepper_change(param1:Event) : void
      {
         dispatchEvent(new CardNumericStepperChangeEvent(CardNumericStepperChangeEvent.CHANGED,this.amountStepper.value));
      }
      
      private function _CardBottom_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CardBottom_HGroup1_c()];
         _loc1_.id = "_CardBottom_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardBottom_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CardBottom_VGroup2",this._CardBottom_VGroup2);
         return _loc1_;
      }
      
      private function _CardBottom_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._CardBottom_ButtonCircularZoomable1_i(),this._CardBottom_ButtonCircularZoomable2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CardBottom_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.iconClass = this._embed_mxml__components_ComponentIcons_swf_BoxOpened_1758673595;
         _loc1_.circularState = "maskCombined";
         _loc1_.bgScale = 0.3;
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.id = "button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button1 = _loc1_;
         BindingManager.executeBindings(this,"button1",this.button1);
         return _loc1_;
      }
      
      private function _CardBottom_ButtonCircularZoomable2_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.iconClass = this._embed_mxml__components_ComponentIcons_swf_Sell_500987965;
         _loc1_.circularState = "maskCombined";
         _loc1_.bgScale = 0.3;
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.id = "button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button2 = _loc1_;
         BindingManager.executeBindings(this,"button2",this.button2);
         return _loc1_;
      }
      
      private function _CardBottom_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 3;
         _loc1_.horizontalCenter = 3;
         _loc1_.mxmlContent = [this._CardBottom_HGroup2_c()];
         _loc1_.id = "_CardBottom_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardBottom_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_CardBottom_VGroup3",this._CardBottom_VGroup3);
         return _loc1_;
      }
      
      private function _CardBottom_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._CardBottom_CustomizableCircularButton1_i(),this._CardBottom_CustomizableCircularButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CardBottom_CustomizableCircularButton1_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.backgroundScale = 0.3;
         _loc1_.addEventListener("click",this.__btMessage_click);
         _loc1_.id = "btMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btMessage = _loc1_;
         BindingManager.executeBindings(this,"btMessage",this.btMessage);
         return _loc1_;
      }
      
      public function __btMessage_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardBottomEvent(CardBottomEvent.LEFT_BUTTON_CLICKED,true));
      }
      
      private function _CardBottom_CustomizableCircularButton2_i() : CustomizableCircularButton
      {
         var _loc1_:CustomizableCircularButton = new CustomizableCircularButton();
         _loc1_.backgroundScale = 0.3;
         _loc1_.addEventListener("click",this.__btVisit_click);
         _loc1_.id = "btVisit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btVisit = _loc1_;
         BindingManager.executeBindings(this,"btVisit",this.btVisit);
         return _loc1_;
      }
      
      public function __btVisit_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardBottomEvent(CardBottomEvent.RIGHT_BUTTON_CLICKED,true));
      }
      
      private function _CardBottom_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 3;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CardBottom_HGroup3_c()];
         _loc1_.id = "_CardBottom_VGroup4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardBottom_VGroup4 = _loc1_;
         BindingManager.executeBindings(this,"_CardBottom_VGroup4",this._CardBottom_VGroup4);
         return _loc1_;
      }
      
      private function _CardBottom_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._CardBottom_ButtonCircularZoomable3_i(),this._CardBottom_ButtonCircularZoomable4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CardBottom_ButtonCircularZoomable3_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.bgScale = 0.22;
         _loc1_.backgroundState = "inner";
         _loc1_.setStyle("skinClass",ButtonOKCircularSkin);
         _loc1_.addEventListener("click",this.__btAccept_click);
         _loc1_.id = "btAccept";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btAccept = _loc1_;
         BindingManager.executeBindings(this,"btAccept",this.btAccept);
         return _loc1_;
      }
      
      public function __btAccept_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardBottomEvent(CardBottomEvent.LEFT_BUTTON_CLICKED,true));
      }
      
      private function _CardBottom_ButtonCircularZoomable4_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.bgScale = 0.22;
         _loc1_.backgroundState = "inner";
         _loc1_.setStyle("skinClass",ButtonXCircularSkin);
         _loc1_.addEventListener("click",this.__btDecline_click);
         _loc1_.id = "btDecline";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btDecline = _loc1_;
         BindingManager.executeBindings(this,"btDecline",this.btDecline);
         return _loc1_;
      }
      
      public function __btDecline_click(param1:MouseEvent) : void
      {
         dispatchEvent(new CardBottomEvent(CardBottomEvent.RIGHT_BUTTON_CLICKED,true));
      }
      
      private function _CardBottom_VGroup5_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 14;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CardBottom_LabelDisplay1_i()];
         _loc1_.id = "clockDisplayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clockDisplayGroup = _loc1_;
         BindingManager.executeBindings(this,"clockDisplayGroup",this.clockDisplayGroup);
         return _loc1_;
      }
      
      private function _CardBottom_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "00:00:00";
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "clockDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clockDisplay = _loc1_;
         BindingManager.executeBindings(this,"clockDisplay",this.clockDisplay);
         return _loc1_;
      }
      
      private function _CardBottom_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.25,0.3];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"btAccept.iconScales");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [0.25,0.3];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"btDecline.iconScales");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get amountStepper() : NumericStepper
      {
         return this._1798415527amountStepper;
      }
      
      public function set amountStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1798415527amountStepper;
         if(_loc2_ !== param1)
         {
            this._1798415527amountStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amountStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get amountStepperGroup() : VGroup
      {
         return this._552589990amountStepperGroup;
      }
      
      public function set amountStepperGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._552589990amountStepperGroup;
         if(_loc2_ !== param1)
         {
            this._552589990amountStepperGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amountStepperGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btAccept() : ButtonCircularZoomable
      {
         return this._823306234btAccept;
      }
      
      public function set btAccept(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._823306234btAccept;
         if(_loc2_ !== param1)
         {
            this._823306234btAccept = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btAccept",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btDecline() : ButtonCircularZoomable
      {
         return this._1822306748btDecline;
      }
      
      public function set btDecline(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._1822306748btDecline;
         if(_loc2_ !== param1)
         {
            this._1822306748btDecline = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btDecline",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btMessage() : CustomizableCircularButton
      {
         return this._1885236053btMessage;
      }
      
      public function set btMessage(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._1885236053btMessage;
         if(_loc2_ !== param1)
         {
            this._1885236053btMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btVisit() : CustomizableCircularButton
      {
         return this._184693785btVisit;
      }
      
      public function set btVisit(param1:CustomizableCircularButton) : void
      {
         var _loc2_:Object = this._184693785btVisit;
         if(_loc2_ !== param1)
         {
            this._184693785btVisit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btVisit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get button1() : ButtonCircularZoomable
      {
         return this._241352511button1;
      }
      
      public function set button1(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._241352511button1;
         if(_loc2_ !== param1)
         {
            this._241352511button1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get button2() : ButtonCircularZoomable
      {
         return this._241352512button2;
      }
      
      public function set button2(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._241352512button2;
         if(_loc2_ !== param1)
         {
            this._241352512button2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chances() : CardChances
      {
         return this._738939839chances;
      }
      
      public function set chances(param1:CardChances) : void
      {
         var _loc2_:Object = this._738939839chances;
         if(_loc2_ !== param1)
         {
            this._738939839chances = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chances",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clockDisplay() : LabelDisplay
      {
         return this._1048103124clockDisplay;
      }
      
      public function set clockDisplay(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1048103124clockDisplay;
         if(_loc2_ !== param1)
         {
            this._1048103124clockDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clockDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clockDisplayGroup() : VGroup
      {
         return this._1012555253clockDisplayGroup;
      }
      
      public function set clockDisplayGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1012555253clockDisplayGroup;
         if(_loc2_ !== param1)
         {
            this._1012555253clockDisplayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clockDisplayGroup",_loc2_,param1));
            }
         }
      }
   }
}

