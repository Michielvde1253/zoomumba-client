package windows.custom.events.christmas.reward
{
   import components.image.StandardImage;
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
   
   public class ChristmasRewardContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3175821glow:StandardImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _1218906345hgroup:HGroup;
      
      private var _3242771item:StandardImage;
      
      private var _100525951item2:StandardImage;
      
      private var _109204045santa:StandardImage;
      
      private var _110256292text1:StandardText;
      
      private var _110256293text2:GradientText;
      
      private var _110256294text3:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChristmasRewardContent()
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
         bindings = this._ChristmasRewardContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_christmas_reward_ChristmasRewardContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ChristmasRewardContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ChristmasRewardContent_InnerGroup1_c(),this._ChristmasRewardContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ChristmasRewardContent._watcherSetupUtil = param1;
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
      
      private function _ChristmasRewardContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ChristmasRewardContent_Group2_c(),this._ChristmasRewardContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 60;
         _loc1_.horizontalCenter = 70;
         _loc1_.mxmlContent = [this._ChristmasRewardContent_StandardImage1_i(),this._ChristmasRewardContent_HGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = "";
         _loc1_.id = "glow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.glow = _loc1_;
         BindingManager.executeBindings(this,"glow",this.glow);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._ChristmasRewardContent_StandardImage2_i(),this._ChristmasRewardContent_StandardImage3_i()];
         _loc1_.id = "hgroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hgroup = _loc1_;
         BindingManager.executeBindings(this,"hgroup",this.hgroup);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = null;
         _loc1_ = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.id = "item";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item = _loc1_;
         BindingManager.executeBindings(this,"item",this.item);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = null;
         _loc1_ = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.id = "item2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item2 = _loc1_;
         BindingManager.executeBindings(this,"item2",this.item2);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 150;
         _loc1_.top = 100;
         _loc1_.gap = -5;
         _loc1_.mxmlContent = [this._ChristmasRewardContent_StandardText1_i(),this._ChristmasRewardContent_GradientText1_i(),this._ChristmasRewardContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 250;
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.id = "text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text1 = _loc1_;
         BindingManager.executeBindings(this,"text1",this.text1);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.id = "text2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text2 = _loc1_;
         BindingManager.executeBindings(this,"text2",this.text2);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 250;
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.id = "text3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text3 = _loc1_;
         BindingManager.executeBindings(this,"text3",this.text3);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ChristmasRewardContent_WindowHeader1_i(),this._ChristmasRewardContent_StandardImage4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 20;
         _loc1_.text = "#Vielen Dank#";
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
      
      private function _ChristmasRewardContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.bottom = 30;
         _loc1_.left = 5;
         _loc1_.id = "santa";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.santa = _loc1_;
         BindingManager.executeBindings(this,"santa",this.santa);
         return _loc1_;
      }
      
      private function _ChristmasRewardContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get glow() : StandardImage
      {
         return this._3175821glow;
      }
      
      public function set glow(param1:StandardImage) : void
      {
         var _loc2_:Object = this._3175821glow;
         if(_loc2_ !== param1)
         {
            this._3175821glow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glow",_loc2_,param1));
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
      public function get hgroup() : HGroup
      {
         return this._1218906345hgroup;
      }
      
      public function set hgroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1218906345hgroup;
         if(_loc2_ !== param1)
         {
            this._1218906345hgroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hgroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item() : StandardImage
      {
         return this._3242771item;
      }
      
      public function set item(param1:StandardImage) : void
      {
         var _loc2_:Object = this._3242771item;
         if(_loc2_ !== param1)
         {
            this._3242771item = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item2() : StandardImage
      {
         return this._100525951item2;
      }
      
      public function set item2(param1:StandardImage) : void
      {
         var _loc2_:Object = this._100525951item2;
         if(_loc2_ !== param1)
         {
            this._100525951item2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get santa() : StandardImage
      {
         return this._109204045santa;
      }
      
      public function set santa(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109204045santa;
         if(_loc2_ !== param1)
         {
            this._109204045santa = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"santa",_loc2_,param1));
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

