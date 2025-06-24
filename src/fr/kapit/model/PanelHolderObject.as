package fr.kapit.model
{
   public class PanelHolderObject
   {
      public var name:String;
      
      public function PanelHolderObject(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}

