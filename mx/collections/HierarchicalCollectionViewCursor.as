package mx.collections
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import mx.collections.errors.ChildItemPendingError;
   import mx.collections.errors.ItemPendingError;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexEvent;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class HierarchicalCollectionViewCursor extends EventDispatcher implements IHierarchicalCollectionViewCursor
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      private var hierarchicalData:IHierarchicalData;
      
      private var currentChildBookmark:CursorBookmark = CursorBookmark.FIRST;
      
      private var currentIndex:int = 0;
      
      private var _currentDepth:int = 1;
      
      private var childNodes:ICollectionView;
      
      private var parentNodes:Array = [];
      
      private var childIndexStack:Array = [];
      
      private var model:ICollectionView;
      
      private var collection:HierarchicalCollectionView;
      
      private var more:Boolean;
      
      private var modelCursor:IViewCursor;
      
      public function HierarchicalCollectionViewCursor(param1:HierarchicalCollectionView, param2:ICollectionView, param3:IHierarchicalData)
      {
         super();
         this.collection = param1;
         this.hierarchicalData = param3;
         this.model = param2;
         param1.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.collectionChangeHandler,false,0,true);
         this.modelCursor = param2.createCursor();
         if(param2.length > 1)
         {
            this.more = true;
         }
         else
         {
            this.more = false;
         }
      }
      
      public function get index() : int
      {
         return this.currentIndex;
      }
      
      public function get bookmark() : CursorBookmark
      {
         return new CursorBookmark(this.currentIndex.toString());
      }
      
      public function get current() : Object
      {
         var childCursor:IViewCursor = null;
         if(this.childIndexStack.length == 0)
         {
            return this.modelCursor.current;
         }
         childCursor = this.childNodes.createCursor();
         try
         {
            childCursor.seek(this.currentChildBookmark);
            return childCursor.current;
         }
         catch(e:ItemPendingError)
         {
            return null;
         }
      }
      
      public function get currentDepth() : int
      {
         return this._currentDepth;
      }
      
      public function get beforeFirst() : Boolean
      {
         return this.currentIndex <= this.collection.length && this.current == null;
      }
      
      public function get afterLast() : Boolean
      {
         return this.currentIndex >= this.collection.length && this.current == null;
      }
      
      public function get view() : ICollectionView
      {
         return this.model;
      }
      
      public function findAny(param1:Object) : Boolean
      {
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         this.seek(CursorBookmark.FIRST);
         var _loc2_:* = false;
         while(true)
         {
            if(_loc2_)
            {
               return false;
            }
            _loc3_ = this.hierarchicalData.getData(this.current);
            _loc4_ = true;
            for(_loc5_ in param1)
            {
               if(_loc3_[_loc5_] != param1[_loc5_])
               {
                  _loc4_ = false;
                  break;
               }
            }
            if(_loc4_)
            {
               break;
            }
            _loc2_ = !this.moveNext();
         }
         return true;
      }
      
      public function findFirst(param1:Object) : Boolean
      {
         return this.findAny(param1);
      }
      
      public function findLast(param1:Object) : Boolean
      {
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         this.seek(CursorBookmark.LAST);
         var _loc2_:* = false;
         while(true)
         {
            if(_loc2_)
            {
               return false;
            }
            _loc3_ = this.current;
            _loc4_ = true;
            for(_loc5_ in param1)
            {
               if(_loc3_[_loc5_] != param1[_loc5_])
               {
                  _loc4_ = false;
                  break;
               }
            }
            if(_loc4_)
            {
               break;
            }
            _loc2_ = !this.movePrevious();
         }
         return true;
      }
      
      public function moveNext() : Boolean
      {
         var uid:String;
         var childCursor:IViewCursor = null;
         var previousChildNodes:ICollectionView = null;
         var grandParent:Object = null;
         var currentNode:Object = this.current;
         if(currentNode == null)
         {
            return false;
         }
         uid = UIDUtil.getUID(currentNode);
         if(this.collection.openNodes[uid] && this.hierarchicalData.canHaveChildren(currentNode) && this.hierarchicalData.hasChildren(currentNode))
         {
            previousChildNodes = this.childNodes;
            this.childNodes = this.collection.getChildren(currentNode);
            if(this.childNodes.length > 0)
            {
               this.childIndexStack.push(this.currentChildBookmark);
               this.parentNodes.push(currentNode);
               this.currentChildBookmark = CursorBookmark.FIRST;
               childCursor = this.childNodes.createCursor();
               try
               {
                  currentNode = childCursor.current;
                  this.updateParentMap(currentNode);
               }
               catch(e:ItemPendingError)
               {
                  currentNode = null;
                  throw new ChildItemPendingError(e.message);
               }
               ++this.currentIndex;
               ++this._currentDepth;
               return true;
            }
            this.childNodes = previousChildNodes;
         }
         while(true)
         {
            if(this.childNodes != null)
            {
               childCursor = this.childNodes.createCursor();
               try
               {
                  childCursor.seek(this.currentChildBookmark);
                  childCursor.moveNext();
               }
               catch(e:ItemPendingError)
               {
                  childCursor.seek(CursorBookmark.FIRST);
               }
            }
            if(!(this.childNodes != null && this.childNodes.length > 0 && (childCursor.bookmark == CursorBookmark.LAST || Boolean(childCursor.afterLast))))
            {
               break;
            }
            if(this.childIndexStack.length < 1 && !this.more)
            {
               currentNode = null;
               ++this.currentIndex;
               this._currentDepth = 1;
               return false;
            }
            currentNode = this.parentNodes.pop();
            grandParent = this.parentNodes[this.parentNodes.length - 1];
            if(grandParent != null && this.hierarchicalData.canHaveChildren(grandParent) && this.hierarchicalData.hasChildren(grandParent))
            {
               this.childNodes = this.collection.getChildren(grandParent);
            }
            else
            {
               this.childNodes = null;
            }
            this.currentChildBookmark = this.childIndexStack.pop();
            --this._currentDepth;
         }
         if(this.childIndexStack.length == 0)
         {
            this._currentDepth = 1;
            this.more = this.modelCursor.moveNext();
            if(!this.more)
            {
               this._currentDepth = 1;
               ++this.currentIndex;
               currentNode = null;
               return false;
            }
            currentNode = this.modelCursor.current;
         }
         else
         {
            try
            {
               childCursor = this.childNodes.createCursor();
               childCursor.seek(this.currentChildBookmark);
               childCursor.moveNext();
               this.currentChildBookmark = childCursor.bookmark;
               currentNode = childCursor.current;
            }
            catch(e:ItemPendingError)
            {
               currentNode = parentNodes.pop();
               grandParent = parentNodes[parentNodes.length - 1];
               if(grandParent != null && hierarchicalData.canHaveChildren(grandParent) && hierarchicalData.hasChildren(grandParent))
               {
                  childNodes = collection.getChildren(grandParent);
               }
               else
               {
                  childNodes = null;
               }
               currentChildBookmark = childIndexStack.pop();
               --_currentDepth;
               if(childIndexStack.length == 0)
               {
                  _currentDepth = 1;
                  more = modelCursor.moveNext();
                  if(more)
                  {
                     currentNode = modelCursor.current;
                     throw new ChildItemPendingError(e.message);
                  }
                  _currentDepth = 1;
                  ++currentIndex;
                  currentNode = null;
                  return false;
               }
            }
         }
         this.updateParentMap(currentNode);
         ++this.currentIndex;
         return true;
      }
      
      public function movePrevious() : Boolean
      {
         var childCursor:IViewCursor = null;
         var grandParent:Object = null;
         var previousChildNodes:ICollectionView = null;
         var currentNode:Object = this.current;
         if(currentNode == null)
         {
            return false;
         }
         if(Boolean(this.parentNodes) && this.parentNodes.length > 0)
         {
            if(this.currentChildBookmark == CursorBookmark.FIRST)
            {
               currentNode = this.parentNodes.pop();
               this.currentChildBookmark = this.childIndexStack.pop();
               grandParent = this.parentNodes[this.parentNodes.length - 1];
               if(grandParent != null && this.hierarchicalData.canHaveChildren(grandParent) && this.hierarchicalData.hasChildren(grandParent))
               {
                  this.childNodes = this.collection.getChildren(grandParent);
               }
               else
               {
                  this.childNodes = null;
               }
               --this._currentDepth;
               --this.currentIndex;
               return true;
            }
            try
            {
               childCursor = this.childNodes.createCursor();
               childCursor.seek(this.currentChildBookmark);
               childCursor.movePrevious();
               this.currentChildBookmark = childCursor.bookmark;
               currentNode = childCursor.current;
               try
               {
                  childCursor.movePrevious();
                  if(childCursor.bookmark == CursorBookmark.FIRST)
                  {
                     this.currentChildBookmark = CursorBookmark.FIRST;
                  }
               }
               catch(e:ItemPendingError)
               {
               }
            }
            catch(e:ItemPendingError)
            {
               return false;
            }
         }
         else
         {
            this.more = this.modelCursor.movePrevious();
            if(!this.more)
            {
               this.currentIndex = -1;
               currentNode = null;
               return false;
            }
            currentNode = this.modelCursor.current;
         }
         while(this.collection.openNodes[UIDUtil.getUID(currentNode)] && this.hierarchicalData.canHaveChildren(currentNode) && this.hierarchicalData.hasChildren(currentNode))
         {
            previousChildNodes = this.childNodes;
            this.childNodes = this.collection.getChildren(currentNode);
            if(this.childNodes.length <= 0)
            {
               this.childNodes = previousChildNodes;
               break;
            }
            this.childIndexStack.push(this.currentChildBookmark);
            this.parentNodes.push(currentNode);
            if(this.childNodes.length == 1)
            {
               this.currentChildBookmark = CursorBookmark.FIRST;
            }
            else
            {
               this.currentChildBookmark = CursorBookmark.LAST;
            }
            childCursor = this.childNodes.createCursor();
            childCursor.seek(this.currentChildBookmark);
            currentNode = childCursor.current;
            ++this._currentDepth;
         }
         this.updateParentMap(currentNode);
         --this.currentIndex;
         return true;
      }
      
      public function seek(param1:CursorBookmark, param2:int = 0, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         if(param1 == CursorBookmark.FIRST)
         {
            _loc4_ = 0;
         }
         else if(param1 == CursorBookmark.CURRENT)
         {
            _loc4_ = this.currentIndex;
         }
         else if(param1 == CursorBookmark.LAST)
         {
            _loc4_ = this.collection.length - 1;
         }
         else
         {
            _loc4_ = int(param1.value);
         }
         _loc4_ = Math.max(Math.min(_loc4_ + param2,this.collection.length),0);
         var _loc5_:int = Math.abs(this.currentIndex - _loc4_);
         var _loc6_:int = Math.abs(this.collection.length - _loc4_);
         var _loc7_:* = true;
         if(_loc5_ < _loc4_)
         {
            if(_loc6_ < _loc5_)
            {
               this.moveToLast();
               if(_loc6_ == 0)
               {
                  this.moveNext();
                  _loc4_ = 0;
               }
               else
               {
                  _loc4_ = _loc6_ - 1;
               }
               _loc7_ = false;
            }
            else
            {
               _loc7_ = this.currentIndex < _loc4_;
               _loc4_ = _loc5_;
               if(this.currentIndex == this.collection.length)
               {
                  _loc4_--;
                  this.moveToLast();
               }
            }
         }
         else if(_loc6_ < _loc4_)
         {
            this.moveToLast();
            if(_loc6_ == 0)
            {
               this.moveNext();
               _loc4_ = 0;
            }
            else
            {
               _loc4_ = _loc6_ - 1;
            }
            _loc7_ = false;
         }
         else
         {
            this.moveToFirst();
         }
         if(_loc7_)
         {
            while(Boolean(_loc4_) && _loc4_ > 0)
            {
               this.moveNext();
               _loc4_--;
            }
         }
         else
         {
            while(Boolean(_loc4_) && _loc4_ > 0)
            {
               this.movePrevious();
               _loc4_--;
            }
         }
      }
      
      public function insert(param1:Object) : void
      {
         var _loc2_:Object = this.collection.getParentItem(this.current);
         this.collection.addChildAt(_loc2_,param1,this.currentIndex);
      }
      
      public function remove() : Object
      {
         var _loc1_:Object = this.current;
         var _loc2_:Object = this.collection.getParentItem(this.current);
         this.collection.removeChild(_loc2_,this.current);
         return _loc1_;
      }
      
      private function isItemVisible(param1:Object) : Boolean
      {
         var _loc2_:Object = this.collection.getParentItem(param1);
         while(_loc2_ != null)
         {
            if(this.collection.openNodes[UIDUtil.getUID(_loc2_)] == null)
            {
               return false;
            }
            _loc2_ = this.collection.getParentItem(_loc2_);
         }
         return true;
      }
      
      private function updateParentMap(param1:Object) : void
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            _loc2_ = UIDUtil.getUID(param1);
            if(!this.collection.mx_internal::parentMap.hasOwnProperty(_loc2_))
            {
               this.collection.mx_internal::parentMap[_loc2_] = this.parentNodes[this.parentNodes.length - 1];
            }
         }
      }
      
      private function getParentStack(param1:Object) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:Object = this.collection.getParentItem(param1);
         while(_loc3_ != null)
         {
            _loc2_.unshift(_loc3_);
            _loc3_ = this.collection.getParentItem(_loc3_);
         }
         return _loc2_;
      }
      
      private function isNodeBefore(param1:Object, param2:Object) : Boolean
      {
         var nodeParents:Array;
         var curParents:Array;
         var i:int = 0;
         var tmpChildNodes:ICollectionView = null;
         var sameParent:Object = null;
         var cursor:IViewCursor = null;
         var child:Object = null;
         var nodeParent:Object = null;
         var curParent:Object = null;
         var node:Object = param1;
         var currentNode:Object = param2;
         if(currentNode == null)
         {
            return false;
         }
         nodeParents = this.getParentStack(node);
         curParents = this.getParentStack(currentNode);
         while(nodeParents.length != 0 && curParents.length != 0)
         {
            nodeParent = nodeParents.shift();
            curParent = curParents.shift();
            if(nodeParent != curParent)
            {
               sameParent = this.collection.getParentItem(nodeParent);
               if(sameParent != null && this.hierarchicalData.canHaveChildren(sameParent) && this.hierarchicalData.hasChildren(sameParent))
               {
                  tmpChildNodes = this.collection.getChildren(sameParent);
               }
               else
               {
                  tmpChildNodes = this.model;
               }
               cursor = tmpChildNodes.createCursor();
               try
               {
                  cursor.seek(CursorBookmark.FIRST,i);
                  child = cursor.current;
               }
               catch(e:ItemPendingError)
               {
                  return false;
               }
               if(child == curParent)
               {
                  return false;
               }
               if(child == nodeParent)
               {
                  return true;
               }
            }
         }
         if(nodeParents.length)
         {
            node = nodeParents.shift();
         }
         if(curParents.length)
         {
            currentNode = curParents.shift();
         }
         tmpChildNodes = this.model;
         cursor = tmpChildNodes.createCursor();
         while(!cursor.afterLast)
         {
            child = cursor.current;
            if(child == currentNode)
            {
               return false;
            }
            if(child == node)
            {
               return true;
            }
            cursor.moveNext();
         }
         return false;
      }
      
      private function moveToFirst() : void
      {
         this.childNodes = null;
         this.modelCursor.seek(CursorBookmark.FIRST,0);
         if(this.model.length > 1)
         {
            this.more = true;
         }
         else
         {
            this.more = false;
         }
         this.currentChildBookmark = CursorBookmark.FIRST;
         this.parentNodes = [];
         this.childIndexStack = [];
         this.currentIndex = 0;
         this._currentDepth = 1;
      }
      
      public function moveToLast() : void
      {
         var emptyBranch:Boolean;
         var currentNode:Object;
         var previousChildNodes:ICollectionView = null;
         var childCursor:IViewCursor = null;
         this.childNodes = null;
         this.childIndexStack = [];
         this._currentDepth = 1;
         this.parentNodes = [];
         emptyBranch = false;
         this.modelCursor.seek(CursorBookmark.LAST,0);
         currentNode = this.modelCursor.current;
         while(this.collection.openNodes[UIDUtil.getUID(currentNode)] && this.hierarchicalData.canHaveChildren(currentNode) && this.hierarchicalData.hasChildren(currentNode))
         {
            previousChildNodes = this.childNodes;
            this.childNodes = this.collection.getChildren(currentNode);
            if(!(this.childNodes != null && this.childNodes.length > 0))
            {
               this.childNodes = previousChildNodes;
               break;
            }
            childCursor = this.childNodes.createCursor();
            try
            {
               childCursor.seek(CursorBookmark.LAST);
            }
            catch(e:ItemPendingError)
            {
               break;
            }
            this.parentNodes.push(currentNode);
            this.childIndexStack.push(this.currentChildBookmark);
            currentNode = childCursor.current;
            this.currentChildBookmark = CursorBookmark.LAST;
            try
            {
               childCursor.movePrevious();
               if(childCursor.bookmark == CursorBookmark.FIRST)
               {
                  this.currentChildBookmark = CursorBookmark.FIRST;
               }
            }
            catch(e:ItemPendingError)
            {
            }
            ++this._currentDepth;
         }
         this.currentIndex = this.collection.length - 1;
      }
      
      public function collectionChangeHandler(param1:CollectionEvent) : void
      {
         var i:int = 0;
         var n:int = 0;
         var node:Object = null;
         var nodeParent:Object = null;
         var parent:Object = null;
         var parentStack:Array = null;
         var parentTable:Dictionary = null;
         var tmpChildnodes:ICollectionView = null;
         var childCursor:IViewCursor = null;
         var newIndex:int = 0;
         var event:CollectionEvent = param1;
         var isBefore:Boolean = false;
         parentStack = this.getParentStack(this.current);
         parentTable = new Dictionary();
         n = int(parentStack.length);
         i = 0;
         while(i < n - 1)
         {
            parentTable[parentStack[i]] = i + 1;
            i++;
         }
         parent = parentStack[parentStack.length - 1];
         if(event.kind == CollectionEventKind.ADD)
         {
            n = int(event.items.length);
            if(event.location <= this.currentIndex)
            {
               this.currentIndex += n;
               isBefore = true;
            }
            i = 0;
            while(i < n)
            {
               node = event.items[i];
               if(isBefore)
               {
                  nodeParent = this.collection.getParentItem(node);
                  tmpChildnodes = this.collection.getChildren(nodeParent);
                  if(nodeParent == parent)
                  {
                     if(tmpChildnodes != null)
                     {
                        childCursor = tmpChildnodes.createCursor();
                        try
                        {
                           childCursor.seek(this.currentChildBookmark);
                           childCursor.moveNext();
                           this.currentChildBookmark = childCursor.bookmark;
                        }
                        catch(e:ItemPendingError)
                        {
                        }
                     }
                  }
                  else if(parentTable[nodeParent] != null)
                  {
                     if(tmpChildnodes != null)
                     {
                        childCursor = tmpChildnodes.createCursor();
                        try
                        {
                           childCursor.seek(this.currentChildBookmark);
                           childCursor.moveNext();
                           this.currentChildBookmark = childCursor.bookmark;
                        }
                        catch(e:ItemPendingError)
                        {
                        }
                        this.childIndexStack[parentTable[nodeParent]] = this.currentChildBookmark;
                     }
                  }
               }
               i++;
            }
         }
         else if(event.kind == CollectionEventKind.REMOVE)
         {
            n = int(event.items.length);
            if(event.location <= this.currentIndex)
            {
               if(event.location + n >= this.currentIndex)
               {
                  newIndex = int(event.location);
                  this.moveToFirst();
                  this.seek(CursorBookmark.FIRST,newIndex);
                  i = 0;
                  while(i < n)
                  {
                     node = event.items[i];
                     delete this.collection.mx_internal::parentMap[UIDUtil.getUID(node)];
                     i++;
                  }
                  return;
               }
               this.currentIndex -= n;
               isBefore = true;
            }
            i = 0;
            while(i < n)
            {
               node = event.items[i];
               if(isBefore)
               {
                  nodeParent = this.collection.getParentItem(node);
                  tmpChildnodes = this.collection.getChildren(nodeParent);
                  if(nodeParent == parent)
                  {
                     if(tmpChildnodes != null)
                     {
                        childCursor = tmpChildnodes.createCursor();
                        try
                        {
                           childCursor.seek(this.currentChildBookmark);
                           childCursor.movePrevious();
                           this.currentChildBookmark = childCursor.bookmark;
                        }
                        catch(e:ItemPendingError)
                        {
                        }
                     }
                  }
                  else if(parentTable[nodeParent] != null)
                  {
                     if(tmpChildnodes != null)
                     {
                        childCursor = tmpChildnodes.createCursor();
                        try
                        {
                           childCursor.seek(this.currentChildBookmark);
                           childCursor.movePrevious();
                           this.currentChildBookmark = childCursor.bookmark;
                        }
                        catch(e:ItemPendingError)
                        {
                        }
                        this.childIndexStack[parentTable[nodeParent]] = this.currentChildBookmark;
                     }
                  }
               }
               delete this.collection.mx_internal::parentMap[UIDUtil.getUID(node)];
               i++;
            }
         }
         else if(event.kind == CollectionEventKind.RESET)
         {
            this.model = this.collection.mx_internal::treeData;
            this.modelCursor = this.model.createCursor();
            this.collection.dispatchEvent(new FlexEvent(FlexEvent.CURSOR_UPDATE));
         }
         else if(event.kind == CollectionEventKind.REFRESH)
         {
            if(!(this.beforeFirst || this.afterLast))
            {
               this.findFirst(this.current);
            }
         }
      }
   }
}

