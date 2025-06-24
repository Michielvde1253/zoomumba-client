package custom.features.collectable.button
{
   import com.greensock.TweenMax;
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
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.Ellipse;
   import spark.primitives.Rect;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class CollWindowButton extends Group implements IBindingClient, IStateClient2
   {
      public static var _747086954$safeOpenSource:*;
      
      public static var _1692914936$safeClosedSource:*;
      
      public static var _366530209$buttonAskHelpSource:*;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _CollWindowButton_Group2:Group;
      
      private var _1445159156_CollWindowButton_SetProperty1:SetProperty;
      
      private var _1445159155_CollWindowButton_SetProperty2:SetProperty;
      
      private var _1445159154_CollWindowButton_SetProperty3:SetProperty;
      
      private var _97549bit:BitmapFill;
      
      private var _835193660bitmapBounds:Rect;
      
      private var _1110650414hitContainer:HGroup;
      
      private var _1814160427hitGraphic:Ellipse;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _buttonState:String = "up";
      
      private var _readyToGo:Boolean = true;
      
      private var _982902018isMouseEnable:Boolean = true;
      
      private var _105100191currentSafeSource:*;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CollWindowButton()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._105100191currentSafeSource = $safeClosedSource;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CollWindowButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_button_CollWindowButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CollWindowButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CollWindowButton_Group2_i()];
         this.currentState = "help";
         states = [new State({
            "name":"help",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"width",
               "value":48
            }),new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"height",
               "value":68
            }),this._CollWindowButton_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"verticalCenter",
               "value":-7
            }),this._CollWindowButton_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"bit",
               "name":"source",
               "value":undefined
            }))]
         }),new State({
            "name":"gift",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"width",
               "value":106
            }),new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"height",
               "value":100
            }),new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"verticalCenter",
               "value":-4
            }),new SetProperty().initializeFromObject({
               "target":"bitmapBounds",
               "name":"horizontalCenter",
               "value":1
            }),this._CollWindowButton_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "target":"bit",
               "name":"source",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_CollWindowButton_SetProperty1",this._CollWindowButton_SetProperty1);
         BindingManager.executeBindings(this,"_CollWindowButton_SetProperty2",this._CollWindowButton_SetProperty2);
         BindingManager.executeBindings(this,"_CollWindowButton_SetProperty3",this._CollWindowButton_SetProperty3);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CollWindowButton._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get $safeOpenSource() : *
      {
         return CollWindowButton._747086954$safeOpenSource;
      }
      
      public static function set $safeOpenSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollWindowButton._747086954$safeOpenSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollWindowButton,"$safeOpenSource",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $safeClosedSource() : *
      {
         return CollWindowButton._1692914936$safeClosedSource;
      }
      
      public static function set $safeClosedSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollWindowButton._1692914936$safeClosedSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollWindowButton,"$safeClosedSource",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get $buttonAskHelpSource() : *
      {
         return CollWindowButton._366530209$buttonAskHelpSource;
      }
      
      public static function set $buttonAskHelpSource(param1:*) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = CollWindowButton._366530209$buttonAskHelpSource;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(CollWindowButton,"$buttonAskHelpSource",_loc2_,param1));
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
      
      private function get buttonState() : String
      {
         return this._buttonState;
      }
      
      private function set buttonState(param1:String) : void
      {
         this.isMouseEnable = !(currentState == "help" && !this.readyToGo);
         if(this._buttonState != param1 && this.isMouseEnable)
         {
            switch(param1)
            {
               case "over":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1.1,
                     "scaleY":1.1
                  });
                  break;
               case "up":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1,
                     "scaleY":1
                  });
            }
         }
         this._buttonState = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get readyToGo() : Boolean
      {
         return this._readyToGo;
      }
      
      private function set _1090377466readyToGo(param1:Boolean) : void
      {
         this._readyToGo = param1;
         if(this.readyToGo && currentState == "gift")
         {
            this.currentSafeSource = $safeOpenSource;
         }
         if(!this.readyToGo && currentState == "gift")
         {
            this.currentSafeSource = $safeClosedSource;
         }
      }
      
      private function _CollWindowButton_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 90;
         _loc1_.height = 90;
         _loc1_.mxmlContent = [this._CollWindowButton_BackgroundImage1_c(),this._CollWindowButton_Rect1_i(),this._CollWindowButton_HGroup1_i()];
         _loc1_.addEventListener("mouseOver",this.___CollWindowButton_Group2_mouseOver);
         _loc1_.addEventListener("mouseOut",this.___CollWindowButton_Group2_mouseOut);
         _loc1_.addEventListener("click",this.___CollWindowButton_Group2_click);
         _loc1_.id = "_CollWindowButton_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CollWindowButton_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CollWindowButton_Group2",this._CollWindowButton_Group2);
         return _loc1_;
      }
      
      private function _CollWindowButton_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.currentState = "innerWood";
         _loc1_.scale = 0.57;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollWindowButton_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._CollWindowButton_BitmapFill1_i();
         _loc1_.initialized(this,"bitmapBounds");
         this.bitmapBounds = _loc1_;
         BindingManager.executeBindings(this,"bitmapBounds",this.bitmapBounds);
         return _loc1_;
      }
      
      private function _CollWindowButton_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         this.bit = _loc1_;
         BindingManager.executeBindings(this,"bit",this.bit);
         return _loc1_;
      }
      
      private function _CollWindowButton_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CollWindowButton_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CollWindowButton_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.fill = this._CollWindowButton_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CollWindowButton_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___CollWindowButton_Group2_mouseOver(param1:MouseEvent) : void
      {
         this.buttonState = "over";
      }
      
      public function ___CollWindowButton_Group2_mouseOut(param1:MouseEvent) : void
      {
         this.buttonState = "up";
      }
      
      public function ___CollWindowButton_Group2_click(param1:MouseEvent) : void
      {
         this.buttonState = "down";
      }
      
      private function _CollWindowButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return isMouseEnable;
         },null,"_CollWindowButton_Group2.buttonMode");
         result[1] = new Binding(this,function():Boolean
         {
            return isMouseEnable;
         },null,"_CollWindowButton_Group2.mouseEnabled");
         result[2] = new Binding(this,function():Boolean
         {
            return isMouseEnable;
         },null,"_CollWindowButton_Group2.useHandCursor");
         result[3] = new Binding(this,null,null,"_CollWindowButton_Group2.hitArea","hitContainer");
         result[4] = new Binding(this,function():*
         {
            return readyToGo ? [] : [Color.getColorMatrixFilter(Color.GRAYSCALE)];
         },null,"_CollWindowButton_SetProperty1.value");
         result[5] = new Binding(this,function():*
         {
            return $buttonAskHelpSource;
         },null,"_CollWindowButton_SetProperty2.value");
         result[6] = new Binding(this,function():*
         {
            return currentSafeSource || $safeClosedSource;
         },null,"_CollWindowButton_SetProperty3.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollWindowButton_SetProperty1() : SetProperty
      {
         return this._1445159156_CollWindowButton_SetProperty1;
      }
      
      public function set _CollWindowButton_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1445159156_CollWindowButton_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1445159156_CollWindowButton_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollWindowButton_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollWindowButton_SetProperty2() : SetProperty
      {
         return this._1445159155_CollWindowButton_SetProperty2;
      }
      
      public function set _CollWindowButton_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1445159155_CollWindowButton_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1445159155_CollWindowButton_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollWindowButton_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CollWindowButton_SetProperty3() : SetProperty
      {
         return this._1445159154_CollWindowButton_SetProperty3;
      }
      
      public function set _CollWindowButton_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1445159154_CollWindowButton_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._1445159154_CollWindowButton_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CollWindowButton_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bit() : BitmapFill
      {
         return this._97549bit;
      }
      
      public function set bit(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._97549bit;
         if(_loc2_ !== param1)
         {
            this._97549bit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapBounds() : Rect
      {
         return this._835193660bitmapBounds;
      }
      
      public function set bitmapBounds(param1:Rect) : void
      {
         var _loc2_:Object = this._835193660bitmapBounds;
         if(_loc2_ !== param1)
         {
            this._835193660bitmapBounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapBounds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : HGroup
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1110650414hitContainer;
         if(_loc2_ !== param1)
         {
            this._1110650414hitContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitGraphic() : Ellipse
      {
         return this._1814160427hitGraphic;
      }
      
      public function set hitGraphic(param1:Ellipse) : void
      {
         var _loc2_:Object = this._1814160427hitGraphic;
         if(_loc2_ !== param1)
         {
            this._1814160427hitGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitGraphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get isMouseEnable() : Boolean
      {
         return this._982902018isMouseEnable;
      }
      
      private function set isMouseEnable(param1:Boolean) : void
      {
         var _loc2_:Object = this._982902018isMouseEnable;
         if(_loc2_ !== param1)
         {
            this._982902018isMouseEnable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isMouseEnable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get currentSafeSource() : *
      {
         return this._105100191currentSafeSource;
      }
      
      private function set currentSafeSource(param1:*) : void
      {
         var _loc2_:Object = this._105100191currentSafeSource;
         if(_loc2_ !== param1)
         {
            this._105100191currentSafeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentSafeSource",_loc2_,param1));
            }
         }
      }
      
      public function set readyToGo(param1:Boolean) : void
      {
         var _loc2_:Object = this.readyToGo;
         if(_loc2_ !== param1)
         {
            this._1090377466readyToGo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"readyToGo",_loc2_,param1));
            }
         }
      }
   }
}

