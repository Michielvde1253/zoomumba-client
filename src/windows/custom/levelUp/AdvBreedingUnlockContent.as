package windows.custom.levelUp
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
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderInfoMarkSkin;
   
   use namespace mx_internal;
   
   public class AdvBreedingUnlockContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _644454771advBreedingBuiding:SpriteVisualElement;
      
      private var _1221270899header:WindowHeader;
      
      private var _954925063message:StandardText;
      
      private var _1356908976nurseryBuiding:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvBreedingUnlockContent()
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
         bindings = this._AdvBreedingUnlockContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_levelUp_AdvBreedingUnlockContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvBreedingUnlockContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AdvBreedingUnlockContent_InnerGroup1_c(),this._AdvBreedingUnlockContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvBreedingUnlockContent._watcherSetupUtil = param1;
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
      
      private function _AdvBreedingUnlockContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.y = 150;
         _loc1_.mxmlContent = [this._AdvBreedingUnlockContent_StandardText1_i(),this._AdvBreedingUnlockContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 450;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 50;
         _loc1_.y = 150;
         _loc1_.mxmlContent = [this._AdvBreedingUnlockContent_SpriteVisualElement1_i(),this._AdvBreedingUnlockContent_SpriteVisualElement2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 150;
         _loc1_.initialized(this,"advBreedingBuiding");
         this.advBreedingBuiding = _loc1_;
         BindingManager.executeBindings(this,"advBreedingBuiding",this.advBreedingBuiding);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 420;
         _loc1_.y = -15;
         _loc1_.initialized(this,"nurseryBuiding");
         this.nurseryBuiding = _loc1_;
         BindingManager.executeBindings(this,"nurseryBuiding",this.nurseryBuiding);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvBreedingUnlockContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingUnlockContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 20;
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
      
      private function _AdvBreedingUnlockContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get advBreedingBuiding() : SpriteVisualElement
      {
         return this._644454771advBreedingBuiding;
      }
      
      public function set advBreedingBuiding(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._644454771advBreedingBuiding;
         if(_loc2_ !== param1)
         {
            this._644454771advBreedingBuiding = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"advBreedingBuiding",_loc2_,param1));
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
      public function get message() : StandardText
      {
         return this._954925063message;
      }
      
      public function set message(param1:StandardText) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nurseryBuiding() : SpriteVisualElement
      {
         return this._1356908976nurseryBuiding;
      }
      
      public function set nurseryBuiding(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1356908976nurseryBuiding;
         if(_loc2_ !== param1)
         {
            this._1356908976nurseryBuiding = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nurseryBuiding",_loc2_,param1));
            }
         }
      }
   }
}

