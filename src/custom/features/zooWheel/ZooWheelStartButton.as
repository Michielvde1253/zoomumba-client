package custom.features.zooWheel
{
   import buttons.customButtons.CustomizableNormalButton;
   import com.greensock.TweenMax;
   import custom.features.zooWheel.events.ZooWheelStartEvent;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Path;
   import utils.Color;
   
   use namespace mx_internal;
   
   public class ZooWheelStartButton extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ZooWheelStartButton_Button1:Button;
      
      public var _ZooWheelStartButton_CustomizableNormalButton1:CustomizableNormalButton;
      
      private var _103315hit:Group;
      
      private var _1000556740spriteContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _filter:Array;
      
      private var _movieclipRef:MovieClip;
      
      private var _customButton:CustomizableNormalButton;
      
      private var _53342463_customButtonEnabled:Boolean = true;
      
      private var _1679659364_customButtonAlpha:Number = 1;
      
      private var _808389049_customButtonFilters:Array;
      
      private var _266482281bitmapDataStart:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZooWheelStartButton()
      {
         var bindings:Array;
         var watchers:Array;
         var _ZooWheelStartButton_Button1_factory:DeferredInstanceFromFunction;
         var _ZooWheelStartButton_CustomizableNormalButton1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._filter = [Color.getColorMatrixFilter(Color.SEPIA)];
         this._808389049_customButtonFilters = [];
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ZooWheelStartButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_zooWheel_ZooWheelStartButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZooWheelStartButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 209;
         this.height = 259;
         this.mxmlContent = [this._ZooWheelStartButton_SpriteVisualElement1_i(),this._ZooWheelStartButton_Group2_i()];
         this.currentState = "start";
         _ZooWheelStartButton_Button1_factory = new DeferredInstanceFromFunction(this._ZooWheelStartButton_Button1_i);
         _ZooWheelStartButton_CustomizableNormalButton1_factory = new DeferredInstanceFromFunction(this._ZooWheelStartButton_CustomizableNormalButton1_i);
         states = [new State({
            "name":"start",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelStartButton_CustomizableNormalButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"forward",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelStartButton_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"deEmphasized",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelStartButton_CustomizableNormalButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
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
         ZooWheelStartButton._watcherSetupUtil = param1;
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
      
      public function set movieClipPenguim(param1:MovieClip) : void
      {
         this._movieclipRef = param1;
         this._movieclipRef.gotoAndStop(1);
         this.spriteContainer.addChild(this._movieclipRef);
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2 && this._movieclipRef != null)
         {
            switch(param2)
            {
               case "start":
                  if(this._movieclipRef.currentFrame != 1)
                  {
                     this.showStart([],0);
                     TweenMax.to(this._movieclipRef,0.3,{
                        "frame":1,
                        "onComplete":this.showStart,
                        "onCompleteParams":[[],1]
                     });
                  }
                  else
                  {
                     TweenMax.killTweensOf(this._movieclipRef);
                     this.showStart([],1);
                  }
                  break;
               case "forward":
                  if(this._movieclipRef.currentFrame != 5)
                  {
                     TweenMax.to(this._movieclipRef,0.5,{"frame":5});
                  }
                  else
                  {
                     TweenMax.killTweensOf(this._movieclipRef);
                  }
                  break;
               case "deEmphasized":
                  if(this._movieclipRef.currentFrame != 1)
                  {
                     this.showStart(this._filter,0);
                     TweenMax.to(this._movieclipRef,0.3,{
                        "frame":1,
                        "onComplete":this.showStart,
                        "onCompleteParams":[this._filter,0.5]
                     });
                  }
                  else
                  {
                     TweenMax.killTweensOf(this._movieclipRef);
                     this.showStart(this._filter,0.5);
                  }
            }
         }
      }
      
      private function showStart(param1:Array, param2:Number = 1) : void
      {
         this._customButtonAlpha = param2;
         this._customButtonFilters = param1;
      }
      
      private function internalIniti(param1:FlexEvent) : void
      {
         this._customButton = param1.currentTarget as CustomizableNormalButton;
      }
      
      private function clickEvent(param1:MouseEvent) : void
      {
         if(currentState == "start")
         {
            dispatchEvent(new ZooWheelStartEvent(ZooWheelStartEvent.START));
         }
         else if(currentState == "deEmphasized")
         {
            dispatchEvent(new ZooWheelStartEvent(ZooWheelStartEvent.BUY));
         }
         else if(currentState == "forward")
         {
            dispatchEvent(new ZooWheelStartEvent(ZooWheelStartEvent.FORWARD));
         }
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this._customButtonEnabled = param1;
      }
      
      public function dispose() : void
      {
         TweenMax.killTweensOf(this._movieclipRef);
      }
      
      private function _ZooWheelStartButton_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"spriteContainer");
         this.spriteContainer = _loc1_;
         BindingManager.executeBindings(this,"spriteContainer",this.spriteContainer);
         return _loc1_;
      }
      
      private function _ZooWheelStartButton_CustomizableNormalButton1_i() : CustomizableNormalButton
      {
         var _loc1_:CustomizableNormalButton = new CustomizableNormalButton();
         _loc1_.x = 62;
         _loc1_.y = 132;
         _loc1_.overEffect = 1;
         _loc1_.addEventListener("preinitialize",this.___ZooWheelStartButton_CustomizableNormalButton1_preinitialize);
         _loc1_.addEventListener("click",this.___ZooWheelStartButton_CustomizableNormalButton1_click);
         _loc1_.id = "_ZooWheelStartButton_CustomizableNormalButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooWheelStartButton_CustomizableNormalButton1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelStartButton_CustomizableNormalButton1",this._ZooWheelStartButton_CustomizableNormalButton1);
         return _loc1_;
      }
      
      public function ___ZooWheelStartButton_CustomizableNormalButton1_preinitialize(param1:FlexEvent) : void
      {
         this.internalIniti(param1);
      }
      
      public function ___ZooWheelStartButton_CustomizableNormalButton1_click(param1:MouseEvent) : void
      {
         this.clickEvent(param1);
      }
      
      private function _ZooWheelStartButton_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 62;
         _loc1_.y = 132;
         _loc1_.width = 0;
         _loc1_.height = 0;
         _loc1_.alpha = 0;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___ZooWheelStartButton_Button1_click);
         _loc1_.id = "_ZooWheelStartButton_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooWheelStartButton_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelStartButton_Button1",this._ZooWheelStartButton_Button1);
         return _loc1_;
      }
      
      public function ___ZooWheelStartButton_Button1_click(param1:MouseEvent) : void
      {
         this.clickEvent(param1);
      }
      
      private function _ZooWheelStartButton_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._ZooWheelStartButton_Path1_c()];
         _loc1_.id = "hit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hit = _loc1_;
         BindingManager.executeBindings(this,"hit",this.hit);
         return _loc1_;
      }
      
      private function _ZooWheelStartButton_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = 38;
         _loc1_.y = 110;
         _loc1_.data = "M143.9 11.4 151.9 41.35Q155.8 55.85 141.35 59.75L30.25 89.5Q15.75 93.4 10.9 86.2 0.18222656 67.758984 -0.1 49.2 -0.05 34.5 14.45 30.6 62.402734 8.3664063 123.9 -0.8 140 -3.05 143.9 11.4";
         _loc1_.fill = this._ZooWheelStartButton_SolidColor1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelStartButton_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelStartButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_ZooWheelStartButton_CustomizableNormalButton1.hitContainer","hit");
         result[1] = new Binding(this,function():Number
         {
            return _customButtonAlpha;
         },null,"_ZooWheelStartButton_CustomizableNormalButton1.alpha");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = _customButtonFilters;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_ZooWheelStartButton_CustomizableNormalButton1.filters");
         result[3] = new Binding(this,function():Boolean
         {
            return _customButtonEnabled;
         },null,"_ZooWheelStartButton_CustomizableNormalButton1.enabled");
         result[4] = new Binding(this,null,null,"_ZooWheelStartButton_CustomizableNormalButton1.bitmapContent","bitmapDataStart");
         result[5] = new Binding(this,null,null,"_ZooWheelStartButton_Button1.hitArea","hit");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get hit() : Group
      {
         return this._103315hit;
      }
      
      public function set hit(param1:Group) : void
      {
         var _loc2_:Object = this._103315hit;
         if(_loc2_ !== param1)
         {
            this._103315hit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteContainer() : SpriteVisualElement
      {
         return this._1000556740spriteContainer;
      }
      
      public function set spriteContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1000556740spriteContainer;
         if(_loc2_ !== param1)
         {
            this._1000556740spriteContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _customButtonEnabled() : Boolean
      {
         return this._53342463_customButtonEnabled;
      }
      
      private function set _customButtonEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._53342463_customButtonEnabled;
         if(_loc2_ !== param1)
         {
            this._53342463_customButtonEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_customButtonEnabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _customButtonAlpha() : Number
      {
         return this._1679659364_customButtonAlpha;
      }
      
      private function set _customButtonAlpha(param1:Number) : void
      {
         var _loc2_:Object = this._1679659364_customButtonAlpha;
         if(_loc2_ !== param1)
         {
            this._1679659364_customButtonAlpha = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_customButtonAlpha",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _customButtonFilters() : Array
      {
         return this._808389049_customButtonFilters;
      }
      
      private function set _customButtonFilters(param1:Array) : void
      {
         var _loc2_:Object = this._808389049_customButtonFilters;
         if(_loc2_ !== param1)
         {
            this._808389049_customButtonFilters = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_customButtonFilters",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDataStart() : BitmapData
      {
         return this._266482281bitmapDataStart;
      }
      
      public function set bitmapDataStart(param1:BitmapData) : void
      {
         var _loc2_:Object = this._266482281bitmapDataStart;
         if(_loc2_ !== param1)
         {
            this._266482281bitmapDataStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDataStart",_loc2_,param1));
            }
         }
      }
   }
}

