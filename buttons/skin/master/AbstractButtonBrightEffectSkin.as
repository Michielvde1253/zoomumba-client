package buttons.skin.master
{
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
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.effects.AnimateFilter;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.filters.ShaderFilter;
   import spark.skins.SparkSkin;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class AbstractButtonBrightEffectSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _241555202_AbstractButtonBrightEffectSkin_SetProperty1:SetProperty;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const BRIGHTNESS:Number = 0.05;
      
      private const CONTRAST:Number = 0.15;
      
      private const SHADER_BY:Number = 0.001;
      
      private var _created:Boolean = false;
      
      private var _reverse:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var MyShaderClass:Class;
      
      private var _1947201469shaderFilter:ShaderFilter;
      
      private var shader:Shader;
      
      private var anim:AnimateFilter;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:Button;
      
      public function AbstractButtonBrightEffectSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.MyShaderClass = AbstractButtonBrightEffectSkin_MyShaderClass;
         this.shader = new Shader();
         this.anim = new AnimateFilter();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AbstractButtonBrightEffectSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_skin_master_AbstractButtonBrightEffectSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AbstractButtonBrightEffectSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 21;
         this.minHeight = 21;
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___AbstractButtonBrightEffectSkin_SparkSkin1_creationComplete);
         this.addEventListener("removed",this.___AbstractButtonBrightEffectSkin_SparkSkin1_removed);
         this.addEventListener("mouseOver",this.___AbstractButtonBrightEffectSkin_SparkSkin1_mouseOver);
         this.addEventListener("mouseUp",this.___AbstractButtonBrightEffectSkin_SparkSkin1_mouseUp);
         this.addEventListener("mouseOut",this.___AbstractButtonBrightEffectSkin_SparkSkin1_mouseOut);
         this.addEventListener("click",this.___AbstractButtonBrightEffectSkin_SparkSkin1_click);
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
            "overrides":[this._AbstractButtonBrightEffectSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":1
            })]
         })];
         BindingManager.executeBindings(this,"_AbstractButtonBrightEffectSkin_SetProperty1",this._AbstractButtonBrightEffectSkin_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AbstractButtonBrightEffectSkin._watcherSetupUtil = param1;
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
      
      protected function init() : void
      {
         throw new Error("ClientGUI - AbstractButtonBrightEffectSkin :: This is an abstract Skin, please, override init()");
      }
      
      protected function dispose() : void
      {
         throw new Error("ClientGUI - AbstractButtonBrightEffectSkin :: This is an abstract Skin, please, override dispose()");
      }
      
      private function _dispose(param1:Event) : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            if(Boolean(this.anim) && Boolean(this.anim.hasEventListener(EffectEvent.EFFECT_START)))
            {
               this.anim.addEventListener(EffectEvent.EFFECT_START,this.startEffect);
            }
            if(Boolean(this.anim) && Boolean(this.anim.hasEventListener(EffectEvent.EFFECT_END)))
            {
               this.anim.addEventListener(EffectEvent.EFFECT_END,this.endEffect);
            }
            this.dispose();
         }
      }
      
      private function _init(param1:FlexEvent) : void
      {
         this.shader.byteCode = new this.MyShaderClass();
         this.shaderFilter = new ShaderFilter(this.shader);
         this.anim.target = this;
         this.anim.duration = 200;
         this.anim.bitmapFilter = this.shaderFilter;
         this.anim.addEventListener(EffectEvent.EFFECT_START,this.startEffect);
         this.anim.addEventListener(EffectEvent.EFFECT_END,this.endEffect);
         this.anim.motionPaths = Vector.<MotionPath>([new SimpleMotionPath("brightness",0,this.BRIGHTNESS,this.SHADER_BY),new SimpleMotionPath("contrast",0,this.CONTRAST,this.SHADER_BY)]);
         this._created = true;
         this.init();
      }
      
      private function assignShaderProperties() : void
      {
         this.shader.data.brightness.value = [this.BRIGHTNESS];
         this.shader.data.contrast.value = [this.CONTRAST];
      }
      
      private function startEffect(param1:EffectEvent) : void
      {
         if(this._reverse)
         {
            this.assignShaderProperties();
            this.filters = [this.shaderFilter];
         }
      }
      
      private function endEffect(param1:EffectEvent) : void
      {
         if(!this._reverse)
         {
            this.assignShaderProperties();
            this.filters = [this.shaderFilter];
         }
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this._reverse = param2 == "up";
         if(param1 != param2 && this.hostComponent.enabled && this.anim.bitmapFilter && param1 != "down")
         {
            switch(param2)
            {
               case "over":
                  this.anim.play();
                  break;
               case "up":
               case "disabled":
                  this.anim.play(null,true);
            }
         }
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this._init(param1);
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_removed(param1:Event) : void
      {
         this._dispose(param1);
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_mouseOver(param1:MouseEvent) : void
      {
         currentState = "over";
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_mouseUp(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_mouseOut(param1:MouseEvent) : void
      {
         currentState = "up";
      }
      
      public function ___AbstractButtonBrightEffectSkin_SparkSkin1_click(param1:MouseEvent) : void
      {
         currentState = "down";
      }
      
      private function _AbstractButtonBrightEffectSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.SEPIA)];
         },null,"_AbstractButtonBrightEffectSkin_SetProperty1.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _AbstractButtonBrightEffectSkin_SetProperty1() : SetProperty
      {
         return this._241555202_AbstractButtonBrightEffectSkin_SetProperty1;
      }
      
      public function set _AbstractButtonBrightEffectSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._241555202_AbstractButtonBrightEffectSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._241555202_AbstractButtonBrightEffectSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AbstractButtonBrightEffectSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get shaderFilter() : ShaderFilter
      {
         return this._1947201469shaderFilter;
      }
      
      private function set shaderFilter(param1:ShaderFilter) : void
      {
         var _loc2_:Object = this._1947201469shaderFilter;
         if(_loc2_ !== param1)
         {
            this._1947201469shaderFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shaderFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

