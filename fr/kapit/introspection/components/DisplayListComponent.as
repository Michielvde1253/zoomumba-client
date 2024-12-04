package fr.kapit.introspection.components
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
   import fr.kapit.components.AbstractKapDebugComponent;
   import fr.kapit.components.ComponentManager;
   import fr.kapit.components.IKapDebugComponent;
   import fr.kapit.components.KapDebugComponentFactory;
   import fr.kapit.components.KapDebugShortcut;
   import fr.kapit.introspection.nodes.DisplayNode;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class DisplayListComponent extends AbstractKapDebugComponent implements IKapDebugComponent, IDisplayListView, IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var LABEL:String = "Display list";
      
      public static var NAME:String = "DisplayObjectComponent";
      
      private var _1714343808displayTree:DisplayListTree;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _downHandler:Function;
      
      private var _1313623661_enableMove:Boolean;
      
      private var _leftHandler:Function;
      
      private var _rightHandler:Function;
      
      private var _493243296_rootObject:DisplayObject;
      
      private var _upHandler:Function;
      
      private var mediator:DisplayListMediator;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DisplayListComponent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":AbstractKapDebugComponent,
            "events":{"creationComplete":"___DisplayListComponent_AbstractKapDebugComponent1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":DisplayListTree,
                  "id":"displayTree",
                  "events":{
                     "doubleClick":"__displayTree_doubleClick",
                     "click":"__displayTree_click"
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "autoExpand":false,
                        "percentWidth":100,
                        "percentHeight":100,
                        "expandOnData":true
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
         bindings = this._DisplayListComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_introspection_components_DisplayListComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DisplayListComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.addEventListener("creationComplete",this.___DisplayListComponent_AbstractKapDebugComponent1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function get factory() : KapDebugComponentFactory
      {
         return new KapDebugComponentFactory(NAME,LABEL,DisplayListComponent,EmbeddedAssets.iconDisplayListOn,EmbeddedAssets.iconDisplayListOff,EmbeddedAssets.iconDisplayListOver,function(param1:Object):Boolean
         {
            return param1 is DisplayObject;
         },new KapDebugShortcut(false,false,false,117,NAME));
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DisplayListComponent._watcherSetupUtil = param1;
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
      
      public function set enableMove(param1:Boolean) : void
      {
         this._enableMove = param1;
      }
      
      public function set moveDownHandler(param1:Function) : void
      {
         this._downHandler = param1;
      }
      
      public function set moveLeftHandler(param1:Function) : void
      {
         this._leftHandler = param1;
      }
      
      public function set moveRightHandler(param1:Function) : void
      {
         this._rightHandler = param1;
      }
      
      public function set moveUpHandler(param1:Function) : void
      {
         this._upHandler = param1;
      }
      
      public function refresh() : void
      {
      }
      
      override public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(DisplayListComponent,param1);
      }
      
      public function get rootObject() : DisplayObject
      {
         return this._rootObject;
      }
      
      public function set rootObject(param1:DisplayObject) : void
      {
         var obj:DisplayObject = param1;
         this._rootObject = obj;
         try
         {
            icon = ComponentIcons.getClassIcon(obj);
         }
         catch(e:Error)
         {
         }
      }
      
      public function selectTreeItem(param1:DisplayObject) : void
      {
         this.displayTree.selectTreeItem(param1);
      }
      
      public function get selectedNode() : DisplayNode
      {
         return DisplayNode(this.tree.selectedItem);
      }
      
      override public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this._rootObject = DisplayObject(param1);
      }
      
      override public function set target(param1:Object) : void
      {
         super.target = param1;
         if(targetChanged)
         {
            targetChanged = false;
            this._rootObject = DisplayObject(param1);
         }
      }
      
      public function get tree() : DisplayListTree
      {
         return this.displayTree;
      }
      
      private function _onClick(param1:MouseEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onCreationComplete() : void
      {
         this.mediator = new DisplayListMediator(this);
      }
      
      private function onDoubleClick(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
      
      public function ___DisplayListComponent_AbstractKapDebugComponent1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function __displayTree_doubleClick(param1:MouseEvent) : void
      {
         this.onDoubleClick(param1);
      }
      
      public function __displayTree_click(param1:MouseEvent) : void
      {
         this._onClick(param1);
      }
      
      private function _DisplayListComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _enableMove;
         },null,"displayTree.enableMove");
         result[1] = new Binding(this,function():DisplayObject
         {
            return _rootObject;
         },null,"displayTree.root");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayTree() : DisplayListTree
      {
         return this._1714343808displayTree;
      }
      
      public function set displayTree(param1:DisplayListTree) : void
      {
         var _loc2_:Object = this._1714343808displayTree;
         if(_loc2_ !== param1)
         {
            this._1714343808displayTree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayTree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _enableMove() : Boolean
      {
         return this._1313623661_enableMove;
      }
      
      private function set _enableMove(param1:Boolean) : void
      {
         var _loc2_:Object = this._1313623661_enableMove;
         if(_loc2_ !== param1)
         {
            this._1313623661_enableMove = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_enableMove",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _rootObject() : DisplayObject
      {
         return this._493243296_rootObject;
      }
      
      private function set _rootObject(param1:DisplayObject) : void
      {
         var _loc2_:Object = this._493243296_rootObject;
         if(_loc2_ !== param1)
         {
            this._493243296_rootObject = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_rootObject",_loc2_,param1));
            }
         }
      }
   }
}

