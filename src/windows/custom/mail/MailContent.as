package windows.custom.mail
{
   import buttons.tabs.TabButton;
   import buttons.tabs.TabButtonMediumSkin;
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
   import windows.core.TabsHGroup;
   import windows.custom.mail.tabs.MailIOBoxTabContent;
   import windows.custom.mail.tabs.MailNewTabContent;
   
   use namespace mx_internal;
   
   public class MailContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1352294148create:TabButton;
      
      private var _100344454inbox:TabButton;
      
      private var _1005526083outbox:TabButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MailContent()
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
         bindings = this._MailContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_mail_MailContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MailContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 0;
         this.mxmlContent = [this._MailContent_TabsHGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MailContent._watcherSetupUtil = param1;
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
      
      private function _MailContent_TabsHGroup1_c() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.mxmlContent = [this._MailContent_TabButton1_i(),this._MailContent_TabButton2_i(),this._MailContent_TabButton3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailContent_TabButton1_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 0;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "inbox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inbox = _loc1_;
         BindingManager.executeBindings(this,"inbox",this.inbox);
         return _loc1_;
      }
      
      private function _MailContent_TabButton2_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 1;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "outbox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outbox = _loc1_;
         BindingManager.executeBindings(this,"outbox",this.outbox);
         return _loc1_;
      }
      
      private function _MailContent_TabButton3_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 2;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "create";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.create = _loc1_;
         BindingManager.executeBindings(this,"create",this.create);
         return _loc1_;
      }
      
      private function _MailContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return MailIOBoxTabContent;
         },null,"inbox.contentClass");
         result[1] = new Binding(this,function():*
         {
            return MailIOBoxTabContent;
         },null,"outbox.contentClass");
         result[2] = new Binding(this,function():*
         {
            return MailNewTabContent;
         },null,"create.contentClass");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get create() : TabButton
      {
         return this._1352294148create;
      }
      
      public function set create(param1:TabButton) : void
      {
         var _loc2_:Object = this._1352294148create;
         if(_loc2_ !== param1)
         {
            this._1352294148create = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"create",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inbox() : TabButton
      {
         return this._100344454inbox;
      }
      
      public function set inbox(param1:TabButton) : void
      {
         var _loc2_:Object = this._100344454inbox;
         if(_loc2_ !== param1)
         {
            this._100344454inbox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inbox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outbox() : TabButton
      {
         return this._1005526083outbox;
      }
      
      public function set outbox(param1:TabButton) : void
      {
         var _loc2_:Object = this._1005526083outbox;
         if(_loc2_ !== param1)
         {
            this._1005526083outbox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outbox",_loc2_,param1));
            }
         }
      }
   }
}

