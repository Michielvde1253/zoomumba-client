package windows.custom.events.circus.reward
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
   
   public class CircusRewardContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1040714455animalSexContainer:SpriteVisualElement;
      
      private var _1307033593bitmapBGImage:BitmapImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _3556653text:StandardText;
      
      private var _1520468169wonItem:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CircusRewardContent()
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
         bindings = this._CircusRewardContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_circus_reward_CircusRewardContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CircusRewardContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._CircusRewardContent_InnerGroup1_c(),this._CircusRewardContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CircusRewardContent._watcherSetupUtil = param1;
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
      
      private function _CircusRewardContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CircusRewardContent_BitmapImage1_i(),this._CircusRewardContent_StandardText1_i(),this._CircusRewardContent_SpriteVisualElement1_i(),this._CircusRewardContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusRewardContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 30;
         _loc1_.bottom = 10;
         _loc1_.initialized(this,"bitmapBGImage");
         this.bitmapBGImage = _loc1_;
         BindingManager.executeBindings(this,"bitmapBGImage",this.bitmapBGImage);
         return _loc1_;
      }
      
      private function _CircusRewardContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.left = 160;
         _loc1_.top = 95;
         _loc1_.width = 230;
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _CircusRewardContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 230;
         _loc1_.y = 225;
         _loc1_.initialized(this,"wonItem");
         this.wonItem = _loc1_;
         BindingManager.executeBindings(this,"wonItem",this.wonItem);
         return _loc1_;
      }
      
      private function _CircusRewardContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 235;
         _loc1_.y = 275;
         _loc1_.initialized(this,"animalSexContainer");
         this.animalSexContainer = _loc1_;
         BindingManager.executeBindings(this,"animalSexContainer",this.animalSexContainer);
         return _loc1_;
      }
      
      private function _CircusRewardContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CircusRewardContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusRewardContent_WindowHeader1_i() : WindowHeader
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
      
      private function _CircusRewardContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get animalSexContainer() : SpriteVisualElement
      {
         return this._1040714455animalSexContainer;
      }
      
      public function set animalSexContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1040714455animalSexContainer;
         if(_loc2_ !== param1)
         {
            this._1040714455animalSexContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalSexContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapBGImage() : BitmapImage
      {
         return this._1307033593bitmapBGImage;
      }
      
      public function set bitmapBGImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1307033593bitmapBGImage;
         if(_loc2_ !== param1)
         {
            this._1307033593bitmapBGImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapBGImage",_loc2_,param1));
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
      public function get text() : StandardText
      {
         return this._3556653text;
      }
      
      public function set text(param1:StandardText) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wonItem() : SpriteVisualElement
      {
         return this._1520468169wonItem;
      }
      
      public function set wonItem(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1520468169wonItem;
         if(_loc2_ !== param1)
         {
            this._1520468169wonItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wonItem",_loc2_,param1));
            }
         }
      }
   }
}

