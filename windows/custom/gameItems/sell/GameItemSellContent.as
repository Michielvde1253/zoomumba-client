package windows.custom.gameItems.sell
{
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.stepper.NumericStepperAmmountSkin;
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.NumericStepper;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderIconBackgroundSkin;
   
   use namespace mx_internal;
   
   public class GameItemSellContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _95504459childIcon:BitmapImage;
      
      private var _94851343count:Counter;
      
      private var _279521806countSelector:NumericStepper;
      
      private var _665008667femaleIcon:BitmapImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _1177184812itemIcon:SpriteVisualElement;
      
      private var _68806694maleIcon:BitmapImage;
      
      private var _954925063message:StandardText;
      
      private var _1176951407priceTag:LabelDisplay;
      
      private var _1862210697windowIcon:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_CardIcoSexC_2090016563:Class;
      
      private var _embed_mxml__components_ComponentIcons_swf_CardIcoSexF_2090016566:Class;
      
      private var _embed_mxml__components_ComponentIcons_swf_CardIcoSexM_2090016573:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GameItemSellContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentIcons_swf_CardIcoSexC_2090016563 = GameItemSellContent__embed_mxml__components_ComponentIcons_swf_CardIcoSexC_2090016563;
         this._embed_mxml__components_ComponentIcons_swf_CardIcoSexF_2090016566 = GameItemSellContent__embed_mxml__components_ComponentIcons_swf_CardIcoSexF_2090016566;
         this._embed_mxml__components_ComponentIcons_swf_CardIcoSexM_2090016573 = GameItemSellContent__embed_mxml__components_ComponentIcons_swf_CardIcoSexM_2090016573;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GameItemSellContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_gameItems_sell_GameItemSellContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GameItemSellContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._GameItemSellContent_InnerGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GameItemSellContent._watcherSetupUtil = param1;
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
      
      public function set sex(param1:String) : void
      {
         this.maleIcon.visible = false;
         this.femaleIcon.visible = false;
         this.childIcon.visible = false;
         switch(param1)
         {
            case "none":
               break;
            case "male":
               this.maleIcon.visible = true;
               break;
            case "female":
               this.femaleIcon.visible = true;
               break;
            case "child":
               this.childIcon.visible = true;
         }
      }
      
      private function _GameItemSellContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._GameItemSellContent_StandardText1_i(),this._GameItemSellContent_Group2_c(),this._GameItemSellContent_VGroup1_c(),this._GameItemSellContent_WindowHeader1_i(),this._GameItemSellContent_Image1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GameItemSellContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.top = 100;
         _loc1_.left = 150;
         _loc1_.text = "Wie viele mochtest Du verkaufen?";
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _GameItemSellContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 100;
         _loc1_.verticalCenter = 40;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.maxWidth = 80;
         _loc1_.maxHeight = 80;
         _loc1_.mxmlContent = [this._GameItemSellContent_SpriteVisualElement1_i(),this._GameItemSellContent_Counter1_i(),this._GameItemSellContent_BitmapImage1_i(),this._GameItemSellContent_BitmapImage2_i(),this._GameItemSellContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GameItemSellContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"itemIcon");
         this.itemIcon = _loc1_;
         BindingManager.executeBindings(this,"itemIcon",this.itemIcon);
         return _loc1_;
      }
      
      private function _GameItemSellContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.top = -15;
         _loc1_.left = -15;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "count";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.count = _loc1_;
         BindingManager.executeBindings(this,"count",this.count);
         return _loc1_;
      }
      
      private function _GameItemSellContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -30;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_CardIcoSexM_2090016573;
         _loc1_.initialized(this,"maleIcon");
         this.maleIcon = _loc1_;
         BindingManager.executeBindings(this,"maleIcon",this.maleIcon);
         return _loc1_;
      }
      
      private function _GameItemSellContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -30;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_CardIcoSexF_2090016566;
         _loc1_.initialized(this,"femaleIcon");
         this.femaleIcon = _loc1_;
         BindingManager.executeBindings(this,"femaleIcon",this.femaleIcon);
         return _loc1_;
      }
      
      private function _GameItemSellContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -30;
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_CardIcoSexC_2090016563;
         _loc1_.initialized(this,"childIcon");
         this.childIcon = _loc1_;
         BindingManager.executeBindings(this,"childIcon",this.childIcon);
         return _loc1_;
      }
      
      private function _GameItemSellContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.right = 100;
         _loc1_.verticalCenter = 40;
         _loc1_.mxmlContent = [this._GameItemSellContent_LabelDisplay1_i(),this._GameItemSellContent_NumericStepper1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GameItemSellContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.value = 100;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "priceTag";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.priceTag = _loc1_;
         BindingManager.executeBindings(this,"priceTag",this.priceTag);
         return _loc1_;
      }
      
      private function _GameItemSellContent_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.id = "countSelector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countSelector = _loc1_;
         BindingManager.executeBindings(this,"countSelector",this.countSelector);
         return _loc1_;
      }
      
      private function _GameItemSellContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.text = "Verkaufen";
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderIconBackgroundSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _GameItemSellContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 38;
         _loc1_.y = 48;
         _loc1_.id = "windowIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.windowIcon = _loc1_;
         BindingManager.executeBindings(this,"windowIcon",this.windowIcon);
         return _loc1_;
      }
      
      private function _GameItemSellContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get childIcon() : BitmapImage
      {
         return this._95504459childIcon;
      }
      
      public function set childIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._95504459childIcon;
         if(_loc2_ !== param1)
         {
            this._95504459childIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"childIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get count() : Counter
      {
         return this._94851343count;
      }
      
      public function set count(param1:Counter) : void
      {
         var _loc2_:Object = this._94851343count;
         if(_loc2_ !== param1)
         {
            this._94851343count = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"count",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countSelector() : NumericStepper
      {
         return this._279521806countSelector;
      }
      
      public function set countSelector(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._279521806countSelector;
         if(_loc2_ !== param1)
         {
            this._279521806countSelector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countSelector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get femaleIcon() : BitmapImage
      {
         return this._665008667femaleIcon;
      }
      
      public function set femaleIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._665008667femaleIcon;
         if(_loc2_ !== param1)
         {
            this._665008667femaleIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"femaleIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
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
      public function get itemIcon() : SpriteVisualElement
      {
         return this._1177184812itemIcon;
      }
      
      public function set itemIcon(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1177184812itemIcon;
         if(_loc2_ !== param1)
         {
            this._1177184812itemIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maleIcon() : BitmapImage
      {
         return this._68806694maleIcon;
      }
      
      public function set maleIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._68806694maleIcon;
         if(_loc2_ !== param1)
         {
            this._68806694maleIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maleIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : StandardText
      {
         return this._954925063message;
      }
      
      public function set message(param1:StandardText) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get priceTag() : LabelDisplay
      {
         return this._1176951407priceTag;
      }
      
      public function set priceTag(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1176951407priceTag;
         if(_loc2_ !== param1)
         {
            this._1176951407priceTag = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"priceTag",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowIcon() : Image
      {
         return this._1862210697windowIcon;
      }
      
      public function set windowIcon(param1:Image) : void
      {
         var _loc2_:Object = this._1862210697windowIcon;
         if(_loc2_ !== param1)
         {
            this._1862210697windowIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowIcon",_loc2_,param1));
            }
         }
      }
   }
}

