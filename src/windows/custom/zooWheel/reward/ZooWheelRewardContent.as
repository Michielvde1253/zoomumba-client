package windows.custom.zooWheel.reward
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
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class ZooWheelRewardContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1040714455animalSexContainer:SpriteVisualElement;
      
      private var _1878665721bearImage:SpriteVisualElement;
      
      private var _1604760200blueprintImage:SpriteVisualElement;
      
      private var _1221270899header:WindowHeader;
      
      private var _110256292text1:Text;
      
      private var _110256293text2:GradientText;
      
      private var _110256294text3:Text;
      
      private var _1520468169wonItem:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZooWheelRewardContent()
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
         bindings = this._ZooWheelRewardContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_zooWheel_reward_ZooWheelRewardContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZooWheelRewardContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._ZooWheelRewardContent_InnerGroup1_c(),this._ZooWheelRewardContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ZooWheelRewardContent._watcherSetupUtil = param1;
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
      
      private function _ZooWheelRewardContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ZooWheelRewardContent_Text1_i(),this._ZooWheelRewardContent_GradientText1_i(),this._ZooWheelRewardContent_Text2_i(),this._ZooWheelRewardContent_SpriteVisualElement1_i(),this._ZooWheelRewardContent_SpriteVisualElement2_i(),this._ZooWheelRewardContent_SpriteVisualElement3_i(),this._ZooWheelRewardContent_SpriteVisualElement4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 160;
         _loc1_.y = 95;
         _loc1_.width = 200;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text1 = _loc1_;
         BindingManager.executeBindings(this,"text1",this.text1);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 160;
         _loc1_.y = 125;
         _loc1_.fontSize = 12;
         _loc1_.id = "text2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text2 = _loc1_;
         BindingManager.executeBindings(this,"text2",this.text2);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 160;
         _loc1_.y = 147;
         _loc1_.width = 250;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "text3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text3 = _loc1_;
         BindingManager.executeBindings(this,"text3",this.text3);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 20;
         _loc1_.y = 157;
         _loc1_.initialized(this,"bearImage");
         this.bearImage = _loc1_;
         BindingManager.executeBindings(this,"bearImage",this.bearImage);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 193;
         _loc1_.y = 184;
         _loc1_.initialized(this,"blueprintImage");
         this.blueprintImage = _loc1_;
         BindingManager.executeBindings(this,"blueprintImage",this.blueprintImage);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 230;
         _loc1_.y = 225;
         _loc1_.initialized(this,"wonItem");
         this.wonItem = _loc1_;
         BindingManager.executeBindings(this,"wonItem",this.wonItem);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 235;
         _loc1_.y = 275;
         _loc1_.initialized(this,"animalSexContainer");
         this.animalSexContainer = _loc1_;
         BindingManager.executeBindings(this,"animalSexContainer",this.animalSexContainer);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ZooWheelRewardContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelRewardContent_WindowHeader1_i() : WindowHeader
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
      
      private function _ZooWheelRewardContent_bindingsSetup() : Array
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
      public function get bearImage() : SpriteVisualElement
      {
         return this._1878665721bearImage;
      }
      
      public function set bearImage(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1878665721bearImage;
         if(_loc2_ !== param1)
         {
            this._1878665721bearImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bearImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get blueprintImage() : SpriteVisualElement
      {
         return this._1604760200blueprintImage;
      }
      
      public function set blueprintImage(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1604760200blueprintImage;
         if(_loc2_ !== param1)
         {
            this._1604760200blueprintImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blueprintImage",_loc2_,param1));
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
      public function get text1() : Text
      {
         return this._110256292text1;
      }
      
      public function set text1(param1:Text) : void
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
      public function get text2() : GradientText
      {
         return this._110256293text2;
      }
      
      public function set text2(param1:GradientText) : void
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
      public function get text3() : Text
      {
         return this._110256294text3;
      }
      
      public function set text3(param1:Text) : void
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

