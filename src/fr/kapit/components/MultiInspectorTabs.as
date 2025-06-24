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
   import flexlib.events.SuperTabEvent;
   import fr.kapit.event.SuperTabNavigatorTabChangeEvent;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.OpenInspectorCommandEvent;
   import fr.kapit.introspection.events.InspectorActivatedEvent;
   import fr.kapit.introspection.events.ObjectSelectEvent;
   import fr.kapit.menu.ContextMenuHelper;
   import mx.binding.*;
   import mx.containers.VBox;
   import mx.core.Container;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class MultiInspectorTabs extends VBox
   {
      private var _108835nav:VersatileTabNavigator;
      
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
         "type":VBox,
         "events":{"creationComplete":"___MultiInspectorTabs_VBox1_creationComplete"},
         "propertiesFactory":function():Object
         {
            return {"childDescriptors":[new UIComponentDescriptor({
               "type":VersatileTabNavigator,
               "id":"nav",
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
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var tabs:Dictionary = new Dictionary();
      
      public function MultiInspectorTabs()
      {
         super();
         mx_internal::_document = this;
         this.addEventListener("creationComplete",this.___MultiInspectorTabs_VBox1_creationComplete);
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
      
      public function getActiveInspector(param1:Object) : IKapDebugComponent
      {
         var _loc2_:InspectorTabs = this.getInspector(param1);
         if(_loc2_)
         {
            return _loc2_.activeViewName;
         }
         return null;
      }
      
      public function get currentInspectorObject() : Object
      {
         var _loc1_:InspectorTabs = this.currentInspector;
         if(_loc1_)
         {
            return _loc1_.target;
         }
         return null;
      }
      
      public function openInspector(param1:String, param2:Object, param3:String = null, param4:Object = null) : void
      {
         var _loc5_:InspectorTabs = this.getInspector(param2);
         if(_loc5_)
         {
            this.activateInspectorTab(param2,param1);
         }
         else
         {
            this.showInspector(param2,param3,param4,param1);
         }
      }
      
      public function closeInspector(param1:String, param2:Object) : void
      {
         var name:String = param1;
         var target:Object = param2;
         var inspector:InspectorTabs = this.getInspector(target);
         if(inspector)
         {
            inspector.closeView(name);
            if(inspector.inspectorCount == 0)
            {
               inspector.dispose();
               try
               {
                  this.nav.removeChild(inspector);
               }
               catch(e:Error)
               {
               }
               delete this.tabs[target];
            }
         }
      }
      
      public function get tabCount() : int
      {
         return this.nav.childCount;
      }
      
      public function dispose() : void
      {
         var _loc2_:InspectorTabs = null;
         KapDebugEventDispatcher.instance.removeEventListener(OpenInspectorCommandEvent.NAME,this._onOpenInspector);
         var _loc1_:Array = this.nav.allChildren;
         for each(_loc2_ in _loc1_)
         {
            _loc2_.dispose();
         }
      }
      
      private function onCreationComplete() : void
      {
         KapDebugEventDispatcher.instance.addEventListener(OpenInspectorCommandEvent.NAME,this._onOpenInspector,false,0,true);
      }
      
      private function _onOpenInspector(param1:OpenInspectorCommandEvent) : void
      {
         if(!visible)
         {
            return;
         }
         var _loc2_:Object = param1.targetObject;
         var _loc3_:Boolean = ComponentManager.instance.isComponentGlobal(param1.inspectorName);
         if(_loc3_)
         {
            _loc2_ = ComponentManager.instance.getPanelObject("panels");
         }
         var _loc4_:InspectorTabs = this.getInspector(_loc2_);
         if(_loc4_)
         {
            this.activateInspectorTab(_loc2_,param1.inspectorName);
         }
         else
         {
            this.showInspector(_loc2_,param1.name,param1.host,param1.inspectorName);
         }
         param1.stopImmediatePropagation();
      }
      
      private function activateInspectorTab(param1:Object, param2:String) : void
      {
         var _loc3_:InspectorTabs = this.getInspector(param1);
         if(_loc3_)
         {
            this.nav.selectedChild = _loc3_;
            _loc3_.activateView(param2);
         }
      }
      
      public function getInspector(param1:Object) : InspectorTabs
      {
         var _loc2_:InspectorTabs = InspectorTabs(this.tabs[param1]);
         if(_loc2_)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function showActiveInspector(param1:Object) : void
      {
         var _loc2_:InspectorTabs = InspectorTabs(this.tabs[param1]);
         if(_loc2_)
         {
            this.showInspector(param1);
         }
         else
         {
            KapDebugEventDispatcher.instance.dispatchEvent(new InspectorActivatedEvent(null,param1));
         }
      }
      
      public function showInspector(param1:Object, param2:String = null, param3:Object = null, param4:String = null) : InspectorTabs
      {
         var _loc5_:InspectorTabs = InspectorTabs(this.tabs[param1]);
         if(_loc5_)
         {
            this.nav.selectedChild = _loc5_;
         }
         else
         {
            _loc5_ = new InspectorTabs();
            _loc5_.target = param1;
            _loc5_.targetName = param2;
            _loc5_.host = param3;
            if(param4)
            {
               _loc5_.initialView = param4;
            }
            _loc5_.addEventListener(FlexEvent.CREATION_COMPLETE,this.onInspectorAdded,false,0,true);
            _loc5_.addEventListener(ListEvent.ITEM_CLICK,this.onItemClick,false,0,true);
            addEventListener(SuperTabEvent.TAB_CLOSE,this.onTabClose,true);
            addEventListener(SuperTabNavigatorTabChangeEvent.NAME,this._onTabChange,true);
            this.tabs[param1] = _loc5_;
            this.nav.addChild(_loc5_);
         }
         return _loc5_;
      }
      
      private function onItemClick(param1:ListEvent) : void
      {
         dispatchEvent(param1.clone() as ListEvent);
      }
      
      private function onInspectorAdded(param1:Event) : void
      {
         this.nav.selectedChild = Container(param1.target);
      }
      
      public function get currentInspector() : InspectorTabs
      {
         return InspectorTabs(this.nav.selectedChild);
      }
      
      private function _onTabChange(param1:SuperTabNavigatorTabChangeEvent) : void
      {
         if(param1.inspector)
         {
            ContextMenuHelper.prepareDebugNodeMenu(this,param1.inspector.target);
         }
      }
      
      private function onTabClose(param1:SuperTabEvent) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:InspectorTabs = null;
         var _loc6_:InspectorTabs = null;
         var _loc7_:Object = null;
         var _loc2_:InspectorTabs = this.nav.getNavigatorChildAt(param1.tabIndex) as InspectorTabs;
         for(_loc3_ in this.tabs)
         {
            _loc6_ = this.tabs[_loc3_] as InspectorTabs;
            if(_loc6_ == _loc2_)
            {
               delete this.tabs[_loc3_];
               _loc6_.dispose();
               break;
            }
         }
         _loc4_ = this.nav.allChildren;
         if(param1.tabIndex < _loc4_.length - 1)
         {
            _loc5_ = InspectorTabs(_loc4_[param1.tabIndex + 1]);
         }
         else if(param1.tabIndex > 0)
         {
            _loc5_ = InspectorTabs(_loc4_[param1.tabIndex - 1]);
         }
         if(_loc5_)
         {
            _loc7_ = _loc5_.target;
            dispatchEvent(new ObjectSelectEvent(_loc7_));
         }
      }
      
      public function ___MultiInspectorTabs_VBox1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      [Bindable(event="propertyChange")]
      public function get nav() : VersatileTabNavigator
      {
         return this._108835nav;
      }
      
      public function set nav(param1:VersatileTabNavigator) : void
      {
         var _loc2_:Object = this._108835nav;
         if(_loc2_ !== param1)
         {
            this._108835nav = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nav",_loc2_,param1));
            }
         }
      }
   }
}

