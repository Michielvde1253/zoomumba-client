package windows.custom.mail.tabs
{
   import buttons.skin.ButtonShowBitmapSkin;
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
   import spark.components.Button;
   import spark.components.DataRenderer;
   import spark.components.HGroup;
   
   use namespace mx_internal;
   
   public class MailIOBoxTabContentInnerClass0 extends DataRenderer implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _MailIOBoxTabContentInnerClass0_Button1:Button;
      
      public var _MailIOBoxTabContentInnerClass0_Button2:Button;
      
      public var _MailIOBoxTabContentInnerClass0_StandardText1:StandardText;
      
      public var _MailIOBoxTabContentInnerClass0_StandardText2:StandardText;
      
      public var _MailIOBoxTabContentInnerClass0_StandardText3:StandardText;
      
      private var _88844982outerDocument:MailIOBoxTabContent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MailIOBoxTabContentInnerClass0()
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
         bindings = this._MailIOBoxTabContentInnerClass0_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_mail_tabs_MailIOBoxTabContentInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MailIOBoxTabContentInnerClass0[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 35;
         this.mxmlContent = [this._MailIOBoxTabContentInnerClass0_HGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MailIOBoxTabContentInnerClass0._watcherSetupUtil = param1;
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
      
      private function _MailIOBoxTabContentInnerClass0_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.verticalCenter = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MailIOBoxTabContentInnerClass0_HGroup2_c(),this._MailIOBoxTabContentInnerClass0_StandardText1_i(),this._MailIOBoxTabContentInnerClass0_StandardText2_i(),this._MailIOBoxTabContentInnerClass0_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContentInnerClass0_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.width = 100;
         _loc1_.gap = 4;
         _loc1_.paddingRight = 20;
         _loc1_.mxmlContent = [this._MailIOBoxTabContentInnerClass0_Button1_i(),this._MailIOBoxTabContentInnerClass0_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContentInnerClass0_Button1_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.addEventListener("click",this.___MailIOBoxTabContentInnerClass0_Button1_click);
         _loc1_.id = "_MailIOBoxTabContentInnerClass0_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MailIOBoxTabContentInnerClass0_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContentInnerClass0_Button1",this._MailIOBoxTabContentInnerClass0_Button1);
         return _loc1_;
      }
      
      public function ___MailIOBoxTabContentInnerClass0_Button1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("remClicked",true));
      }
      
      private function _MailIOBoxTabContentInnerClass0_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.addEventListener("click",this.___MailIOBoxTabContentInnerClass0_Button2_click);
         _loc1_.id = "_MailIOBoxTabContentInnerClass0_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MailIOBoxTabContentInnerClass0_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContentInnerClass0_Button2",this._MailIOBoxTabContentInnerClass0_Button2);
         return _loc1_;
      }
      
      public function ___MailIOBoxTabContentInnerClass0_Button2_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("ansClicked",true));
      }
      
      private function _MailIOBoxTabContentInnerClass0_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 125;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.addEventListener("click",this.___MailIOBoxTabContentInnerClass0_StandardText1_click);
         _loc1_.id = "_MailIOBoxTabContentInnerClass0_StandardText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MailIOBoxTabContentInnerClass0_StandardText1 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContentInnerClass0_StandardText1",this._MailIOBoxTabContentInnerClass0_StandardText1);
         return _loc1_;
      }
      
      public function ___MailIOBoxTabContentInnerClass0_StandardText1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("readClicked",true));
      }
      
      private function _MailIOBoxTabContentInnerClass0_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 278;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.addEventListener("click",this.___MailIOBoxTabContentInnerClass0_StandardText2_click);
         _loc1_.id = "_MailIOBoxTabContentInnerClass0_StandardText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MailIOBoxTabContentInnerClass0_StandardText2 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContentInnerClass0_StandardText2",this._MailIOBoxTabContentInnerClass0_StandardText2);
         return _loc1_;
      }
      
      public function ___MailIOBoxTabContentInnerClass0_StandardText2_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("readClicked",true));
      }
      
      private function _MailIOBoxTabContentInnerClass0_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("textAlign","left");
         _loc1_.addEventListener("click",this.___MailIOBoxTabContentInnerClass0_StandardText3_click);
         _loc1_.id = "_MailIOBoxTabContentInnerClass0_StandardText3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MailIOBoxTabContentInnerClass0_StandardText3 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContentInnerClass0_StandardText3",this._MailIOBoxTabContentInnerClass0_StandardText3);
         return _loc1_;
      }
      
      public function ___MailIOBoxTabContentInnerClass0_StandardText3_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("readClicked",true));
      }
      
      private function _MailIOBoxTabContentInnerClass0_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return MailIOBoxTabContent.delBitmapData;
         },null,"_MailIOBoxTabContentInnerClass0_Button1.content");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = MailIOBoxTabContent.delToolTip;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MailIOBoxTabContentInnerClass0_Button1.toolTip");
         result[2] = new Binding(this,function():Boolean
         {
            return data.inbox;
         },null,"_MailIOBoxTabContentInnerClass0_Button2.visible");
         result[3] = new Binding(this,function():Object
         {
            return MailIOBoxTabContent.repBitmapData;
         },null,"_MailIOBoxTabContentInnerClass0_Button2.content");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = MailIOBoxTabContent.repToolTip;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MailIOBoxTabContentInnerClass0_Button2.toolTip");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = data.status == 1 ? "normal" : "bold";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MailIOBoxTabContentInnerClass0_StandardText1.setStyle("fontWeight",param1);
         },"_MailIOBoxTabContentInnerClass0_StandardText1.fontWeight");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = !!data.inbox ? data.sName : data.rName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MailIOBoxTabContentInnerClass0_StandardText1.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = data.status == 1 ? "normal" : "bold";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MailIOBoxTabContentInnerClass0_StandardText2.setStyle("fontWeight",param1);
         },"_MailIOBoxTabContentInnerClass0_StandardText2.fontWeight");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = data.head;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MailIOBoxTabContentInnerClass0_StandardText2.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = data.status == 1 ? "normal" : "bold";
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _MailIOBoxTabContentInnerClass0_StandardText3.setStyle("fontWeight",param1);
         },"_MailIOBoxTabContentInnerClass0_StandardText3.fontWeight");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = data.ins;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MailIOBoxTabContentInnerClass0_StandardText3.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : MailIOBoxTabContent
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:MailIOBoxTabContent) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}

