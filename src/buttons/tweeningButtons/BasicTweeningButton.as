package buttons.tweeningButtons
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class BasicTweeningButton extends Group
   {
      private var _1893625931backgroundIMG:SpriteVisualElement;
      
      private var _697757034bottomContainer:SpriteVisualElement;
      
      private var _1841816962buttonDecoration:SpriteVisualElement;
      
      private var _358215371buttonIcon:SpriteVisualElement;
      
      private var _1559664047extraContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var active:Boolean = true;
      
      private var _backImage:Sprite = null;
      
      private var _upImage:Sprite = null;
      
      private var _overImage:Sprite = null;
      
      private var _scaleX:Number;
      
      private var _scaleY:Number;
      
      private var buttonDecorations:Vector.<ButtonDecoration>;
      
      public function BasicTweeningButton()
      {
         super();
         this.mxmlContent = [this._BasicTweeningButton_SpriteVisualElement1_i(),this._BasicTweeningButton_SpriteVisualElement2_i(),this._BasicTweeningButton_SpriteVisualElement3_i(),this._BasicTweeningButton_SpriteVisualElement4_i(),this._BasicTweeningButton_SpriteVisualElement5_i(),this._BasicTweeningButton_SpriteVisualElement6_i()];
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
      
      protected function handleButtonClick(param1:MouseEvent) : void
      {
         if(this.active)
         {
            dispatchEvent(param1);
         }
      }
      
      protected function handleMouseOver(param1:MouseEvent) : void
      {
         if(this.active && this._overImage != null && this._upImage != null)
         {
            this._overImage.width = this._upImage.width;
            this._overImage.height = this._upImage.height;
            this._scaleX = this._overImage.scaleX;
            this._scaleY = this._overImage.scaleY;
            this.buttonIcon.removeChildAt(0);
            this.buttonIcon.addChild(this._overImage);
            TweenLite.to(this._overImage,0.18,{
               "scaleX":1,
               "scaleY":1,
               "ease":Cubic.easeOut,
               "onComplete":this.maximizeComplete
            });
         }
      }
      
      protected function handleMouseOut(param1:MouseEvent) : void
      {
         if(this.active && this._overImage != null && this._upImage != null)
         {
            TweenLite.to(this._overImage,0.18,{
               "scaleX":this._scaleX,
               "scaleY":this._scaleY,
               "ease":Cubic.easeOut,
               "onComplete":this.minimizeComplete
            });
         }
      }
      
      private function maximizeComplete() : void
      {
         this.buttonIcon.removeChildAt(0);
         this.buttonIcon.addChild(this._overImage);
      }
      
      private function minimizeComplete() : void
      {
         this.buttonIcon.removeChildAt(0);
         this.buttonIcon.addChild(this._upImage);
      }
      
      public function set backgroundSkin(param1:Sprite) : void
      {
         this._backImage = param1;
         this.backgroundIMG.addChild(this._backImage);
         this.width = param1.width;
         this.height = param1.height;
      }
      
      public function get backgroundSkin() : Sprite
      {
         return this._backImage;
      }
      
      public function set overSkin(param1:Sprite) : void
      {
         this._overImage = param1;
      }
      
      public function set upSkin(param1:Sprite) : void
      {
         this._upImage = param1;
         if(this.buttonIcon.numChildren > 0)
         {
            this.buttonIcon.removeChildAt(0);
         }
         this.buttonIcon.addChild(this._upImage);
      }
      
      public function set buttonAlpha(param1:Number) : void
      {
         this.buttonIcon.alpha = param1;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.active = param1;
         this.toggleButtonEnabled();
      }
      
      private function toggleButtonEnabled() : void
      {
         if(this.active)
         {
         }
      }
      
      public function drawHitArea(param1:int) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16763904,0);
         _loc2_.graphics.drawCircle(0,0,param1);
         hitArea.addChild(_loc2_);
      }
      
      public function defineDecoration(param1:Array) : void
      {
         if(!this.buttonDecorations)
         {
            this.buttonDecorations = new Vector.<ButtonDecoration>();
         }
         var _loc2_:ButtonDecoration = new ButtonDecoration();
         _loc2_.DECORATION_NAME = param1[0];
         _loc2_.DECORATION_SKIN = param1[1];
         this.buttonDecorations.push(_loc2_);
      }
      
      public function showDecoration(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonDecorations.length)
         {
            if(this.buttonDecorations[_loc2_].DECORATION_NAME == param1)
            {
               this.buttonDecoration.addChild(this.buttonDecorations[_loc2_].DECORATION_SKIN);
            }
            _loc2_++;
         }
      }
      
      public function removeAllDecorations() : void
      {
         while(this.buttonDecoration.numChildren)
         {
            this.buttonDecoration.removeChildAt(0);
         }
      }
      
      public function hideButtonGraphics() : void
      {
         this.backgroundIMG.visible = false;
         this.buttonIcon.visible = false;
         this.buttonDecoration.visible = false;
         hitArea.visible = false;
      }
      
      public function showButtonGraphics() : void
      {
         this.backgroundIMG.visible = true;
         this.buttonIcon.visible = true;
         this.buttonDecoration.visible = true;
         hitArea.visible = true;
      }
      
      public function removeDecoration(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonDecorations.length)
         {
            if(this.buttonDecorations[_loc2_].DECORATION_NAME == param1)
            {
               if(this.buttonDecoration.contains(this.buttonDecorations[_loc2_].DECORATION_SKIN))
               {
                  this.buttonDecoration.removeChild(this.buttonDecorations[_loc2_].DECORATION_SKIN);
               }
            }
            _loc2_++;
         }
      }
      
      private function _BasicTweeningButton_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"backgroundIMG");
         this.backgroundIMG = _loc1_;
         BindingManager.executeBindings(this,"backgroundIMG",this.backgroundIMG);
         return _loc1_;
      }
      
      private function _BasicTweeningButton_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"bottomContainer");
         this.bottomContainer = _loc1_;
         BindingManager.executeBindings(this,"bottomContainer",this.bottomContainer);
         return _loc1_;
      }
      
      private function _BasicTweeningButton_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"buttonIcon");
         this.buttonIcon = _loc1_;
         BindingManager.executeBindings(this,"buttonIcon",this.buttonIcon);
         return _loc1_;
      }
      
      private function _BasicTweeningButton_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"buttonDecoration");
         this.buttonDecoration = _loc1_;
         BindingManager.executeBindings(this,"buttonDecoration",this.buttonDecoration);
         return _loc1_;
      }
      
      private function _BasicTweeningButton_SpriteVisualElement5_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("mouseOver",this.__hitArea_mouseOver);
         _loc1_.addEventListener("mouseOut",this.__hitArea_mouseOut);
         _loc1_.initialized(this,"hitArea");
         hitArea = _loc1_;
         BindingManager.executeBindings(this,"hitArea",hitArea);
         return _loc1_;
      }
      
      public function __hitArea_mouseOver(param1:MouseEvent) : void
      {
         this.handleMouseOver(param1);
      }
      
      public function __hitArea_mouseOut(param1:MouseEvent) : void
      {
         this.handleMouseOut(param1);
      }
      
      private function _BasicTweeningButton_SpriteVisualElement6_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"extraContainer");
         this.extraContainer = _loc1_;
         BindingManager.executeBindings(this,"extraContainer",this.extraContainer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundIMG() : SpriteVisualElement
      {
         return this._1893625931backgroundIMG;
      }
      
      public function set backgroundIMG(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1893625931backgroundIMG;
         if(_loc2_ !== param1)
         {
            this._1893625931backgroundIMG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundIMG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomContainer() : SpriteVisualElement
      {
         return this._697757034bottomContainer;
      }
      
      public function set bottomContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._697757034bottomContainer;
         if(_loc2_ !== param1)
         {
            this._697757034bottomContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonDecoration() : SpriteVisualElement
      {
         return this._1841816962buttonDecoration;
      }
      
      public function set buttonDecoration(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1841816962buttonDecoration;
         if(_loc2_ !== param1)
         {
            this._1841816962buttonDecoration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonDecoration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonIcon() : SpriteVisualElement
      {
         return this._358215371buttonIcon;
      }
      
      public function set buttonIcon(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._358215371buttonIcon;
         if(_loc2_ !== param1)
         {
            this._358215371buttonIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonIcon",_loc2_,param1));
            }
         }
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
   }
}

