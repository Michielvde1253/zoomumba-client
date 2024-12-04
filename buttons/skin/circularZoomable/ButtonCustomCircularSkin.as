package buttons.skin.circularZoomable
{
   import buttons.extended.ButtonCircularZoomable;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Ellipse;
   
   use namespace mx_internal;
   
   public class ButtonCustomCircularSkin extends Skin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ButtonCustomCircularSkin_Ellipse1:Ellipse;
      
      private var _914540639displayImg:CircularDisplayImage;
      
      private var _1110650414hitContainer:Group;
      
      private var _701444433imgBackground:BackgroundImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ButtonCircularZoomable;
      
      public function ButtonCustomCircularSkin()
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
         bindings = this._ButtonCustomCircularSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_skin_circularZoomable_ButtonCustomCircularSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonCustomCircularSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ButtonCustomCircularSkin_Group1_c(),this._ButtonCustomCircularSkin_Group2_i()];
         this.currentState = "up";
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
               "target":"displayImg",
               "name":"enabled",
               "value":false
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
         ButtonCustomCircularSkin._watcherSetupUtil = param1;
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
      
      private function _ButtonCustomCircularSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._ButtonCustomCircularSkin_BackgroundImage1_i(),this._ButtonCustomCircularSkin_CircularDisplayImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ButtonCustomCircularSkin_BackgroundImage1_i() : BackgroundImage
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
      
      private function _ButtonCustomCircularSkin_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.id = "displayImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayImg = _loc1_;
         BindingManager.executeBindings(this,"displayImg",this.displayImg);
         return _loc1_;
      }
      
      private function _ButtonCustomCircularSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ButtonCustomCircularSkin_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _ButtonCustomCircularSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.fill = this._ButtonCustomCircularSkin_SolidColor1_c();
         _loc1_.initialized(this,"_ButtonCustomCircularSkin_Ellipse1");
         this._ButtonCustomCircularSkin_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonCustomCircularSkin_Ellipse1",this._ButtonCustomCircularSkin_Ellipse1);
         return _loc1_;
      }
      
      private function _ButtonCustomCircularSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ButtonCustomCircularSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.backgroundState;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"imgBackground.currentState");
         result[1] = new Binding(this,function():Number
         {
            return hostComponent.bgScale;
         },null,"imgBackground.scale");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.circularState;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"displayImg.currentState");
         result[3] = new Binding(this,function():Number
         {
            return hostComponent.bgScale;
         },null,"displayImg.maskScale");
         result[4] = new Binding(this,function():*
         {
            return hostComponent.iconClass;
         },null,"displayImg.spriteClassDisplay");
         result[5] = new Binding(this,function():Number
         {
            return imgBackground.width;
         },null,"_ButtonCustomCircularSkin_Ellipse1.width");
         result[6] = new Binding(this,function():Number
         {
            return imgBackground.height;
         },null,"_ButtonCustomCircularSkin_Ellipse1.height");
         result[7] = new Binding(this,function():Number
         {
            return hostComponent.bgScale;
         },null,"_ButtonCustomCircularSkin_Ellipse1.scaleX");
         result[8] = new Binding(this,function():Number
         {
            return hostComponent.bgScale;
         },null,"_ButtonCustomCircularSkin_Ellipse1.scaleY");
         return result;
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
      public function get hostComponent() : ButtonCircularZoomable
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ButtonCircularZoomable) : void
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

