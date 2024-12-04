package windows.custom.settings.tabs
{
   import buttons.simpleButton.BuyButtonNormalSkin;
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
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class SettingsAccountTabContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1266618688bubbleBitmapImage:BitmapImage;
      
      private var _163334105bubbleText:Text;
      
      private var _1377687758button:Button;
      
      private var _1998129540circleBitmapImage:BitmapImage;
      
      private var _1386223393guyBitmapImage:BitmapImage;
      
      private var _177936123infoText:Text;
      
      private var _2135756891titleText:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SettingsAccountTabContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SettingsAccountTabContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_settings_tabs_SettingsAccountTabContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SettingsAccountTabContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SettingsAccountTabContent_InnerGroup1_c(),this._SettingsAccountTabContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SettingsAccountTabContent._watcherSetupUtil = param1;
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
      
      private function _SettingsAccountTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SettingsAccountTabContent_BitmapImage1_i(),this._SettingsAccountTabContent_BitmapImage2_i(),this._SettingsAccountTabContent_Text1_i(),this._SettingsAccountTabContent_Text2_i(),this._SettingsAccountTabContent_Text3_i(),this._SettingsAccountTabContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 25;
         _loc1_.y = 175;
         _loc1_.initialized(this,"circleBitmapImage");
         this.circleBitmapImage = _loc1_;
         BindingManager.executeBindings(this,"circleBitmapImage",this.circleBitmapImage);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 150;
         _loc1_.y = 150;
         _loc1_.initialized(this,"bubbleBitmapImage");
         this.bubbleBitmapImage = _loc1_;
         BindingManager.executeBindings(this,"bubbleBitmapImage",this.bubbleBitmapImage);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.width = 290;
         _loc1_.height = 80;
         _loc1_.x = 265;
         _loc1_.y = 185;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "bubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleText = _loc1_;
         BindingManager.executeBindings(this,"bubbleText",this.bubbleText);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.horizontalCenter = 10;
         _loc1_.bottom = 170;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "titleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleText = _loc1_;
         BindingManager.executeBindings(this,"titleText",this.titleText);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_Text3_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.width = 250;
         _loc1_.horizontalCenter = 10;
         _loc1_.bottom = 130;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "infoText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoText = _loc1_;
         BindingManager.executeBindings(this,"infoText",this.infoText);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 10;
         _loc1_.bottom = 80;
         _loc1_.setStyle("skinClass",BuyButtonNormalSkin);
         _loc1_.id = "button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.button = _loc1_;
         BindingManager.executeBindings(this,"button",this.button);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SettingsAccountTabContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 10;
         _loc1_.y = 165;
         _loc1_.initialized(this,"guyBitmapImage");
         this.guyBitmapImage = _loc1_;
         BindingManager.executeBindings(this,"guyBitmapImage",this.guyBitmapImage);
         return _loc1_;
      }
      
      private function _SettingsAccountTabContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.BUBBLE_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            bubbleText.setStyle("color",param1);
         },"bubbleText.color");
         result[1] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            titleText.setStyle("color",param1);
         },"titleText.color");
         result[2] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            infoText.setStyle("color",param1);
         },"infoText.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleBitmapImage() : BitmapImage
      {
         return this._1266618688bubbleBitmapImage;
      }
      
      public function set bubbleBitmapImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1266618688bubbleBitmapImage;
         if(_loc2_ !== param1)
         {
            this._1266618688bubbleBitmapImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleBitmapImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleText() : Text
      {
         return this._163334105bubbleText;
      }
      
      public function set bubbleText(param1:Text) : void
      {
         var _loc2_:Object = this._163334105bubbleText;
         if(_loc2_ !== param1)
         {
            this._163334105bubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : Button
      {
         return this._1377687758button;
      }
      
      public function set button(param1:Button) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get circleBitmapImage() : BitmapImage
      {
         return this._1998129540circleBitmapImage;
      }
      
      public function set circleBitmapImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1998129540circleBitmapImage;
         if(_loc2_ !== param1)
         {
            this._1998129540circleBitmapImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circleBitmapImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get guyBitmapImage() : BitmapImage
      {
         return this._1386223393guyBitmapImage;
      }
      
      public function set guyBitmapImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1386223393guyBitmapImage;
         if(_loc2_ !== param1)
         {
            this._1386223393guyBitmapImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"guyBitmapImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoText() : Text
      {
         return this._177936123infoText;
      }
      
      public function set infoText(param1:Text) : void
      {
         var _loc2_:Object = this._177936123infoText;
         if(_loc2_ !== param1)
         {
            this._177936123infoText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleText() : Text
      {
         return this._2135756891titleText;
      }
      
      public function set titleText(param1:Text) : void
      {
         var _loc2_:Object = this._2135756891titleText;
         if(_loc2_ !== param1)
         {
            this._2135756891titleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleText",_loc2_,param1));
            }
         }
      }
   }
}

