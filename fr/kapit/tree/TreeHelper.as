package fr.kapit.tree
{
   import fr.kapit.utils.ArrayUtils;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.controls.Tree;
   import mx.events.ListEvent;
   import mx.utils.UIDUtil;
   
   public class TreeHelper
   {
      private var tree:Tree;
      
      private var openItems:Array;
      
      private var selectedUID:String;
      
      public function TreeHelper(param1:Tree)
      {
         super();
         this.tree = param1;
      }
      
      public function itemSelected(param1:String) : void
      {
         this.selectedUID = param1;
      }
      
      public function setOpenItems(param1:Array) : void
      {
         this.openItems = param1;
      }
      
      public function autoSelectItem() : void
      {
         if(this.selectedUID != null && this.selectedUID.length != 0)
         {
            this.selectObjectById(this.selectedUID);
         }
         else if(this.tree.dataProvider != null && this.tree.dataProvider.length > 0)
         {
            this.selectTreeItem(this.tree.dataProvider[0]);
         }
      }
      
      public function selectTreeItem(param1:Object, param2:Boolean = false, param3:Boolean = true) : void
      {
         var item:Object = param1;
         var noExpand:Boolean = param2;
         var dispatchChangeEvent:Boolean = param3;
         if(item != null)
         {
            if(noExpand && this.tree is KapDebugTree)
            {
               KapDebugTree(this.tree).noAutoExpand = true;
            }
            try
            {
               this.tree.selectedItem = item;
               if(dispatchChangeEvent)
               {
                  this.tree.dispatchEvent(new ListEvent("change"));
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function selectObjectById(param1:String) : void
      {
         if(this.tree.dataProvider == null || this.tree.dataProvider.length == 0)
         {
            return;
         }
         var _loc2_:Object = this.findItemByUID(this.tree.dataProvider[0],param1);
         if(_loc2_ != null)
         {
            this.selectTreeItem(_loc2_);
         }
      }
      
      public function restoreSelection() : void
      {
         this.selectObjectById(this.selectedUID);
      }
      
      public function findItemByUID(param1:Object, param2:String) : Object
      {
         var _loc3_:ICollectionView = null;
         var _loc4_:Number = NaN;
         var _loc5_:Object = null;
         if(UIDUtil.getUID(param1) == param2)
         {
            return param1;
         }
         if(param1.hasOwnProperty("children"))
         {
            _loc3_ = this.tree.dataDescriptor.getChildren(param1);
            if(_loc3_)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = _loc3_[_loc4_];
                  _loc5_ = this.findItemByUID(_loc5_,param2);
                  if(_loc5_ != null)
                  {
                     return _loc5_;
                  }
                  _loc4_++;
               }
            }
            return null;
         }
         return null;
      }
      
      public function restoreOpenState(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:ICollectionView = null;
         var _loc8_:Number = NaN;
         var _loc9_:Object = null;
         this.tree.openItems = new Array();
         if(this.openItems.length != 0)
         {
            _loc2_ = UIDUtil.getUID(param1);
            _loc3_ = -1;
            _loc4_ = 0;
            while(_loc4_ < this.openItems.length)
            {
               _loc5_ = this.openItems[_loc4_];
               _loc6_ = UIDUtil.getUID(_loc5_);
               if(_loc6_ == _loc2_)
               {
                  _loc3_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_ >= 0)
            {
               this.tree.expandItem(this.openItems[_loc3_],true,false);
               if(param1.hasOwnProperty("children"))
               {
                  _loc7_ = this.tree.dataDescriptor.getChildren(param1);
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_.length)
                  {
                     _loc9_ = _loc7_[_loc8_];
                     this.restoreOpenState(_loc9_);
                     _loc8_++;
                  }
               }
            }
         }
         else
         {
            this.tree.expandItem(this.tree.dataProvider[0],true,false);
         }
      }
      
      public function openLevels(param1:int, param2:Object = null) : void
      {
         var children:Array = null;
         var iChild:int = 0;
         var child:Object = null;
         var depth:int = param1;
         var node:Object = param2;
         if(node == null)
         {
            try
            {
               node = this.tree.dataProvider[0];
            }
            catch(e:Error)
            {
               return;
            }
         }
         if(depth > 0)
         {
            this.tree.expandItem(node,true);
            if(depth > 1)
            {
               if(node.hasOwnProperty("children"))
               {
                  children = node.children is ArrayCollection ? ArrayCollection(node.children).source : node.children as Array;
                  if(children)
                  {
                     iChild = 0;
                     while(iChild < children.length)
                     {
                        child = children[iChild];
                        depth - 1;
                        iChild++;
                     }
                  }
               }
            }
         }
      }
      
      public function selectItemById(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         if(this.tree.dataProvider == null || this.tree.dataProvider.length == 0)
         {
            return;
         }
         var _loc4_:Array = this._selectItemById(this.tree.dataProvider[0],param1,param2);
         if(_loc4_ != null)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc7_ = _loc4_[_loc6_];
               if(_loc6_ >= _loc4_.length - 1)
               {
                  this.tree.callLater(this.selectTreeItem,[_loc7_,true,param3]);
                  return;
               }
               this.tree.callLater(this.tree.expandItem,[_loc7_,true]);
               _loc6_++;
            }
         }
      }
      
      private function _selectItemById(param1:Object, param2:String, param3:String) : Array
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:ArrayCollection = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         if(param1.hasOwnProperty(param3))
         {
            _loc4_ = param1[param3];
            if(_loc4_ == param2)
            {
               _loc6_ = new Array();
               _loc6_.push(param1);
               return _loc6_;
            }
            if(param1.hasOwnProperty("children"))
            {
               if(this.tree.dataDescriptor)
               {
                  _loc7_ = this.tree.dataDescriptor.getChildren(param1);
               }
               else
               {
                  _loc7_ = param1.children;
               }
               _loc8_ = ArrayUtils.getSafeArray(_loc7_);
               _loc9_ = 0;
               while(_loc9_ < _loc8_.length)
               {
                  _loc10_ = _loc8_[_loc9_];
                  _loc6_ = this._selectItemById(_loc10_,param2,param3);
                  if(_loc6_ != null)
                  {
                     _loc6_.unshift(param1);
                     break;
                  }
                  _loc9_++;
               }
            }
         }
         return _loc6_;
      }
   }
}

