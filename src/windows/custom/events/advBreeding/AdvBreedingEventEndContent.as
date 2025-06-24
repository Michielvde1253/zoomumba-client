package windows.custom.events.advBreeding
{
   import components.image.StandardImage;
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
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class AdvBreedingEventEndContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _3258024jean:StandardImage;
      
      private var _954925063message:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvBreedingEventEndContent()
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
         bindings = this._AdvBreedingEventEndContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_events_advBreeding_AdvBreedingEventEndContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvBreedingEventEndContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._AdvBreedingEventEndContent_InnerGroup1_c(),this._AdvBreedingEventEndContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvBreedingEventEndContent._watcherSetupUtil = param1;
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
      
      private function _AdvBreedingEventEndContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvBreedingEventEndContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventEndContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 180;
         _loc1_.y = 150;
         _loc1_.mxmlContent = [this._AdvBreedingEventEndContent_Text1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventEndContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.width = 200;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _AdvBreedingEventEndContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvBreedingEventEndContent_WindowHeader1_i(),this._AdvBreedingEventEndContent_StandardImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvBreedingEventEndContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
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
      
      private function _AdvBreedingEventEndContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 15;
         _loc1_.y = 158;
         _loc1_.id = "jean";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.jean = _loc1_;
         BindingManager.executeBindings(this,"jean",this.jean);
         return _loc1_;
      }
      
      private function _AdvBreedingEventEndContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_BROWN;
         },function(param1:uint):void
         {
            message.setStyle("color",param1);
         },"message.color");
         result[1] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
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
      public function get message() : Text
      {
         return this._954925063message;
      }
      
      public function set message(param1:Text) : void
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
   }
}

