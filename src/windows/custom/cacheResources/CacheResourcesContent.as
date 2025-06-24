package windows.custom.cacheResources
{
   import buttons.extended.IconLabelButton;
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceCachedEvent;
   import components.image.StandardImage;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class CacheResourcesContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1480909402acceptButton:IconLabelButton;
      
      private var _1600068152declineButton:IconLabelButton;
      
      private var _1221270899header:WindowHeader;
      
      private var _618562655settingsPanel:StandardImage;
      
      private var _110256292text1:StandardText;
      
      private var _110256293text2:StandardText;
      
      private var _110256294text3:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var okClass:Class;
      
      public var xClass:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CacheResourcesContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.okClass = CacheResourcesContent_okClass;
         this.xClass = CacheResourcesContent_xClass;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CacheResourcesContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_cacheResources_CacheResourcesContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CacheResourcesContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CacheResourcesContent_InnerGroup1_c(),this._CacheResourcesContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CacheResourcesContent._watcherSetupUtil = param1;
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
      
      private function _CacheResourcesContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CacheResourcesContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 150;
         _loc1_.mxmlContent = [this._CacheResourcesContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.y = 150;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._CacheResourcesContent_StandardText1_i(),this._CacheResourcesContent_HGroup1_c(),this._CacheResourcesContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 450;
         _loc1_.id = "text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text1 = _loc1_;
         BindingManager.executeBindings(this,"text1",this.text1);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CacheResourcesContent_StandardText2_i(),this._CacheResourcesContent_StandardImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 230;
         _loc1_.id = "text2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text2 = _loc1_;
         BindingManager.executeBindings(this,"text2",this.text2);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.id = "settingsPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.settingsPanel = _loc1_;
         BindingManager.executeBindings(this,"settingsPanel",this.settingsPanel);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 450;
         _loc1_.id = "text3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text3 = _loc1_;
         BindingManager.executeBindings(this,"text3",this.text3);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CacheResourcesContent_WindowHeader1_i(),this._CacheResourcesContent_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_WindowHeader1_i() : WindowHeader
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
      
      private function _CacheResourcesContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.y = 440;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CacheResourcesContent_IconLabelButton1_i(),this._CacheResourcesContent_IconLabelButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CacheResourcesContent_IconLabelButton1_i() : IconLabelButton
      {
         var _loc1_:IconLabelButton = new IconLabelButton();
         _loc1_.verticalCenter = 0;
         _loc1_.label = "Yes, save to my Hard Drive (recommended)";
         _loc1_.addEventListener("click",this.__acceptButton_click);
         _loc1_.id = "acceptButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.acceptButton = _loc1_;
         BindingManager.executeBindings(this,"acceptButton",this.acceptButton);
         return _loc1_;
      }
      
      public function __acceptButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ResourceCachedEvent(ResourceCachedEvent.CHANGE_CACHE_STATUS,true));
      }
      
      private function _CacheResourcesContent_IconLabelButton2_i() : IconLabelButton
      {
         var _loc1_:IconLabelButton = new IconLabelButton();
         _loc1_.verticalCenter = 0;
         _loc1_.label = "No, continue to use my browser cache";
         _loc1_.addEventListener("click",this.__declineButton_click);
         _loc1_.id = "declineButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.declineButton = _loc1_;
         BindingManager.executeBindings(this,"declineButton",this.declineButton);
         return _loc1_;
      }
      
      public function __declineButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ResourceCachedEvent(ResourceCachedEvent.CHANGE_CACHE_STATUS,false));
      }
      
      private function _CacheResourcesContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_50;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get acceptButton() : IconLabelButton
      {
         return this._1480909402acceptButton;
      }
      
      public function set acceptButton(param1:IconLabelButton) : void
      {
         var _loc2_:Object = this._1480909402acceptButton;
         if(_loc2_ !== param1)
         {
            this._1480909402acceptButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"acceptButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get declineButton() : IconLabelButton
      {
         return this._1600068152declineButton;
      }
      
      public function set declineButton(param1:IconLabelButton) : void
      {
         var _loc2_:Object = this._1600068152declineButton;
         if(_loc2_ !== param1)
         {
            this._1600068152declineButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"declineButton",_loc2_,param1));
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
      public function get settingsPanel() : StandardImage
      {
         return this._618562655settingsPanel;
      }
      
      public function set settingsPanel(param1:StandardImage) : void
      {
         var _loc2_:Object = this._618562655settingsPanel;
         if(_loc2_ !== param1)
         {
            this._618562655settingsPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"settingsPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text1() : StandardText
      {
         return this._110256292text1;
      }
      
      public function set text1(param1:StandardText) : void
      {
         var _loc2_:Object = this._110256292text1;
         if(_loc2_ !== param1)
         {
            this._110256292text1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text2() : StandardText
      {
         return this._110256293text2;
      }
      
      public function set text2(param1:StandardText) : void
      {
         var _loc2_:Object = this._110256293text2;
         if(_loc2_ !== param1)
         {
            this._110256293text2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text3() : StandardText
      {
         return this._110256294text3;
      }
      
      public function set text3(param1:StandardText) : void
      {
         var _loc2_:Object = this._110256294text3;
         if(_loc2_ !== param1)
         {
            this._110256294text3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text3",_loc2_,param1));
            }
         }
      }
   }
}

