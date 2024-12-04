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
   import fr.kapit.controls.kButton;
   import fr.kapit.controls.kTextInput;
   import fr.kapit.introspection.events.EventFilterSelectedEvent;
   import fr.kapit.tree.DebugComponent;
   import fr.kapit.utils.ApplicationUtils;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.ControlBar;
   import mx.containers.HBox;
   import mx.containers.ViewStack;
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class EventLoggerComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var NAME:String = "EventLoggerComponent";
      
      public static var LABEL:String = "Event console";
      
      public var _EventLoggerComponent_Label1:Label;
      
      private var _939570648activeButton:kButton;
      
      private var _198239087debugTree:DebugComponent;
      
      private var _120150326eventDataGrid:EventLogDataGrid;
      
      private var _53708801eventFilters:kButton;
      
      private var _211259928gridButton:kButton;
      
      private var _719617843maxStepper:kTextInput;
      
      private var _162781296treeButton:kButton;
      
      private var _1584105757viewStack:ViewStack;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _targets:Array;
      
      private var pauseButton:Class;
      
      private var playButton:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_chooseevent_png_1265214128:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_up_png_1615221306:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_tree_over_png_1361478452:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_list_up_png_1486580730:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_clear_png_907925852:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_list_over_png_1644285236:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_tree_up_png_268641274:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_down_png_1322034192:Class;
      
      private var _embed_mxml__fr_kapit_assets_eventlogger_pause_png_884859530:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EventLoggerComponent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":AbstractKapDebugComponent,
            "events":{"creationComplete":"___EventLoggerComponent_AbstractKapDebugComponent1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ControlBar,
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 0;
                     this.horizontalGap = 2;
                     this.paddingRight = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":kButton,
                           "id":"eventFilters",
                           "events":{"click":"__eventFilters_click"},
                           "stylesFactory":function():void
                           {
                              this.paddingLeft = 0;
                              this.icon = _embed_mxml__fr_kapit_assets_eventlogger_chooseevent_png_1265214128;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":26,
                                 "height":24,
                                 "toolTip":"Choose events to capture"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":7};
                           }
                        }),new UIComponentDescriptor({
                           "type":kButton,
                           "events":{"click":"___EventLoggerComponent_kButton2_click"},
                           "stylesFactory":function():void
                           {
                              this.icon = _embed_mxml__fr_kapit_assets_eventlogger_up_png_1615221306;
                              this.paddingLeft = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":26,
                                 "height":24,
                                 "toolTip":"Previous event"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":kButton,
                           "events":{"click":"___EventLoggerComponent_kButton3_click"},
                           "stylesFactory":function():void
                           {
                              this.icon = _embed_mxml__fr_kapit_assets_eventlogger_down_png_1322034192;
                              this.paddingLeft = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":26,
                                 "height":24,
                                 "toolTip":"Next event"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":7};
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalGap = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":kButton,
                                 "id":"gridButton",
                                 "events":{"click":"__gridButton_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.upSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_up_png_1486580730;
                                    this.downSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184;
                                    this.overSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_over_png_1644285236;
                                    this.selectedDownSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184;
                                    this.selectedUpSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184;
                                    this.selectedOverSkin = _embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":26,
                                       "height":24,
                                       "toggle":true,
                                       "selected":true,
                                       "toolTip":"Display list of events, or inspect individual events"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":kButton,
                                 "id":"treeButton",
                                 "events":{"click":"__treeButton_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.upSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_up_png_268641274;
                                    this.downSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904;
                                    this.overSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_over_png_1361478452;
                                    this.selectedDownSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904;
                                    this.selectedUpSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904;
                                    this.selectedOverSkin = _embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "width":26,
                                       "height":24,
                                       "toggle":true,
                                       "selected":false,
                                       "toolTip":"Display list of events, or inspect individual events"
                                    };
                                 }
                              })]};
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":7};
                           }
                        }),new UIComponentDescriptor({
                           "type":kButton,
                           "events":{"click":"___EventLoggerComponent_kButton6_click"},
                           "stylesFactory":function():void
                           {
                              this.icon = _embed_mxml__fr_kapit_assets_eventlogger_clear_png_907925852;
                              this.paddingLeft = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "toolTip":"Clear recorded events",
                                 "width":26
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":15};
                           }
                        }),new UIComponentDescriptor({
                           "type":kButton,
                           "id":"activeButton",
                           "events":{"click":"__activeButton_click"},
                           "stylesFactory":function():void
                           {
                              this.icon = _embed_mxml__fr_kapit_assets_eventlogger_pause_png_884859530;
                              this.paddingLeft = 1;
                              this.paddingRight = 2;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "toggle":false,
                                 "selected":true,
                                 "toolTip":"Activate or dectivate recording of events",
                                 "width":26
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        }),new UIComponentDescriptor({
                           "type":Label,
                           "id":"_EventLoggerComponent_Label1",
                           "propertiesFactory":function():Object
                           {
                              return {"toolTip":"Total number of events recorded and displayed"};
                           }
                        }),new UIComponentDescriptor({
                           "type":kTextInput,
                           "id":"maxStepper",
                           "events":{"enter":"__maxStepper_enter"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "toolTip":"Maximum recorded event. Change the value and hit enter to fix a new limit",
                                 "text":"500",
                                 "width":40
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"viewStack",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":EventLogDataGrid,
                                    "id":"eventDataGrid",
                                    "events":{"creationComplete":"__eventDataGrid_creationComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":DebugComponent,
                                    "id":"debugTree",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._targets = [];
         this.pauseButton = EventLoggerComponent_pauseButton;
         this.playButton = EventLoggerComponent_playButton;
         this._embed_mxml__fr_kapit_assets_eventlogger_chooseevent_png_1265214128 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_chooseevent_png_1265214128;
         this._embed_mxml__fr_kapit_assets_eventlogger_up_png_1615221306 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_up_png_1615221306;
         this._embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_list_down_png_1931875184;
         this._embed_mxml__fr_kapit_assets_eventlogger_tree_over_png_1361478452 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_tree_over_png_1361478452;
         this._embed_mxml__fr_kapit_assets_eventlogger_list_up_png_1486580730 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_list_up_png_1486580730;
         this._embed_mxml__fr_kapit_assets_eventlogger_clear_png_907925852 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_clear_png_907925852;
         this._embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_tree_down_png_1914817904;
         this._embed_mxml__fr_kapit_assets_eventlogger_list_over_png_1644285236 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_list_over_png_1644285236;
         this._embed_mxml__fr_kapit_assets_eventlogger_tree_up_png_268641274 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_tree_up_png_268641274;
         this._embed_mxml__fr_kapit_assets_eventlogger_down_png_1322034192 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_down_png_1322034192;
         this._embed_mxml__fr_kapit_assets_eventlogger_pause_png_884859530 = EventLoggerComponent__embed_mxml__fr_kapit_assets_eventlogger_pause_png_884859530;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._EventLoggerComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_EventLoggerComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EventLoggerComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.addEventListener("creationComplete",this.___EventLoggerComponent_AbstractKapDebugComponent1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,EventLoggerComponent,EmbeddedAssets.iconEventOn,EmbeddedAssets.iconEventOff,EmbeddedAssets.iconEventOver,_isTargetAcceptable,new KapDebugShortcut(false,false,false,113,NAME));
      }
      
      private static function _isTargetAcceptable(param1:Object) : Boolean
      {
         return param1 is EventDispatcher;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         EventLoggerComponent._watcherSetupUtil = param1;
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
      
      public function setEventTarget(param1:Object) : void
      {
         this.target = param1;
         if(this.eventDataGrid)
         {
            this.eventDataGrid.setEventTarget(target);
         }
      }
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.target = param1;
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(EventLoggerComponent,param1);
      }
      
      override public function set target(param1:Object) : void
      {
         super.target = param1;
         if(targetChanged)
         {
            targetChanged = false;
            this.setEventTarget(param1);
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
      
      private function onCreationComplete() : void
      {
         if(this.eventDataGrid)
         {
            this.eventDataGrid.setEventTarget(target);
         }
      }
      
      private function onDataGridComplete() : void
      {
         if(this.eventDataGrid)
         {
            this.eventDataGrid.setEventTarget(target);
         }
      }
      
      public function clearLogger() : void
      {
         this.eventDataGrid.clear();
      }
      
      public function set active(param1:Boolean) : void
      {
         this.eventDataGrid.active = param1;
         this.activeButton.selected = false;
      }
      
      override public function dispose() : void
      {
         this.eventDataGrid.dispose();
         EventSelectionPanel.releaseTarget(target);
         this.target = null;
      }
      
      private function _toggleActive() : void
      {
         var _loc1_:* = !this.eventDataGrid.currentTrapper.active;
         this.eventDataGrid.currentTrapper.active = _loc1_;
         var _loc2_:Class = _loc1_ ? this.pauseButton : this.playButton;
         this.activeButton.setStyle("icon",_loc2_);
      }
      
      private function goPrevious() : void
      {
         this.eventDataGrid.selectPrevious();
         this.setTreeRoot();
      }
      
      private function goNext() : void
      {
         this.eventDataGrid.selectNext();
         this.setTreeRoot();
      }
      
      private function setTreeRoot() : void
      {
         if(this.viewStack.selectedIndex == 1)
         {
            if(this.eventDataGrid.selectedEventWrapper)
            {
               this.debugTree.setRoot(this.eventDataGrid.selectedEventWrapper.event,this.eventDataGrid.selectedEventWrapper.type);
            }
         }
      }
      
      private function showGrid() : void
      {
         this.viewStack.selectedIndex = 0;
      }
      
      private function showTree() : void
      {
         this.viewStack.selectedIndex = 1;
         callLater(this.setTreeRoot);
      }
      
      private function setFilters() : void
      {
         var _loc1_:EventSelectionPanel = EventSelectionPanel.show(ApplicationUtils.application,this.eventDataGrid.currentTrapper,target);
         _loc1_.addEventListener("eventPanelClose",this.onPopupClose);
         _loc1_.addEventListener(EventFilterSelectedEvent.EVENT_OFF,this.onFilterSelected);
         _loc1_.addEventListener(EventFilterSelectedEvent.EVENT_ON,this.onFilterSelected);
      }
      
      private function onPopupClose(param1:Event) : void
      {
         EventSelectionPanel(param1.target).removeEventListener("eventPanelClose",this.onPopupClose);
         EventSelectionPanel(param1.target).removeEventListener(EventFilterSelectedEvent.EVENT_OFF,this.onFilterSelected);
         EventSelectionPanel(param1.target).removeEventListener(EventFilterSelectedEvent.EVENT_ON,this.onFilterSelected);
      }
      
      private function onFilterSelected(param1:EventFilterSelectedEvent) : void
      {
         if(param1.type == EventFilterSelectedEvent.EVENT_OFF)
         {
            this.eventDataGrid.currentTrapper.removeListener(param1.eventName);
         }
         else
         {
            this.eventDataGrid.currentTrapper.addListener(param1.eventName);
         }
      }
      
      private function _onSliderChange() : void
      {
         var _loc1_:int = int(this.maxStepper.text);
         this.eventDataGrid.currentTrapper.maxEvents = _loc1_;
      }
      
      private function _onModeChange() : void
      {
      }
      
      private function _onGridMode() : void
      {
         if(this.gridButton.selected)
         {
            this.treeButton.selected = false;
            callLater(this.showGrid);
         }
         else
         {
            this.treeButton.selected = true;
            callLater(this.showTree);
         }
      }
      
      private function _onTreeMode() : void
      {
         if(this.treeButton.selected)
         {
            this.gridButton.selected = false;
            callLater(this.showTree);
         }
         else
         {
            this.gridButton.selected = true;
            callLater(this.showGrid);
         }
      }
      
      public function ___EventLoggerComponent_AbstractKapDebugComponent1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function __eventFilters_click(param1:MouseEvent) : void
      {
         this.setFilters();
      }
      
      public function ___EventLoggerComponent_kButton2_click(param1:MouseEvent) : void
      {
         this.goPrevious();
      }
      
      public function ___EventLoggerComponent_kButton3_click(param1:MouseEvent) : void
      {
         this.goNext();
      }
      
      public function __gridButton_click(param1:MouseEvent) : void
      {
         this._onGridMode();
      }
      
      public function __treeButton_click(param1:MouseEvent) : void
      {
         this._onTreeMode();
      }
      
      public function ___EventLoggerComponent_kButton6_click(param1:MouseEvent) : void
      {
         this.clearLogger();
      }
      
      public function __activeButton_click(param1:MouseEvent) : void
      {
         this._toggleActive();
      }
      
      public function __maxStepper_enter(param1:FlexEvent) : void
      {
         this._onSliderChange();
      }
      
      public function __eventDataGrid_creationComplete(param1:FlexEvent) : void
      {
         this.onDataGridComplete();
      }
      
      private function _EventLoggerComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = eventDataGrid.totalEvents;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_EventLoggerComponent_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get activeButton() : kButton
      {
         return this._939570648activeButton;
      }
      
      public function set activeButton(param1:kButton) : void
      {
         var _loc2_:Object = this._939570648activeButton;
         if(_loc2_ !== param1)
         {
            this._939570648activeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get debugTree() : DebugComponent
      {
         return this._198239087debugTree;
      }
      
      public function set debugTree(param1:DebugComponent) : void
      {
         var _loc2_:Object = this._198239087debugTree;
         if(_loc2_ !== param1)
         {
            this._198239087debugTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"debugTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eventDataGrid() : EventLogDataGrid
      {
         return this._120150326eventDataGrid;
      }
      
      public function set eventDataGrid(param1:EventLogDataGrid) : void
      {
         var _loc2_:Object = this._120150326eventDataGrid;
         if(_loc2_ !== param1)
         {
            this._120150326eventDataGrid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventDataGrid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eventFilters() : kButton
      {
         return this._53708801eventFilters;
      }
      
      public function set eventFilters(param1:kButton) : void
      {
         var _loc2_:Object = this._53708801eventFilters;
         if(_loc2_ !== param1)
         {
            this._53708801eventFilters = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventFilters",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gridButton() : kButton
      {
         return this._211259928gridButton;
      }
      
      public function set gridButton(param1:kButton) : void
      {
         var _loc2_:Object = this._211259928gridButton;
         if(_loc2_ !== param1)
         {
            this._211259928gridButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maxStepper() : kTextInput
      {
         return this._719617843maxStepper;
      }
      
      public function set maxStepper(param1:kTextInput) : void
      {
         var _loc2_:Object = this._719617843maxStepper;
         if(_loc2_ !== param1)
         {
            this._719617843maxStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get treeButton() : kButton
      {
         return this._162781296treeButton;
      }
      
      public function set treeButton(param1:kButton) : void
      {
         var _loc2_:Object = this._162781296treeButton;
         if(_loc2_ !== param1)
         {
            this._162781296treeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"treeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewStack() : ViewStack
      {
         return this._1584105757viewStack;
      }
      
      public function set viewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1584105757viewStack;
         if(_loc2_ !== param1)
         {
            this._1584105757viewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewStack",_loc2_,param1));
            }
         }
      }
   }
}

