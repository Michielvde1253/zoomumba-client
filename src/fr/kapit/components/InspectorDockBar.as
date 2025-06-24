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
   import fr.kapit.DockBar;
   import fr.kapit.KapInspect;
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.event.ComponentAddedInDockBarEvent;
   import fr.kapit.event.SelectedTargetChangeEvent;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.OpenInspectorCommandEvent;
   import fr.kapit.introspection.events.InspectorActivatedEvent;
   import fr.kapit.utils.ClassUtils;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class InspectorDockBar extends Canvas implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _InspectorDockBar_InspectorDockBarItem1:InspectorDockBarItem;
      
      public var _InspectorDockBar_InspectorDockBarItem2:InspectorDockBarItem;
      
      public var _InspectorDockBar_InspectorDockBarItem3:InspectorDockBarItem;
      
      public var _InspectorDockBar_InspectorDockBarItem4:InspectorDockBarItem;
      
      public var _InspectorDockBar_InspectorDockBarItem5:InspectorDockBarItem;
      
      private var _1344845117activationArea:Canvas;
      
      private var _1828604160dockbar:DockBar;
      
      private var _1056958642innerCanvas:HBox;
      
      private var _1544880939menuLabel:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _filterOver:GlowFilter;
      
      private var _filterSelect:GlowFilter;
      
      private var _selectedItem:String = "";
      
      private var _activeName:String = "";
      
      private var _buttons:Object;
      
      private var _target:Object;
      
      private var _pluginPosition:int = 0;
      
      private var _activateByMyselft:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function InspectorDockBar()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{
               "creationComplete":"___InspectorDockBar_Canvas1_creationComplete",
               "resize":"___InspectorDockBar_Canvas1_resize"
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":DockBar,
                  "id":"dockbar",
                  "events":{"closed":"__dockbar_closed"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "horizontalCenter":0,
                        "percentWidth":100,
                        "minSize":32,
                        "maxSize":64,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "top":0,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"menuLabel",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "visible":false,
                                          "alpha":0.75
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"activationArea",
                           "events":{"rollOver":"__activationArea_rollOver"},
                           "stylesFactory":function():void
                           {
                              this.backgroundColor = 0;
                              this.backgroundAlpha = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "y":-5,
                                 "height":20
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "id":"innerCanvas",
                           "stylesFactory":function():void
                           {
                              this.backgroundColor = 3355443;
                              this.backgroundAlpha = 0;
                              this.horizontalGap = 2;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalCenter":0,
                                 "y":-45,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":InspectorDockBarItem,
                                    "id":"_InspectorDockBar_InspectorDockBarItem1"
                                 }),new UIComponentDescriptor({
                                    "type":InspectorDockBarItem,
                                    "id":"_InspectorDockBar_InspectorDockBarItem2",
                                    "events":{"click":"___InspectorDockBar_InspectorDockBarItem2_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"toolTip":"Capture"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":InspectorDockBarItem,
                                    "id":"_InspectorDockBar_InspectorDockBarItem3",
                                    "events":{"click":"___InspectorDockBar_InspectorDockBarItem3_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"toolTip":"Refresh"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":InspectorDockBarItem,
                                    "id":"_InspectorDockBar_InspectorDockBarItem4",
                                    "events":{"click":"___InspectorDockBar_InspectorDockBarItem4_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"toolTip":"Refresh popups"};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":InspectorDockBarItem,
                                    "id":"_InspectorDockBar_InspectorDockBarItem5",
                                    "events":{"click":"___InspectorDockBar_InspectorDockBarItem5_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {"toolTip":"Unselect"};
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
         this._buttons = {};
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._InspectorDockBar_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_InspectorDockBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return InspectorDockBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.addEventListener("creationComplete",this.___InspectorDockBar_Canvas1_creationComplete);
         this.addEventListener("resize",this.___InspectorDockBar_Canvas1_resize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         InspectorDockBar._watcherSetupUtil = param1;
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
      
      private function _onCreationComplete() : void
      {
         this._filterOver = new GlowFilter();
         this._filterOver.color = 16711680;
         this._filterOver.blurX = this._filterOver.blurY = 20;
         this._filterSelect = new GlowFilter();
         this._filterSelect.color = 65280;
         this._filterSelect.blurX = this._filterSelect.blurY = 20;
         KapDebugEventDispatcher.instance.addEventListener(SelectedTargetChangeEvent.NAME,this._onMainObjectChanged);
         KapDebugEventDispatcher.instance.addEventListener(InspectorActivatedEvent.NAME,this._onInspectorActivated);
         this.dockbar.resize(this.width);
      }
      
      private function _onMainObjectChanged(param1:SelectedTargetChangeEvent) : void
      {
         this._target = param1.targetObject;
         this._refreshButtons();
      }
      
      private function _onInspectorActivated(param1:InspectorActivatedEvent) : void
      {
         this.activeButton = param1.inspectorName;
      }
      
      public function set activeButton(param1:String) : void
      {
         this._activeName = param1;
         this._activateButton(param1);
      }
      
      public function get activeButton() : String
      {
         return this._activeName;
      }
      
      private function _refreshButtons() : void
      {
         var _loc3_:String = null;
         var _loc4_:InspectorDockBarItem = null;
         var _loc5_:KapDebugComponentFactory = null;
         var _loc1_:Array = ComponentManager.instance.getComponentNames(KapInspect.NAME);
         var _loc2_:int = 1;
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = InspectorDockBarItem(this._buttons[_loc3_]);
            if(!_loc4_)
            {
               return;
            }
            _loc5_ = ComponentManager.instance.getComponentFactory(_loc3_);
            if(Boolean(this._target) && _loc5_.canAccept(this._target))
            {
               _loc4_.enabled = true;
               _loc4_.toolTip = _loc5_.label + " (F" + _loc2_ + ")" + (!!this._target ? " : " + ClassUtils.getInstanceLabel(this._target) : "");
            }
            else
            {
               _loc4_.enabled = false;
               _loc4_.toolTip = _loc5_.label + " (F" + _loc2_ + ")" + " not applicable for " + ClassUtils.getShortClassName(this._target);
            }
            _loc2_++;
         }
      }
      
      private function _activateButton(param1:String) : void
      {
         var _loc3_:InspectorDockBarItem = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Array = this.innerCanvas.getChildren();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.name == param1)
            {
               _loc3_.activate = true;
            }
            else
            {
               _loc3_.activate = false;
               if(!this._activateByMyselft)
               {
                  _loc3_.visible = false;
               }
            }
         }
         if(!this._activateByMyselft)
         {
            this.dockbar.open(600);
         }
         this._activateByMyselft = false;
      }
      
      private function _onDockHide() : void
      {
         var _loc2_:InspectorDockBarItem = null;
         var _loc1_:Array = this.innerCanvas.getChildren();
         for each(_loc2_ in _loc1_)
         {
            _loc2_.visible = true;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this._activateByMyselft = true;
         this._selectedItem = InspectorDockBarItem(param1.currentTarget).name;
         KapDebugEventDispatcher.instance.dispatchEvent(new OpenInspectorCommandEvent(this._selectedItem,this._target));
      }
      
      public function addButton(param1:String) : void
      {
         var _loc2_:KapDebugComponentFactory = ComponentManager.instance.getComponentFactory(param1);
         this._createButtonFromFactory(_loc2_,param1);
         dispatchEvent(new ComponentAddedInDockBarEvent(_loc2_.shortcut));
      }
      
      private function _createButtonFromFactory(param1:KapDebugComponentFactory, param2:String) : void
      {
         var _loc3_:InspectorDockBarItem = new InspectorDockBarItem();
         _loc3_.iconOff = param1.iconOff;
         _loc3_.iconOn = param1.iconOn;
         _loc3_.iconOver = param1.iconOver;
         _loc3_.name = param2;
         _loc3_.buttonMode = _loc3_.useHandCursor = true;
         _loc3_.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc3_.enabled = false;
         this.innerCanvas.addChildAt(_loc3_,this._pluginPosition++);
         this._buttons[param2] = _loc3_;
      }
      
      private function _onResize() : void
      {
         this.dockbar.resize(this.width);
      }
      
      private function _onCapture(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("capture"));
      }
      
      private function _onRefresh(param1:MouseEvent) : void
      {
         this._activateButton("nobuttonactivated");
         dispatchEvent(new Event("reloadInspector"));
      }
      
      private function _onRefreshPopup(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("refreshSystemManager"));
      }
      
      private function _onUnSelect(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("removePreview"));
      }
      
      public function ___InspectorDockBar_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this._onCreationComplete();
      }
      
      public function ___InspectorDockBar_Canvas1_resize(param1:ResizeEvent) : void
      {
         this._onResize();
      }
      
      public function __dockbar_closed(param1:Event) : void
      {
         this._onDockHide();
      }
      
      public function __activationArea_rollOver(param1:MouseEvent) : void
      {
         this.dockbar.open();
      }
      
      public function ___InspectorDockBar_InspectorDockBarItem2_click(param1:MouseEvent) : void
      {
         this._onCapture(param1);
      }
      
      public function ___InspectorDockBar_InspectorDockBarItem3_click(param1:MouseEvent) : void
      {
         this._onRefresh(param1);
      }
      
      public function ___InspectorDockBar_InspectorDockBarItem4_click(param1:MouseEvent) : void
      {
         this._onRefreshPopup(param1);
      }
      
      public function ___InspectorDockBar_InspectorDockBarItem5_click(param1:MouseEvent) : void
      {
         this._onUnSelect(param1);
      }
      
      private function _InspectorDockBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconShowMenu;
         },null,"menuLabel.source");
         result[1] = new Binding(this,function():Number
         {
            return this.width;
         },null,"activationArea.width");
         result[2] = new Binding(this,function():Number
         {
            return dockbar.minSize;
         },function(param1:Number):void
         {
            innerCanvas.setStyle("paddingLeft",param1);
         },"innerCanvas.paddingLeft");
         result[3] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconSeparator;
         },null,"_InspectorDockBar_InspectorDockBarItem1.iconOn");
         result[4] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconSeparator;
         },null,"_InspectorDockBar_InspectorDockBarItem1.iconOff");
         result[5] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconSeparator;
         },null,"_InspectorDockBar_InspectorDockBarItem1.iconOver");
         result[6] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconCapture_on;
         },null,"_InspectorDockBar_InspectorDockBarItem2.iconOn");
         result[7] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconCapture_off;
         },null,"_InspectorDockBar_InspectorDockBarItem2.iconOff");
         result[8] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconCapture_over;
         },null,"_InspectorDockBar_InspectorDockBarItem2.iconOver");
         result[9] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefresh_on;
         },null,"_InspectorDockBar_InspectorDockBarItem3.iconOn");
         result[10] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefresh_off;
         },null,"_InspectorDockBar_InspectorDockBarItem3.iconOff");
         result[11] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefresh_over;
         },null,"_InspectorDockBar_InspectorDockBarItem3.iconOver");
         result[12] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefreshPopUp_on;
         },null,"_InspectorDockBar_InspectorDockBarItem4.iconOn");
         result[13] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefreshPopUp_off;
         },null,"_InspectorDockBar_InspectorDockBarItem4.iconOff");
         result[14] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconRefreshPopUp_over;
         },null,"_InspectorDockBar_InspectorDockBarItem4.iconOver");
         result[15] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconUnselect_on;
         },null,"_InspectorDockBar_InspectorDockBarItem5.iconOn");
         result[16] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconUnselect_off;
         },null,"_InspectorDockBar_InspectorDockBarItem5.iconOff");
         result[17] = new Binding(this,function():Class
         {
            return EmbeddedAssets.iconUnselect_over;
         },null,"_InspectorDockBar_InspectorDockBarItem5.iconOver");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get activationArea() : Canvas
      {
         return this._1344845117activationArea;
      }
      
      public function set activationArea(param1:Canvas) : void
      {
         var _loc2_:Object = this._1344845117activationArea;
         if(_loc2_ !== param1)
         {
            this._1344845117activationArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activationArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dockbar() : DockBar
      {
         return this._1828604160dockbar;
      }
      
      public function set dockbar(param1:DockBar) : void
      {
         var _loc2_:Object = this._1828604160dockbar;
         if(_loc2_ !== param1)
         {
            this._1828604160dockbar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dockbar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get innerCanvas() : HBox
      {
         return this._1056958642innerCanvas;
      }
      
      public function set innerCanvas(param1:HBox) : void
      {
         var _loc2_:Object = this._1056958642innerCanvas;
         if(_loc2_ !== param1)
         {
            this._1056958642innerCanvas = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"innerCanvas",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuLabel() : Image
      {
         return this._1544880939menuLabel;
      }
      
      public function set menuLabel(param1:Image) : void
      {
         var _loc2_:Object = this._1544880939menuLabel;
         if(_loc2_ !== param1)
         {
            this._1544880939menuLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuLabel",_loc2_,param1));
            }
         }
      }
   }
}

