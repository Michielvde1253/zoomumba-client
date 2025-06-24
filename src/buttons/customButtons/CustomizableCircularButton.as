package buttons.customButtons
{
   import com.greensock.TweenMax;
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
   import spark.primitives.Ellipse;
   
   use namespace mx_internal;
   
   public class CustomizableCircularButton extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _CustomizableCircularButton_Ellipse1:Ellipse;
      
      public var _CustomizableCircularButton_Group2:Group;
      
      private var _914540639displayImg:CircularDisplayImage;
      
      private var _1110650414hitContainer:Group;
      
      private var _701444433imgBackground:BackgroundImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1301532860backgroundScale:Number = 0.46;
      
      private var _760019018bitmapContent:BitmapData;
      
      private var _810915913bitmapDisplayPosX:int = -8;
      
      private var _810915912bitmapDisplayPosY:int = -8;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CustomizableCircularButton()
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
         bindings = this._CustomizableCircularButton_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_buttons_customButtons_CustomizableCircularButtonWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CustomizableCircularButton[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CustomizableCircularButton_Group2_i(),this._CustomizableCircularButton_Group3_i()];
         this.currentState = "up";
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
            "overrides":[new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"buttonMode",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"useHandCursor",
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
         CustomizableCircularButton._watcherSetupUtil = param1;
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
      
      protected function mouseHandler(param1:MouseEvent) : void
      {
         if(currentState != "minimized" && currentState != "disabled")
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  TweenMax.to(this.displayImg,0.2,{"bitmapDisplayScale":1.1});
                  currentState = "over";
                  break;
               case MouseEvent.MOUSE_OUT:
                  TweenMax.to(this.displayImg,0.2,{"bitmapDisplayScale":1});
                  currentState = "up";
                  break;
               case MouseEvent.CLICK:
                  currentState = "down";
            }
         }
      }
      
      private function _CustomizableCircularButton_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._CustomizableCircularButton_BackgroundImage1_i(),this._CustomizableCircularButton_CircularDisplayImage1_i()];
         _loc1_.id = "_CustomizableCircularButton_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CustomizableCircularButton_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CustomizableCircularButton_Group2",this._CustomizableCircularButton_Group2);
         return _loc1_;
      }
      
      private function _CustomizableCircularButton_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.horizontalCenter = -8;
         _loc1_.verticalCenter = -8;
         _loc1_.id = "imgBackground";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imgBackground = _loc1_;
         BindingManager.executeBindings(this,"imgBackground",this.imgBackground);
         return _loc1_;
      }
      
      private function _CustomizableCircularButton_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = null;
         _loc1_ = new CircularDisplayImage();
         _loc1_.currentState = "maskCombined";
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "displayImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayImg = _loc1_;
         BindingManager.executeBindings(this,"displayImg",this.displayImg);
         return _loc1_;
      }
      
      private function _CustomizableCircularButton_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.mxmlContent = [this._CustomizableCircularButton_Ellipse1_i()];
         _loc1_.addEventListener("click",this.__hitContainer_click);
         _loc1_.addEventListener("mouseOut",this.__hitContainer_mouseOut);
         _loc1_.addEventListener("mouseOver",this.__hitContainer_mouseOver);
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CustomizableCircularButton_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.fill = this._CustomizableCircularButton_SolidColor1_c();
         _loc1_.initialized(this,"_CustomizableCircularButton_Ellipse1");
         this._CustomizableCircularButton_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_CustomizableCircularButton_Ellipse1",this._CustomizableCircularButton_Ellipse1);
         return _loc1_;
      }
      
      private function _CustomizableCircularButton_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         _loc1_.color = 16711680;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function __hitContainer_click(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      public function __hitContainer_mouseOut(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      public function __hitContainer_mouseOver(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      private function _CustomizableCircularButton_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return backgroundScale * 75;
         },null,"this.explicitWidth");
         result[1] = new Binding(this,function():Number
         {
            return backgroundScale * 75;
         },null,"this.explicitHeight");
         result[2] = new Binding(this,function():Number
         {
            return 100 * backgroundScale;
         },null,"_CustomizableCircularButton_Group2.maxWidth");
         result[3] = new Binding(this,function():Number
         {
            return 100 * backgroundScale;
         },null,"_CustomizableCircularButton_Group2.maxHeight");
         result[4] = new Binding(this,null,null,"imgBackground.scale","backgroundScale");
         result[5] = new Binding(this,function():Number
         {
            return imgBackground.width * backgroundScale;
         },null,"displayImg.width");
         result[6] = new Binding(this,function():Number
         {
            return imgBackground.height * backgroundScale;
         },null,"displayImg.height");
         result[7] = new Binding(this,null,null,"displayImg.bitmapDataDisplay","bitmapContent");
         result[8] = new Binding(this,null,null,"displayImg.maskScale","backgroundScale");
         result[9] = new Binding(this,null,null,"displayImg.paddingDisplayX","bitmapDisplayPosX");
         result[10] = new Binding(this,null,null,"displayImg.paddingDisplayY","bitmapDisplayPosY");
         result[11] = new Binding(this,function():Number
         {
            return imgBackground.width;
         },null,"_CustomizableCircularButton_Ellipse1.width");
         result[12] = new Binding(this,function():Number
         {
            return imgBackground.height;
         },null,"_CustomizableCircularButton_Ellipse1.height");
         result[13] = new Binding(this,null,null,"_CustomizableCircularButton_Ellipse1.scaleX","backgroundScale");
         result[14] = new Binding(this,null,null,"_CustomizableCircularButton_Ellipse1.scaleY","backgroundScale");
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
      public function get backgroundScale() : Number
      {
         return this._1301532860backgroundScale;
      }
      
      public function set backgroundScale(param1:Number) : void
      {
         var _loc2_:Object = this._1301532860backgroundScale;
         if(_loc2_ !== param1)
         {
            this._1301532860backgroundScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapContent() : BitmapData
      {
         return this._760019018bitmapContent;
      }
      
      public function set bitmapContent(param1:BitmapData) : void
      {
         var _loc2_:Object = this._760019018bitmapContent;
         if(_loc2_ !== param1)
         {
            this._760019018bitmapContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapContent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDisplayPosX() : int
      {
         return this._810915913bitmapDisplayPosX;
      }
      
      public function set bitmapDisplayPosX(param1:int) : void
      {
         var _loc2_:Object = this._810915913bitmapDisplayPosX;
         if(_loc2_ !== param1)
         {
            this._810915913bitmapDisplayPosX = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDisplayPosX",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDisplayPosY() : int
      {
         return this._810915912bitmapDisplayPosY;
      }
      
      public function set bitmapDisplayPosY(param1:int) : void
      {
         var _loc2_:Object = this._810915912bitmapDisplayPosY;
         if(_loc2_ !== param1)
         {
            this._810915912bitmapDisplayPosY = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDisplayPosY",_loc2_,param1));
            }
         }
      }
   }
}

