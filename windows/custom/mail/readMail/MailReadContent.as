package windows.custom.mail.readMail
{
   import buttons.skin.ButtonShowBitmapSkin;
   import components.textfield.gradientText.GradientText;
   import components.textfield.textArea.StandardTextArea;
   import components.textfield.textArea.TextAreaWoodSkin;
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
   import windows.core.InnerGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderLineSkin;
   
   use namespace mx_internal;
   
   public class MailReadContent extends Group implements IBindingClient
   {
      public static var _1918786038repBitmapData:BitmapData;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var _646202234repToolTip:String = "";
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private var _1221270899header:WindowHeader;
      
      private var _954925063message:StandardTextArea;
      
      private var _873516975messageFrom:GradientText;
      
      private var _673591620replyButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MailReadContent()
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
         bindings = this._MailReadContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_mail_readMail_MailReadContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MailReadContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MailReadContent_InnerGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MailReadContent._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get repBitmapData() : BitmapData
      {
         return MailReadContent._1918786038repBitmapData;
      }
      
      public static function set repBitmapData(param1:BitmapData) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailReadContent._1918786038repBitmapData;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailReadContent,"repBitmapData",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get repToolTip() : String
      {
         return MailReadContent._646202234repToolTip;
      }
      
      public static function set repToolTip(param1:String) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailReadContent._646202234repToolTip;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailReadContent,"repToolTip",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
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
      
      private function _MailReadContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._MailReadContent_Group2_c(),this._MailReadContent_StandardTextArea1_i(),this._MailReadContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailReadContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 77;
         _loc1_.right = 70;
         _loc1_.top = 130;
         _loc1_.height = 40;
         _loc1_.mxmlContent = [this._MailReadContent_GradientText1_i(),this._MailReadContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailReadContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.left = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "messageFrom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageFrom = _loc1_;
         BindingManager.executeBindings(this,"messageFrom",this.messageFrom);
         return _loc1_;
      }
      
      private function _MailReadContent_Button1_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.right = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.addEventListener("click",this.__replyButton_click);
         _loc1_.id = "replyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.replyButton = _loc1_;
         BindingManager.executeBindings(this,"replyButton",this.replyButton);
         return _loc1_;
      }
      
      public function __replyButton_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("replyButtonClicked"));
      }
      
      private function _MailReadContent_StandardTextArea1_i() : StandardTextArea
      {
         var _loc1_:StandardTextArea = new StandardTextArea();
         _loc1_.left = 83;
         _loc1_.right = 74;
         _loc1_.bottom = 70;
         _loc1_.top = 165;
         _loc1_.editable = false;
         _loc1_.setStyle("skinClass",TextAreaWoodSkin);
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _MailReadContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 22;
         _loc1_.setStyle("skinClass",WindowHeaderLineSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _MailReadContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return repBitmapData;
         },null,"replyButton.content");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = repToolTip;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"replyButton.toolTip");
         result[2] = new Binding(this,function():int
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
      public function get message() : StandardTextArea
      {
         return this._954925063message;
      }
      
      public function set message(param1:StandardTextArea) : void
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
      public function get messageFrom() : GradientText
      {
         return this._873516975messageFrom;
      }
      
      public function set messageFrom(param1:GradientText) : void
      {
         var _loc2_:Object = this._873516975messageFrom;
         if(_loc2_ !== param1)
         {
            this._873516975messageFrom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageFrom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get replyButton() : Button
      {
         return this._673591620replyButton;
      }
      
      public function set replyButton(param1:Button) : void
      {
         var _loc2_:Object = this._673591620replyButton;
         if(_loc2_ !== param1)
         {
            this._673591620replyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replyButton",_loc2_,param1));
            }
         }
      }
   }
}

