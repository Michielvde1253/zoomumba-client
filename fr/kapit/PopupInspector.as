package fr.kapit
{
   import com.flexspy.imp.DataGridValueEnumEditor;
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
   import fr.kapit.components.AboutKapInspect;
   import fr.kapit.components.EventLoggerComponent;
   import fr.kapit.components.IKapDebugComponent;
   import fr.kapit.components.InspectorDockBar;
   import fr.kapit.components.KapDebugShortcut;
   import fr.kapit.components.KapITPopupWindow;
   import fr.kapit.components.MultiInspectorTabs;
   import fr.kapit.components.PanelViewManager;
   import fr.kapit.components.VersatileTabNavigator;
   import fr.kapit.containers.kHDividedBox;
   import fr.kapit.event.ComponentAddedInDockBarEvent;
   import fr.kapit.event.InspectorCloseEvent;
   import fr.kapit.event.StatisticsDataGridItemClick;
   import fr.kapit.event.SuperTabNavigatorTabChangeEvent;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.OpenInspectorCommandEvent;
   import fr.kapit.introspection.components.DisplayListComponent;
   import fr.kapit.introspection.events.InspectorActivatedEvent;
   import fr.kapit.introspection.events.ObjectSelectEvent;
   import fr.kapit.introspection.nodes.DisplayNode;
   import fr.kapit.model.ApplicationModel;
   import fr.kapit.popup.IPopupView;
   import fr.kapit.util.KapInspectFunctions;
   import fr.kapit.utils.ApplicationUtils;
   import fr.kapit.utils.ClassUtils;
   import fr.kapit.utils.capture.MouseCapture;
   import fr.kapit.utils.capture.ObjectCapturedEvent;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.controls.ToolTip;
   import mx.core.FlexSprite;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.managers.CursorManager;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   
   public class PopupInspector extends KapITPopupWindow implements IPopupView, IBindingClient
   {
      private static var _414841024_mouseCapture:MouseCapture;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private var _150500382displayListTabs:VersatileTabNavigator;
      
      private var _150516798displayListTree:DisplayListComponent;
      
      private var _1751852124inspectors:MultiInspectorTabs;
      
      private var _8830564mainHBox:kHDividedBox;
      
      private var _1494281975panelManager:PanelViewManager;
      
      private var _1140124837toolBar:InspectorDockBar;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _417214238initialWidth:int = 500;
      
      private var _481734261initialHeight:int = 400;
      
      private var _91240897_root:DisplayObject;
      
      public var mustBeReloaded:Boolean = false;
      
      private var _peakMem:int;
      
      private var _captureCursor:Class;
      
      private var _captureCursorInt:int;
      
      private var _currentInspectorTarget:Object;
      
      private var _currentInspectorTargetName:String = "";
      
      private var _componentShortcuts:Array;
      
      private var _expanded:Boolean = false;
      
      public function PopupInspector()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":KapITPopupWindow,
            "events":{
               "mouseOver":"___PopupInspector_KapITPopupWindow1_mouseOver",
               "mouseOut":"___PopupInspector_KapITPopupWindow1_mouseOut",
               "mouseMove":"___PopupInspector_KapITPopupWindow1_mouseMove",
               "keyDown":"___PopupInspector_KapITPopupWindow1_keyDown",
               "resize":"___PopupInspector_KapITPopupWindow1_resize",
               "creationComplete":"___PopupInspector_KapITPopupWindow1_creationComplete",
               "initialize":"___PopupInspector_KapITPopupWindow1_initialize"
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":kHDividedBox,
                           "id":"mainHBox",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VersatileTabNavigator,
                                    "id":"displayListTabs",
                                    "events":{"creationComplete":"__displayListTabs_creationComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":30,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":DisplayListComponent,
                                             "id":"displayListTree",
                                             "events":{
                                                "click":"__displayListTree_click",
                                                "doubleClick":"__displayListTree_doubleClick",
                                                "keyDown":"__displayListTree_keyDown"
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "label":"application",
                                                   "percentWidth":100,
                                                   "percentHeight":100,
                                                   "enableMove":true,
                                                   "focusEnabled":false
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":MultiInspectorTabs,
                                    "id":"inspectors",
                                    "events":{"updateComplete":"__inspectors_updateComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "label":"Inspect",
                                          "percentWidth":70,
                                          "percentHeight":100
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "includeInLayout":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":PanelViewManager,
                           "id":"panelManager"
                        }),new UIComponentDescriptor({
                           "type":InspectorDockBar,
                           "id":"toolBar",
                           "events":{
                              "capture":"__toolBar_capture",
                              "refreshSystemManager":"__toolBar_refreshSystemManager",
                              "reloadInspector":"__toolBar_reloadInspector",
                              "removePreview":"__toolBar_removePreview",
                              "ComponentAddedInDockBarEvent":"__toolBar_ComponentAddedInDockBarEvent"
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"height":100};
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._captureCursor = PopupInspector__captureCursor;
         super();
         mx_internal::_document = this;
         bindings = this._PopupInspector_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_PopupInspectorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PopupInspector[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 123;
         this.title = "KapInspect";
         this.maximizable = false;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("mouseOver",this.___PopupInspector_KapITPopupWindow1_mouseOver);
         this.addEventListener("mouseOut",this.___PopupInspector_KapITPopupWindow1_mouseOut);
         this.addEventListener("mouseMove",this.___PopupInspector_KapITPopupWindow1_mouseMove);
         this.addEventListener("keyDown",this.___PopupInspector_KapITPopupWindow1_keyDown);
         this.addEventListener("resize",this.___PopupInspector_KapITPopupWindow1_resize);
         this.addEventListener("creationComplete",this.___PopupInspector_KapITPopupWindow1_creationComplete);
         this.addEventListener("initialize",this.___PopupInspector_KapITPopupWindow1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function get mouseCapture() : MouseCapture
      {
         return _mouseCapture;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PopupInspector._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      private static function get _mouseCapture() : MouseCapture
      {
         return PopupInspector._414841024_mouseCapture;
      }
      
      private static function set _mouseCapture(param1:MouseCapture) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = PopupInspector._414841024_mouseCapture;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(PopupInspector,"_mouseCapture",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
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
      
      public function addDebugItem(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.inspectors.showInspector(param1,param2,param3);
      }
      
      public function addEventLogger(param1:Object) : void
      {
         this.inspectors.showInspector(param1,null,null,EventLoggerComponent.NAME);
      }
      
      public function get activeInspector() : IKapDebugComponent
      {
         return this.inspectors.getActiveInspector(ApplicationModel.instance.selectedTarget);
      }
      
      public function addModule(param1:String) : void
      {
         if(this.toolBar)
         {
            this.toolBar.addButton(param1);
         }
      }
      
      public function addCustomView(param1:String) : void
      {
         if(this.toolBar)
         {
            this.toolBar.addButton(param1);
         }
      }
      
      override protected function showAbout() : void
      {
         var _loc1_:IFlexDisplayObject = PopUpManager.createPopUp(ApplicationUtils.application,AboutKapInspect,true);
         PopUpManager.centerPopUp(_loc1_);
      }
      
      private function onCreationComplete() : void
      {
         setStyle("headerHeight",28);
         addEventListener("close",this.closeWindow,false,0,true);
         addEventListener(StatisticsDataGridItemClick.NAME,this.onStatisticDataGridClick,true);
         addEventListener(SuperTabNavigatorTabChangeEvent.NAME,this.onTabChange,true);
         addEventListener(ObjectSelectEvent.NAME,this._onObjectSelected,true);
         KapDebugEventDispatcher.instance.addEventListener(OpenInspectorCommandEvent.NAME,this._onOpenInspector,false,0,true);
         KapDebugEventDispatcher.instance.addEventListener(InspectorActivatedEvent.NAME,this._onInspectorActivated,false,0,true);
         var _loc1_:Timer = new Timer(1000);
         _loc1_.addEventListener("timer",this.timerHandler);
         _loc1_.start();
         var _loc2_:Array = [];
         var _loc3_:ContextMenuItem = new ContextMenuItem("About KapInspect... ");
         _loc3_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this._showAbout);
         _loc2_.push(_loc3_);
         var _loc4_:ContextMenu = new ContextMenu();
         _loc4_.customItems = _loc2_;
         _loc4_.hideBuiltInItems();
         this.contextMenu = _loc4_;
         this.toolBar.width = this.width - 90;
         ApplicationModel.instance.selectedTarget = ApplicationUtils.application;
         mouseCapture.objectPreview = ApplicationUtils.application;
         this._setTitle();
      }
      
      private function _onResize(param1:ResizeEvent) : void
      {
         if(param1.oldHeight != this.height && this.isRolled)
         {
            this.height = MIN_HEIGHT;
            return;
         }
         if(this.toolBar)
         {
            this.toolBar.width = this.width - 90;
         }
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         this._setTitle();
      }
      
      private function _setTitle() : void
      {
         var _loc1_:int = int(System.totalMemory);
         if(_loc1_ > this._peakMem)
         {
            this._peakMem = _loc1_;
         }
         var _loc2_:* = "";
         if(this._currentInspectorTargetName != "" || this.toolBar.activeButton != "")
         {
            if(this.toolBar.activeButton == "")
            {
               _loc2_ = this._currentInspectorTargetName + "     -    ";
            }
            else
            {
               _loc2_ = this._currentInspectorTargetName + (this.toolBar.activeButton == null || this.toolBar.activeButton == "" ? "    -    " : " (" + this.toolBar.activeButton + ")     -    ");
            }
         }
         this.title = _loc2_ + "VM: " + KapInspectFunctions.byteConvert(_loc1_) + " / " + KapInspectFunctions.byteConvert(this._peakMem);
      }
      
      public function set currentInspectorTarget(param1:Object) : void
      {
         if(param1 != this._currentInspectorTarget)
         {
            this._currentInspectorTarget = param1;
            this._currentInspectorTargetName = ClassUtils.getLabelForDisplayNode(param1);
            this._setTitle();
         }
      }
      
      public function setRootComponents(param1:DisplayObject, param2:UIComponent) : void
      {
         this._root = param1;
         _mouseCapture = MouseCapture.initialize(this._root,param2);
         _mouseCapture.addEventListener(ObjectCapturedEvent.NAME,this.onObjectSelected);
         this.init();
      }
      
      private function onStatisticDataGridClick(param1:StatisticsDataGridItemClick) : void
      {
         var _loc2_:DisplayNode = null;
         if(_mouseCapture.previewObject)
         {
            _loc2_ = new DisplayNode(_mouseCapture.previewObject.dObject,null,null);
            _mouseCapture.arrSelectedRect = _loc2_.getObjectOfType(param1.objType);
         }
      }
      
      private function init() : void
      {
      }
      
      private function onTabChange(param1:SuperTabNavigatorTabChangeEvent) : void
      {
         _mouseCapture.objectPreview = param1.displayObject;
         this.displayListTree.selectTreeItem(param1.displayObject);
         if(param1.inspector)
         {
            this.toolBar.activeButton = param1.inspector.componentName;
            this.currentInspectorTarget = param1.inspector.target;
         }
      }
      
      public function registerShortcut() : void
      {
      }
      
      private function _onComponentAddedInDockBar(param1:ComponentAddedInDockBarEvent) : void
      {
         if(this._componentShortcuts == null)
         {
            this._componentShortcuts = new Array();
         }
         this._componentShortcuts.push(param1.shortcut);
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:KapDebugShortcut = null;
         if(param1.target is DataGridValueEnumEditor)
         {
            return;
         }
         if(param1.ctrlKey && param1.keyCode == 67)
         {
            this.visible = false;
            this.setCaptureCursor(true);
            _mouseCapture.isInCapture = true;
            param1.stopImmediatePropagation();
            param1.stopPropagation();
            param1.preventDefault();
         }
         if(param1.keyCode == 123 || param1.keyCode == 122)
         {
            this.panelManager.shortcutHandler(param1);
         }
         for each(_loc2_ in this._componentShortcuts)
         {
            if(_loc2_ && param1.altKey == _loc2_.altKey && param1.shiftKey == _loc2_.shiftKey && param1.ctrlKey == _loc2_.ctrlKey && param1.keyCode == _loc2_.keyCode)
            {
               KapDebugEventDispatcher.instance.dispatchEvent(new OpenInspectorCommandEvent(_loc2_.componentName,this._currentInspectorTarget));
            }
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         _mouseCapture.overPopup();
         CursorManager.removeCursor(this._captureCursorInt);
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(_mouseCapture.isInCapture)
         {
            this.setCaptureCursor(true);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      private function closeWindow(param1:Event = null) : void
      {
         _mouseCapture.enabled = false;
      }
      
      public function setCaptureCursor(param1:Boolean) : void
      {
         if(param1)
         {
            this._captureCursorInt = CursorManager.setCursor(this._captureCursor,2,-9,-9);
         }
         else
         {
            CursorManager.removeCursor(this._captureCursorInt);
            cursorManager.removeAllCursors();
            cursorManager.showCursor();
         }
      }
      
      public function set mouseCaptureEnabled(param1:Boolean) : void
      {
         _mouseCapture.enabled = param1;
      }
      
      private function onCaptureModeChanged() : void
      {
         _mouseCapture.isInCapture = true;
         this.visible = false;
      }
      
      private function onCaptureAppChanged() : void
      {
      }
      
      private function onOnlyVisibleChanged() : void
      {
      }
      
      private function onCaptureSwfLoader() : void
      {
      }
      
      private function onObjectSelected(param1:ObjectCapturedEvent) : void
      {
         var e:ObjectCapturedEvent = param1;
         try
         {
            this.inspectors.showInspector(e.objectCaptured,"root",null);
            this.displayListTabs.selectedChild = this.displayListTree;
            this.displayListTree.selectTreeItem(e.objectCaptured);
         }
         catch(e:Error)
         {
         }
      }
      
      private function onTreeChange2(param1:Event) : void
      {
         CursorManager.setBusyCursor();
         var _loc2_:DisplayNode = DisplayListComponent(param1.currentTarget).selectedNode;
         var _loc3_:DisplayObject = _loc2_ == null ? null : _loc2_.displayObject;
         if(!_loc3_)
         {
            return;
         }
         _mouseCapture.objectPreview = _loc3_;
         CursorManager.removeBusyCursor();
      }
      
      private function onDisplayDoubleClick(param1:MouseEvent) : void
      {
         var _loc2_:DisplayNode = DisplayListComponent(param1.currentTarget).selectedNode;
         var _loc3_:DisplayObject = _loc2_ == null ? null : _loc2_.displayObject;
         if(!_loc3_)
         {
            return;
         }
         this.inspectors.showInspector(_loc3_,_loc2_.shortVarName,null);
      }
      
      private function reloadInspector() : void
      {
         this.mustBeReloaded = true;
         this.inspectors.dispose();
         dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
      }
      
      private function loadPopups() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayListComponent = null;
         for each(_loc1_ in systemManager.popUpChildren)
         {
            _loc2_ = new DisplayListComponent();
            _loc2_.rootObject = _loc1_;
            _loc2_.label = _loc1_.toString();
            this.displayListTabs.addChild(_loc2_);
         }
         callLater(this.selectMainDisplayList);
      }
      
      private function selectMainDisplayList() : void
      {
         this.displayListTabs.selectedIndex = 0;
      }
      
      private function refreshSystemManager() : void
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         var _loc6_:DisplayListComponent = null;
         var _loc7_:DisplayListComponent = null;
         var _loc1_:int = 0;
         while(_loc1_ < systemManager.rawChildren.numChildren)
         {
            _loc2_ = systemManager.rawChildren.getChildAt(_loc1_);
            _loc3_ = ClassUtils.getObjectClass(_loc2_);
            if(!(_loc3_ == Sprite || _loc3_ == FlexSprite || _loc2_ is ToolTip))
            {
               if(_loc2_ is DisplayObject)
               {
                  _loc4_ = this.displayListTabs.allChildren;
                  _loc5_ = false;
                  for each(_loc6_ in _loc4_)
                  {
                     if(_loc6_.rootObject == _loc2_)
                     {
                        _loc6_.refresh();
                        _loc5_ = true;
                        break;
                     }
                  }
                  if(!_loc5_)
                  {
                     _loc7_ = new DisplayListComponent();
                     _loc7_.percentHeight = 100;
                     _loc7_.percentWidth = 100;
                     _loc7_.rootObject = DisplayObject(_loc2_);
                     _loc7_.label = _loc2_.toString();
                     _loc7_.addEventListener("change",this.onTreeChange2);
                     _loc7_.addEventListener(MouseEvent.DOUBLE_CLICK,this.onDisplayDoubleClick);
                     callLater(this.displayListTabs.addChild,[_loc7_]);
                  }
               }
            }
            _loc1_++;
         }
      }
      
      private function onNavComplete() : void
      {
         callLater(this.selectFirstTab);
      }
      
      private function selectFirstTab() : void
      {
         this.displayListTabs.selectedChild = this.displayListTree;
      }
      
      private function _onObjectSelected(param1:ObjectSelectEvent) : void
      {
         ApplicationModel.instance.selectedTarget = param1.targetObject;
         this.inspectors.showActiveInspector(param1.targetObject);
         this._setTitle();
         this.currentInspectorTarget = param1.targetObject;
      }
      
      private function _onOpenInspector(param1:OpenInspectorCommandEvent) : void
      {
         this.inspectors.openInspector(param1.inspectorName,param1.targetObject,param1.name,param1.host);
      }
      
      private function _onInspectorsUpdate() : void
      {
         if(this.inspectors.tabCount == 0 && !this._expanded)
         {
            this._expanded = true;
            this.displayListTabs.percentWidth = 100;
            this.inspectors.percentWidth = 0;
         }
         else if(this._expanded && this.inspectors.tabCount > 0)
         {
            this._expanded = false;
            this.displayListTabs.percentWidth = 30;
            this.inspectors.percentWidth = 70;
         }
      }
      
      private function _onInspectorActivated(param1:InspectorActivatedEvent) : void
      {
         this.currentInspectorTarget = param1.targetObject;
      }
      
      private function removePreview() : void
      {
         _mouseCapture.enabled = false;
      }
      
      private function _onInspectorClose(param1:InspectorCloseEvent) : void
      {
         this.inspectors.closeInspector(param1.componentName,this._currentInspectorTarget);
      }
      
      private function _showAbout(param1:Event) : void
      {
         var _loc2_:IFlexDisplayObject = PopUpManager.createPopUp(ApplicationUtils.application,AboutKapInspect,true);
         PopUpManager.centerPopUp(_loc2_);
      }
      
      private function _onInitialize() : void
      {
         if(ApplicationUtils.application)
         {
            width = Math.min(500,ApplicationUtils.application.width * 0.75);
            height = Math.min(400,ApplicationUtils.application.height * 0.9);
         }
      }
      
      public function ___PopupInspector_KapITPopupWindow1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver(param1);
      }
      
      public function ___PopupInspector_KapITPopupWindow1_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseOut(param1);
      }
      
      public function ___PopupInspector_KapITPopupWindow1_mouseMove(param1:MouseEvent) : void
      {
         this.onMouseMove(param1);
      }
      
      public function ___PopupInspector_KapITPopupWindow1_keyDown(param1:KeyboardEvent) : void
      {
         this.onKeyDown(param1);
      }
      
      public function ___PopupInspector_KapITPopupWindow1_resize(param1:ResizeEvent) : void
      {
         this._onResize(param1);
      }
      
      public function ___PopupInspector_KapITPopupWindow1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function ___PopupInspector_KapITPopupWindow1_initialize(param1:FlexEvent) : void
      {
         this._onInitialize();
      }
      
      public function __displayListTabs_creationComplete(param1:FlexEvent) : void
      {
         this.onNavComplete();
      }
      
      public function __displayListTree_click(param1:Event) : void
      {
         this.onTreeChange2(param1);
      }
      
      public function __displayListTree_doubleClick(param1:Event) : void
      {
         this.onDisplayDoubleClick(param1 as MouseEvent);
      }
      
      public function __displayListTree_keyDown(param1:KeyboardEvent) : void
      {
         this.onKeyDown(param1);
      }
      
      public function __inspectors_updateComplete(param1:FlexEvent) : void
      {
         this._onInspectorsUpdate();
      }
      
      public function __toolBar_capture(param1:Event) : void
      {
         this.onCaptureModeChanged();
      }
      
      public function __toolBar_refreshSystemManager(param1:Event) : void
      {
         this.refreshSystemManager();
      }
      
      public function __toolBar_reloadInspector(param1:Event) : void
      {
         this.reloadInspector();
      }
      
      public function __toolBar_removePreview(param1:Event) : void
      {
         this.removePreview();
      }
      
      public function __toolBar_ComponentAddedInDockBarEvent(param1:ComponentAddedInDockBarEvent) : void
      {
         this._onComponentAddedInDockBar(param1);
      }
      
      private function _PopupInspector_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"this.width","initialWidth");
         result[1] = new Binding(this,null,null,"this.height","initialHeight");
         result[2] = new Binding(this,function():DisplayObject
         {
            return _root;
         },null,"displayListTree.rootObject");
         result[3] = new Binding(this,null,null,"panelManager.mainHBox","mainHBox");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayListTabs() : VersatileTabNavigator
      {
         return this._150500382displayListTabs;
      }
      
      public function set displayListTabs(param1:VersatileTabNavigator) : void
      {
         var _loc2_:Object = this._150500382displayListTabs;
         if(_loc2_ !== param1)
         {
            this._150500382displayListTabs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayListTabs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayListTree() : DisplayListComponent
      {
         return this._150516798displayListTree;
      }
      
      public function set displayListTree(param1:DisplayListComponent) : void
      {
         var _loc2_:Object = this._150516798displayListTree;
         if(_loc2_ !== param1)
         {
            this._150516798displayListTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayListTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inspectors() : MultiInspectorTabs
      {
         return this._1751852124inspectors;
      }
      
      public function set inspectors(param1:MultiInspectorTabs) : void
      {
         var _loc2_:Object = this._1751852124inspectors;
         if(_loc2_ !== param1)
         {
            this._1751852124inspectors = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inspectors",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainHBox() : kHDividedBox
      {
         return this._8830564mainHBox;
      }
      
      public function set mainHBox(param1:kHDividedBox) : void
      {
         var _loc2_:Object = this._8830564mainHBox;
         if(_loc2_ !== param1)
         {
            this._8830564mainHBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainHBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panelManager() : PanelViewManager
      {
         return this._1494281975panelManager;
      }
      
      public function set panelManager(param1:PanelViewManager) : void
      {
         var _loc2_:Object = this._1494281975panelManager;
         if(_loc2_ !== param1)
         {
            this._1494281975panelManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolBar() : InspectorDockBar
      {
         return this._1140124837toolBar;
      }
      
      public function set toolBar(param1:InspectorDockBar) : void
      {
         var _loc2_:Object = this._1140124837toolBar;
         if(_loc2_ !== param1)
         {
            this._1140124837toolBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get initialWidth() : int
      {
         return this._417214238initialWidth;
      }
      
      public function set initialWidth(param1:int) : void
      {
         var _loc2_:Object = this._417214238initialWidth;
         if(_loc2_ !== param1)
         {
            this._417214238initialWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"initialWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get initialHeight() : int
      {
         return this._481734261initialHeight;
      }
      
      public function set initialHeight(param1:int) : void
      {
         var _loc2_:Object = this._481734261initialHeight;
         if(_loc2_ !== param1)
         {
            this._481734261initialHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"initialHeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _root() : DisplayObject
      {
         return this._91240897_root;
      }
      
      private function set _root(param1:DisplayObject) : void
      {
         var _loc2_:Object = this._91240897_root;
         if(_loc2_ !== param1)
         {
            this._91240897_root = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_root",_loc2_,param1));
            }
         }
      }
   }
}

