package com.bigpoint.zoomumba.view.windows.events.frogEvent.components
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.BitmapData;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class FrogStepItem extends Group
   {
      private var _1324487151stepImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _value:uint;
      
      private var _active:Boolean = false;
      
      private var _current:Boolean = false;
      
      public function FrogStepItem()
      {
         super();
         this.mouseEnabledWhereTransparent = false;
         this.mxmlContent = [this._FrogStepItem_BitmapImage1_i()];
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
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
         this.activeCheck();
      }
      
      public function get current() : Boolean
      {
         return this._current;
      }
      
      public function set current(param1:Boolean) : void
      {
         this._current = param1;
         this.activeCheck();
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.stepImage.source = param1;
         this.activeCheck();
      }
      
      public function set value(param1:uint) : void
      {
         this._value = param1;
      }
      
      public function get value() : uint
      {
         return this._value;
      }
      
      private function activeCheck() : void
      {
         if(Boolean(this.stepImage) && Boolean(this.stepImage.source))
         {
            TweenLite.killTweensOf(this.stepImage);
            if(this._active)
            {
               this.stepImage.alpha = 1;
            }
            else if(this._current)
            {
               this.stepImage.alpha = 0;
               TweenMax.to(this.stepImage,1,{
                  "alpha":1,
                  "repeat":-1,
                  "yoyo":true
               });
            }
            else
            {
               this.stepImage.alpha = 0.5;
            }
         }
      }
      
      private function _FrogStepItem_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"stepImage");
         this.stepImage = _loc1_;
         BindingManager.executeBindings(this,"stepImage",this.stepImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get stepImage() : BitmapImage
      {
         return this._1324487151stepImage;
      }
      
      public function set stepImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1324487151stepImage;
         if(_loc2_ !== param1)
         {
            this._1324487151stepImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stepImage",_loc2_,param1));
            }
         }
      }
   }
}
