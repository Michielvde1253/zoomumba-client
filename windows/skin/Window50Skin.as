package windows.skin
{
   import buttons.simpleButton.CancelButtonSkin;
   import buttons.simpleButton.CloseButtonSkin;
   import buttons.simpleButton.OKButtonSkin;
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
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.supportClasses.Skin;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import windows.core.AbstractWindow;
   import windows.core.LoaderImage;
   import windows.core.WindowConstants;
   import windows.core.tabs.TabsContainer;
   
   use namespace mx_internal;
   
   public class Window50Skin extends Skin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _Window50Skin_BitmapFill1:BitmapFill;
      
      public var _Window50Skin_Group2:Group;
      
      public var _Window50Skin_Group3:Group;
      
      public var _Window50Skin_Group4:Group;
      
      public var _Window50Skin_HGroup2:HGroup;
      
      private var _728301711borderImage:BitmapImage;
      
      private var _1990131276cancelButton:Button;
      
      private var _312699062closeButton:Button;
      
      private var _571023705dynamicTitle:UIComponent;
      
      private var _601374936dynamicTitleContainer:HGroup;
      
      private var _1221270899header:LoaderImage;
      
      private var _1417404107innerContainer:Group;
      
      private var _1463054684modalLayer:SpriteVisualElement;
      
      private var _1641788370okButton:Button;
      
      private var _1399694918outerContainer:Group;
      
      private var _876869253preloaderImage:Image;
      
      private var _422332067tabsContainer:TabsContainer;
      
      private var _1196685478viewport:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LoaderProgress_1407024497:Class;
      
      private var _embed_mxml__windows_Tabs_swf_TabsBorder50_512993442:Class;
      
      private var _embed_mxml__general_Patterns_swf_TileBG4_1819943806:Class;
      
      private var _embed_mxml__windows_Borders_swf_Border50_993269606:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:AbstractWindow;
      
      public function Window50Skin()
      {
         var watchers:Array;
         var _Window50Skin_Group3_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497 = Window50Skin__embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         this._embed_mxml__windows_Tabs_swf_TabsBorder50_512993442 = Window50Skin__embed_mxml__windows_Tabs_swf_TabsBorder50_512993442;
         this._embed_mxml__general_Patterns_swf_TileBG4_1819943806 = Window50Skin__embed_mxml__general_Patterns_swf_TileBG4_1819943806;
         this._embed_mxml__windows_Borders_swf_Border50_993269606 = Window50Skin__embed_mxml__windows_Borders_swf_Border50_993269606;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._Window50Skin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_skin_Window50SkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return Window50Skin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._Window50Skin_SpriteVisualElement1_i(),this._Window50Skin_Group1_i()];
         this.currentState = "default";
         this.addEventListener("initialize",this.___Window50Skin_Skin1_initialize);
         _Window50Skin_Group3_factory = new DeferredInstanceFromFunction(this._Window50Skin_Group3_i);
         states = [new State({
            "name":"default",
            "overrides":[]
         }),new State({
            "name":"bg5",
            "overrides":[]
         }),new State({
            "name":"tab",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_Window50Skin_Group3_factory,
               "destination":"viewport",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_Window50Skin_Group2"]
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
         Window50Skin._watcherSetupUtil = param1;
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
      
      protected function skin1_creationCompleteHandler(param1:FlexEvent) : void
      {
         this.hostComponent.verticalCenter = 20;
      }
      
      private function _Window50Skin_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"modalLayer");
         this.modalLayer = _loc1_;
         BindingManager.executeBindings(this,"modalLayer",this.modalLayer);
         return _loc1_;
      }
      
      private function _Window50Skin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._Window50Skin_Group2_i(),this._Window50Skin_Group5_i(),this._Window50Skin_BitmapImage2_i(),this._Window50Skin_Group6_i(),this._Window50Skin_HGroup1_i(),this._Window50Skin_Image1_i(),this._Window50Skin_Button1_i(),this._Window50Skin_HGroup2_i(),this._Window50Skin_HGroup3_c()];
         _loc1_.id = "viewport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.viewport = _loc1_;
         BindingManager.executeBindings(this,"viewport",this.viewport);
         return _loc1_;
      }
      
      private function _Window50Skin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._Window50Skin_Path1_c()];
         _loc1_.id = "_Window50Skin_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._Window50Skin_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_Window50Skin_Group2",this._Window50Skin_Group2);
         return _loc1_;
      }
      
      private function _Window50Skin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M637 37 655 379 631 438 424 456 36 449 0 316 19 55 55 16 596 0 637 37";
         _loc1_.fill = this._Window50Skin_BitmapFill1_i();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Window50Skin_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         _loc1_.scaleX = 1;
         _loc1_.scaleY = 1;
         this._Window50Skin_BitmapFill1 = _loc1_;
         BindingManager.executeBindings(this,"_Window50Skin_BitmapFill1",this._Window50Skin_BitmapFill1);
         return _loc1_;
      }
      
      private function _Window50Skin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._Window50Skin_Group4_i(),this._Window50Skin_BitmapImage1_c(),this._Window50Skin_TabsContainer1_i()];
         _loc1_.id = "_Window50Skin_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._Window50Skin_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_Window50Skin_Group3",this._Window50Skin_Group3);
         return _loc1_;
      }
      
      private function _Window50Skin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.y = 3;
         _loc1_.mxmlContent = [this._Window50Skin_Path2_c()];
         _loc1_.id = "_Window50Skin_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._Window50Skin_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_Window50Skin_Group4",this._Window50Skin_Group4);
         return _loc1_;
      }
      
      private function _Window50Skin_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M637 37 655 379 631 438 424 456 36 449 0 316 19 55 55 16 596 0 637 37";
         _loc1_.fill = this._Window50Skin_BitmapFill2_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Window50Skin_BitmapFill2_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         _loc1_.scaleX = 1;
         _loc1_.scaleY = 1;
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG4_1819943806;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Window50Skin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__windows_Tabs_swf_TabsBorder50_512993442;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Window50Skin_TabsContainer1_i() : TabsContainer
      {
         var _loc1_:TabsContainer = new TabsContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "tabsContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabsContainer = _loc1_;
         BindingManager.executeBindings(this,"tabsContainer",this.tabsContainer);
         return _loc1_;
      }
      
      private function _Window50Skin_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "innerContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.innerContainer = _loc1_;
         BindingManager.executeBindings(this,"innerContainer",this.innerContainer);
         return _loc1_;
      }
      
      private function _Window50Skin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.source = this._embed_mxml__windows_Borders_swf_Border50_993269606;
         _loc1_.initialized(this,"borderImage");
         this.borderImage = _loc1_;
         BindingManager.executeBindings(this,"borderImage",this.borderImage);
         return _loc1_;
      }
      
      private function _Window50Skin_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "outerContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outerContainer = _loc1_;
         BindingManager.executeBindings(this,"outerContainer",this.outerContainer);
         return _loc1_;
      }
      
      private function _Window50Skin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "top";
         _loc1_.mxmlContent = [this._Window50Skin_UIComponent1_i()];
         _loc1_.id = "dynamicTitleContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dynamicTitleContainer = _loc1_;
         BindingManager.executeBindings(this,"dynamicTitleContainer",this.dynamicTitleContainer);
         return _loc1_;
      }
      
      private function _Window50Skin_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.height = 90;
         _loc1_.id = "dynamicTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dynamicTitle = _loc1_;
         BindingManager.executeBindings(this,"dynamicTitle",this.dynamicTitle);
         return _loc1_;
      }
      
      private function _Window50Skin_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LoaderProgress_1407024497;
         _loc1_.id = "preloaderImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloaderImage = _loc1_;
         BindingManager.executeBindings(this,"preloaderImage",this.preloaderImage);
         return _loc1_;
      }
      
      private function _Window50Skin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 616;
         _loc1_.y = 21;
         _loc1_.setStyle("skinClass",CloseButtonSkin);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      private function _Window50Skin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "top";
         _loc1_.mxmlContent = [this._Window50Skin_LoaderImage1_i()];
         _loc1_.id = "_Window50Skin_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._Window50Skin_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_Window50Skin_HGroup2",this._Window50Skin_HGroup2);
         return _loc1_;
      }
      
      private function _Window50Skin_LoaderImage1_i() : LoaderImage
      {
         var _loc1_:LoaderImage = new LoaderImage();
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _Window50Skin_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 456;
         _loc1_.mxmlContent = [this._Window50Skin_Button2_i(),this._Window50Skin_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _Window50Skin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",CancelButtonSkin);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      private function _Window50Skin_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",OKButtonSkin);
         _loc1_.id = "okButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.okButton = _loc1_;
         BindingManager.executeBindings(this,"okButton",this.okButton);
         return _loc1_;
      }
      
      public function ___Window50Skin_Skin1_initialize(param1:FlexEvent) : void
      {
         this.skin1_creationCompleteHandler(param1);
      }
      
      private function _Window50Skin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return WindowConstants.WIDTH_SKIN_50;
         },null,"viewport.width");
         result[1] = new Binding(this,function():Number
         {
            return WindowConstants.HEIGHT_SKIN_50;
         },null,"viewport.height");
         result[2] = new Binding(this,function():Object
         {
            return hostComponent.backgroundPattern;
         },null,"_Window50Skin_BitmapFill1.source");
         result[3] = new Binding(this,function():Object
         {
            return hostComponent.tabDistanceFromTop;
         },null,"_Window50Skin_Group3.verticalCenter");
         result[4] = new Binding(this,function():Number
         {
            return hostComponent.tabDistanceFromTop;
         },null,"_Window50Skin_Group4.verticalScrollPosition");
         result[5] = new Binding(this,function():Object
         {
            return hostComponent.tabDistanceFromLeft;
         },null,"tabsContainer.left");
         result[6] = new Binding(this,function():Number
         {
            return -header.height / 8;
         },null,"_Window50Skin_HGroup2.y");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get borderImage() : BitmapImage
      {
         return this._728301711borderImage;
      }
      
      public function set borderImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._728301711borderImage;
         if(_loc2_ !== param1)
         {
            this._728301711borderImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dynamicTitle() : UIComponent
      {
         return this._571023705dynamicTitle;
      }
      
      public function set dynamicTitle(param1:UIComponent) : void
      {
         var _loc2_:Object = this._571023705dynamicTitle;
         if(_loc2_ !== param1)
         {
            this._571023705dynamicTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dynamicTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dynamicTitleContainer() : HGroup
      {
         return this._601374936dynamicTitleContainer;
      }
      
      public function set dynamicTitleContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._601374936dynamicTitleContainer;
         if(_loc2_ !== param1)
         {
            this._601374936dynamicTitleContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dynamicTitleContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : LoaderImage
      {
         return this._1221270899header;
      }
      
      public function set header(param1:LoaderImage) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get innerContainer() : Group
      {
         return this._1417404107innerContainer;
      }
      
      public function set innerContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1417404107innerContainer;
         if(_loc2_ !== param1)
         {
            this._1417404107innerContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"innerContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get modalLayer() : SpriteVisualElement
      {
         return this._1463054684modalLayer;
      }
      
      public function set modalLayer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1463054684modalLayer;
         if(_loc2_ !== param1)
         {
            this._1463054684modalLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modalLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get okButton() : Button
      {
         return this._1641788370okButton;
      }
      
      public function set okButton(param1:Button) : void
      {
         var _loc2_:Object = this._1641788370okButton;
         if(_loc2_ !== param1)
         {
            this._1641788370okButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"okButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerContainer() : Group
      {
         return this._1399694918outerContainer;
      }
      
      public function set outerContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1399694918outerContainer;
         if(_loc2_ !== param1)
         {
            this._1399694918outerContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloaderImage() : Image
      {
         return this._876869253preloaderImage;
      }
      
      public function set preloaderImage(param1:Image) : void
      {
         var _loc2_:Object = this._876869253preloaderImage;
         if(_loc2_ !== param1)
         {
            this._876869253preloaderImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloaderImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabsContainer() : TabsContainer
      {
         return this._422332067tabsContainer;
      }
      
      public function set tabsContainer(param1:TabsContainer) : void
      {
         var _loc2_:Object = this._422332067tabsContainer;
         if(_loc2_ !== param1)
         {
            this._422332067tabsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabsContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewport() : Group
      {
         return this._1196685478viewport;
      }
      
      public function set viewport(param1:Group) : void
      {
         var _loc2_:Object = this._1196685478viewport;
         if(_loc2_ !== param1)
         {
            this._1196685478viewport = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewport",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : AbstractWindow
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:AbstractWindow) : void
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

