package windows.custom.zooWheel.freeSpin
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
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class FreeSpinContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _110256292text1:Text;
      
      private var _110256293text2:GradientText;
      
      private var _110256294text3:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FreeSpinContent()
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
         bindings = this._FreeSpinContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_zooWheel_freeSpin_FreeSpinContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FreeSpinContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._FreeSpinContent_InnerGroup1_c(),this._FreeSpinContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FreeSpinContent._watcherSetupUtil = param1;
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
      
      private function _FreeSpinContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._FreeSpinContent_Text1_i(),this._FreeSpinContent_GradientText1_i(),this._FreeSpinContent_Text2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FreeSpinContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 70;
         _loc1_.y = 115;
         _loc1_.width = 320;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text1 = _loc1_;
         BindingManager.executeBindings(this,"text1",this.text1);
         return _loc1_;
      }
      
      private function _FreeSpinContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 88;
         _loc1_.y = 171;
         _loc1_.textAlign = "center";
         _loc1_.width = 250;
         _loc1_.fontSize = 12;
         _loc1_.buttonMode = true;
         _loc1_.id = "text2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text2 = _loc1_;
         BindingManager.executeBindings(this,"text2",this.text2);
         return _loc1_;
      }
      
      private function _FreeSpinContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 69;
         _loc1_.y = 216;
         _loc1_.width = 300;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "text3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text3 = _loc1_;
         BindingManager.executeBindings(this,"text3",this.text3);
         return _loc1_;
      }
      
      private function _FreeSpinContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._FreeSpinContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FreeSpinContent_WindowHeader1_i() : WindowHeader
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
      
      private function _FreeSpinContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
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
   }
}

