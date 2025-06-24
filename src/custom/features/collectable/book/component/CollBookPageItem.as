package custom.features.collectable.book.component
{
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
   import mx.controls.Text;
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
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class CollBookPageItem extends Group implements IBindingClient, IStateClient2
   {
      public static var _457023405$lineSource:*;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _CollBookPageItem_BitmapImage1:BitmapImage;
      
      public var _CollBookPageItem_CollBookPageIcon1:CollBookPageIcon;
      
      public var _CollBookPageItem_CollBookPageIcon2:CollBookPageIcon;
      
      public var _CollBookPageItem_GradientText1:GradientText;
      
      public var _CollBookPageItem_Group2:Group;
      
      private var _1314742127_CollBookPageItem_HGroup1:HGroup;
      
      public var _CollBookPageItem_Text1:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3575610type:String = "type1";
      
      private var _1798260018showBottomRow:Boolean = true;
      
      private var _3556653text:String = "";
      
      private var _3357525more:String = "";
      
      private var _count:int = 0;
      
      private var _1883491145collected:Boolean = false;
      
      private var _1605867799surprise:Boolean = false;
      
      private var _1456500268moreEnabled:Boolean = true;
      
      private var _896505829source:Object;
      
      private var _pageRefId:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookPageItem()
      {
         var watchers:Array;
         var _CollBookPageItem_CollBookPageIcon1_factory:DeferredInstanceFromFunction;
         var _CollBookPageItem_CollBookPageIcon2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollBookPageItem_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_CollBookPageItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookPageItem[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 222;
         this.height = 85;
         this.mxmlContent = [this._CollBookPageItem_HGroup1_i()];
         this.currentState = "left";
         _CollBookPageItem_CollBookPageIcon1_factory = new DeferredInstanceFromFunction(this._CollBookPageItem_CollBookPageIcon1_i);
         _CollBookPageItem_CollBookPageIcon2_factory = new DeferredInstanceFromFunction(this._CollBookPageItem_CollBookPageIcon2_i);
         states = [new State({
            "name":"left",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageItem_CollBookPageIcon1_factory,
               "destination":"_CollBookPageItem_HGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageItem_HGroup1",
               "name":"gap",
               "value":10
            })]
         }),new State({
            "name":"right",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookPageItem_CollBookPageIcon2_factory,
               "destination":"_CollBookPageItem_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CollBookPageItem_Group2"]
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageItem_HGroup1",
               "name":"gap",
               "value":-10
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookPageItem_HGroup1",
               "name":"left",
               "value":10
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
         CollBookPageItem._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get $lineSource() : *
      {
         return CollBookPageItem._457023405$lineSource;
      }
      
      public static function set $lineSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookPageItem._457023405$lineSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookPageItem,"$lineSource",_loc2_,param1));
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
      
      public function get pageRefId() : int
      {
         return this._pageRefId;
      }
      
      public function set pageRefId(param1:int) : void
      {
         this._pageRefId = param1;
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
      
      private function _CollBookPageItem_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CollBookPageItem_Group2_i()];
         _loc1_.id = "_CollBookPageItem_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_HGroup1",this._CollBookPageItem_HGroup1);
         return _loc1_;
      }
      
      private function _CollBookPageItem_CollBookPageIcon1_i() : CollBookPageIcon
      {
         var _loc1_:CollBookPageIcon = new CollBookPageIcon();
         _loc1_.id = "_CollBookPageItem_CollBookPageIcon1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_CollBookPageIcon1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_CollBookPageIcon1",this._CollBookPageItem_CollBookPageIcon1);
         return _loc1_;
      }
      
      private function _CollBookPageItem_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 135;
         _loc1_.percentHeight = 90;
         _loc1_.mxmlContent = [this._CollBookPageItem_VGroup1_c(),this._CollBookPageItem_BitmapImage1_i()];
         _loc1_.id = "_CollBookPageItem_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_Group2",this._CollBookPageItem_Group2);
         return _loc1_;
      }
      
      private function _CollBookPageItem_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.mxmlContent = [this._CollBookPageItem_Text1_i(),this._CollBookPageItem_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookPageItem_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.width = 125;
         _loc1_.height = 30;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("paddingTop",0);
         _loc1_.setStyle("paddingBottom",-10);
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("leading",-2);
         _loc1_.setStyle("fontGridFitType","none");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CollBookPageItem_Text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_Text1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_Text1",this._CollBookPageItem_Text1);
         return _loc1_;
      }
      
      private function _CollBookPageItem_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 9;
         _loc1_.percentWidth = 100;
         _loc1_.align = "LT";
         _loc1_.buttonMode = true;
         _loc1_.mouseEnabled = true;
         _loc1_.useHandCursor = true;
         _loc1_.addEventListener("click",this.___CollBookPageItem_GradientText1_click);
         _loc1_.id = "_CollBookPageItem_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_GradientText1",this._CollBookPageItem_GradientText1);
         return _loc1_;
      }
      
      public function ___CollBookPageItem_GradientText1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("moreCliked"));
      }
      
      private function _CollBookPageItem_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 90;
         _loc1_.height = 4;
         _loc1_.fillMode = "repeat";
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"_CollBookPageItem_BitmapImage1");
         this._CollBookPageItem_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_BitmapImage1",this._CollBookPageItem_BitmapImage1);
         return _loc1_;
      }
      
      private function _CollBookPageItem_CollBookPageIcon2_i() : CollBookPageIcon
      {
         var _loc1_:CollBookPageIcon = new CollBookPageIcon();
         _loc1_.id = "_CollBookPageItem_CollBookPageIcon2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookPageItem_CollBookPageIcon2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookPageItem_CollBookPageIcon2",this._CollBookPageItem_CollBookPageIcon2);
         return _loc1_;
      }
      
      private function _CollBookPageItem_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon1.count","count");
         result[1] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon1.collected","collected");
         result[2] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon1.source","source");
         result[3] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon1.surprise","surprise");
         result[4] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon1.currentState","type");
         result[5] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            _CollBookPageItem_Text1.setStyle("color",param1);
         },"_CollBookPageItem_Text1.color");
         result[6] = new Binding(this,null,null,"_CollBookPageItem_Text1.text","text");
         result[7] = new Binding(this,null,null,"_CollBookPageItem_GradientText1.text","more");
         result[8] = new Binding(this,null,null,"_CollBookPageItem_GradientText1.enabled","moreEnabled");
         result[9] = new Binding(this,function():Object
         {
            return $lineSource;
         },null,"_CollBookPageItem_BitmapImage1.source");
         result[10] = new Binding(this,null,null,"_CollBookPageItem_BitmapImage1.visible","showBottomRow");
         result[11] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon2.count","count");
         result[12] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon2.collected","collected");
         result[13] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon2.source","source");
         result[14] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon2.surprise","surprise");
         result[15] = new Binding(this,null,null,"_CollBookPageItem_CollBookPageIcon2.currentState","type");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookPageItem_HGroup1() : HGroup
      {
         return this._1314742127_CollBookPageItem_HGroup1;
      }
      
      public function set _CollBookPageItem_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1314742127_CollBookPageItem_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1314742127_CollBookPageItem_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookPageItem_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get type() : String
      {
         return this._3575610type;
      }
      
      public function set type(param1:String) : void
      {
         var _loc2_:Object = this._3575610type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get showBottomRow() : Boolean
      {
         return this._1798260018showBottomRow;
      }
      
      public function set showBottomRow(param1:Boolean) : void
      {
         var _loc2_:Object = this._1798260018showBottomRow;
         if(_loc2_ !== param1)
         {
            this._1798260018showBottomRow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showBottomRow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get more() : String
      {
         return this._3357525more;
      }
      
      public function set more(param1:String) : void
      {
         var _loc2_:Object = this._3357525more;
         if(_loc2_ !== param1)
         {
            this._3357525more = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"more",_loc2_,param1));
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
      public function get moreEnabled() : Boolean
      {
         return this._1456500268moreEnabled;
      }
      
      public function set moreEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._1456500268moreEnabled;
         if(_loc2_ !== param1)
         {
            this._1456500268moreEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moreEnabled",_loc2_,param1));
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

