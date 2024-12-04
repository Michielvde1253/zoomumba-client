package fr.kapit.introspection
{
   public class AbstractTypeElement extends AbstractLanguageElement implements ITypedElement
   {
      protected var _type:Class;
      
      public function AbstractTypeElement(param1:String, param2:Class = null)
      {
         super(param1);
         if(param2)
         {
            this._type = param2;
         }
      }
      
      public function get type() : Class
      {
         return this._type;
      }
   }
}

