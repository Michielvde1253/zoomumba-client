package fr.kapit.watch
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
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
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.components.AbstractKapDebugComponent;
   import fr.kapit.components.ComponentManager;
   import fr.kapit.components.DataGridAutoScroll;
   import fr.kapit.components.IKapDebugComponent;
   import fr.kapit.components.KapDebugComponentFactory;
   import fr.kapit.components.KapDebugShortcut;
   import fr.kapit.components.StackDataGrid;
   import fr.kapit.containers.kHDividedBox;
   import fr.kapit.containers.kVDividedBox;
   import fr.kapit.tree.DebugComponent;
   import fr.kapit.tree.KapDebugTree;
   import fr.kapit.utils.ClassUtils;
   import fr.kapit.utils.StringUtils;
   import mx.binding.*;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.ClassFactory;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ChangeWatcherComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var NAME:String = "ChangeWatcherComponent";
      
      public static var LABEL:String = "Bindings Watcher";
      
      private var _1066855446debugComponent:DebugComponent;
      
      private var _341336234logGrid:DataGridAutoScroll;
      
      private var _109757064stack:StackDataGrid;
      
      private var _2067048512targetsTree:KapDebugTree;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _observer:ChangeObserver;
      
      private var _observerChanged:Boolean;
      
      private var _selectedTarget:ChangeTargetNode;
      
      private var _filter:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChangeWatcherComponent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":AbstractKapDebugComponent,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":kVDividedBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":kHDividedBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":75,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":KapDebugTree,
                                    "id":"targetsTree",
                                    "events":{
                                       "change":"__targetsTree_change",
                                       "doubleClick":"__targetsTree_doubleClick"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":20,
                                          "percentHeight":100,
                                          "expandOnData":true,
                                          "toolTip":"List of binded variables and objects being currently monitored"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":DataGridAutoScroll,
                                    "id":"logGrid",
                                    "events":{"change":"__logGrid_change"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":60,
                                          "percentHeight":100,
                                          "toolTip":"List of recorded binding and collection events",
                                          "columns":[_ChangeWatcherComponent_DataGridColumn1_c(),_ChangeWatcherComponent_DataGridColumn2_c(),_ChangeWatcherComponent_DataGridColumn3_c(),_ChangeWatcherComponent_DataGridColumn4_c(),_ChangeWatcherComponent_DataGridColumn5_c()]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":DebugComponent,
                                    "id":"debugComponent",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":20,
                                          "percentHeight":100,
                                          "toolTip":"Inspect the data that has been modified"
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":StackDataGrid,
                           "id":"stack",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":20,
                                 "toolTip":"StackTrace for the selected event."
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ChangeWatcherComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_watch_ChangeWatcherComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ChangeWatcherComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,ChangeWatcherComponent,null,null,null,isTargetAcceptable,new KapDebugShortcut(false,false,false,112,NAME));
      }
      
      public static function isTargetAcceptable(param1:Object) : Boolean
      {
         return Boolean(param1) && !(param1 is int || param1 is Number || param1 is Boolean || param1 is String);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ChangeWatcherComponent._watcherSetupUtil = param1;
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
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(ChangeWatcherComponent,param1);
      }
      
      override public function set target(param1:Object) : void
      {
         super.target = param1;
         this._initObserver();
         if(!label)
         {
            label = ClassUtils.getInstanceLabel(param1);
         }
         if(!icon)
         {
            icon = ComponentIcons.getClassIcon(param1);
         }
      }
      
      private function _initObserver() : void
      {
         this._observer = new ChangeObserver(target);
         this._observerChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._observerChanged)
         {
            this._observerChanged = false;
            this._observer.log.filterFunction = this._filterItem;
            this._observer.log.refresh();
            this.logGrid.dataProvider = this._observer.log;
            this.targetsTree.dataProvider = [this._observer.rootTargetNode];
         }
      }
      
      private function _onTargetChange() : void
      {
         this._selectedTarget = this.targetsTree.selectedItem as ChangeTargetNode;
         this._filter = this._selectedTarget.accessPath;
         this._observer.log.refresh();
      }
      
      private function _filterItem(param1:ChangeLogItem) : Boolean
      {
         if(StringUtils.isEmpty(this._filter))
         {
            return true;
         }
         return param1.propertyChain.indexOf(this._filter) == 0;
      }
      
      private function _getIcon(param1:ChangeTargetNode) : Class
      {
         return param1.icon;
      }
      
      private function _onGridChange() : void
      {
         var _loc1_:ChangeLogItem = this.logGrid.selectedItem as ChangeLogItem;
         this.stack.callStack = _loc1_.callStack;
         this.debugComponent.setRoot(_loc1_.value,_loc1_.propertyName);
      }
      
      private function _onDoubleClick(param1:Event) : void
      {
         var _loc3_:ChangeTargetItemRenderer = null;
         var _loc2_:ChangeTargetNode = this.targetsTree.selectedItem as ChangeTargetNode;
         if(_loc2_)
         {
            _loc2_.isWatchPoint = this._observer.toggleWatchPoint(_loc2_.accessPath);
            _loc3_ = this.targetsTree.itemToItemRenderer(_loc2_) as ChangeTargetItemRenderer;
            if(_loc3_)
            {
               _loc3_.toggleState();
            }
         }
      }
      
      public function __targetsTree_change(param1:ListEvent) : void
      {
         this._onTargetChange();
      }
      
      public function __targetsTree_doubleClick(param1:MouseEvent) : void
      {
         this._onDoubleClick(param1);
      }
      
      private function _ChangeWatcherComponent_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "#";
         _loc1_.dataField = "number";
         _loc1_.width = 40;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChangeWatcherComponent_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "name";
         _loc1_.dataField = "propertyName";
         _loc1_.showDataTips = true;
         _loc1_.dataTipField = "propertyName";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChangeWatcherComponent_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "chain";
         _loc1_.dataField = "propertyChain";
         _loc1_.showDataTips = true;
         _loc1_.dataTipField = "propertyChain";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChangeWatcherComponent_DataGridColumn4_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.dataField = "value";
         _loc1_.showDataTips = true;
         _loc1_.dataTipField = "value";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ChangeWatcherComponent_DataGridColumn5_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.headerText = "kind";
         _loc1_.dataField = "kind";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function __logGrid_change(param1:ListEvent) : void
      {
         this._onGridChange();
      }
      
      private function _ChangeWatcherComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Function
         {
            return _getIcon;
         },null,"targetsTree.iconFunction");
         result[1] = new Binding(this,function():IFactory
         {
            return new ClassFactory(ChangeTargetItemRenderer);
         },null,"targetsTree.itemRenderer");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get debugComponent() : DebugComponent
      {
         return this._1066855446debugComponent;
      }
      
      public function set debugComponent(param1:DebugComponent) : void
      {
         var _loc2_:Object = this._1066855446debugComponent;
         if(_loc2_ !== param1)
         {
            this._1066855446debugComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"debugComponent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logGrid() : DataGridAutoScroll
      {
         return this._341336234logGrid;
      }
      
      public function set logGrid(param1:DataGridAutoScroll) : void
      {
         var _loc2_:Object = this._341336234logGrid;
         if(_loc2_ !== param1)
         {
            this._341336234logGrid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logGrid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stack() : StackDataGrid
      {
         return this._109757064stack;
      }
      
      public function set stack(param1:StackDataGrid) : void
      {
         var _loc2_:Object = this._109757064stack;
         if(_loc2_ !== param1)
         {
            this._109757064stack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetsTree() : KapDebugTree
      {
         return this._2067048512targetsTree;
      }
      
      public function set targetsTree(param1:KapDebugTree) : void
      {
         var _loc2_:Object = this._2067048512targetsTree;
         if(_loc2_ !== param1)
         {
            this._2067048512targetsTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetsTree",_loc2_,param1));
            }
         }
      }
   }
}

