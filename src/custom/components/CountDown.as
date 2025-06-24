package custom.components
{
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class CountDown extends Group
   {
      private var _1474884516_image:Image;
      
      private var _1332194002background:BitmapImage;
      
      private var _450399998countdownText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_ClockRedIcon_694477795:Class = CountDown__embed_mxml__general_Decorations_swf_ClockRedIcon_694477795;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRect9SPR_405693755:Class = CountDown__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRect9SPR_405693755;
      
      public function CountDown()
      {
         super();
         this.mxmlContent = [this._CountDown_BitmapImage1_i(),this._CountDown_Image1_i(),this._CountDown_GradientText1_i()];
         this.addEventListener("creationComplete",this.___CountDown_Group1_creationComplete);
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
      
      protected function group1_creationCompleteHandler(param1:FlexEvent) : void
      {
         this.background.width = 100;
      }
      
      private function _CountDown_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRect9SPR_405693755;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _CountDown_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.9;
         _loc1_.scaleY = 0.9;
         _loc1_.x = 4;
         _loc1_.y = 3;
         _loc1_.smoothBitmapContent = true;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_ClockRedIcon_694477795;
         _loc1_.id = "_image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._image = _loc1_;
         BindingManager.executeBindings(this,"_image",this._image);
         return _loc1_;
      }
      
      private function _CountDown_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "10:00:00";
         _loc1_.x = 20;
         _loc1_.id = "countdownText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdownText = _loc1_;
         BindingManager.executeBindings(this,"countdownText",this.countdownText);
         return _loc1_;
      }
      
      public function ___CountDown_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.group1_creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _image() : Image
      {
         return this._1474884516_image;
      }
      
      public function set _image(param1:Image) : void
      {
         var _loc2_:Object = this._1474884516_image;
         if(_loc2_ !== param1)
         {
            this._1474884516_image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdownText() : GradientText
      {
         return this._450399998countdownText;
      }
      
      public function set countdownText(param1:GradientText) : void
      {
         var _loc2_:Object = this._450399998countdownText;
         if(_loc2_ !== param1)
         {
            this._450399998countdownText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdownText",_loc2_,param1));
            }
         }
      }
   }
}

