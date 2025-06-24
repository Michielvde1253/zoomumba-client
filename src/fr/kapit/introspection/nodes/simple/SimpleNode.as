package fr.kapit.introspection.nodes.simple
{
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeCollection;
   
   public class SimpleNode extends DebugNode
   {
      public function SimpleNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function getChildNodes() : NodeCollection
      {
         return null;
      }
   }
}

