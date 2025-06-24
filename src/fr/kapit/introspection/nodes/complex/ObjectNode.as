package fr.kapit.introspection.nodes.complex
{
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.nodes.DebugNode;
   import fr.kapit.introspection.nodes.NodeCollection;
   import fr.kapit.introspection.nodes.NodeFactory;
   import mx.collections.ArrayCollection;
   
   public class ObjectNode extends DebugNode
   {
      public function ObjectNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override public function get displayValue() : String
      {
         if(target == null)
         {
            return "null";
         }
         return typeDescriptor.qualifiedClassName;
      }
      
      override protected function getChildNodes() : NodeCollection
      {
         var _loc2_:ArrayCollection = null;
         var _loc3_:AccessorDescriptor = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:DebugNode = null;
         var _loc1_:NodeCollection = new NodeCollection();
         _loc2_ = showInherited ? typeDescriptor.allVariables : typeDescriptor.accessors;
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = target;
            _loc5_ = _loc3_.name;
            _loc6_ = this.getChildValue(_loc5_);
            if(!_loc1_.hasNode(_loc5_,_loc4_))
            {
               _loc7_ = NodeFactory.newNode(_loc6_,_loc5_,_loc4_);
               _loc1_.addItem(_loc7_);
            }
         }
         return _loc1_;
      }
      
      private function getChildValue(param1:String) : Object
      {
         var value:Object = null;
         var name:String = param1;
         try
         {
            if(target.hasOwnProperty(name))
            {
               value = target[name];
            }
         }
         catch(e:Error)
         {
         }
         return value;
      }
   }
}

