package fr.kapit.introspection.oldnodes
{
   import fr.kapit.introspection.AccessorDescriptor;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ILanguageElement;
   import mx.collections.ArrayCollection;
   
   public class NodeFactory
   {
      public function NodeFactory()
      {
         super();
      }
      
      public static function getNode(param1:ILanguageElement, param2:Object) : AbstractNode
      {
         var node:AbstractNode = null;
         var data:Object = null;
         var isArray:Boolean = false;
         var desc:ILanguageElement = param1;
         var target:Object = param2;
         if(desc is ClassDescriptor)
         {
            node = new ClassNode(ClassDescriptor(desc),target);
         }
         else if(desc is AccessorDescriptor)
         {
            if(target)
            {
               try
               {
                  data = target[desc.name];
               }
               catch(e:Error)
               {
               }
               if(data && data is Array || data is ArrayCollection)
               {
                  isArray = true;
               }
            }
            if(isArray)
            {
               node = new ArrayNode(AccessorDescriptor(desc),target);
            }
            else
            {
               node = new VariableNode(AccessorDescriptor(desc),target);
            }
         }
         else
         {
            node = new AbstractNode(desc);
         }
         return node;
      }
   }
}

