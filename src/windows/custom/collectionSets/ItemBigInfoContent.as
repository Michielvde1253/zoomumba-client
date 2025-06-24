package windows.custom.collectionSets
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
   import mx.geom.Transform;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class ItemBigInfoContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _3237038info:Text;
      
      private var _926261450itemPicContainer:SpriteVisualElement;
      
      private var _311324810signText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ItemBigInfoContent()
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
         bindings = this._ItemBigInfoContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_collectionSets_ItemBigInfoContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ItemBigInfoContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ItemBigInfoContent_InnerGroup1_c(),this._ItemBigInfoContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ItemBigInfoContent._watcherSetupUtil = param1;
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
      
      private function _ItemBigInfoContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ItemBigInfoContent_SpriteVisualElement1_i(),this._ItemBigInfoContent_GradientText1_i(),this._ItemBigInfoContent_Text1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 190;
         _loc1_.y = 250;
         _loc1_.initialized(this,"itemPicContainer");
         this.itemPicContainer = _loc1_;
         BindingManager.executeBindings(this,"itemPicContainer",this.itemPicContainer);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.visible = false;
         _loc1_.textAlign = "center";
         _loc1_.width = 150;
         _loc1_.fontSize = 14;
         _loc1_.transform = this._ItemBigInfoContent_Transform1_c();
         _loc1_.id = "signText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.signText = _loc1_;
         BindingManager.executeBindings(this,"signText",this.signText);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_Transform1_c() : mx.geom.Transform
      {
         var _loc1_:mx.geom.Transform = new mx.geom.Transform();
         _loc1_.matrix = this._ItemBigInfoContent_Matrix1_c();
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_Matrix1_c() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.b = -0.12;
         _loc1_.tx = 140;
         _loc1_.ty = 235;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.mouseEnabled = false;
         _loc1_.truncateToFit = false;
         _loc1_.x = 320;
         _loc1_.y = 136;
         _loc1_.width = 250;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ItemBigInfoContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ItemBigInfoContent_WindowHeader1_i() : WindowHeader
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
      
      private function _ItemBigInfoContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"header.skinSize");
         return result;
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
      public function get signText() : GradientText
      {
         return this._311324810signText;
      }
      
      public function set signText(param1:GradientText) : void
      {
         var _loc2_:Object = this._311324810signText;
         if(_loc2_ !== param1)
         {
            this._311324810signText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"signText",_loc2_,param1));
            }
         }
      }
   }
}

