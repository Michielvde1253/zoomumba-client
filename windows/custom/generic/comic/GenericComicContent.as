package windows.custom.generic.comic
{
   import buttons.skin.sign.ButtonArrowSkin;
   import components.image.BackgroundImage;
   import components.textfield.StandardText;
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
   import general.paginator.Paginator;
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.LoaderImage;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class GenericComicContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _661409372_nextButton:Button;
      
      private var _55158556_prevButton:Button;
      
      private var _1292595405backgroundImage:BackgroundImage;
      
      private var _878707486imageBack:BitmapImage;
      
      private var _1465916018imageFront:BitmapImage;
      
      private var _1801243748imageFront2:BitmapImage;
      
      private var _1801243749imageFront3:BitmapImage;
      
      private var _1969821006imageLoader:LoaderImage;
      
      private var _1011692561paginator:Paginator;
      
      private var _1113514890preloader:Image;
      
      private var _178576515textGradient:GradientText;
      
      private var _1704106100textNormal:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GenericComicContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497 = GenericComicContent__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GenericComicContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_generic_comic_GenericComicContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GenericComicContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._GenericComicContent_InnerGroup1_c(),this._GenericComicContent_OuterGroup1_c()];
         this._GenericComicContent_Paginator1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GenericComicContent._watcherSetupUtil = param1;
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
      
      private function _GenericComicContent_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         _loc1_.hideInsteadOfDisable = true;
         _loc1_.currentPage = 0;
         _loc1_.entriesPerPage = 1;
         _loc1_.maxEntries = 5;
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _GenericComicContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._GenericComicContent_BitmapImage1_i(),this._GenericComicContent_BackgroundImage1_i(),this._GenericComicContent_Image1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericComicContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"imageBack");
         this.imageBack = _loc1_;
         BindingManager.executeBindings(this,"imageBack",this.imageBack);
         return _loc1_;
      }
      
      private function _GenericComicContent_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 1.55;
         _loc1_.top = 60;
         _loc1_.left = -10;
         _loc1_.id = "backgroundImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgroundImage = _loc1_;
         BindingManager.executeBindings(this,"backgroundImage",this.backgroundImage);
         return _loc1_;
      }
      
      private function _GenericComicContent_Image1_i() : Image
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
      
      private function _GenericComicContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._GenericComicContent_LoaderImage1_i(),this._GenericComicContent_BitmapImage2_i(),this._GenericComicContent_BitmapImage3_i(),this._GenericComicContent_BitmapImage4_i(),this._GenericComicContent_Button1_i(),this._GenericComicContent_Button2_i(),this._GenericComicContent_GradientText1_i(),this._GenericComicContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericComicContent_LoaderImage1_i() : LoaderImage
      {
         var _loc1_:LoaderImage = new LoaderImage();
         _loc1_.top = 68;
         _loc1_.horizontalCenter = 48;
         _loc1_.id = "imageLoader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageLoader = _loc1_;
         BindingManager.executeBindings(this,"imageLoader",this.imageLoader);
         return _loc1_;
      }
      
      private function _GenericComicContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"imageFront");
         this.imageFront = _loc1_;
         BindingManager.executeBindings(this,"imageFront",this.imageFront);
         return _loc1_;
      }
      
      private function _GenericComicContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"imageFront2");
         this.imageFront2 = _loc1_;
         BindingManager.executeBindings(this,"imageFront2",this.imageFront2);
         return _loc1_;
      }
      
      private function _GenericComicContent_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"imageFront3");
         this.imageFront3 = _loc1_;
         BindingManager.executeBindings(this,"imageFront3",this.imageFront3);
         return _loc1_;
      }
      
      private function _GenericComicContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 70;
         _loc1_.scaleX = -1;
         _loc1_.bottom = 80;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_prevButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._prevButton = _loc1_;
         BindingManager.executeBindings(this,"_prevButton",this._prevButton);
         return _loc1_;
      }
      
      private function _GenericComicContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 47;
         _loc1_.bottom = 80;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "_nextButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._nextButton = _loc1_;
         BindingManager.executeBindings(this,"_nextButton",this._nextButton);
         return _loc1_;
      }
      
      private function _GenericComicContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "textGradient";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textGradient = _loc1_;
         BindingManager.executeBindings(this,"textGradient",this.textGradient);
         return _loc1_;
      }
      
      private function _GenericComicContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.horizontalCenter = 80;
         _loc1_.verticalCenter = -90;
         _loc1_.id = "textNormal";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textNormal = _loc1_;
         BindingManager.executeBindings(this,"textNormal",this.textNormal);
         return _loc1_;
      }
      
      private function _GenericComicContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"paginator.prevButton","_prevButton");
         result[1] = new Binding(this,null,null,"paginator.nextButton","_nextButton");
         result[2] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_LIGHTER;
         },function(param1:uint):void
         {
            textNormal.setStyle("color",param1);
         },"textNormal.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _nextButton() : Button
      {
         return this._661409372_nextButton;
      }
      
      public function set _nextButton(param1:Button) : void
      {
         var _loc2_:Object = this._661409372_nextButton;
         if(_loc2_ !== param1)
         {
            this._661409372_nextButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_nextButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _prevButton() : Button
      {
         return this._55158556_prevButton;
      }
      
      public function set _prevButton(param1:Button) : void
      {
         var _loc2_:Object = this._55158556_prevButton;
         if(_loc2_ !== param1)
         {
            this._55158556_prevButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prevButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundImage() : BackgroundImage
      {
         return this._1292595405backgroundImage;
      }
      
      public function set backgroundImage(param1:BackgroundImage) : void
      {
         var _loc2_:Object = this._1292595405backgroundImage;
         if(_loc2_ !== param1)
         {
            this._1292595405backgroundImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundImage",_loc2_,param1));
            }
         }
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
      public function get imageFront() : BitmapImage
      {
         return this._1465916018imageFront;
      }
      
      public function set imageFront(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1465916018imageFront;
         if(_loc2_ !== param1)
         {
            this._1465916018imageFront = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageFront",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageFront2() : BitmapImage
      {
         return this._1801243748imageFront2;
      }
      
      public function set imageFront2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1801243748imageFront2;
         if(_loc2_ !== param1)
         {
            this._1801243748imageFront2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageFront2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageFront3() : BitmapImage
      {
         return this._1801243749imageFront3;
      }
      
      public function set imageFront3(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1801243749imageFront3;
         if(_loc2_ !== param1)
         {
            this._1801243749imageFront3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageFront3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageLoader() : LoaderImage
      {
         return this._1969821006imageLoader;
      }
      
      public function set imageLoader(param1:LoaderImage) : void
      {
         var _loc2_:Object = this._1969821006imageLoader;
         if(_loc2_ !== param1)
         {
            this._1969821006imageLoader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageLoader",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paginator() : Paginator
      {
         return this._1011692561paginator;
      }
      
      public function set paginator(param1:Paginator) : void
      {
         var _loc2_:Object = this._1011692561paginator;
         if(_loc2_ !== param1)
         {
            this._1011692561paginator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paginator",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get textGradient() : GradientText
      {
         return this._178576515textGradient;
      }
      
      public function set textGradient(param1:GradientText) : void
      {
         var _loc2_:Object = this._178576515textGradient;
         if(_loc2_ !== param1)
         {
            this._178576515textGradient = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textGradient",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textNormal() : StandardText
      {
         return this._1704106100textNormal;
      }
      
      public function set textNormal(param1:StandardText) : void
      {
         var _loc2_:Object = this._1704106100textNormal;
         if(_loc2_ !== param1)
         {
            this._1704106100textNormal = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textNormal",_loc2_,param1));
            }
         }
      }
   }
}

