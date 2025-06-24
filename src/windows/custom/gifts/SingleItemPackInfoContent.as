package windows.custom.gifts
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
   
   public class SingleItemPackInfoContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _448968774giftBoxContainer:SpriteVisualElement;
      
      private var _849166299giftName:GradientText;
      
      private var _1221270899header:WindowHeader;
      
      private var _1945388365infoEnd:Text;
      
      private var _1220553812infoStart:Text;
      
      private var _926261450itemPicContainer:SpriteVisualElement;
      
      private var _910324746itemsPicHolder:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SingleItemPackInfoContent()
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
         bindings = this._SingleItemPackInfoContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_gifts_SingleItemPackInfoContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SingleItemPackInfoContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SingleItemPackInfoContent_InnerGroup1_c(),this._SingleItemPackInfoContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SingleItemPackInfoContent._watcherSetupUtil = param1;
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
      
      private function _SingleItemPackInfoContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._SingleItemPackInfoContent_Group2_i(),this._SingleItemPackInfoContent_Text1_i(),this._SingleItemPackInfoContent_GradientText1_i(),this._SingleItemPackInfoContent_Text2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 110;
         _loc1_.y = 180;
         _loc1_.mxmlContent = [this._SingleItemPackInfoContent_SpriteVisualElement1_i(),this._SingleItemPackInfoContent_SpriteVisualElement2_i()];
         _loc1_.id = "itemsPicHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemsPicHolder = _loc1_;
         BindingManager.executeBindings(this,"itemsPicHolder",this.itemsPicHolder);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"giftBoxContainer");
         this.giftBoxContainer = _loc1_;
         BindingManager.executeBindings(this,"giftBoxContainer",this.giftBoxContainer);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"itemPicContainer");
         this.itemPicContainer = _loc1_;
         BindingManager.executeBindings(this,"itemPicContainer",this.itemPicContainer);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 180;
         _loc1_.y = 130;
         _loc1_.width = 250;
         _loc1_.height = 200;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "infoStart";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoStart = _loc1_;
         BindingManager.executeBindings(this,"infoStart",this.infoStart);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "5";
         _loc1_.fontSize = 12;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "left";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 180;
         _loc1_.y = 145;
         _loc1_.width = 220;
         _loc1_.height = 40;
         _loc1_.id = "giftName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.giftName = _loc1_;
         BindingManager.executeBindings(this,"giftName",this.giftName);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 180;
         _loc1_.y = 180;
         _loc1_.width = 250;
         _loc1_.height = 200;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "infoEnd";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoEnd = _loc1_;
         BindingManager.executeBindings(this,"infoEnd",this.infoEnd);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SingleItemPackInfoContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SingleItemPackInfoContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 24;
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
      
      private function _SingleItemPackInfoContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get giftBoxContainer() : SpriteVisualElement
      {
         return this._448968774giftBoxContainer;
      }
      
      public function set giftBoxContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._448968774giftBoxContainer;
         if(_loc2_ !== param1)
         {
            this._448968774giftBoxContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftBoxContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giftName() : GradientText
      {
         return this._849166299giftName;
      }
      
      public function set giftName(param1:GradientText) : void
      {
         var _loc2_:Object = this._849166299giftName;
         if(_loc2_ !== param1)
         {
            this._849166299giftName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftName",_loc2_,param1));
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
      public function get infoEnd() : Text
      {
         return this._1945388365infoEnd;
      }
      
      public function set infoEnd(param1:Text) : void
      {
         var _loc2_:Object = this._1945388365infoEnd;
         if(_loc2_ !== param1)
         {
            this._1945388365infoEnd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoEnd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoStart() : Text
      {
         return this._1220553812infoStart;
      }
      
      public function set infoStart(param1:Text) : void
      {
         var _loc2_:Object = this._1220553812infoStart;
         if(_loc2_ !== param1)
         {
            this._1220553812infoStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoStart",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemPicContainer() : SpriteVisualElement
      {
         return this._926261450itemPicContainer;
      }
      
      public function set itemPicContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._926261450itemPicContainer;
         if(_loc2_ !== param1)
         {
            this._926261450itemPicContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemPicContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemsPicHolder() : Group
      {
         return this._910324746itemsPicHolder;
      }
      
      public function set itemsPicHolder(param1:Group) : void
      {
         var _loc2_:Object = this._910324746itemsPicHolder;
         if(_loc2_ !== param1)
         {
            this._910324746itemsPicHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemsPicHolder",_loc2_,param1));
            }
         }
      }
   }
}

