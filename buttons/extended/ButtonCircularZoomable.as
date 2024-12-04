package buttons.extended
{
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
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
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.effects.easing.Power;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ButtonCircularZoomable extends SkinnableComponent implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static const STANDARD_BG_STATE:String = "inner";
      
      public static const STANDARD_BG_SCALE:Number = 0.5;
      
      public static const STANDARD_ICON_SCALES:Array = [1,1.1];
      
      private static var _skinParts:Object = {
         "displayImg":true,
         "imgBackground":true,
         "hitContainer":true
      };
      
      private var _1480136228_ButtonCircularZoomable_SetProperty1:SetProperty;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _190451707bgScale:Number = -1;
      
      private var _513193406iconScales:Array = null;
      
      private var _1416535937iconClass:Class;
      
      private var _1302039555backgroundState:String = null;
      
      private var _1818683086circularState:String = "normal";
      
      private var _990522683animDuration:int = 100;
      
      private var _anim:Animate;
      
      private var _created:Boolean = false;
      
      private var _reverse:Boolean = false;
      
      [SkinPart(required="true")]
      public var hitContainer:Group;
      
      [SkinPart(required="true")]
      public var imgBackground:BackgroundImage;
      
      [SkinPart(required="true")]
      public var displayImg:CircularDisplayImage;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ButtonCircularZoomable()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._anim = new Animate();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ButtonCircularZoomable_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_extended_ButtonCircularZoomableWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonCircularZoomable[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.currentState = "up";
         this.addEventListener("click",this.___ButtonCircularZoomable_SkinnableComponent1_click);
         this.addEventListener("mouseUp",this.___ButtonCircularZoomable_SkinnableComponent1_mouseUp);
         this.addEventListener("mouseDown",this.___ButtonCircularZoomable_SkinnableComponent1_mouseDown);
         this.addEventListener("mouseDownOutside",this.___ButtonCircularZoomable_SkinnableComponent1_mouseDownOutside);
         this.addEventListener("mouseOut",this.___ButtonCircularZoomable_SkinnableComponent1_mouseOut);
         this.addEventListener("mouseOver",this.___ButtonCircularZoomable_SkinnableComponent1_mouseOver);
         this.addEventListener("creationComplete",this.___ButtonCircularZoomable_SkinnableComponent1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"out",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"mouseEnabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "name":"mouseChildren",
               "value":false
            }),this._ButtonCircularZoomable_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "name":"filters",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_ButtonCircularZoomable_SetProperty1",this._ButtonCircularZoomable_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ButtonCircularZoomable._watcherSetupUtil = param1;
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
      
      override public function set enabled(param1:Boolean) : void
      {
         currentState = param1 ? "up" : "disabled";
         super.enabled = true;
      }
      
      private function _init(param1:FlexEvent) : void
      {
         if(this.bgScale == -1)
         {
            this.bgScale = STANDARD_BG_SCALE;
         }
         if(this.iconScales == null)
         {
            this.iconScales = STANDARD_ICON_SCALES;
         }
         if(this.backgroundState == null)
         {
            this.backgroundState = STANDARD_BG_STATE;
         }
         this.hitContainer.mouseEnabled = false;
         hitArea = skin.hitArea = this.hitContainer;
         buttonMode = skin.buttonMode = true;
         useHandCursor = skin.useHandCursor = true;
         this._anim.target = this.displayImg;
         this._anim.duration = this.animDuration;
         this._anim.easer = new Power();
         this._anim.motionPaths = Vector.<MotionPath>([new SimpleMotionPath("bitmapDisplayScale",this.iconScales[0],this.iconScales[1],0.01)]);
         this.displayImg.bitmapDisplayScale = this.iconScales[0];
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            this._reverse = param2 == "up";
            if(enabled)
            {
               switch(param2)
               {
                  case "over":
                     this._anim.play();
                     break;
                  case "out":
                  case "disabled":
                     this._anim.play(null,true);
               }
            }
         }
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_click(param1:MouseEvent) : void
      {
         currentState = "down";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_mouseUp(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_mouseDown(param1:MouseEvent) : void
      {
         currentState = "down";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_mouseDownOutside(param1:FlexMouseEvent) : void
      {
         currentState = "down";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_mouseOut(param1:MouseEvent) : void
      {
         currentState = "out";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_mouseOver(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      public function ___ButtonCircularZoomable_SkinnableComponent1_creationComplete(param1:FlexEvent) : void
      {
         this._init(param1);
      }
      
      private function _ButtonCircularZoomable_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.SEPIA)];
         },null,"_ButtonCircularZoomable_SetProperty1.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonCircularZoomable_SetProperty1() : SetProperty
      {
         return this._1480136228_ButtonCircularZoomable_SetProperty1;
      }
      
      public function set _ButtonCircularZoomable_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1480136228_ButtonCircularZoomable_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1480136228_ButtonCircularZoomable_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonCircularZoomable_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgScale() : Number
      {
         return this._190451707bgScale;
      }
      
      public function set bgScale(param1:Number) : void
      {
         var _loc2_:Object = this._190451707bgScale;
         if(_loc2_ !== param1)
         {
            this._190451707bgScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconScales() : Array
      {
         return this._513193406iconScales;
      }
      
      public function set iconScales(param1:Array) : void
      {
         var _loc2_:Object = this._513193406iconScales;
         if(_loc2_ !== param1)
         {
            this._513193406iconScales = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconScales",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconClass() : Class
      {
         return this._1416535937iconClass;
      }
      
      public function set iconClass(param1:Class) : void
      {
         var _loc2_:Object = this._1416535937iconClass;
         if(_loc2_ !== param1)
         {
            this._1416535937iconClass = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconClass",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundState() : String
      {
         return this._1302039555backgroundState;
      }
      
      public function set backgroundState(param1:String) : void
      {
         var _loc2_:Object = this._1302039555backgroundState;
         if(_loc2_ !== param1)
         {
            this._1302039555backgroundState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get circularState() : String
      {
         return this._1818683086circularState;
      }
      
      public function set circularState(param1:String) : void
      {
         var _loc2_:Object = this._1818683086circularState;
         if(_loc2_ !== param1)
         {
            this._1818683086circularState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circularState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animDuration() : int
      {
         return this._990522683animDuration;
      }
      
      public function set animDuration(param1:int) : void
      {
         var _loc2_:Object = this._990522683animDuration;
         if(_loc2_ !== param1)
         {
            this._990522683animDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animDuration",_loc2_,param1));
            }
         }
      }
   }
}

