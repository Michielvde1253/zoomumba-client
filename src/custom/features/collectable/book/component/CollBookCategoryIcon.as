package custom.features.collectable.book.component
{
   import components.counter.Counter;
   import components.counter.CounterProgressSkin;
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
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class CollBookCategoryIcon extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1056118201_CollBookCategoryIcon_Group2:Group;
      
      private var _970180718_CollBookCategoryIcon_SetProperty1:SetProperty;
      
      private var _410956671container:SpriteVisualElement;
      
      private var _1131509414progressBar:Counter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _910560372_progress:int;
      
      private var _pageRefId:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookCategoryIcon()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollBookCategoryIcon_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_CollBookCategoryIconWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookCategoryIcon[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CollBookCategoryIcon_Group2_i()];
         this.currentState = "enabled";
         states = [new State({
            "name":"enabled",
            "overrides":[]
         }),new State({
            "name":"complete",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CollBookCategoryIcon_Group2",
               "name":"buttonMode",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_CollBookCategoryIcon_Group2",
               "name":"useHandCursor",
               "value":false
            }),this._CollBookCategoryIcon_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_CollBookCategoryIcon_Group2",
               "name":"filters",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_CollBookCategoryIcon_SetProperty1",this._CollBookCategoryIcon_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollBookCategoryIcon._watcherSetupUtil = param1;
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
      
      public function set progress(param1:int) : void
      {
         if(this._progress != param1)
         {
            this._progress = param1;
            dispatchEvent(new Event("valueChanged"));
         }
      }
      
      [Bindable(event="valueChanged")]
      public function get progress() : int
      {
         return this._progress;
      }
      
      private function _CollBookCategoryIcon_Group2_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.width = 72;
         _loc1_.height = 72;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = true;
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.mxmlContent = [this._CollBookCategoryIcon_BackgroundImage1_c(),this._CollBookCategoryIcon_SpriteVisualElement1_i(),this._CollBookCategoryIcon_Counter1_i()];
         _loc1_.id = "_CollBookCategoryIcon_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookCategoryIcon_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookCategoryIcon_Group2",this._CollBookCategoryIcon_Group2);
         return _loc1_;
      }
      
      private function _CollBookCategoryIcon_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.62;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookCategoryIcon_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"container");
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _CollBookCategoryIcon_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.scaleX = 1.2;
         _loc1_.scaleY = 1.2;
         _loc1_.verticalCenter = 20;
         _loc1_.horizontalCenter = -3;
         _loc1_.setStyle("skinClass",CounterProgressSkin);
         _loc1_.id = "progressBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.progressBar = _loc1_;
         BindingManager.executeBindings(this,"progressBar",this.progressBar);
         return _loc1_;
      }
      
      private function _CollBookCategoryIcon_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.GRAYSCALE)];
         },null,"_CollBookCategoryIcon_SetProperty1.value");
         result[1] = new Binding(this,null,null,"progressBar.value","progress");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookCategoryIcon_Group2() : Group
      {
         return this._1056118201_CollBookCategoryIcon_Group2;
      }
      
      public function set _CollBookCategoryIcon_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1056118201_CollBookCategoryIcon_Group2;
         if(_loc2_ !== param1)
         {
            this._1056118201_CollBookCategoryIcon_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookCategoryIcon_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookCategoryIcon_SetProperty1() : SetProperty
      {
         return this._970180718_CollBookCategoryIcon_SetProperty1;
      }
      
      public function set _CollBookCategoryIcon_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._970180718_CollBookCategoryIcon_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._970180718_CollBookCategoryIcon_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookCategoryIcon_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : SpriteVisualElement
      {
         return this._410956671container;
      }
      
      public function set container(param1:SpriteVisualElement) : void
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
      public function get progressBar() : Counter
      {
         return this._1131509414progressBar;
      }
      
      public function set progressBar(param1:Counter) : void
      {
         var _loc2_:Object = this._1131509414progressBar;
         if(_loc2_ !== param1)
         {
            this._1131509414progressBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progressBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _progress() : int
      {
         return this._910560372_progress;
      }
      
      private function set _progress(param1:int) : void
      {
         var _loc2_:Object = this._910560372_progress;
         if(_loc2_ !== param1)
         {
            this._910560372_progress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_progress",_loc2_,param1));
            }
         }
      }
   }
}

