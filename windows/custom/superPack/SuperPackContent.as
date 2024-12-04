package windows.custom.superPack
{
   import components.counter.Counter;
   import components.counter.CounterRectBigSkin;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class SuperPackContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _163334105bubbleText:Text;
      
      private var _1916501697imgFood:BitmapImage;
      
      private var _1417404107innerContainer:SpriteVisualElement;
      
      private var _72791555mainCounter:Counter;
      
      private var _1399694918outerContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SuperPackContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SuperPackContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_superPack_SuperPackContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SuperPackContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SuperPackContent_InnerGroup1_c(),this._SuperPackContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SuperPackContent._watcherSetupUtil = param1;
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
      
      private function _SuperPackContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SuperPackContent_SpriteVisualElement1_i(),this._SuperPackContent_Text1_i(),this._SuperPackContent_BitmapImage1_i(),this._SuperPackContent_Counter1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuperPackContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"innerContainer");
         this.innerContainer = _loc1_;
         BindingManager.executeBindings(this,"innerContainer",this.innerContainer);
         return _loc1_;
      }
      
      private function _SuperPackContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 210;
         _loc1_.y = 90;
         _loc1_.width = 280;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "bubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleText = _loc1_;
         BindingManager.executeBindings(this,"bubbleText",this.bubbleText);
         return _loc1_;
      }
      
      private function _SuperPackContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 555;
         _loc1_.y = 95;
         _loc1_.initialized(this,"imgFood");
         this.imgFood = _loc1_;
         BindingManager.executeBindings(this,"imgFood",this.imgFood);
         return _loc1_;
      }
      
      private function _SuperPackContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 550;
         _loc1_.y = 150;
         _loc1_.setStyle("skinClass",CounterRectBigSkin);
         _loc1_.id = "mainCounter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainCounter = _loc1_;
         BindingManager.executeBindings(this,"mainCounter",this.mainCounter);
         return _loc1_;
      }
      
      private function _SuperPackContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SuperPackContent_HGroup1_c(),this._SuperPackContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuperPackContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "bottom";
         _loc1_.bottom = 80;
         _loc1_.gap = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuperPackContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"outerContainer");
         this.outerContainer = _loc1_;
         BindingManager.executeBindings(this,"outerContainer",this.outerContainer);
         return _loc1_;
      }
      
      private function _SuperPackContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.PRICE_TXT_COLOR_ENABLE_BROWN;
         },function(param1:uint):void
         {
            bubbleText.setStyle("color",param1);
         },"bubbleText.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleText() : Text
      {
         return this._163334105bubbleText;
      }
      
      public function set bubbleText(param1:Text) : void
      {
         var _loc2_:Object = this._163334105bubbleText;
         if(_loc2_ !== param1)
         {
            this._163334105bubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imgFood() : BitmapImage
      {
         return this._1916501697imgFood;
      }
      
      public function set imgFood(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1916501697imgFood;
         if(_loc2_ !== param1)
         {
            this._1916501697imgFood = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imgFood",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get innerContainer() : SpriteVisualElement
      {
         return this._1417404107innerContainer;
      }
      
      public function set innerContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1417404107innerContainer;
         if(_loc2_ !== param1)
         {
            this._1417404107innerContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"innerContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainCounter() : Counter
      {
         return this._72791555mainCounter;
      }
      
      public function set mainCounter(param1:Counter) : void
      {
         var _loc2_:Object = this._72791555mainCounter;
         if(_loc2_ !== param1)
         {
            this._72791555mainCounter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainCounter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerContainer() : SpriteVisualElement
      {
         return this._1399694918outerContainer;
      }
      
      public function set outerContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1399694918outerContainer;
         if(_loc2_ !== param1)
         {
            this._1399694918outerContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerContainer",_loc2_,param1));
            }
         }
      }
   }
}

