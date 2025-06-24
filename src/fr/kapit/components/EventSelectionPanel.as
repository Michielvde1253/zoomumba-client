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
   import fr.kapit.controls.kButton;
   import fr.kapit.events.EventFilters;
   import fr.kapit.events.EventTrapper;
   import fr.kapit.events.EventTreeItem;
   import fr.kapit.introspection.components.CheckTreeRenderer;
   import fr.kapit.introspection.events.EventFilterSelectedEvent;
   import fr.kapit.tree.KapDebugTree;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.ControlBar;
   import mx.containers.HBox;
   import mx.containers.TabNavigator;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   
   public class EventSelectionPanel extends ResizableTitleWindow
   {
      public static var popup:EventSelectionPanel;
      
      private var _398592198checkTree:KapDebugTree;
      
      private var _1561815751checkTreeByParent:KapDebugTree;
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":ResizableTitleWindow,
         "events":{
            "close":"___EventSelectionPanel_ResizableTitleWindow1_close",
            "creationComplete":"___EventSelectionPanel_ResizableTitleWindow1_creationComplete"
         },
         "propertiesFactory":function():Object
         {
            return {
               "width":400,
               "height":500,
               "childDescriptors":[new UIComponentDescriptor({
                  "type":TabNavigator,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "label":"By event type",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":KapDebugTree,
                                    "id":"checkTree",
                                    "events":{"creationComplete":"__checkTree_creationComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "autoExpand":false,
                                          "expandOnData":true,
                                          "itemRenderer":_EventSelectionPanel_ClassFactory1_c(),
                                          "labelField":"label"
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
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "label":"By target parent",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":KapDebugTree,
                                    "id":"checkTreeByParent",
                                    "events":{"creationComplete":"__checkTreeByParent_creationComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "autoExpand":false,
                                          "expandOnData":true,
                                          "itemRenderer":_EventSelectionPanel_ClassFactory2_c(),
                                          "labelField":"label"
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ControlBar,
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":kButton,
                        "events":{"click":"___EventSelectionPanel_kButton1_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"OK"};
                        }
                     }),new UIComponentDescriptor({
                        "type":kButton,
                        "events":{"click":"___EventSelectionPanel_kButton2_click"},
                        "propertiesFactory":function():Object
                        {
                           return {"label":"Cancel"};
                        }
                     })]};
                  }
               })]
            };
         }
      });
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _865596246treeDP:ArrayCollection = new ArrayCollection();
      
      private var _436385109treeDPByParent:ArrayCollection = new ArrayCollection();
      
      public var eventFilters:EventFilters;
      
      private var _trapper:EventTrapper;
      
      private var _target:Object;
      
      public function EventSelectionPanel()
      {
         super();
         mx_internal::_document = this;
         this.layout = "vertical";
         this.showCloseButton = true;
         this.aboutable = false;
         this.rollupable = false;
         this.maximizable = false;
         this.title = "Select events to show";
         this.width = 400;
         this.height = 500;
         this.addEventListener("close",this.___EventSelectionPanel_ResizableTitleWindow1_close);
         this.addEventListener("creationComplete",this.___EventSelectionPanel_ResizableTitleWindow1_creationComplete);
      }
      
      public static function show(param1:DisplayObject, param2:EventTrapper, param3:Object) : EventSelectionPanel
      {
         if(!popup)
         {
            popup = new EventSelectionPanel();
         }
         if(popup._target != param3)
         {
            popup._trapper = param2;
            popup.eventFilters = param2.filters;
            popup.target = param3;
         }
         PopUpManager.addPopUp(popup,param1,true);
         PopUpManager.centerPopUp(popup);
         return popup;
      }
      
      public static function releaseTarget(param1:Object) : void
      {
         if(popup)
         {
            if(popup._target == param1)
            {
               popup._target = null;
            }
         }
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
      
      private function onCreationComplete() : void
      {
         addEventListener(EventFilterSelectedEvent.EVENT_ON,this.onEventOn);
         addEventListener(EventFilterSelectedEvent.EVENT_OFF,this.onEventOff);
      }
      
      private function onEventOn(param1:EventFilterSelectedEvent) : void
      {
         removeEventListener(param1.type,this.onEventOn);
         dispatchEvent(new EventFilterSelectedEvent(param1.type,param1.eventName));
         addEventListener(param1.type,this.onEventOn);
      }
      
      private function onEventOff(param1:EventFilterSelectedEvent) : void
      {
         removeEventListener(param1.type,this.onEventOff);
         dispatchEvent(new EventFilterSelectedEvent(param1.type,param1.eventName));
         addEventListener(param1.type,this.onEventOff);
      }
      
      private function onClose() : void
      {
         removeEventListener("close",this.onClose);
         PopUpManager.removePopUp(this);
         dispatchEvent(new Event("eventPanelClose"));
      }
      
      public function set target(param1:Object) : void
      {
         if(this._target != param1)
         {
            this._target = param1;
            this.treeDP.removeAll();
            if(this._target)
            {
               this.treeDP.addItem(EventTreeItem.buildTreeByEventClass(param1,this.eventFilters));
               if(this.checkTree)
               {
                  this.checkTree.dataProvider = this.treeDP;
               }
               this.treeDPByParent.removeAll();
               this.treeDPByParent.addItem(EventTreeItem.buildTree(param1,this.eventFilters));
               if(this.checkTreeByParent)
               {
                  this.checkTreeByParent.dataProvider = this.treeDPByParent;
               }
               if(this.checkTree)
               {
                  this.checkTree.expandItem(this.treeDP[0],true);
               }
               if(this.checkTreeByParent)
               {
                  this.checkTreeByParent.expandItem(this.treeDPByParent[0],true);
               }
            }
         }
      }
      
      private function onOK(param1:EventTreeItem = null) : void
      {
         var _loc3_:EventTreeItem = null;
         var _loc2_:EventTreeItem = param1;
         if(!param1)
         {
            param1 = EventTreeItem(this.checkTree.dataProvider[0]);
         }
         for each(_loc3_ in param1.children)
         {
            this.onOK(_loc3_);
         }
         if(param1.isEvent)
         {
            if(param1.selected)
            {
               this.eventFilters.removeFilter(param1.label);
            }
            else
            {
               this.eventFilters.addFilter(param1.label);
            }
         }
         if(_loc2_ == null)
         {
            this._trapper.refreshFilters();
            this.onClose();
         }
      }
      
      public function ___EventSelectionPanel_ResizableTitleWindow1_close(param1:CloseEvent) : void
      {
         this.onClose();
      }
      
      public function ___EventSelectionPanel_ResizableTitleWindow1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _EventSelectionPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CheckTreeRenderer;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function __checkTree_creationComplete(param1:FlexEvent) : void
      {
         this.checkTree.dataProvider = this.treeDP;
      }
      
      private function _EventSelectionPanel_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CheckTreeRenderer;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function __checkTreeByParent_creationComplete(param1:FlexEvent) : void
      {
         this.checkTreeByParent.dataProvider = this.treeDPByParent;
      }
      
      public function ___EventSelectionPanel_kButton1_click(param1:MouseEvent) : void
      {
         this.onOK();
      }
      
      public function ___EventSelectionPanel_kButton2_click(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      [Bindable(event="propertyChange")]
      public function get checkTree() : KapDebugTree
      {
         return this._398592198checkTree;
      }
      
      public function set checkTree(param1:KapDebugTree) : void
      {
         var _loc2_:Object = this._398592198checkTree;
         if(_loc2_ !== param1)
         {
            this._398592198checkTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get checkTreeByParent() : KapDebugTree
      {
         return this._1561815751checkTreeByParent;
      }
      
      public function set checkTreeByParent(param1:KapDebugTree) : void
      {
         var _loc2_:Object = this._1561815751checkTreeByParent;
         if(_loc2_ !== param1)
         {
            this._1561815751checkTreeByParent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkTreeByParent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get treeDP() : ArrayCollection
      {
         return this._865596246treeDP;
      }
      
      private function set treeDP(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._865596246treeDP;
         if(_loc2_ !== param1)
         {
            this._865596246treeDP = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"treeDP",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get treeDPByParent() : ArrayCollection
      {
         return this._436385109treeDPByParent;
      }
      
      private function set treeDPByParent(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._436385109treeDPByParent;
         if(_loc2_ !== param1)
         {
            this._436385109treeDPByParent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"treeDPByParent",_loc2_,param1));
            }
         }
      }
   }
}

