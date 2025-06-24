package fr.kapit.tree
{
   import fr.kapit.introspection.oldnodes.AbstractNode;
   import mx.collections.ICollectionView;
   import mx.controls.treeClasses.ITreeDataDescriptor;
   
   public class ClassDescTreeDescriptor implements ITreeDataDescriptor
   {
      public function ClassDescTreeDescriptor()
      {
         super();
      }
      
      public function getData(param1:Object, param2:Object = null) : Object
      {
         return null;
      }
      
      public function hasChildren(param1:Object, param2:Object = null) : Boolean
      {
         return AbstractNode(param1).hasChildren();
      }
      
      public function addChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean
      {
         return false;
      }
      
      public function isBranch(param1:Object, param2:Object = null) : Boolean
      {
         return AbstractNode(param1).hasChildren();
      }
      
      public function removeChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean
      {
         return false;
      }
      
      public function getChildren(param1:Object, param2:Object = null) : ICollectionView
      {
         return AbstractNode(param1).children;
      }
   }
}

