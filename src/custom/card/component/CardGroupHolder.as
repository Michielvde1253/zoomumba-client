package custom.card.component
{
   import buttons.skin.sign.ButtonArrowSkin;
   import buttons.skin.sign.ButtonArrowToEndSkin;
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
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   
   use namespace mx_internal;
   
   public class CardGroupHolder extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2037555771_CardGroupHolder_VGroup1:VGroup;
      
      private var _2037555770_CardGroupHolder_VGroup2:VGroup;
      
      private var _1477757519_first:Button;
      
      private var _91048821_last:Button;
      
      private var _91112402_next:Button;
      
      private var _91183890_prev:Button;
      
      private var _410956671container:Group;
      
      private var _1907601976layoutDisplay:TileLayout;
      
      private var _1011692561paginator:Paginator;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1484151783horizontalTileCenter:Object = null;
      
      private var _115178852entriesPerPage:int = 8;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardGroupHolder()
      {
         var watchers:Array;
         var _CardGroupHolder_Button1_factory:DeferredInstanceFromFunction;
         var _CardGroupHolder_Button2_factory:DeferredInstanceFromFunction;
         var _CardGroupHolder_Button3_factory:DeferredInstanceFromFunction;
         var _CardGroupHolder_Button4_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardGroupHolder_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardGroupHolderWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardGroupHolder[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._CardGroupHolder_Group2_i(),this._CardGroupHolder_VGroup1_i(),this._CardGroupHolder_VGroup2_i()];
         this.currentState = "normal";
         this._CardGroupHolder_Paginator1_i();
         _CardGroupHolder_Button1_factory = new DeferredInstanceFromFunction(this._CardGroupHolder_Button1_i);
         _CardGroupHolder_Button2_factory = new DeferredInstanceFromFunction(this._CardGroupHolder_Button2_i);
         _CardGroupHolder_Button3_factory = new DeferredInstanceFromFunction(this._CardGroupHolder_Button3_i);
         _CardGroupHolder_Button4_factory = new DeferredInstanceFromFunction(this._CardGroupHolder_Button4_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button4_factory,
               "destination":"_CardGroupHolder_VGroup2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button3_factory,
               "destination":"_CardGroupHolder_VGroup2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button2_factory,
               "destination":"_CardGroupHolder_VGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button1_factory,
               "destination":"_CardGroupHolder_VGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"noForwardArrows",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button3_factory,
               "destination":"_CardGroupHolder_VGroup2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardGroupHolder_Button1_factory,
               "destination":"_CardGroupHolder_VGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"noArrows",
            "overrides":[]
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
         CardGroupHolder._watcherSetupUtil = param1;
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
      
      private function _CardGroupHolder_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         _loc1_.hideInsteadOfDisable = false;
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _CardGroupHolder_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.layout = this._CardGroupHolder_TileLayout1_i();
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _CardGroupHolder_TileLayout1_i() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.orientation = "rows";
         _loc1_.horizontalGap = 2;
         _loc1_.verticalGap = -8;
         this.layoutDisplay = _loc1_;
         BindingManager.executeBindings(this,"layoutDisplay",this.layoutDisplay);
         return _loc1_;
      }
      
      private function _CardGroupHolder_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = -40;
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [];
         _loc1_.id = "_CardGroupHolder_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardGroupHolder_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CardGroupHolder_VGroup1",this._CardGroupHolder_VGroup1);
         return _loc1_;
      }
      
      private function _CardGroupHolder_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -0.36;
         _loc1_.scaleY = 0.36;
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
      
      private function _CardGroupHolder_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -0.36;
         _loc1_.scaleY = 0.36;
         _loc1_.setStyle("skinClass",ButtonArrowToEndSkin);
         _loc1_.id = "_first";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._first = _loc1_;
         BindingManager.executeBindings(this,"_first",this._first);
         return _loc1_;
      }
      
      private function _CardGroupHolder_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.right = -40;
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [];
         _loc1_.id = "_CardGroupHolder_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardGroupHolder_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CardGroupHolder_VGroup2",this._CardGroupHolder_VGroup2);
         return _loc1_;
      }
      
      private function _CardGroupHolder_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.36;
         _loc1_.scaleY = 0.36;
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
      
      private function _CardGroupHolder_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.36;
         _loc1_.scaleY = 0.36;
         _loc1_.setStyle("skinClass",ButtonArrowToEndSkin);
         _loc1_.id = "_last";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._last = _loc1_;
         BindingManager.executeBindings(this,"_last",this._last);
         return _loc1_;
      }
      
      private function _CardGroupHolder_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"paginator.prevButton","_prev");
         result[1] = new Binding(this,null,null,"paginator.nextButton","_next");
         result[2] = new Binding(this,null,null,"paginator.firstButton","_first");
         result[3] = new Binding(this,null,null,"paginator.lastButton","_last");
         result[4] = new Binding(this,null,null,"paginator.entriesPerPage","entriesPerPage");
         result[5] = new Binding(this,null,null,"container.horizontalCenter","horizontalTileCenter");
         result[6] = new Binding(this,function():int
         {
            return Math.min(paginator.maxEntries,4);
         },null,"layoutDisplay.requestedColumnCount");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardGroupHolder_VGroup1() : VGroup
      {
         return this._2037555771_CardGroupHolder_VGroup1;
      }
      
      public function set _CardGroupHolder_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._2037555771_CardGroupHolder_VGroup1;
         if(_loc2_ !== param1)
         {
            this._2037555771_CardGroupHolder_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardGroupHolder_VGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CardGroupHolder_VGroup2() : VGroup
      {
         return this._2037555770_CardGroupHolder_VGroup2;
      }
      
      public function set _CardGroupHolder_VGroup2(param1:VGroup) : void
      {
         var _loc2_:Object = this._2037555770_CardGroupHolder_VGroup2;
         if(_loc2_ !== param1)
         {
            this._2037555770_CardGroupHolder_VGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CardGroupHolder_VGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _first() : Button
      {
         return this._1477757519_first;
      }
      
      public function set _first(param1:Button) : void
      {
         var _loc2_:Object = this._1477757519_first;
         if(_loc2_ !== param1)
         {
            this._1477757519_first = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_first",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _last() : Button
      {
         return this._91048821_last;
      }
      
      public function set _last(param1:Button) : void
      {
         var _loc2_:Object = this._91048821_last;
         if(_loc2_ !== param1)
         {
            this._91048821_last = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_last",_loc2_,param1));
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
      public function get container() : Group
      {
         return this._410956671container;
      }
      
      public function set container(param1:Group) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layoutDisplay() : TileLayout
      {
         return this._1907601976layoutDisplay;
      }
      
      public function set layoutDisplay(param1:TileLayout) : void
      {
         var _loc2_:Object = this._1907601976layoutDisplay;
         if(_loc2_ !== param1)
         {
            this._1907601976layoutDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layoutDisplay",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get horizontalTileCenter() : Object
      {
         return this._1484151783horizontalTileCenter;
      }
      
      public function set horizontalTileCenter(param1:Object) : void
      {
         var _loc2_:Object = this._1484151783horizontalTileCenter;
         if(_loc2_ !== param1)
         {
            this._1484151783horizontalTileCenter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalTileCenter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get entriesPerPage() : int
      {
         return this._115178852entriesPerPage;
      }
      
      public function set entriesPerPage(param1:int) : void
      {
         var _loc2_:Object = this._115178852entriesPerPage;
         if(_loc2_ !== param1)
         {
            this._115178852entriesPerPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"entriesPerPage",_loc2_,param1));
            }
         }
      }
   }
}

