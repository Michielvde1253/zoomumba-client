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
   import fr.kapit.assets.ComponentIcons;
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.event.StatisticsDataGridItemClick;
   import fr.kapit.introspection.nodes.DisplayNode;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class StatisticsComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var NAME:String = "StatisticsComponent";
      
      public static var LABEL:String = "Statistics";
      
      private var _964746289statsDataGrid:StatisticsDataGrid;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _339742651dataProvider:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StatisticsComponent()
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
                  "type":StatisticsDataGrid,
                  "id":"statsDataGrid",
                  "events":{"itemClick":"__statsDataGrid_itemClick"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100
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
         bindings = this._StatisticsComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_StatisticsComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StatisticsComponent[param1];
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
         return new KapDebugComponentFactory(NAME,LABEL,StatisticsComponent,EmbeddedAssets.iconStatisticsOn,EmbeddedAssets.iconStatisticsOff,EmbeddedAssets.iconStatisticsOver,_isTargetAcceptable,new KapDebugShortcut(false,false,false,114,NAME));
      }
      
      private static function _isTargetAcceptable(param1:Object) : Boolean
      {
         return param1 is DisplayObject;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StatisticsComponent._watcherSetupUtil = param1;
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
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.target = param1;
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(StatisticsComponent,param1);
      }
      
      override public function set target(param1:Object) : void
      {
         var _loc2_:DisplayNode = null;
         var _loc3_:Array = null;
         var _loc4_:Sort = null;
         super.target = param1;
         if(targetChanged)
         {
            targetChanged = false;
            _loc2_ = new DisplayNode(DisplayObject(param1),null,null);
            _loc3_ = _loc2_.getStatistics();
            this.dataProvider = new ArrayCollection(_loc3_);
            _loc4_ = new Sort();
            _loc4_.fields = [new SortField("count",true,true,true)];
            this.dataProvider.sort = _loc4_;
            this.dataProvider.refresh();
            if(!label)
            {
               label = ClassUtils.getInstanceLabel(param1);
            }
            if(!icon)
            {
               icon = ComponentIcons.getClassIcon(param1);
            }
         }
      }
      
      private function onItemClick(param1:ListEvent) : void
      {
         var _loc2_:StatisticsDataGridItemClick = new StatisticsDataGridItemClick(param1.itemRenderer.data.type);
         dispatchEvent(_loc2_);
      }
      
      public function __statsDataGrid_itemClick(param1:ListEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _StatisticsComponent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"statsDataGrid.dataProvider","dataProvider");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get statsDataGrid() : StatisticsDataGrid
      {
         return this._964746289statsDataGrid;
      }
      
      public function set statsDataGrid(param1:StatisticsDataGrid) : void
      {
         var _loc2_:Object = this._964746289statsDataGrid;
         if(_loc2_ !== param1)
         {
            this._964746289statsDataGrid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statsDataGrid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataProvider() : ArrayCollection
      {
         return this._339742651dataProvider;
      }
      
      public function set dataProvider(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._339742651dataProvider;
         if(_loc2_ !== param1)
         {
            this._339742651dataProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataProvider",_loc2_,param1));
            }
         }
      }
   }
}

