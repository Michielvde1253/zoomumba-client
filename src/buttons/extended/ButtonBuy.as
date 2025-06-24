package buttons.extended
{
   import buttons.skin.fluid.ButtonFluidGoldSkin;
   import buttons.skin.fluid.ButtonFluidNormalSkin;
   import buttons.skin.fluid.ButtonFluidPaleSkin;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
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
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ButtonBuy extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1377687758button:Button;
      
      private var _491821181gradientText:GradientText;
      
      private var _102727412label:LabelDisplay;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var index:int = -1;
      
      public var callbackClickFunction:Function = null;
      
      public var note:Object = null;
      
      public var param:Object = null;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ButtonBuy()
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
         bindings = this._ButtonBuy_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_extended_ButtonBuyWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonBuy[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 112;
         this.height = 30;
         this.mxmlContent = [this._ButtonBuy_Button1_i(),this._ButtonBuy_GradientText1_i(),this._ButtonBuy_LabelDisplay1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"button",
               "name":"skinClass",
               "value":ButtonFluidNormalSkin
            })]
         }),new State({
            "name":"pale",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"button",
               "name":"skinClass",
               "value":ButtonFluidPaleSkin
            })]
         }),new State({
            "name":"gold",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"button",
               "name":"skinClass",
               "value":ButtonFluidGoldSkin
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
         ButtonBuy._watcherSetupUtil = param1;
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
      
      private function internalClick(param1:MouseEvent) : void
      {
         if(this.callbackClickFunction != null)
         {
            this.callbackClickFunction(this);
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = true;
         super.mouseChildren = param1;
         super.mouseEnabled = param1;
         super.alpha = 1;
         this.filters = param1 ? [] : [Color.getColorMatrixFilter(Color.GRAYSCALE_LIGHT)];
      }
      
      private function _ButtonBuy_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("click",this.__button_click);
         _loc1_.addEventListener("mouseDown",this.__button_mouseDown);
         _loc1_.addEventListener("mouseOut",this.__button_mouseOut);
         _loc1_.addEventListener("mouseUp",this.__button_mouseUp);
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      public function __button_click(param1:MouseEvent) : void
      {
         this.internalClick(param1);
      }
      
      public function __button_mouseDown(param1:MouseEvent) : void
      {
         this.label.verticalCenter = 1;
         this.label.horizontalCenter = 1;
      }
      
      public function __button_mouseOut(param1:MouseEvent) : void
      {
         this.label.verticalCenter = 0;
         this.label.horizontalCenter = 0;
      }
      
      public function __button_mouseUp(param1:MouseEvent) : void
      {
         this.label.verticalCenter = 0;
         this.label.horizontalCenter = 0;
      }
      
      private function _ButtonBuy_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "gradientText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradientText = _loc1_;
         BindingManager.executeBindings(this,"gradientText",this.gradientText);
         return _loc1_;
      }
      
      private function _ButtonBuy_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "label";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.label = _loc1_;
         BindingManager.executeBindings(this,"label",this.label);
         return _loc1_;
      }
      
      private function _ButtonBuy_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return this.width;
         },null,"button.width");
         result[1] = new Binding(this,function():Number
         {
            return this.height;
         },null,"button.height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : Button
      {
         return this._1377687758button;
      }
      
      public function set button(param1:Button) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gradientText() : GradientText
      {
         return this._491821181gradientText;
      }
      
      public function set gradientText(param1:GradientText) : void
      {
         var _loc2_:Object = this._491821181gradientText;
         if(_loc2_ !== param1)
         {
            this._491821181gradientText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradientText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : LabelDisplay
      {
         return this._102727412label;
      }
      
      public function set label(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}

