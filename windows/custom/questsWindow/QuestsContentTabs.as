package windows.custom.questsWindow
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
   
   use namespace mx_internal;
   
   public class QuestsContentTabs extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1298496934collectablesTab:TabButton;
      
      private var _1675798135puzzleTab:TabButton;
      
      private var _1781963260questsTab:TabButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function QuestsContentTabs()
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
         bindings = this._QuestsContentTabs_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_questsWindow_QuestsContentTabsWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return QuestsContentTabs[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._QuestsContentTabs_TabsHGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         QuestsContentTabs._watcherSetupUtil = param1;
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
      
      private function _QuestsContentTabs_TabsHGroup1_c() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.mxmlContent = [this._QuestsContentTabs_TabButton1_i(),this._QuestsContentTabs_TabButton2_i(),this._QuestsContentTabs_TabButton3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _QuestsContentTabs_TabButton1_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 0;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "questsTab";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.questsTab = _loc1_;
         BindingManager.executeBindings(this,"questsTab",this.questsTab);
         return _loc1_;
      }
      
      private function _QuestsContentTabs_TabButton2_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 1;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "puzzleTab";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.puzzleTab = _loc1_;
         BindingManager.executeBindings(this,"puzzleTab",this.puzzleTab);
         return _loc1_;
      }
      
      private function _QuestsContentTabs_TabButton3_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 2;
         _loc1_.setStyle("skinClass",TabButtonMediumSkin);
         _loc1_.id = "collectablesTab";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.collectablesTab = _loc1_;
         BindingManager.executeBindings(this,"collectablesTab",this.collectablesTab);
         return _loc1_;
      }
      
      private function _QuestsContentTabs_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return DailyQuestsTabContent;
         },null,"questsTab.contentClass");
         result[1] = new Binding(this,function():*
         {
            return PuzzleTabContent;
         },null,"puzzleTab.contentClass");
         result[2] = new Binding(this,function():*
         {
            return CollectablesTabContent;
         },null,"collectablesTab.contentClass");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectablesTab() : TabButton
      {
         return this._1298496934collectablesTab;
      }
      
      public function set collectablesTab(param1:TabButton) : void
      {
         var _loc2_:Object = this._1298496934collectablesTab;
         if(_loc2_ !== param1)
         {
            this._1298496934collectablesTab = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectablesTab",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get puzzleTab() : TabButton
      {
         return this._1675798135puzzleTab;
      }
      
      public function set puzzleTab(param1:TabButton) : void
      {
         var _loc2_:Object = this._1675798135puzzleTab;
         if(_loc2_ !== param1)
         {
            this._1675798135puzzleTab = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"puzzleTab",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get questsTab() : TabButton
      {
         return this._1781963260questsTab;
      }
      
      public function set questsTab(param1:TabButton) : void
      {
         var _loc2_:Object = this._1781963260questsTab;
         if(_loc2_ !== param1)
         {
            this._1781963260questsTab = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questsTab",_loc2_,param1));
            }
         }
      }
   }
}

