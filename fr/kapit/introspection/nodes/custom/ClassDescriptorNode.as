package fr.kapit.introspection.nodes.custom
{
   import fr.kapit.introspection.AbstractLanguageElement;
   import fr.kapit.introspection.nodes.complex.ObjectNode;
   import fr.kapit.utils.ClassUtils;
   
   public class ClassDescriptorNode extends ObjectNode
   {
      public function ClassDescriptorNode(param1:Object, param2:String, param3:Object = null)
      {
         super(param1,param2,param3);
      }
      
      override public function get displayValue() : String
      {
         if(target)
         {
            return ClassUtils.getShortClassName(target) + " = " + (target as AbstractLanguageElement).label;
         }
         return "";
      }
   }
}

