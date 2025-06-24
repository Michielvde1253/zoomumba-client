package custom.tabs
{
   import components.image.BackgroundImage;
   import custom.loader.Prealoder;
   import flash.display.BitmapData;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class TabIcon extends Group
   {
      private var _1388777169bitmap:BitmapImage;
      
      private var _1113514890preloader:Prealoder;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TabIcon()
      {
         super();
         this.width = 32;
         this.height = 32;
         this.mxmlContent = [this._TabIcon_BackgroundImage1_c(),this._TabIcon_Prealoder1_i(),this._TabIcon_BitmapImage1_i()];
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
      
      public function set bitmapSource(param1:BitmapData) : void
      {
         if(param1)
         {
            this.bitmap.source = param1;
            this.removeElement(this.preloader);
         }
      }
      
      private function _TabIcon_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.32;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TabIcon_Prealoder1_i() : Prealoder
      {
         var _loc1_:Prealoder = null;
         _loc1_ = new Prealoder();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.currentState = "small";
         _loc1_.id = "preloader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloader = _loc1_;
         BindingManager.executeBindings(this,"preloader",this.preloader);
         return _loc1_;
      }
      
      private function _TabIcon_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"bitmap");
         this.bitmap = _loc1_;
         BindingManager.executeBindings(this,"bitmap",this.bitmap);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmap() : BitmapImage
      {
         return this._1388777169bitmap;
      }
      
      public function set bitmap(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1388777169bitmap;
         if(_loc2_ !== param1)
         {
            this._1388777169bitmap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloader() : Prealoder
      {
         return this._1113514890preloader;
      }
      
      public function set preloader(param1:Prealoder) : void
      {
         var _loc2_:Object = this._1113514890preloader;
         if(_loc2_ !== param1)
         {
            this._1113514890preloader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloader",_loc2_,param1));
            }
         }
      }
   }
}

