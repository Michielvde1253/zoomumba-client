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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.Ellipse;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ButtonZoomable extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ButtonZoomable_Ellipse1:Ellipse;
      
      private var _1957262907_ButtonZoomable_SetProperty1:SetProperty;
      
      private var _914540639displayImg:CircularDisplayImage;
      
      private var _1110650414hitContainer:Group;
      
      private var _701444433imgBackground:BackgroundImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _190451707bgScale:Number = 0.5;
      
      private var _513193406iconScales:Array;
      
      private var _427585298isBitmapIcon:Boolean;
      
      private var _990522683animDuration:int = 100;
      
      private var _anim:Animate;
      
      private var _created:Boolean = false;
      
      private var _reverse:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ButtonZoomable()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._513193406iconScales = [1,1.1];
         this._anim = new Animate();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ButtonZoomable_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_extended_ButtonZoomableWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonZoomable[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ButtonZoomable_Group2_c(),this._ButtonZoomable_Group3_i()];
         this.currentState = "up";
         this.addEventListener("mouseOver",this.___ButtonZoomable_Group1_mouseOver);
         this.addEventListener("mouseUp",this.___ButtonZoomable_Group1_mouseUp);
         this.addEventListener("mouseOut",this.___ButtonZoomable_Group1_mouseOut);
         this.addEventListener("click",this.___ButtonZoomable_Group1_click);
         this.addEventListener("creationComplete",this.___ButtonZoomable_Group1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[this._ButtonZoomable_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "name":"filters",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_ButtonZoomable_SetProperty1",this._ButtonZoomable_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ButtonZoomable._watcherSetupUtil = param1;
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
      
      public function set iconClass(param1:*) : void
      {
         if(this.isBitmapIcon)
         {
            this.displayImg.bitmapDataDisplay = param1;
         }
         else
         {
            this.displayImg.spriteClassDisplay = param1;
         }
      }
      
      private function _init(param1:FlexEvent) : void
      {
         this.hitContainer.mouseEnabled = false;
         hitArea = this.hitContainer;
         buttonMode = true;
         useHandCursor = true;
         this._anim.target = this.displayImg;
         this._anim.duration = this.animDuration;
         this._anim.motionPaths = Vector.<MotionPath>([new SimpleMotionPath("bitmapDisplayScale",this.iconScales[0],this.iconScales[1],0.01)]);
         this.displayImg.bitmapDisplayScale = this.iconScales[0];
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this._reverse = param2 == "up";
         if(param1 != param2 && enabled && param1 != "down")
         {
            switch(param2)
            {
               case "over":
                  this._anim.play();
                  break;
               case "up":
               case "disabled":
                  this._anim.play(null,true);
            }
         }
      }
      
      private function _ButtonZoomable_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._ButtonZoomable_BackgroundImage1_i(),this._ButtonZoomable_CircularDisplayImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ButtonZoomable_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.id = "imgBackground";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imgBackground = _loc1_;
         BindingManager.executeBindings(this,"imgBackground",this.imgBackground);
         return _loc1_;
      }
      
      private function _ButtonZoomable_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.currentState = "maskCombined";
         _loc1_.id = "displayImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayImg = _loc1_;
         BindingManager.executeBindings(this,"displayImg",this.displayImg);
         return _loc1_;
      }
      
      private function _ButtonZoomable_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ButtonZoomable_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _ButtonZoomable_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.fill = this._ButtonZoomable_SolidColor1_c();
         _loc1_.initialized(this,"_ButtonZoomable_Ellipse1");
         this._ButtonZoomable_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonZoomable_Ellipse1",this._ButtonZoomable_Ellipse1);
         return _loc1_;
      }
      
      private function _ButtonZoomable_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___ButtonZoomable_Group1_mouseOver(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      public function ___ButtonZoomable_Group1_mouseUp(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___ButtonZoomable_Group1_mouseOut(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___ButtonZoomable_Group1_click(param1:MouseEvent) : void
      {
         currentState = "down";
      }
      
      public function ___ButtonZoomable_Group1_creationComplete(param1:FlexEvent) : void
      {
         this._init(param1);
      }
      
      private function _ButtonZoomable_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.SEPIA)];
         },null,"_ButtonZoomable_SetProperty1.value");
         result[1] = new Binding(this,null,null,"imgBackground.scale","bgScale");
         result[2] = new Binding(this,function():Number
         {
            return imgBackground.width * bgScale;
         },null,"displayImg.width");
         result[3] = new Binding(this,function():Number
         {
            return imgBackground.height * bgScale;
         },null,"displayImg.height");
         result[4] = new Binding(this,null,null,"displayImg.maskScale","bgScale");
         result[5] = new Binding(this,function():Number
         {
            return imgBackground.width;
         },null,"_ButtonZoomable_Ellipse1.width");
         result[6] = new Binding(this,function():Number
         {
            return imgBackground.height;
         },null,"_ButtonZoomable_Ellipse1.height");
         result[7] = new Binding(this,null,null,"_ButtonZoomable_Ellipse1.scaleX","bgScale");
         result[8] = new Binding(this,null,null,"_ButtonZoomable_Ellipse1.scaleY","bgScale");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonZoomable_SetProperty1() : SetProperty
      {
         return this._1957262907_ButtonZoomable_SetProperty1;
      }
      
      public function set _ButtonZoomable_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1957262907_ButtonZoomable_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1957262907_ButtonZoomable_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonZoomable_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayImg() : CircularDisplayImage
      {
         return this._914540639displayImg;
      }
      
      public function set displayImg(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._914540639displayImg;
         if(_loc2_ !== param1)
         {
            this._914540639displayImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : Group
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:Group) : void
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
      public function get imgBackground() : BackgroundImage
      {
         return this._701444433imgBackground;
      }
      
      public function set imgBackground(param1:BackgroundImage) : void
      {
         var _loc2_:Object = this._701444433imgBackground;
         if(_loc2_ !== param1)
         {
            this._701444433imgBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imgBackground",_loc2_,param1));
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
      public function get isBitmapIcon() : Boolean
      {
         return this._427585298isBitmapIcon;
      }
      
      public function set isBitmapIcon(param1:Boolean) : void
      {
         var _loc2_:Object = this._427585298isBitmapIcon;
         if(_loc2_ !== param1)
         {
            this._427585298isBitmapIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isBitmapIcon",_loc2_,param1));
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

