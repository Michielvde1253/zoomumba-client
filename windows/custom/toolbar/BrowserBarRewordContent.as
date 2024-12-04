package windows.custom.toolbar
{
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
   import mx.binding.*;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class BrowserBarRewordContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1310202826expIcon:BitmapImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _847268939itemIconContainer:SpriteVisualElement;
      
      private var _827682498rewardAmmount:Text;
      
      private var _1363753409rewardTextEnd:GradientText;
      
      private var _588891962rewardTextStart:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_XpIcon_1230327042:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BrowserBarRewordContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_XpIcon_1230327042 = BrowserBarRewordContent__embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._BrowserBarRewordContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_toolbar_BrowserBarRewordContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BrowserBarRewordContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._BrowserBarRewordContent_InnerGroup1_c(),this._BrowserBarRewordContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BrowserBarRewordContent._watcherSetupUtil = param1;
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
      
      private function _BrowserBarRewordContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._BrowserBarRewordContent_GradientText1_i(),this._BrowserBarRewordContent_Text1_i(),this._BrowserBarRewordContent_BitmapImage1_i(),this._BrowserBarRewordContent_SpriteVisualElement1_i(),this._BrowserBarRewordContent_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.mouseEnabled = false;
         _loc1_.x = 100;
         _loc1_.y = 126;
         _loc1_.textAlign = "center";
         _loc1_.width = 250;
         _loc1_.id = "rewardTextStart";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardTextStart = _loc1_;
         BindingManager.executeBindings(this,"rewardTextStart",this.rewardTextStart);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.x = 143;
         _loc1_.y = 182;
         _loc1_.width = 100;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","right");
         _loc1_.id = "rewardAmmount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardAmmount = _loc1_;
         BindingManager.executeBindings(this,"rewardAmmount",this.rewardAmmount);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 247;
         _loc1_.y = 178;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         _loc1_.initialized(this,"expIcon");
         this.expIcon = _loc1_;
         BindingManager.executeBindings(this,"expIcon",this.expIcon);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 225;
         _loc1_.y = 230;
         _loc1_.initialized(this,"itemIconContainer");
         this.itemIconContainer = _loc1_;
         BindingManager.executeBindings(this,"itemIconContainer",this.itemIconContainer);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.mouseEnabled = false;
         _loc1_.x = 100;
         _loc1_.y = 200;
         _loc1_.textAlign = "center";
         _loc1_.width = 250;
         _loc1_.height = 80;
         _loc1_.id = "rewardTextEnd";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardTextEnd = _loc1_;
         BindingManager.executeBindings(this,"rewardTextEnd",this.rewardTextEnd);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BrowserBarRewordContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderExclamationMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _BrowserBarRewordContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get expIcon() : BitmapImage
      {
         return this._1310202826expIcon;
      }
      
      public function set expIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1310202826expIcon;
         if(_loc2_ !== param1)
         {
            this._1310202826expIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expIcon",_loc2_,param1));
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
      public function get itemIconContainer() : SpriteVisualElement
      {
         return this._847268939itemIconContainer;
      }
      
      public function set itemIconContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._847268939itemIconContainer;
         if(_loc2_ !== param1)
         {
            this._847268939itemIconContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemIconContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardAmmount() : Text
      {
         return this._827682498rewardAmmount;
      }
      
      public function set rewardAmmount(param1:Text) : void
      {
         var _loc2_:Object = this._827682498rewardAmmount;
         if(_loc2_ !== param1)
         {
            this._827682498rewardAmmount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardAmmount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardTextEnd() : GradientText
      {
         return this._1363753409rewardTextEnd;
      }
      
      public function set rewardTextEnd(param1:GradientText) : void
      {
         var _loc2_:Object = this._1363753409rewardTextEnd;
         if(_loc2_ !== param1)
         {
            this._1363753409rewardTextEnd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardTextEnd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardTextStart() : GradientText
      {
         return this._588891962rewardTextStart;
      }
      
      public function set rewardTextStart(param1:GradientText) : void
      {
         var _loc2_:Object = this._588891962rewardTextStart;
         if(_loc2_ !== param1)
         {
            this._588891962rewardTextStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardTextStart",_loc2_,param1));
            }
         }
      }
   }
}

