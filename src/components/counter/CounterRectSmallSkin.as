package components.counter
{
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
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CounterRectSmallSkin extends Skin implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1559664047extraContainer:SpriteVisualElement;
      
      private var _1110650414hitContainer:Group;
      
      private var _1814160427hitGraphic:Rect;
      
      private var _3556653text:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectSmall_678912622:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:Counter;
      
      public function CounterRectSmallSkin()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectSmall_678912622 = CounterRectSmallSkin__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectSmall_678912622;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CounterRectSmallSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_counter_CounterRectSmallSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CounterRectSmallSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CounterRectSmallSkin_Group1_c()];
         this.addEventListener("creationComplete",this.___CounterRectSmallSkin_Skin1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CounterRectSmallSkin._watcherSetupUtil = param1;
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
         this.hitContainer.mouseEnabled = false;
         hitArea = this.hitContainer;
         this.hostComponent.hitArea = this.hitContainer;
      }
      
      private function _CounterRectSmallSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.focusEnabled = false;
         _loc1_.width = 44;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._CounterRectSmallSkin_Image1_c(),this._CounterRectSmallSkin_GradientText1_i(),this._CounterRectSmallSkin_Group2_i(),this._CounterRectSmallSkin_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectSmall_678912622;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = -2;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CounterRectSmallSkin_Rect1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 40;
         _loc1_.height = 24;
         _loc1_.verticalCenter = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._CounterRectSmallSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectSmallSkin_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"extraContainer");
         this.extraContainer = _loc1_;
         BindingManager.executeBindings(this,"extraContainer",this.extraContainer);
         return _loc1_;
      }
      
      public function ___CounterRectSmallSkin_Skin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _CounterRectSmallSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.value.toString();
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"text.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get extraContainer() : SpriteVisualElement
      {
         return this._1559664047extraContainer;
      }
      
      public function set extraContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1559664047extraContainer;
         if(_loc2_ !== param1)
         {
            this._1559664047extraContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraContainer",_loc2_,param1));
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
      public function get hitGraphic() : Rect
      {
         return this._1814160427hitGraphic;
      }
      
      public function set hitGraphic(param1:Rect) : void
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
      public function get hostComponent() : Counter
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Counter) : void
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

