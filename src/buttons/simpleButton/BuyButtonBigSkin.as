package buttons.simpleButton
{
   import com.greensock.TweenMax;
   import components.textfield.gradientText.GradientText;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class BuyButtonBigSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1136579947_BuyButtonBigSkin_SetProperty1:SetProperty;
      
      private var _1377687758button:BitmapImage;
      
      private var _3556653text:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigOver_1285518067:Class;
      
      private var _embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:Button;
      
      public function BuyButtonBigSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigOver_1285518067 = BuyButtonBigSkin__embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigOver_1285518067;
         this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924 = BuyButtonBigSkin__embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._BuyButtonBigSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_simpleButton_BuyButtonBigSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BuyButtonBigSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._BuyButtonBigSkin_BitmapImage1_i(),this._BuyButtonBigSkin_GradientText1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___BuyButtonBigSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"button",
               "name":"source",
               "value":this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924
            })]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"button",
               "name":"source",
               "value":this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"button",
               "name":"source",
               "value":this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigOver_1285518067
            })]
         }),new State({
            "name":"disabled",
            "overrides":[this._BuyButtonBigSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"button",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"button",
               "name":"source",
               "value":this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_ButtonBigUp_240857924
            })]
         })];
         BindingManager.executeBindings(this,"_BuyButtonBigSkin_SetProperty1",this._BuyButtonBigSkin_SetProperty1);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BuyButtonBigSkin._watcherSetupUtil = param1;
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
      
      protected function config(param1:FlexEvent) : void
      {
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2 && Boolean(this.hostComponent.enabled))
         {
            switch(param2)
            {
               case "over":
                  TweenMax.to(this,0.3,{"colorMatrixFilter":{
                     "contrast":1.4,
                     "brightness":1.2
                  }});
                  break;
               case "up":
                  TweenMax.to(this,0.3,{"colorMatrixFilter":{
                     "contrast":1,
                     "brightness":1,
                     "remove":true
                  }});
            }
         }
      }
      
      private function _BuyButtonBigSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"button");
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      private function _BuyButtonBigSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.fontSize = 14;
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      public function ___BuyButtonBigSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _BuyButtonBigSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return [Color.getColorMatrixFilter(Color.SEPIA)];
         },null,"_BuyButtonBigSkin_SetProperty1.value");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"text.text");
         result[2] = new Binding(this,null,null,"text.width","width");
         result[3] = new Binding(this,null,null,"text.height","height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _BuyButtonBigSkin_SetProperty1() : SetProperty
      {
         return this._1136579947_BuyButtonBigSkin_SetProperty1;
      }
      
      public function set _BuyButtonBigSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1136579947_BuyButtonBigSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1136579947_BuyButtonBigSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BuyButtonBigSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : BitmapImage
      {
         return this._1377687758button;
      }
      
      public function set button(param1:BitmapImage) : void
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
      public function get text() : GradientText
      {
         return this._3556653text;
      }
      
      public function set text(param1:GradientText) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
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

