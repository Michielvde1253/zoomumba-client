package fr.kapit.introspection.nodes.complex
{
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeCollection;
   import fr.kapit.introspection.nodes.NodeFactory;
   import mx.core.IChildList;
   
   public class ChildrenCollectionNode extends ObjectNode
   {
      public function ChildrenCollectionNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      public function get childList() : IChildList
      {
         return target as IChildList;
      }
      
      override protected function getChildNodes() : NodeCollection
      {
         var _loc3_:Object = null;
         var _loc4_:DebugNode = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:IChildList = this.childList;
         var _loc2_:NodeCollection = new NodeCollection();
         if(_loc1_)
         {
            _loc5_ = int(_loc1_.numChildren);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ = _loc1_.getChildAt(_loc6_);
               _loc4_ = NodeFactory.newNode(_loc3_,null);
               _loc2_.addItem(_loc4_);
               _loc6_++;
            }
         }
         return _loc2_;
      }
   }
}

