package windows.custom.events.advBreeding
{
   import buttons.simpleButton.InfoButtonBigSkin;
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import components.textfield.StandardText;
   import custom.card.component.CardGroupHolder;
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
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class AdvBreedingEventContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _AdvBreedingEventContent_RadioButton1:RadioButton;
      
      public var _AdvBreedingEventContent_RadioButton2:RadioButton;
      
      private var _93090825arrow:StandardImage;
      
      private var _2098207848btnTrade:Button;
      
      private var _1378241396bubble:StandardImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _506349927groupSex:RadioButtonGroup;
      
      private var _3237038info:Button;
      
      private var _3258024jean:StandardImage;
      
      private var _1365610521textBubble:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvBreedingEventContent()
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
         bindings = this._AdvBreedingEventContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_advBreeding_AdvBreedingEventContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvBreedingEventContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AdvBreedingEventContent_InnerGroup1_c(),this._AdvBreedingEventContent_OuterGroup1_c()];
         this._AdvBreedingEventContent_RadioButtonGroup1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvBreedingEventContent._watcherSetupUtil = param1;
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
      
      private function _AdvBreedingEventContent_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"groupSex");
         this.groupSex = _loc1_;
         BindingManager.executeBindings(this,"groupSex",this.groupSex);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_BackgroundImage1_c(),this._AdvBreedingEventContent_StandardImage1_i(),this._AdvBreedingEventContent_StandardText1_i(),this._AdvBreedingEventContent_VGroup1_c(),this._AdvBreedingEventContent_HGroup2_c(),this._AdvBreedingEventContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.y = 75;
         _loc1_.scale = 1.4;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 165;
         _loc1_.y = 60;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 205;
         _loc1_.y = 85;
         _loc1_.width = 380;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textBubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBubble = _loc1_;
         BindingManager.executeBindings(this,"textBubble",this.textBubble);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingTop = 230;
         _loc1_.horizontalAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_HGroup1_c(),this._AdvBreedingEventContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -20;
         _loc1_.gap = -5;
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_RadioButton1_i(),this._AdvBreedingEventContent_RadioButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.scaleX = 1.5;
         _loc1_.scaleY = 1.5;
         _loc1_.selected = true;
         _loc1_.setStyle("skinClass",RadioButtonSexMaleSkin);
         _loc1_.id = "_AdvBreedingEventContent_RadioButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AdvBreedingEventContent_RadioButton1 = _loc1_;
         BindingManager.executeBindings(this,"_AdvBreedingEventContent_RadioButton1",this._AdvBreedingEventContent_RadioButton1);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.scaleX = 1.5;
         _loc1_.scaleY = 1.5;
         _loc1_.setStyle("skinClass",RadioButtonSexFemaleSkin);
         _loc1_.id = "_AdvBreedingEventContent_RadioButton2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AdvBreedingEventContent_RadioButton2 = _loc1_;
         BindingManager.executeBindings(this,"_AdvBreedingEventContent_RadioButton2",this._AdvBreedingEventContent_RadioButton2);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = null;
         _loc1_ = new CardGroupHolder();
         _loc1_.horizontalTileCenter = 0;
         _loc1_.entriesPerPage = 4;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.left = 95;
         _loc1_.right = 100;
         _loc1_.y = 285;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.top = 320;
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_StandardImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.id = "arrow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 105;
         _loc1_.y = 220;
         _loc1_.setStyle("skinClass",InfoButtonBigSkin);
         _loc1_.addEventListener("click",this.__info_click);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      public function __info_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("infoComicClick"));
      }
      
      private function _AdvBreedingEventContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_StandardImage3_i(),this._AdvBreedingEventContent_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 27;
         _loc1_.y = 95;
         _loc1_.id = "jean";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.jean = _loc1_;
         BindingManager.executeBindings(this,"jean",this.jean);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 22;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._AdvBreedingEventContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnTrade_click);
         _loc1_.id = "btnTrade";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnTrade = _loc1_;
         BindingManager.executeBindings(this,"btnTrade",this.btnTrade);
         return _loc1_;
      }
      
      public function __btnTrade_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("tradeClicked"));
      }
      
      private function _AdvBreedingEventContent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_AdvBreedingEventContent_RadioButton1.group","groupSex");
         _loc1_[1] = new Binding(this,null,null,"_AdvBreedingEventContent_RadioButton2.group","groupSex");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : StandardImage
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:StandardImage) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnTrade() : Button
      {
         return this._2098207848btnTrade;
      }
      
      public function set btnTrade(param1:Button) : void
      {
         var _loc2_:Object = this._2098207848btnTrade;
         if(_loc2_ !== param1)
         {
            this._2098207848btnTrade = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnTrade",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardGroupHolder() : CardGroupHolder
      {
         return this._171849691cardGroupHolder;
      }
      
      public function set cardGroupHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._171849691cardGroupHolder;
         if(_loc2_ !== param1)
         {
            this._171849691cardGroupHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardGroupHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupSex() : RadioButtonGroup
      {
         return this._506349927groupSex;
      }
      
      public function set groupSex(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._506349927groupSex;
         if(_loc2_ !== param1)
         {
            this._506349927groupSex = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupSex",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : Button
      {
         return this._3237038info;
      }
      
      public function set info(param1:Button) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get jean() : StandardImage
      {
         return this._3258024jean;
      }
      
      public function set jean(param1:StandardImage) : void
      {
         var _loc2_:Object = this._3258024jean;
         if(_loc2_ !== param1)
         {
            this._3258024jean = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"jean",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBubble() : StandardText
      {
         return this._1365610521textBubble;
      }
      
      public function set textBubble(param1:StandardText) : void
      {
         var _loc2_:Object = this._1365610521textBubble;
         if(_loc2_ !== param1)
         {
            this._1365610521textBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBubble",_loc2_,param1));
            }
         }
      }
   }
}

