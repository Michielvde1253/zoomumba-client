package fr.kapit.tree
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
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.DisplayNode;
   import fr.kapit.introspection.nodes.NodeFactory;
   import fr.kapit.introspection.nodes.simple.SimpleNode;
   import fr.kapit.menu.ContextMenuHelper;
   import fr.kapit.utils.EffectUtils;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.core.ClassFactory;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class IntrospectionTree extends KapDebugTree implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var varName:String;
      
      private var _108698577roots:ArrayCollection;
      
      private var _1754640579selectedNode:DebugNode;
      
      private var _1934499494dragActive:Boolean = false;
      
      public var isWatchTarget:Boolean = true;
      
      private var _lastRollOverNode:DebugNode;
      
      private var _lastRollOverIndex:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function IntrospectionTree()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._108698577roots = new ArrayCollection();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._IntrospectionTree_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_tree_IntrospectionTreeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return IntrospectionTree[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.showDataTips = true;
         this.dataTipFunction = this.onDataTip;
         this.dragEnabled = false;
         this.dragMoveEnabled = false;
         this.editable = true;
         this.doubleClickEnabled = true;
         this.editorDataField = "text";
         this.iconFunction = this.getIcon;
         this.autoExpand = false;
         this.expandOnData = true;
         this.keepOpenState = true;
         this.keepSelection = true;
         this.addEventListener("creationComplete",this.___IntrospectionTree_KapDebugTree1_creationComplete);
         this.addEventListener("dragDrop",this.___IntrospectionTree_KapDebugTree1_dragDrop);
         this.addEventListener("keyDown",this.___IntrospectionTree_KapDebugTree1_keyDown);
         this.addEventListener("itemEditBegin",this.___IntrospectionTree_KapDebugTree1_itemEditBegin);
         this.addEventListener("itemEditEnd",this.___IntrospectionTree_KapDebugTree1_itemEditEnd);
         this.addEventListener("change",this.___IntrospectionTree_KapDebugTree1_change);
         this.addEventListener("itemRollOver",this.___IntrospectionTree_KapDebugTree1_itemRollOver);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         IntrospectionTree._watcherSetupUtil = param1;
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
      
      private function _onCreationComplete() : void
      {
         contextMenu = new ContextMenu();
         contextMenu.hideBuiltInItems();
         contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,this._onMenuSelect);
      }
      
      private function getIcon(param1:DebugNode) : Class
      {
         return ComponentIcons.getClassIcon(param1.target,param1.host,param1.name);
      }
      
      private function disableEditing(param1:ListEvent) : void
      {
         if(param1.columnIndex == 1)
         {
            param1.preventDefault();
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.keyCode == Keyboard.DELETE)
         {
            _loc2_ = selectedItem;
            this.removeRoot(_loc2_);
         }
      }
      
      private function _onItemRollOver(param1:ListEvent) : void
      {
         var _loc2_:NodeItemRenderer = null;
         var _loc3_:Object = null;
         if(param1.itemRenderer is NodeItemRenderer)
         {
            _loc2_ = param1.itemRenderer as NodeItemRenderer;
            this._lastRollOverIndex = itemRendererToIndex(_loc2_);
            this._lastRollOverNode = _loc2_.node;
            _loc3_ = _loc2_.node.target;
            if(_loc3_ is DisplayObject && !_loc3_ is Stage)
            {
               EffectUtils.glow(_loc3_);
            }
         }
      }
      
      private function onChange() : void
      {
         this.selectedNode = selectedItem as DebugNode;
      }
      
      private function _onMenuSelect(param1:ContextMenuEvent) : void
      {
         if(this._lastRollOverNode)
         {
            ContextMenuHelper.fillContextMenu(this,this._lastRollOverNode.target,!!this._lastRollOverNode.name ? this._lastRollOverNode.name : null);
            selectedIndex = this._lastRollOverIndex;
         }
      }
      
      public function refresh(param1:Event) : void
      {
         super.collectionChangeHandler(param1);
      }
      
      public function addRoot(param1:Object, param2:String, param3:Object = null) : void
      {
         var _loc4_:DebugNode = NodeFactory.newNode(param1,param2,param3);
         this.roots.addItem(_loc4_);
         if(this.roots.length == 1)
         {
            selectedItem = _loc4_;
         }
         expandItem(_loc4_,true);
      }
      
      public function addRootNode(param1:DebugNode) : void
      {
         this.roots.addItem(param1);
         selectedItem = param1;
      }
      
      public function setRoot(param1:Object, param2:String, param3:Object = null) : void
      {
         var _loc4_:DebugNode = NodeFactory.newNode(param1,param2,param3);
         this.roots.removeAll();
         this.addRoot(param1,param2,param3);
         expandItem(this.roots.getItemAt(0),true);
      }
      
      public function removeRoot(param1:Object) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.roots)
         {
            if(param1 == _loc3_)
            {
               this.roots.removeItemAt(_loc2_);
               break;
            }
            _loc2_++;
         }
      }
      
      public function get rootNode() : DebugNode
      {
         return !!dataProvider ? DebugNode(dataProvider[0]) : null;
      }
      
      private function onDataTip(param1:Object) : String
      {
         var _loc2_:DebugNode = DebugNode(param1);
         var _loc3_:String = "";
         if(Boolean(_loc2_) && Boolean(_loc2_.label))
         {
            _loc3_ += _loc2_.label;
         }
         if(_loc2_ && _loc2_.typeDescriptor && Boolean(_loc2_.typeDescriptor.name))
         {
            _loc3_ += " (" + _loc2_.typeDescriptor.name + ")";
         }
         return _loc3_;
      }
      
      private function onDragDrop(param1:DragEvent) : void
      {
         var _loc3_:DisplayNode = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:DebugNode = null;
         var _loc2_:Array = param1.dragSource.dataForFormat("treeItems") as Array;
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_ == null ? null : _loc3_.displayObject;
            if(_loc4_)
            {
               _loc5_ = new DebugNode(_loc4_,_loc3_.shortVarName);
               this.addRoot(_loc4_,_loc3_.shortVarName);
            }
         }
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      private function onItemEdit(param1:ListEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:DebugNode = NodeItemRenderer(param1.itemRenderer).node;
         if(Boolean(_loc2_.accessDescriptor) && _loc2_.accessDescriptor.isReadOnly)
         {
            _loc3_ = true;
         }
         if(_loc2_ is SimpleNode && !_loc3_)
         {
            createItemEditor(param1.columnIndex,param1.rowIndex);
            if(itemEditorInstance != null)
            {
               itemEditorInstance.data = DebugNode(param1.itemRenderer.data);
            }
         }
         else
         {
            param1.preventDefault();
         }
      }
      
      private function onItemEditEnd(param1:Event) : void
      {
      }
      
      public function ___IntrospectionTree_KapDebugTree1_creationComplete(param1:FlexEvent) : void
      {
         this._onCreationComplete();
      }
      
      public function ___IntrospectionTree_KapDebugTree1_dragDrop(param1:DragEvent) : void
      {
         this.onDragDrop(param1);
      }
      
      public function ___IntrospectionTree_KapDebugTree1_keyDown(param1:KeyboardEvent) : void
      {
         this.onKeyDown(param1);
      }
      
      public function ___IntrospectionTree_KapDebugTree1_itemEditBegin(param1:ListEvent) : void
      {
         this.onItemEdit(param1);
      }
      
      public function ___IntrospectionTree_KapDebugTree1_itemEditEnd(param1:ListEvent) : void
      {
         this.onItemEditEnd(param1);
      }
      
      public function ___IntrospectionTree_KapDebugTree1_change(param1:ListEvent) : void
      {
         this.onChange();
      }
      
      public function ___IntrospectionTree_KapDebugTree1_itemRollOver(param1:ListEvent) : void
      {
         this._onItemRollOver(param1);
      }
      
      private function _IntrospectionTree_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IFactory
         {
            return new ClassFactory(NodeItemRenderer);
         },null,"this.itemRenderer");
         result[1] = new Binding(this,null,null,"this.dropEnabled","dragActive");
         result[2] = new Binding(this,function():IFactory
         {
            return new ClassFactory(NodeItemEditor);
         },null,"this.itemEditor");
         result[3] = new Binding(this,function():Object
         {
            return roots;
         },null,"this.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get roots() : ArrayCollection
      {
         return this._108698577roots;
      }
      
      private function set roots(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._108698577roots;
         if(_loc2_ !== param1)
         {
            this._108698577roots = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roots",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedNode() : DebugNode
      {
         return this._1754640579selectedNode;
      }
      
      public function set selectedNode(param1:DebugNode) : void
      {
         var _loc2_:Object = this._1754640579selectedNode;
         if(_loc2_ !== param1)
         {
            this._1754640579selectedNode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedNode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragActive() : Boolean
      {
         return this._1934499494dragActive;
      }
      
      public function set dragActive(param1:Boolean) : void
      {
         var _loc2_:Object = this._1934499494dragActive;
         if(_loc2_ !== param1)
         {
            this._1934499494dragActive = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragActive",_loc2_,param1));
            }
         }
      }
   }
}

