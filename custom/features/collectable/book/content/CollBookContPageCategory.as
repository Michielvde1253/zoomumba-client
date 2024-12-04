package custom.features.collectable.book.content
{
   import components.textfield.gradientText.GradientText;
   import custom.features.collectable.book.component.CollBookCategoryIcon;
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
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CollBookContPageCategory extends Group implements IBindingClient, IStateClient2
   {
      public static var _457023405$lineSource:*;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _CollBookContPageCategory_BitmapImage1:BitmapImage;
      
      public var _CollBookContPageCategory_GradientText1:GradientText;
      
      private var _689711140_CollBookContPageCategory_VGroup1:VGroup;
      
      public var _CollBookContPageCategory_VGroup2:VGroup;
      
      private var _3046171cat1:CollBookCategoryIcon;
      
      private var _3046172cat2:CollBookCategoryIcon;
      
      private var _3046173cat3:CollBookCategoryIcon;
      
      private var _3046174cat4:CollBookCategoryIcon;
      
      private var _3046175cat5:CollBookCategoryIcon;
      
      private var _3046176cat6:CollBookCategoryIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _110371416title:String = "";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollBookContPageCategory()
      {
         var watchers:Array;
         var _CollBookContPageCategory_VGroup2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollBookContPageCategory_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_content_CollBookContPageCategoryWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollBookContPageCategory[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 240;
         this.height = 280;
         this.mxmlContent = [this._CollBookContPageCategory_Rect1_c(),this._CollBookContPageCategory_VGroup1_i()];
         this.currentState = "main";
         _CollBookContPageCategory_VGroup2_factory = new DeferredInstanceFromFunction(this._CollBookContPageCategory_VGroup2_i);
         states = [new State({
            "name":"main",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CollBookContPageCategory_VGroup2_factory,
               "destination":"_CollBookContPageCategory_VGroup1",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"slave",
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
         CollBookContPageCategory._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get $lineSource() : *
      {
         return CollBookContPageCategory._457023405$lineSource;
      }
      
      public static function set $lineSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollBookContPageCategory._457023405$lineSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollBookContPageCategory,"$lineSource",_loc2_,param1));
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
      
      private function _CollBookContPageCategory_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.stroke = this._CollBookContPageCategory_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16711680;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "bottom";
         _loc1_.bottom = 15;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._CollBookContPageCategory_Group2_c()];
         _loc1_.id = "_CollBookContPageCategory_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookContPageCategory_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookContPageCategory_VGroup1",this._CollBookContPageCategory_VGroup1);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CollBookContPageCategory_GradientText1_i(),this._CollBookContPageCategory_BitmapImage1_i()];
         _loc1_.id = "_CollBookContPageCategory_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookContPageCategory_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookContPageCategory_VGroup2",this._CollBookContPageCategory_VGroup2);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_CollBookContPageCategory_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollBookContPageCategory_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookContPageCategory_GradientText1",this._CollBookContPageCategory_GradientText1);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 130;
         _loc1_.height = 4;
         _loc1_.fillMode = "repeat";
         _loc1_.initialized(this,"_CollBookContPageCategory_BitmapImage1");
         this._CollBookContPageCategory_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CollBookContPageCategory_BitmapImage1",this._CollBookContPageCategory_BitmapImage1);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.layout = this._CollBookContPageCategory_TileLayout1_c();
         _loc1_.mxmlContent = [this._CollBookContPageCategory_CollBookCategoryIcon1_i(),this._CollBookContPageCategory_CollBookCategoryIcon2_i(),this._CollBookContPageCategory_CollBookCategoryIcon3_i(),this._CollBookContPageCategory_CollBookCategoryIcon4_i(),this._CollBookContPageCategory_CollBookCategoryIcon5_i(),this._CollBookContPageCategory_CollBookCategoryIcon6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 2;
         _loc1_.columnWidth = 72;
         _loc1_.horizontalGap = 30;
         _loc1_.verticalGap = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon1_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 0;
         _loc1_.id = "cat1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat1 = _loc1_;
         BindingManager.executeBindings(this,"cat1",this.cat1);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon2_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 1;
         _loc1_.id = "cat2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat2 = _loc1_;
         BindingManager.executeBindings(this,"cat2",this.cat2);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon3_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 2;
         _loc1_.id = "cat3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat3 = _loc1_;
         BindingManager.executeBindings(this,"cat3",this.cat3);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon4_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 3;
         _loc1_.id = "cat4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat4 = _loc1_;
         BindingManager.executeBindings(this,"cat4",this.cat4);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon5_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 4;
         _loc1_.id = "cat5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat5 = _loc1_;
         BindingManager.executeBindings(this,"cat5",this.cat5);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_CollBookCategoryIcon6_i() : CollBookCategoryIcon
      {
         var _loc1_:CollBookCategoryIcon = new CollBookCategoryIcon();
         _loc1_.pageRefId = 5;
         _loc1_.id = "cat6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cat6 = _loc1_;
         BindingManager.executeBindings(this,"cat6",this.cat6);
         return _loc1_;
      }
      
      private function _CollBookContPageCategory_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_CollBookContPageCategory_GradientText1.text","title");
         result[1] = new Binding(this,function():Object
         {
            return $lineSource;
         },null,"_CollBookContPageCategory_BitmapImage1.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollBookContPageCategory_VGroup1() : VGroup
      {
         return this._689711140_CollBookContPageCategory_VGroup1;
      }
      
      public function set _CollBookContPageCategory_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._689711140_CollBookContPageCategory_VGroup1;
         if(_loc2_ !== param1)
         {
            this._689711140_CollBookContPageCategory_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollBookContPageCategory_VGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat1() : CollBookCategoryIcon
      {
         return this._3046171cat1;
      }
      
      public function set cat1(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046171cat1;
         if(_loc2_ !== param1)
         {
            this._3046171cat1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat2() : CollBookCategoryIcon
      {
         return this._3046172cat2;
      }
      
      public function set cat2(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046172cat2;
         if(_loc2_ !== param1)
         {
            this._3046172cat2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat3() : CollBookCategoryIcon
      {
         return this._3046173cat3;
      }
      
      public function set cat3(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046173cat3;
         if(_loc2_ !== param1)
         {
            this._3046173cat3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat4() : CollBookCategoryIcon
      {
         return this._3046174cat4;
      }
      
      public function set cat4(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046174cat4;
         if(_loc2_ !== param1)
         {
            this._3046174cat4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat5() : CollBookCategoryIcon
      {
         return this._3046175cat5;
      }
      
      public function set cat5(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046175cat5;
         if(_loc2_ !== param1)
         {
            this._3046175cat5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cat6() : CollBookCategoryIcon
      {
         return this._3046176cat6;
      }
      
      public function set cat6(param1:CollBookCategoryIcon) : void
      {
         var _loc2_:Object = this._3046176cat6;
         if(_loc2_ !== param1)
         {
            this._3046176cat6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cat6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._110371416title;
      }
      
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
   }
}

