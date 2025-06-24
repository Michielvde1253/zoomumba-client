package windows.custom.crafting
{
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
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class SuccessCraftingContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _208132581animalContainer:StandardImage;
      
      private var _3175821glow:StandardImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _2130460664starsLeft:StandardImage;
      
      private var _1614110149starsRight:StandardImage;
      
      private var _1268301872successText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SuccessCraftingContent()
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
         bindings = this._SuccessCraftingContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_crafting_SuccessCraftingContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SuccessCraftingContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SuccessCraftingContent_InnerGroup1_c(),this._SuccessCraftingContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SuccessCraftingContent._watcherSetupUtil = param1;
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
      
      private function _SuccessCraftingContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SuccessCraftingContent_StandardText1_i(),this._SuccessCraftingContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 85;
         _loc1_.y = 115;
         _loc1_.width = 300;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "successText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.successText = _loc1_;
         BindingManager.executeBindings(this,"successText",this.successText);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 170;
         _loc1_.height = 120;
         _loc1_.verticalCenter = 60;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._SuccessCraftingContent_StandardImage1_i(),this._SuccessCraftingContent_StandardImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "glow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.glow = _loc1_;
         BindingManager.executeBindings(this,"glow",this.glow);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = null;
         _loc1_ = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.verticalCenter = -5;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "animalContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animalContainer = _loc1_;
         BindingManager.executeBindings(this,"animalContainer",this.animalContainer);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SuccessCraftingContent_StandardImage3_i(),this._SuccessCraftingContent_StandardImage4_i(),this._SuccessCraftingContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "starsLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsLeft = _loc1_;
         BindingManager.executeBindings(this,"starsLeft",this.starsLeft);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.scaleX = -1;
         _loc1_.id = "starsRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsRight = _loc1_;
         BindingManager.executeBindings(this,"starsRight",this.starsRight);
         return _loc1_;
      }
      
      private function _SuccessCraftingContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
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
      
      private function _SuccessCraftingContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get animalContainer() : StandardImage
      {
         return this._208132581animalContainer;
      }
      
      public function set animalContainer(param1:StandardImage) : void
      {
         var _loc2_:Object = this._208132581animalContainer;
         if(_loc2_ !== param1)
         {
            this._208132581animalContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalContainer",_loc2_,param1));
            }
         }
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
      public function get starsLeft() : StandardImage
      {
         return this._2130460664starsLeft;
      }
      
      public function set starsLeft(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2130460664starsLeft;
         if(_loc2_ !== param1)
         {
            this._2130460664starsLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starsRight() : StandardImage
      {
         return this._1614110149starsRight;
      }
      
      public function set starsRight(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1614110149starsRight;
         if(_loc2_ !== param1)
         {
            this._1614110149starsRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get successText() : StandardText
      {
         return this._1268301872successText;
      }
      
      public function set successText(param1:StandardText) : void
      {
         var _loc2_:Object = this._1268301872successText;
         if(_loc2_ !== param1)
         {
            this._1268301872successText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"successText",_loc2_,param1));
            }
         }
      }
   }
}

