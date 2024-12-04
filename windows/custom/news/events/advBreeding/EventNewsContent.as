package windows.custom.news.events.advBreeding
{
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   
   public class EventNewsContent extends Group
   {
      private var _878707486imageBack:BitmapImage;
      
      private var _1923561036newsMessage:GradientText;
      
      private var _1113514890preloader:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class = EventNewsContent__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
      
      public function EventNewsContent()
      {
         super();
         this.mxmlContent = [this._EventNewsContent_InnerGroup1_c()];
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
      
      private function _EventNewsContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._EventNewsContent_BitmapImage1_i(),this._EventNewsContent_GradientText1_i(),this._EventNewsContent_Image1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EventNewsContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"imageBack");
         this.imageBack = _loc1_;
         BindingManager.executeBindings(this,"imageBack",this.imageBack);
         return _loc1_;
      }
      
      private function _EventNewsContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.y = 250;
         _loc1_.fontSize = 12;
         _loc1_.textAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 300;
         _loc1_.id = "newsMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newsMessage = _loc1_;
         BindingManager.executeBindings(this,"newsMessage",this.newsMessage);
         return _loc1_;
      }
      
      private function _EventNewsContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "preloader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloader = _loc1_;
         BindingManager.executeBindings(this,"preloader",this.preloader);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageBack() : BitmapImage
      {
         return this._878707486imageBack;
      }
      
      public function set imageBack(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._878707486imageBack;
         if(_loc2_ !== param1)
         {
            this._878707486imageBack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageBack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newsMessage() : GradientText
      {
         return this._1923561036newsMessage;
      }
      
      public function set newsMessage(param1:GradientText) : void
      {
         var _loc2_:Object = this._1923561036newsMessage;
         if(_loc2_ !== param1)
         {
            this._1923561036newsMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newsMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloader() : Image
      {
         return this._1113514890preloader;
      }
      
      public function set preloader(param1:Image) : void
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

