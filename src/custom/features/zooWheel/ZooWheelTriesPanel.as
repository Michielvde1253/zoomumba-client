package custom.features.zooWheel
{
   import buttons.simpleButton.PlusButtonNormalSkin;
   import custom.features.zooWheel.events.ZooWheelBuyTryEvent;
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
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ZooWheelTriesPanel extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ZooWheelTriesPanel_Button1:Button;
      
      private var _2039161950_bitmap0:BitmapImage;
      
      private var _2039161949_bitmap1:BitmapImage;
      
      private var _2039161948_bitmap2:BitmapImage;
      
      private var _2039161947_bitmap3:BitmapImage;
      
      private var _2039161946_bitmap4:BitmapImage;
      
      private var _1332194002background:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const ALPHA_DISABLED:Number = 0.4;
      
      private const MAX_NUMBER_OF_CHANCES:uint = 5;
      
      private var _filter:Array;
      
      private var _eventBuy:ZooWheelBuyTryEvent;
      
      private var _951652231sourceTryBird:Object;
      
      private var _1136348752_buttonEnabled:Boolean = true;
      
      private var _2105664902_numberOfTries:uint = 0;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZooWheelTriesPanel()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._filter = [Color.getColorMatrixFilter(Color.SEPIA)];
         this._eventBuy = new ZooWheelBuyTryEvent(ZooWheelBuyTryEvent.CLICKED);
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ZooWheelTriesPanel_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_zooWheel_ZooWheelTriesPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZooWheelTriesPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 99;
         this.height = 355;
         this.mxmlContent = [this._ZooWheelTriesPanel_BitmapImage1_i(),this._ZooWheelTriesPanel_VGroup1_c(),this._ZooWheelTriesPanel_Button1_i()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ZooWheelTriesPanel._watcherSetupUtil = param1;
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
      
      public function set numberOfTries(param1:uint) : void
      {
         this._numberOfTries = Math.min(param1,this.MAX_NUMBER_OF_CHANCES);
         this._buttonEnabled = this._numberOfTries != this.MAX_NUMBER_OF_CHANCES;
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            (this["_bitmap" + _loc2_] as BitmapImage).filters = _loc2_ < this._numberOfTries ? [] : this._filter;
            (this["_bitmap" + _loc2_] as BitmapImage).alpha = _loc2_ < this._numberOfTries ? 1 : this.ALPHA_DISABLED;
            _loc2_++;
         }
      }
      
      private function _ZooWheelTriesPanel_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 35;
         _loc1_.gap = -8;
         _loc1_.mxmlContent = [this._ZooWheelTriesPanel_BitmapImage2_i(),this._ZooWheelTriesPanel_BitmapImage3_i(),this._ZooWheelTriesPanel_BitmapImage4_i(),this._ZooWheelTriesPanel_BitmapImage5_i(),this._ZooWheelTriesPanel_BitmapImage6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_bitmap0");
         this._bitmap0 = _loc1_;
         BindingManager.executeBindings(this,"_bitmap0",this._bitmap0);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_bitmap1");
         this._bitmap1 = _loc1_;
         BindingManager.executeBindings(this,"_bitmap1",this._bitmap1);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_bitmap2");
         this._bitmap2 = _loc1_;
         BindingManager.executeBindings(this,"_bitmap2",this._bitmap2);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_bitmap3");
         this._bitmap3 = _loc1_;
         BindingManager.executeBindings(this,"_bitmap3",this._bitmap3);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_bitmap4");
         this._bitmap4 = _loc1_;
         BindingManager.executeBindings(this,"_bitmap4",this._bitmap4);
         return _loc1_;
      }
      
      private function _ZooWheelTriesPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 45;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("skinClass",PlusButtonNormalSkin);
         _loc1_.addEventListener("click",this.___ZooWheelTriesPanel_Button1_click);
         _loc1_.id = "_ZooWheelTriesPanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooWheelTriesPanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelTriesPanel_Button1",this._ZooWheelTriesPanel_Button1);
         return _loc1_;
      }
      
      public function ___ZooWheelTriesPanel_Button1_click(param1:MouseEvent) : void
      {
         dispatchEvent(this._eventBuy);
      }
      
      private function _ZooWheelTriesPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_bitmap0.source","sourceTryBird");
         result[1] = new Binding(this,null,null,"_bitmap1.source","sourceTryBird");
         result[2] = new Binding(this,null,null,"_bitmap2.source","sourceTryBird");
         result[3] = new Binding(this,null,null,"_bitmap3.source","sourceTryBird");
         result[4] = new Binding(this,null,null,"_bitmap4.source","sourceTryBird");
         result[5] = new Binding(this,function():Boolean
         {
            return _buttonEnabled;
         },null,"_ZooWheelTriesPanel_Button1.enabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmap0() : BitmapImage
      {
         return this._2039161950_bitmap0;
      }
      
      public function set _bitmap0(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2039161950_bitmap0;
         if(_loc2_ !== param1)
         {
            this._2039161950_bitmap0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmap0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmap1() : BitmapImage
      {
         return this._2039161949_bitmap1;
      }
      
      public function set _bitmap1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2039161949_bitmap1;
         if(_loc2_ !== param1)
         {
            this._2039161949_bitmap1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmap1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmap2() : BitmapImage
      {
         return this._2039161948_bitmap2;
      }
      
      public function set _bitmap2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2039161948_bitmap2;
         if(_loc2_ !== param1)
         {
            this._2039161948_bitmap2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmap2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmap3() : BitmapImage
      {
         return this._2039161947_bitmap3;
      }
      
      public function set _bitmap3(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2039161947_bitmap3;
         if(_loc2_ !== param1)
         {
            this._2039161947_bitmap3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmap3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmap4() : BitmapImage
      {
         return this._2039161946_bitmap4;
      }
      
      public function set _bitmap4(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2039161946_bitmap4;
         if(_loc2_ !== param1)
         {
            this._2039161946_bitmap4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmap4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceTryBird() : Object
      {
         return this._951652231sourceTryBird;
      }
      
      public function set sourceTryBird(param1:Object) : void
      {
         var _loc2_:Object = this._951652231sourceTryBird;
         if(_loc2_ !== param1)
         {
            this._951652231sourceTryBird = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceTryBird",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _buttonEnabled() : Boolean
      {
         return this._1136348752_buttonEnabled;
      }
      
      private function set _buttonEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._1136348752_buttonEnabled;
         if(_loc2_ !== param1)
         {
            this._1136348752_buttonEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_buttonEnabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _numberOfTries() : uint
      {
         return this._2105664902_numberOfTries;
      }
      
      private function set _numberOfTries(param1:uint) : void
      {
         var _loc2_:Object = this._2105664902_numberOfTries;
         if(_loc2_ !== param1)
         {
            this._2105664902_numberOfTries = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_numberOfTries",_loc2_,param1));
            }
         }
      }
   }
}

