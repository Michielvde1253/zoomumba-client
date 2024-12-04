package windows.custom.settings
{
   import buttons.tabs.TabButton;
   import buttons.tabs.TabButtonSmallSkin;
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
   import windows.custom.settings.tabs.SettingsAccountTabContent;
   import windows.custom.settings.tabs.SettingsConfigTabContent;
   
   use namespace mx_internal;
   
   public class SettingsContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _803343832accountTab:TabButton;
      
      private var _804461325configTab:TabButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SettingsContent()
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
         bindings = this._SettingsContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_settings_SettingsContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SettingsContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SettingsContent_TabsHGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SettingsContent._watcherSetupUtil = param1;
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
      
      private function _SettingsContent_TabsHGroup1_c() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.mxmlContent = [this._SettingsContent_TabButton1_i(),this._SettingsContent_TabButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsContent_TabButton1_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 0;
         _loc1_.setStyle("skinClass",TabButtonSmallSkin);
         _loc1_.id = "accountTab";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.accountTab = _loc1_;
         BindingManager.executeBindings(this,"accountTab",this.accountTab);
         return _loc1_;
      }
      
      private function _SettingsContent_TabButton2_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 1;
         _loc1_.setStyle("skinClass",TabButtonSmallSkin);
         _loc1_.id = "configTab";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.configTab = _loc1_;
         BindingManager.executeBindings(this,"configTab",this.configTab);
         return _loc1_;
      }
      
      private function _SettingsContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return SettingsAccountTabContent;
         },null,"accountTab.contentClass");
         result[1] = new Binding(this,function():*
         {
            return SettingsConfigTabContent;
         },null,"configTab.contentClass");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get accountTab() : TabButton
      {
         return this._803343832accountTab;
      }
      
      public function set accountTab(param1:TabButton) : void
      {
         var _loc2_:Object = this._803343832accountTab;
         if(_loc2_ !== param1)
         {
            this._803343832accountTab = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"accountTab",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get configTab() : TabButton
      {
         return this._804461325configTab;
      }
      
      public function set configTab(param1:TabButton) : void
      {
         var _loc2_:Object = this._804461325configTab;
         if(_loc2_ !== param1)
         {
            this._804461325configTab = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"configTab",_loc2_,param1));
            }
         }
      }
   }
}

