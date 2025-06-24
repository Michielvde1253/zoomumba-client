package fr.kapit.introspection.nodes.complex
{
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeFactory;
   import fr.kapit.utils.ClassUtils;
   
   public class DictionaryNode extends ObjectNode
   {
      public function DictionaryNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function buildDynamicAttributes() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:DebugNode = null;
         for(_loc1_ in target)
         {
            _loc2_ = target[_loc1_];
            _loc3_ = ClassUtils.getShortClassName(_loc2_);
            _loc4_ = NodeFactory.newNode(_loc2_,_loc3_,target);
            _loc4_.key = _loc1_;
            _children.addItem(_loc4_);
         }
      }
   }
}

