package fr.kapit.components
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
   import fr.kapit.events.EventTrapper;
   import fr.kapit.events.EventWrapper;
   import fr.kapit.events.EventsManager;
   import fr.kapit.menu.ContextMenuHelper;
   import fr.kapit.utils.ClassUtils;
   import fr.kapit.utils.EffectUtils;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.collections.Grouping;
   import mx.collections.GroupingCollection2;
   import mx.collections.GroupingField;
   import mx.controls.AdvancedDataGrid;
   import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class EventLogDataGrid extends AdvancedDataGrid implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _EventLogDataGrid_AdvancedDataGridColumn1:AdvancedDataGridColumn;
      
      public var _EventLogDataGrid_AdvancedDataGridColumn2:AdvancedDataGridColumn;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var eventsManager:EventsManager;
      
      private var _1638089495currentTrapper:EventTrapper;
      
      private var _1134877315totalEvents:int;
      
      private var _496050219visibleEvents:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EventLogDataGrid()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.eventsManager = EventsManager.getInstance();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._EventLogDataGrid_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_EventLogDataGridWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EventLogDataGrid[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.columns = [this._EventLogDataGrid_AdvancedDataGridColumn1_i(),this._EventLogDataGrid_AdvancedDataGridColumn2_i(),this._EventLogDataGrid_AdvancedDataGridColumn3_c(),this._EventLogDataGrid_AdvancedDataGridColumn4_c(),this._EventLogDataGrid_AdvancedDataGridColumn5_c()];
         this.addEventListener("creationComplete",this.___EventLogDataGrid_AdvancedDataGrid1_creationComplete);
         this.addEventListener("change",this.___EventLogDataGrid_AdvancedDataGrid1_change);
         this.addEventListener("itemRollOver",this.___EventLogDataGrid_AdvancedDataGrid1_itemRollOver);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         EventLogDataGrid._watcherSetupUtil = param1;
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
      
      private function onCreationComplete() : void
      {
      }
      
      public function set active(param1:Boolean) : void
      {
         this.currentTrapper.active = param1;
      }
      
      public function dispose() : void
      {
         if(this.currentTrapper)
         {
            this.currentTrapper.dispose();
            this.currentTrapper = null;
         }
      }
      
      public function setEventTarget(param1:Object) : void
      {
         var _loc2_:EventTrapper = EventTrapper.getTrapper(param1);
         if(!_loc2_)
         {
            _loc2_ = new EventTrapper(param1,this.onEvent);
            _loc2_.excludeTarget(this);
            EventTrapper.addTrapper(param1,_loc2_);
         }
         else
         {
            _loc2_.callback = this.onEvent;
         }
         this.currentTrapper = _loc2_;
         this.computeCount();
      }
      
      public function clear() : void
      {
         this.currentTrapper.clear();
         this.totalEvents = 0;
      }
      
      public function selectPrevious() : void
      {
         if(selectedIndex > 0)
         {
            --selectedIndex;
            scrollToIndex(selectedIndex);
         }
      }
      
      public function selectNext() : void
      {
         if(selectedIndex < this.currentTrapper.events.length)
         {
            ++selectedIndex;
            scrollToIndex(selectedIndex);
         }
      }
      
      public function get selectedEventWrapper() : EventWrapper
      {
         return selectedItem as EventWrapper;
      }
      
      private function onEvent(param1:Event) : void
      {
         callLater(this.selectLastItem);
         this.computeCount();
      }
      
      private function computeCount() : void
      {
         this.totalEvents = this.currentTrapper.events.source.length;
         this.visibleEvents = this.currentTrapper.events.length;
      }
      
      private function selectLastItem() : void
      {
         var _loc1_:int = ArrayCollection(dataProvider).length - 1;
         if(_loc1_ >= 0)
         {
            selectedItem = ArrayCollection(dataProvider).getItemAt(_loc1_);
            scrollToIndex(_loc1_);
         }
      }
      
      private function sortByClass(param1:EventWrapper, param2:EventWrapper) : int
      {
         var _loc3_:String = ClassUtils.getShortClassName(param1.event);
         var _loc4_:String = ClassUtils.getShortClassName(param2.event);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function sortByTime(param1:EventWrapper, param2:EventWrapper) : int
      {
         var _loc3_:Number = param1.time;
         var _loc4_:Number = param2.time;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function sortByNumber(param1:EventWrapper, param2:EventWrapper) : int
      {
         var _loc3_:int = param1.number;
         var _loc4_:int = param2.number;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function getDataTip(param1:Object) : String
      {
         if(param1 is EventWrapper)
         {
            return EventWrapper(param1).target.toString();
         }
         return "";
      }
      
      private function getEvent(param1:Object) : String
      {
         if(param1 is EventWrapper)
         {
            return EventWrapper(param1).type;
         }
         return "";
      }
      
      private function getParentDataTip(param1:Object) : String
      {
         var item:Object = param1;
         try
         {
            if(item is EventWrapper)
            {
               return !!EventWrapper(item).target.parent ? item.target.parent.toString() : "";
            }
            return "";
         }
         catch(e:Error)
         {
         }
         return "";
      }
      
      private function groupTarget(param1:EventWrapper, param2:GroupingField) : String
      {
         return param1.targetLabel;
      }
      
      public function groupColumns() : void
      {
         var _loc4_:GroupingCollection2 = null;
         _loc4_ = new GroupingCollection2();
         _loc4_.source = this.currentTrapper.events;
         var _loc1_:Array = [];
         var _loc2_:GroupingField = new GroupingField("Target");
         _loc2_.groupingFunction = this.groupTarget;
         _loc1_.push(_loc2_);
         var _loc3_:Grouping = new Grouping();
         _loc3_.fields = _loc1_;
         _loc4_.grouping = _loc3_;
         this.dataProvider = _loc4_;
         _loc4_.refresh();
      }
      
      private function _onChange() : void
      {
         ContextMenuHelper.prepareDebugNodeMenu(this,selectedItem);
      }
      
      private function _onItemRollOver(param1:ListEvent) : void
      {
         var _loc2_:EventWrapper = null;
         var _loc3_:Object = null;
         var _loc4_:DisplayObject = null;
         if(param1.itemRenderer.data is EventWrapper)
         {
            _loc2_ = param1.itemRenderer.data as EventWrapper;
            _loc3_ = _loc2_.target;
            if(_loc2_.event is ListEvent)
            {
               _loc4_ = ListEvent(_loc2_.event).itemRenderer as DisplayObject;
               if(_loc4_)
               {
                  EffectUtils.glow(_loc4_);
               }
            }
         }
      }
      
      private function _EventLogDataGrid_AdvancedDataGridColumn1_i() : AdvancedDataGridColumn
      {
         var _loc1_:AdvancedDataGridColumn = new AdvancedDataGridColumn();
         _loc1_.headerText = "#";
         _loc1_.dataField = "number";
         _loc1_.width = 40;
         this._EventLogDataGrid_AdvancedDataGridColumn1 = _loc1_;
         BindingManager.executeBindings(this,"_EventLogDataGrid_AdvancedDataGridColumn1",this._EventLogDataGrid_AdvancedDataGridColumn1);
         return _loc1_;
      }
      
      private function _EventLogDataGrid_AdvancedDataGridColumn2_i() : AdvancedDataGridColumn
      {
         var _loc1_:AdvancedDataGridColumn = new AdvancedDataGridColumn();
         _loc1_.dataField = "time";
         _loc1_.width = 65;
         this._EventLogDataGrid_AdvancedDataGridColumn2 = _loc1_;
         BindingManager.executeBindings(this,"_EventLogDataGrid_AdvancedDataGridColumn2",this._EventLogDataGrid_AdvancedDataGridColumn2);
         return _loc1_;
      }
      
      private function _EventLogDataGrid_AdvancedDataGridColumn3_c() : AdvancedDataGridColumn
      {
         var _loc1_:AdvancedDataGridColumn = new AdvancedDataGridColumn();
         _loc1_.headerText = "Target";
         _loc1_.dataField = "targetLabel";
         _loc1_.showDataTips = true;
         _loc1_.dataTipFunction = this.getDataTip;
         _loc1_.width = 160;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EventLogDataGrid_AdvancedDataGridColumn4_c() : AdvancedDataGridColumn
      {
         var _loc1_:AdvancedDataGridColumn = new AdvancedDataGridColumn();
         _loc1_.headerText = "Type";
         _loc1_.dataField = "type";
         _loc1_.width = 80;
         _loc1_.showDataTips = true;
         _loc1_.dataTipFunction = this.getEvent;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EventLogDataGrid_AdvancedDataGridColumn5_c() : AdvancedDataGridColumn
      {
         var _loc1_:AdvancedDataGridColumn = new AdvancedDataGridColumn();
         _loc1_.headerText = "phase";
         _loc1_.dataField = "eventPhase";
         _loc1_.width = 55;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___EventLogDataGrid_AdvancedDataGrid1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function ___EventLogDataGrid_AdvancedDataGrid1_change(param1:ListEvent) : void
      {
         this._onChange();
      }
      
      public function ___EventLogDataGrid_AdvancedDataGrid1_itemRollOver(param1:ListEvent) : void
      {
         this._onItemRollOver(param1);
      }
      
      private function _EventLogDataGrid_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return currentTrapper.events;
         },null,"this.dataProvider");
         result[1] = new Binding(this,function():Function
         {
            return sortByNumber;
         },null,"_EventLogDataGrid_AdvancedDataGridColumn1.sortCompareFunction");
         result[2] = new Binding(this,function():Function
         {
            return sortByTime;
         },null,"_EventLogDataGrid_AdvancedDataGridColumn2.sortCompareFunction");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get currentTrapper() : EventTrapper
      {
         return this._1638089495currentTrapper;
      }
      
      public function set currentTrapper(param1:EventTrapper) : void
      {
         var _loc2_:Object = this._1638089495currentTrapper;
         if(_loc2_ !== param1)
         {
            this._1638089495currentTrapper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentTrapper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get totalEvents() : int
      {
         return this._1134877315totalEvents;
      }
      
      public function set totalEvents(param1:int) : void
      {
         var _loc2_:Object = this._1134877315totalEvents;
         if(_loc2_ !== param1)
         {
            this._1134877315totalEvents = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalEvents",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visibleEvents() : int
      {
         return this._496050219visibleEvents;
      }
      
      public function set visibleEvents(param1:int) : void
      {
         var _loc2_:Object = this._496050219visibleEvents;
         if(_loc2_ !== param1)
         {
            this._496050219visibleEvents = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visibleEvents",_loc2_,param1));
            }
         }
      }
   }
}

