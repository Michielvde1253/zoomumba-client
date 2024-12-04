package mx.collections
{
   import flash.events.EventDispatcher;
   import mx.core.mx_internal;
   import mx.utils.UIDUtil;
   
   use namespace mx_internal;
   
   public class LeafNodeCursor extends EventDispatcher implements IHierarchicalCollectionViewCursor
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      private var hierarchicalData:IHierarchicalData;
      
      private var currentIndex:int = 0;
      
      private var currentChildIndex:int = 0;
      
      private var _currentDepth:int = 1;
      
      private var childNodes:Object = [];
      
      private var parentNodes:Array = [];
      
      private var childIndexStack:Array = [];
      
      private var model:ICollectionView;
      
      private var collection:HierarchicalCollectionView;
      
      private var more:Boolean;
      
      private var modelCursor:IViewCursor;
      
      public function LeafNodeCursor(param1:HierarchicalCollectionView, param2:ICollectionView, param3:IHierarchicalData)
      {
         super();
         this.collection = param1;
         this.hierarchicalData = param3;
         this.model = param2;
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
         return null;
      }
      
      public function get current() : Object
      {
         try
         {
            if(this.childIndexStack.length == 0)
            {
               if(!(this.hierarchicalData.canHaveChildren(this.modelCursor.current) || this.modelCursor.current is SummaryObject))
               {
                  return this.modelCursor.current;
               }
               this.moveNext();
            }
            return this.childNodes[this.currentChildIndex];
         }
         catch(e:RangeError)
         {
         }
         return null;
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
         return false;
      }
      
      public function findFirst(param1:Object) : Boolean
      {
         return false;
      }
      
      public function findLast(param1:Object) : Boolean
      {
         return false;
      }
      
      public function moveNext() : Boolean
      {
         var uid:String;
         var flag:Boolean;
         var previousChildNodes:Object = null;
         var grandParent:Object = null;
         var currentNode:Object = this.childIndexStack.length == 0 ? this.modelCursor.current : this.current;
         if(currentNode == null)
         {
            return false;
         }
         uid = UIDUtil.getUID(currentNode);
         if(!this.collection.mx_internal::parentMap.hasOwnProperty(uid))
         {
            this.collection.mx_internal::parentMap[uid] = this.parentNodes[this.parentNodes.length - 1];
         }
         flag = true;
         if(this.hierarchicalData.canHaveChildren(currentNode) && this.hierarchicalData.hasChildren(currentNode))
         {
            previousChildNodes = this.childNodes;
            this.childNodes = this.collection.getChildren(currentNode);
            if(this.childNodes.length > 0)
            {
               this.childIndexStack.push(this.currentChildIndex);
               this.parentNodes.push(currentNode);
               this.currentChildIndex = 0;
               currentNode = this.childNodes[0];
               ++this.currentIndex;
               ++this._currentDepth;
               if(this.hierarchicalData.canHaveChildren(currentNode) || currentNode is SummaryObject)
               {
                  flag = this.moveNext();
               }
               return flag;
            }
            this.childNodes = previousChildNodes;
         }
         while(this.childNodes != null && this.childNodes.length > 0 && this.currentChildIndex >= Math.max(this.childNodes.length - 1,0))
         {
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
               this.childNodes = [];
            }
            this.currentChildIndex = this.childIndexStack.pop();
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
               currentNode = this.childNodes[++this.currentChildIndex];
            }
            catch(e:RangeError)
            {
               return false;
            }
         }
         ++this.currentIndex;
         if(this.hierarchicalData.canHaveChildren(currentNode) || currentNode is SummaryObject)
         {
            flag = this.moveNext();
         }
         return flag;
      }
      
      public function movePrevious() : Boolean
      {
         var flag:Boolean;
         var grandParent:Object = null;
         var previousChildNodes:Object = null;
         var currentNode:Object = this.current;
         if(currentNode == null)
         {
            return false;
         }
         flag = true;
         if(Boolean(this.parentNodes) && this.parentNodes.length > 0)
         {
            if(this.currentChildIndex == 0)
            {
               currentNode = this.parentNodes.pop();
               this.currentChildIndex = this.childIndexStack.pop();
               grandParent = this.parentNodes[this.parentNodes.length - 1];
               if(grandParent != null && this.hierarchicalData.canHaveChildren(grandParent) && this.hierarchicalData.hasChildren(grandParent))
               {
                  this.childNodes = this.collection.getChildren(grandParent);
               }
               else
               {
                  this.childNodes = [];
               }
               --this._currentDepth;
               --this.currentIndex;
               if(!this.beforeFirst && (this.hierarchicalData.canHaveChildren(currentNode) || currentNode is SummaryObject))
               {
                  flag = this.movePrevious();
               }
               return flag;
            }
            try
            {
               currentNode = this.childNodes[--this.currentChildIndex];
            }
            catch(e:RangeError)
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
         while(this.hierarchicalData.canHaveChildren(currentNode) && this.hierarchicalData.hasChildren(currentNode))
         {
            previousChildNodes = this.childNodes;
            this.childNodes = this.collection.getChildren(currentNode);
            if(this.childNodes.length <= 0)
            {
               this.childNodes = previousChildNodes;
               break;
            }
            this.childIndexStack.push(this.currentChildIndex);
            this.parentNodes.push(currentNode);
            this.currentChildIndex = this.childNodes.length - 1;
            currentNode = this.childNodes[this.currentChildIndex];
            ++this._currentDepth;
         }
         --this.currentIndex;
         if(this.hierarchicalData.canHaveChildren(currentNode) || currentNode is SummaryObject)
         {
            flag = this.movePrevious();
         }
         return flag;
      }
      
      public function seek(param1:CursorBookmark, param2:int = 0, param3:int = 0) : void
      {
      }
      
      public function insert(param1:Object) : void
      {
      }
      
      public function remove() : Object
      {
         return null;
      }
   }
}

