package fr.kapit.introspection.nodes
{
   import flash.utils.Dictionary;
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ArgumentDescriptor;
   import fr.kapit.introspection.AttributeDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.MethodDescriptor;
   import fr.kapit.introspection.nodes.complex.ArrayNode;
   import fr.kapit.introspection.nodes.complex.ChildrenCollectionNode;
   import fr.kapit.introspection.nodes.complex.DictionaryNode;
   import fr.kapit.introspection.nodes.complex.ObjectNode;
   import fr.kapit.introspection.nodes.complex.XMLDebugNode;
   import fr.kapit.introspection.nodes.custom.ClassDescriptorNode;
   import fr.kapit.introspection.nodes.simple.BooleanNode;
   import fr.kapit.introspection.nodes.simple.IntNode;
   import fr.kapit.introspection.nodes.simple.NumberNode;
   import fr.kapit.introspection.nodes.simple.StringNode;
   import fr.kapit.utils.ClassUtils;
   import mx.collections.ArrayCollection;
   import mx.core.IChildList;
   
   public class NodeFactory
   {
      public function NodeFactory()
      {
         super();
      }
      
      public static function newNode(param1:Object, param2:String, param3:Object = null, param4:int = -1, param5:Boolean = false) : DebugNode
      {
         var _loc6_:DebugNode = null;
         var _loc8_:ClassDescriptor = null;
         var _loc9_:AccessorDescriptor = null;
         var _loc7_:Class = ClassUtils.getObjectClass(param1);
         if(param1 == null && param3 == null)
         {
            return null;
         }
         if(param1 == null && param3 != null)
         {
            _loc8_ = ClassProxy.getInstance().getDescriptor(param3);
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.getAccessorDescriptor(param2);
               if(_loc9_)
               {
                  _loc7_ = _loc9_.type.type;
               }
            }
         }
         if(param2 == "rawChildren" && param1 is IChildList)
         {
            _loc6_ = new ChildrenCollectionNode(param1,param2,param3);
         }
         else
         {
            switch(_loc7_)
            {
               case int:
                  _loc6_ = new IntNode(param1,param2,param3);
                  break;
               case Number:
                  _loc6_ = new NumberNode(param1,param2,param3);
                  break;
               case Boolean:
                  _loc6_ = new BooleanNode(param1,param2,param3);
                  break;
               case String:
                  _loc6_ = new StringNode(param1,param2,param3);
                  break;
               case Array:
               case ArrayCollection:
                  _loc6_ = new ArrayNode(param1,param2,param3);
                  break;
               case Dictionary:
                  _loc6_ = new DictionaryNode(param1,param2,param3);
                  break;
               case XML:
               case XMLList:
                  _loc6_ = new XMLDebugNode(param1,param2,param3);
                  break;
               case ClassDescriptor:
               case AttributeDescriptor:
               case AccessorDescriptor:
               case MethodDescriptor:
               case ArgumentDescriptor:
                  _loc6_ = new ClassDescriptorNode(param1,param2,param3);
                  break;
               case null:
                  _loc6_ = new DebugNode(param1,param2,param3);
                  break;
               default:
                  _loc6_ = new ObjectNode(param1,param2,param3);
            }
         }
         if(param4 >= 0 && _loc6_ != null)
         {
            _loc6_.index = param4;
         }
         return _loc6_;
      }
   }
}

