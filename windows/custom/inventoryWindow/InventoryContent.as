package windows.custom.inventoryWindow
{
   import buttons.tabs.TabButton;
   import buttons.tabs.TabButtonTinySkin;
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
   
   public class InventoryContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3552060tab1:TabButton;
      
      private var _3552061tab2:TabButton;
      
      private var _3552062tab3:TabButton;
      
      private var _3552063tab4:TabButton;
      
      private var _3552064tab5:TabButton;
      
      private var _3552065tab6:TabButton;
      
      private var _3552066tab7:TabButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InventoryContent()
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
         bindings = this._InventoryContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_inventoryWindow_InventoryContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InventoryContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._InventoryContent_TabsHGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InventoryContent._watcherSetupUtil = param1;
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
      
      private function _InventoryContent_TabsHGroup1_c() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.gap = 2;
         _loc1_.selectedIndex = 1;
         _loc1_.mxmlContent = [this._InventoryContent_TabButton1_i(),this._InventoryContent_TabButton2_i(),this._InventoryContent_TabButton3_i(),this._InventoryContent_TabButton4_i(),this._InventoryContent_TabButton5_i(),this._InventoryContent_TabButton6_i(),this._InventoryContent_TabButton7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton1_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 0;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab1 = _loc1_;
         BindingManager.executeBindings(this,"tab1",this.tab1);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton2_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 1;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab2 = _loc1_;
         BindingManager.executeBindings(this,"tab2",this.tab2);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton3_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 2;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab3 = _loc1_;
         BindingManager.executeBindings(this,"tab3",this.tab3);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton4_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 3;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab4 = _loc1_;
         BindingManager.executeBindings(this,"tab4",this.tab4);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton5_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 4;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab5 = _loc1_;
         BindingManager.executeBindings(this,"tab5",this.tab5);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton6_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 5;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab6 = _loc1_;
         BindingManager.executeBindings(this,"tab6",this.tab6);
         return _loc1_;
      }
      
      private function _InventoryContent_TabButton7_i() : TabButton
      {
         var _loc1_:TabButton = new TabButton();
         _loc1_.index = 6;
         _loc1_.setStyle("skinClass",TabButtonTinySkin);
         _loc1_.id = "tab7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tab7 = _loc1_;
         BindingManager.executeBindings(this,"tab7",this.tab7);
         return _loc1_;
      }
      
      private function _InventoryContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab1.contentClass");
         result[1] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab2.contentClass");
         result[2] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab3.contentClass");
         result[3] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab4.contentClass");
         result[4] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab5.contentClass");
         result[5] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab6.contentClass");
         result[6] = new Binding(this,function():*
         {
            return InventoryContentCardGroup;
         },null,"tab7.contentClass");
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
      
      [Bindable(event="propertyChange")]
      public function get tab3() : TabButton
      {
         return this._3552062tab3;
      }
      
      public function set tab3(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552062tab3;
         if(_loc2_ !== param1)
         {
            this._3552062tab3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tab4() : TabButton
      {
         return this._3552063tab4;
      }
      
      public function set tab4(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552063tab4;
         if(_loc2_ !== param1)
         {
            this._3552063tab4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tab5() : TabButton
      {
         return this._3552064tab5;
      }
      
      public function set tab5(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552064tab5;
         if(_loc2_ !== param1)
         {
            this._3552064tab5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tab6() : TabButton
      {
         return this._3552065tab6;
      }
      
      public function set tab6(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552065tab6;
         if(_loc2_ !== param1)
         {
            this._3552065tab6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tab7() : TabButton
      {
         return this._3552066tab7;
      }
      
      public function set tab7(param1:TabButton) : void
      {
         var _loc2_:Object = this._3552066tab7;
         if(_loc2_ !== param1)
         {
            this._3552066tab7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tab7",_loc2_,param1));
            }
         }
      }
   }
}

