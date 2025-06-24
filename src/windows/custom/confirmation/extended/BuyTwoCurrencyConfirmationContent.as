package windows.custom.confirmation.extended
{
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
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
   import spark.components.Label;
   import spark.components.VGroup;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderQuestionMarkSkin;
   
   use namespace mx_internal;
   
   public class BuyTwoCurrencyConfirmationContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1221270899header:WindowHeader;
      
      private var _102727412label:LabelDisplay;
      
      private var _1110417474label2:LabelDisplay;
      
      private var _954925063message:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BuyTwoCurrencyConfirmationContent()
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
         bindings = this._BuyTwoCurrencyConfirmationContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_confirmation_extended_BuyTwoCurrencyConfirmationContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BuyTwoCurrencyConfirmationContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._BuyTwoCurrencyConfirmationContent_InnerGroup1_c(),this._BuyTwoCurrencyConfirmationContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BuyTwoCurrencyConfirmationContent._watcherSetupUtil = param1;
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
      
      private function _BuyTwoCurrencyConfirmationContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BuyTwoCurrencyConfirmationContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 120;
         _loc1_.bottom = 55;
         _loc1_.gap = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._BuyTwoCurrencyConfirmationContent_Label1_i(),this._BuyTwoCurrencyConfirmationContent_LabelDisplay1_i(),this._BuyTwoCurrencyConfirmationContent_LabelDisplay2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 250;
         _loc1_.setStyle("color",3611397);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
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
      
      private function _BuyTwoCurrencyConfirmationContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.type = "zooDollar";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "label";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.label = _loc1_;
         BindingManager.executeBindings(this,"label",this.label);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.type = "zooDollar";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.label2 = _loc1_;
         BindingManager.executeBindings(this,"label2",this.label2);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BuyTwoCurrencyConfirmationContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 14;
         _loc1_.setStyle("skinClass",WindowHeaderQuestionMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _BuyTwoCurrencyConfirmationContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_10;
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
      public function get label() : LabelDisplay
      {
         return this._102727412label;
      }
      
      public function set label(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label2() : LabelDisplay
      {
         return this._1110417474label2;
      }
      
      public function set label2(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1110417474label2;
         if(_loc2_ !== param1)
         {
            this._1110417474label2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : Label
      {
         return this._954925063message;
      }
      
      public function set message(param1:Label) : void
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

