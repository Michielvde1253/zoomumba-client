package fr.kapit.introspection
{
   public class ConstantDescriptor extends AccessorDescriptor
   {
      public var value:Object;
      
      public function ConstantDescriptor(param1:Object = null, param2:Boolean = false, param3:ClassDescriptor = null)
      {
         super(param1,param2,param3);
         if(param2)
         {
            this.value = param1.@value;
         }
         else
         {
            this.value = !!param3 ? param3.type[name] : "";
         }
      }
   }
}

