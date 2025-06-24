package windows.custom.safari
{
   import components.textfield.StandardText;
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
   import spark.components.RadioButton;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class SafariItemContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2109219915assetImage:Image;
      
      private var _1221270899header:WindowHeader;
      
      private var _1177195105itemInfo:StandardText;
      
      private var _31298965radioSex:RadioButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SafariItemContent()
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
         bindings = this._SafariItemContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_safari_SafariItemContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SafariItemContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._SafariItemContent_InnerGroup1_c(),this._SafariItemContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SafariItemContent._watcherSetupUtil = param1;
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
      
      private function _SafariItemContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SafariItemContent_StandardText1_i(),this._SafariItemContent_Image1_i(),this._SafariItemContent_RadioButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SafariItemContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 215;
         _loc1_.y = 120;
         _loc1_.width = 200;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "itemInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemInfo = _loc1_;
         BindingManager.executeBindings(this,"itemInfo",this.itemInfo);
         return _loc1_;
      }
      
      private function _SafariItemContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.8;
         _loc1_.x = 135;
         _loc1_.y = 200;
         _loc1_.id = "assetImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.assetImage = _loc1_;
         BindingManager.executeBindings(this,"assetImage",this.assetImage);
         return _loc1_;
      }
      
      private function _SafariItemContent_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.enabled = false;
         _loc1_.visible = false;
         _loc1_.x = 120;
         _loc1_.y = 265;
         _loc1_.id = "radioSex";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.radioSex = _loc1_;
         BindingManager.executeBindings(this,"radioSex",this.radioSex);
         return _loc1_;
      }
      
      private function _SafariItemContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SafariItemContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SafariItemContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
         _loc1_.setStyle("skinClass",WindowHeaderInfoMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _SafariItemContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get assetImage() : Image
      {
         return this._2109219915assetImage;
      }
      
      public function set assetImage(param1:Image) : void
      {
         var _loc2_:Object = this._2109219915assetImage;
         if(_loc2_ !== param1)
         {
            this._2109219915assetImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetImage",_loc2_,param1));
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
      public function get itemInfo() : StandardText
      {
         return this._1177195105itemInfo;
      }
      
      public function set itemInfo(param1:StandardText) : void
      {
         var _loc2_:Object = this._1177195105itemInfo;
         if(_loc2_ !== param1)
         {
            this._1177195105itemInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get radioSex() : RadioButton
      {
         return this._31298965radioSex;
      }
      
      public function set radioSex(param1:RadioButton) : void
      {
         var _loc2_:Object = this._31298965radioSex;
         if(_loc2_ !== param1)
         {
            this._31298965radioSex = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioSex",_loc2_,param1));
            }
         }
      }
   }
}

