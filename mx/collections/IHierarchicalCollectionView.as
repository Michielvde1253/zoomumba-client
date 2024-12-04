package mx.collections
{
   public interface IHierarchicalCollectionView extends ICollectionView
   {
      function get openNodes() : Object;
      
      function set openNodes(param1:Object) : void;
      
      function get hasRoot() : Boolean;
      
      function get showRoot() : Boolean;
      
      function set showRoot(param1:Boolean) : void;
      
      function get source() : IHierarchicalData;
      
      function set source(param1:IHierarchicalData) : void;
      
      function openNode(param1:Object) : void;
      
      function closeNode(param1:Object) : void;
      
      function getChildren(param1:Object) : ICollectionView;
      
      function addChild(param1:Object, param2:Object) : Boolean;
      
      function removeChild(param1:Object, param2:Object) : Boolean;
      
      function addChildAt(param1:Object, param2:Object, param3:int) : Boolean;
      
      function removeChildAt(param1:Object, param2:int) : Boolean;
      
      function getNodeDepth(param1:Object) : int;
      
      function getParentItem(param1:Object) : *;
   }
}

