package fr.kapit.introspection
{
   import flash.utils.getDefinitionByName;
   
   public class InterfaceDescriptor extends AbstractTypeElement
   {
      public function InterfaceDescriptor(param1:String, param2:Boolean = false)
      {
         super(param1);
         if(!param2)
         {
            _type = getDefinitionByName(param1) as Class;
         }
      }
      
      override public function get type() : Class
      {
         if(!_type)
         {
            _type = getDefinitionByName(name) as Class;
         }
         return _type;
      }
   }
}

