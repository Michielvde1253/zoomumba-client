package windows.custom.superPack
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
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class SuperPackInfoContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _2017629209bonusPercentage:GradientText;
      
      private var _1441004121bonusPlus:GradientText;
      
      private var _544617919giftCount:GradientText;
      
      private var _1221270899header:WindowHeader;
      
      private var _3237038info:Text;
      
      private var _1207745224infoPicHolder:Group;
      
      private var _2127813052itemCount:Text;
      
      private var _1998009053pictureContainer:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SuperPackInfoContent()
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
         bindings = this._SuperPackInfoContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_superPack_SuperPackInfoContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SuperPackInfoContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SuperPackInfoContent_InnerGroup1_c(),this._SuperPackInfoContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SuperPackInfoContent._watcherSetupUtil = param1;
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
      
      private function _SuperPackInfoContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SuperPackInfoContent_Group2_i(),this._SuperPackInfoContent_Text2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 190;
         _loc1_.y = 270;
         _loc1_.mxmlContent = [this._SuperPackInfoContent_SpriteVisualElement1_i(),this._SuperPackInfoContent_Text1_i(),this._SuperPackInfoContent_GradientText1_i(),this._SuperPackInfoContent_GradientText2_i(),this._SuperPackInfoContent_GradientText3_i()];
         _loc1_.id = "infoPicHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoPicHolder = _loc1_;
         BindingManager.executeBindings(this,"infoPicHolder",this.infoPicHolder);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"pictureContainer");
         this.pictureContainer = _loc1_;
         BindingManager.executeBindings(this,"pictureContainer",this.pictureContainer);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.x = -107;
         _loc1_.y = 40;
         _loc1_.width = 80;
         _loc1_.rotation = -14;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "itemCount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCount = _loc1_;
         BindingManager.executeBindings(this,"itemCount",this.itemCount);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "";
         _loc1_.fontSize = 15;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 12;
         _loc1_.y = -60;
         _loc1_.width = 100;
         _loc1_.rotation = -14;
         _loc1_.id = "bonusPercentage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bonusPercentage = _loc1_;
         BindingManager.executeBindings(this,"bonusPercentage",this.bonusPercentage);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "+";
         _loc1_.fontSize = 20;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 7;
         _loc1_.y = -80;
         _loc1_.width = 100;
         _loc1_.rotation = -14;
         _loc1_.id = "bonusPlus";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bonusPlus = _loc1_;
         BindingManager.executeBindings(this,"bonusPlus",this.bonusPlus);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "5";
         _loc1_.fontSize = 16;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 32;
         _loc1_.y = 5;
         _loc1_.width = 100;
         _loc1_.id = "giftCount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.giftCount = _loc1_;
         BindingManager.executeBindings(this,"giftCount",this.giftCount);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.text = "";
         _loc1_.mouseEnabled = false;
         _loc1_.x = 330;
         _loc1_.y = 136;
         _loc1_.width = 250;
         _loc1_.height = 200;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SuperPackInfoContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuperPackInfoContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 24;
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
      
      private function _SuperPackInfoContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bonusPercentage() : GradientText
      {
         return this._2017629209bonusPercentage;
      }
      
      public function set bonusPercentage(param1:GradientText) : void
      {
         var _loc2_:Object = this._2017629209bonusPercentage;
         if(_loc2_ !== param1)
         {
            this._2017629209bonusPercentage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bonusPercentage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bonusPlus() : GradientText
      {
         return this._1441004121bonusPlus;
      }
      
      public function set bonusPlus(param1:GradientText) : void
      {
         var _loc2_:Object = this._1441004121bonusPlus;
         if(_loc2_ !== param1)
         {
            this._1441004121bonusPlus = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bonusPlus",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giftCount() : GradientText
      {
         return this._544617919giftCount;
      }
      
      public function set giftCount(param1:GradientText) : void
      {
         var _loc2_:Object = this._544617919giftCount;
         if(_loc2_ !== param1)
         {
            this._544617919giftCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftCount",_loc2_,param1));
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
      public function get info() : Text
      {
         return this._3237038info;
      }
      
      public function set info(param1:Text) : void
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
      public function get infoPicHolder() : Group
      {
         return this._1207745224infoPicHolder;
      }
      
      public function set infoPicHolder(param1:Group) : void
      {
         var _loc2_:Object = this._1207745224infoPicHolder;
         if(_loc2_ !== param1)
         {
            this._1207745224infoPicHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoPicHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCount() : Text
      {
         return this._2127813052itemCount;
      }
      
      public function set itemCount(param1:Text) : void
      {
         var _loc2_:Object = this._2127813052itemCount;
         if(_loc2_ !== param1)
         {
            this._2127813052itemCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pictureContainer() : SpriteVisualElement
      {
         return this._1998009053pictureContainer;
      }
      
      public function set pictureContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1998009053pictureContainer;
         if(_loc2_ !== param1)
         {
            this._1998009053pictureContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictureContainer",_loc2_,param1));
            }
         }
      }
   }
}
