package windows.custom.currencies
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
   import windows.custom.currencies.tabs.CurrencyTabContent;
   import windows.custom.currencies.tabs.TrashTabContent;
   
   use namespace mx_internal;
   
   public class SpecialsCurrenciesContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3552060tab1:TabButton;
      
      private var _3552061tab2:TabButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SpecialsCurrenciesContent()
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
         bindings = this._SpecialsCurrenciesContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_currencies_SpecialsCurrenciesContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SpecialsCurrenciesContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SpecialsCurrenciesContent_TabsHGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SpecialsCurrenciesContent._watcherSetupUtil = param1;
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
      
      private function _SpecialsCurrenciesContent_TabsHGroup1_c() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._SpecialsCurrenciesContent_TabButton1_i(),this._SpecialsCurrenciesContent_TabButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SpecialsCurrenciesContent_TabButton1_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 0;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "tab1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab1 = _loc1_;
         BindingManager.executeBindings(this,"tab1",this.tab1);
         return _loc1_;
      }
      
      private function _SpecialsCurrenciesContent_TabButton2_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 1;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "tab2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab2 = _loc1_;
         BindingManager.executeBindings(this,"tab2",this.tab2);
         return _loc1_;
      }
      
      private function _SpecialsCurrenciesContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return CurrencyTabContent;
         },null,"tab1.contentClass");
         result[1] = new Binding(this,function():*
         {
            return TrashTabContent;
         },null,"tab2.contentClass");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get tab1() : TabButton
      {
         return this._3552060tab1;
      }
      
      public function set tab1(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552060tab1;
         if(_loc2_ !== param1)
         {
            this._3552060tab1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tab2() : TabButton
      {
         return this._3552061tab2;
      }
      
      public function set tab2(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552061tab2;
         if(_loc2_ !== param1)
         {
            this._3552061tab2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab2",_loc2_,param1));
            }
         }
      }
   }
}

