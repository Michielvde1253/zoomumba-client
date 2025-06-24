package fr.kapit.introspection
{
   public class AbstractLanguageElement implements ILanguageElement
   {
      protected var _name:String;
      
      public function AbstractLanguageElement(param1:String)
      {
         super();
         this._name = param1;
      }
      
      public function get label() : String
      {
         return this._name;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
   }
}

