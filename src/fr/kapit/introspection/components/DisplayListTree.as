package fr.kapit.introspection.components
{
   import flash.display.DisplayObject;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.ContextMenu;
   import fr.kapit.introspection.events.ObjectSelectEvent;
   import fr.kapit.introspection.nodes.DisplayNode;
   import fr.kapit.menu.ContextMenuHelper;
   import fr.kapit.tree.KapDebugTree;
   import fr.kapit.utils.EffectUtils;
   import fr.kapit.utils.StringUtils;
   import mx.controls.Tree;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.Container;
   import mx.core.DragSource;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ToolTipEvent;
   
   public class DisplayListTree extends KapDebugTree
   {
      public var displayObject:DisplayObject;
      
      private var _ctrlKeyPressed:Boolean;
      
      private var _lastSelectedIndex:int;
      
      private var _91240897_root:DisplayNode;
      
      private var rollOverNode:DisplayNode;
      
      private var toolTipDO:DisplayObjectToolTip;
      
      private var toolTipPoint:Point;
      
      public function DisplayListTree()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onComplete);
         labelFunction = this.treeLabel;
         iconFunction = this.getIcon;
         showDataTips = false;
         setStyle("horizontalScrollPolicy","on");
         this.addEventListener(ToolTipEvent.TOOL_TIP_CREATE,this.onCreateToolTip);
         this.addEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.onTTShow);
         this.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver);
         this.addEventListener(ListEvent.ITEM_ROLL_OUT,this.onItemRollOut);
         this.addEventListener(ListEvent.CHANGE,this._onItemChange);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this._onMouseMove);
         addEventListener(MouseEvent.MOUSE_WHEEL,this._onMouseWheel,false,0,true);
      }
      
      public function set enableMove(param1:Boolean) : void
      {
         if(param1)
         {
            dragEnabled = true;
            dropEnabled = true;
            addEventListener(DragEvent.DRAG_DROP,this._onDragDrop);
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:DisplayNode = new DisplayNode(this.displayObject,null,this);
         dataProvider = [_loc1_];
         this.validateNow();
         this.expandItem(this._root,true);
      }
      
      public function set root(param1:DisplayObject) : void
      {
         this.displayObject = param1;
         this.refresh();
      }
      
      public function set rootComponent(param1:DisplayObject) : void
      {
      }
      
      public function selectTreeItem(param1:DisplayObject) : void
      {
         if(param1)
         {
            selectItemById(param1.toString(),"type");
         }
      }
      
      private function _onDragDrop(param1:DragEvent) : void
      {
         var targetNode:DisplayNode;
         var sourceIndexInTarget:int;
         var parentDO:DisplayObject;
         var childDO:DisplayObject = null;
         var childIndex:int = 0;
         var event:DragEvent = param1;
         var ds:DragSource = event.dragSource;
         var tree:Tree = Tree(event.currentTarget);
         var items:Array = ds.dataForFormat("treeItems") as Array;
         var sourceNode:DisplayNode = items[0] as DisplayNode;
         var children:Array = sourceNode.parent.children.source;
         var sourceIndexInParent:int = int(children.indexOf(sourceNode));
         var targetIndex:int = int(tree.calculateDropIndex(event));
         tree.selectedIndex = targetIndex;
         targetNode = tree.selectedItem as DisplayNode;
         children = targetNode.parent.children.source;
         sourceIndexInTarget = int(children.indexOf(targetNode));
         parentDO = targetNode.parent.displayObject;
         if(parentDO is Container)
         {
            tree.dataDescriptor.removeChildAt(sourceNode.parent,sourceNode,sourceIndexInParent);
            tree.dataDescriptor.addChildAt(targetNode.parent,sourceNode,sourceIndexInTarget);
            childDO = sourceNode.displayObject;
            childIndex = childDO.parent.getChildIndex(childDO);
            if(parentDO != childDO)
            {
               try
               {
                  childDO.parent.removeChildAt(childIndex);
                  Container(parentDO).addChildAt(childDO,sourceIndexInTarget);
               }
               catch(e:Error)
               {
               }
            }
         }
      }
      
      private function _onItemChange(param1:ListEvent) : void
      {
         dispatchEvent(new ObjectSelectEvent(DisplayNode(selectedItem).displayObject));
      }
      
      private function _onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey && (StringUtils.numToChar(param1.charCode) == "o" || StringUtils.numToChar(param1.charCode) == "O"))
         {
            expandChildrenOf(selectedItem,true);
            param1.preventDefault();
            param1.stopImmediatePropagation();
         }
         if(param1.ctrlKey && (StringUtils.numToChar(param1.charCode) == "c" || StringUtils.numToChar(param1.charCode) == "C"))
         {
            expandChildrenOf(selectedItem,false);
            param1.preventDefault();
            param1.stopImmediatePropagation();
         }
      }
      
      private function _onMenuSelect(param1:ContextMenuEvent) : void
      {
         if(this.rollOverNode)
         {
            ContextMenuHelper.fillContextMenu(this,this.rollOverNode.displayObject);
            selectedIndex = this._lastSelectedIndex;
         }
      }
      
      private function _onMouseMove(param1:MouseEvent) : void
      {
         this._ctrlKeyPressed = param1.ctrlKey;
      }
      
      private function _onMouseWheel(param1:MouseEvent) : void
      {
         if(Boolean(this.toolTipDO) && param1.ctrlKey)
         {
            param1.preventDefault();
            param1.stopImmediatePropagation();
            if(param1.delta > 0)
            {
               this.toolTipDO.size *= 1.2;
            }
            else
            {
               this.toolTipDO.size /= 1.2;
            }
         }
      }
      
      private function getIcon(param1:DisplayNode) : Class
      {
         return param1.icon;
      }
      
      private function onComplete(param1:Event) : void
      {
         if(Boolean(dataProvider) && Boolean(dataProvider[0]))
         {
            expandItem(dataProvider[0],true);
         }
         contextMenu = new ContextMenu();
         contextMenu.hideBuiltInItems();
         contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,this._onMenuSelect);
      }
      
      private function onCreateToolTip(param1:ToolTipEvent) : void
      {
         if(this.rollOverNode)
         {
            this.toolTipDO = new DisplayObjectToolTip(this.rollOverNode);
            param1.toolTip = this.toolTipDO;
         }
      }
      
      private function onItemRollOut(param1:ListEvent) : void
      {
         if(param1.target.toolTip != null)
         {
            param1.target.toolTip = null;
            this.toolTipDO.dispose();
            this.toolTipDO = null;
         }
      }
      
      private function onItemRollOver(param1:ListEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc2_:DisplayNode = DisplayNode(param1.itemRenderer.data);
         this._lastSelectedIndex = itemRendererToIndex(param1.itemRenderer);
         if(_loc2_)
         {
            this.rollOverNode = _loc2_;
            _loc3_ = int(param1.itemRenderer.x);
            _loc4_ = int(param1.itemRenderer.y);
            _loc5_ = param1.currentTarget.contentToGlobal(new Point(_loc3_,_loc4_));
            _loc5_.x += param1.itemRenderer.width + 5;
            this.toolTipPoint = _loc5_;
            param1.target.toolTip = "toolTip";
            if(_loc2_.displayObject is IListItemRenderer && this._ctrlKeyPressed)
            {
               EffectUtils.glow(_loc2_.displayObject);
            }
         }
      }
      
      private function onItemSelected(param1:Event) : void
      {
         var _loc2_:DisplayNode = selectedItem as DisplayNode;
         this.displayObject = _loc2_ == null ? null : _loc2_.displayObject;
      }
      
      private function onTTShow(param1:ToolTipEvent) : void
      {
         param1.toolTip.x = this.toolTipPoint.x;
         param1.toolTip.y = this.toolTipPoint.y;
      }
      
      private function treeLabel(param1:DisplayNode) : String
      {
         return param1.name;
      }
      
      [Bindable(event="propertyChange")]
      private function get _root() : DisplayNode
      {
         return this._91240897_root;
      }
      
      private function set _root(param1:DisplayNode) : void
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

