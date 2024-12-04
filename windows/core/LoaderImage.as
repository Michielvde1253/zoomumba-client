package windows.core
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class LoaderImage extends Group
   {
      private var _1780559212bitmapImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _filePath:String;
      
      private var _loader:Loader = new Loader();
      
      private var _context:LoaderContext = new LoaderContext(true);
      
      public function LoaderImage()
      {
         super();
         this.mxmlContent = [this._LoaderImage_BitmapImage1_i()];
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
      
      public function set filePath(param1:String) : void
      {
         if(param1 != this._filePath && param1 != null)
         {
            this._filePath = param1;
            this.loadBMP();
         }
      }
      
      public function get filePath() : String
      {
         return this._filePath;
      }
      
      private function loadBMP() : void
      {
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onBMPloaded);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loaderIOErrorHandler);
         this._loader.load(new URLRequest(this.filePath),this._context);
      }
      
      private function loaderIOErrorHandler(param1:Event) : void
      {
      }
      
      private function onBMPloaded(param1:Event) : void
      {
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onBMPloaded);
         dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DONE));
         this.bitmapImage.source = this._loader.content;
      }
      
      public function clean() : void
      {
         this.bitmapImage.source = null;
         this._filePath = null;
      }
      
      private function _LoaderImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"bitmapImage");
         this.bitmapImage = _loc1_;
         BindingManager.executeBindings(this,"bitmapImage",this.bitmapImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImage() : BitmapImage
      {
         return this._1780559212bitmapImage;
      }
      
      public function set bitmapImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1780559212bitmapImage;
         if(_loc2_ !== param1)
         {
            this._1780559212bitmapImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImage",_loc2_,param1));
            }
         }
      }
   }
}

