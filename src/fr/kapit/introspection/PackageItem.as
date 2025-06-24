package fr.kapit.introspection
{
   public class PackageItem extends AbstractLanguageElement
   {
      public var parentPackage:AS3Package;
      
      public function PackageItem(param1:String)
      {
         super(param1);
      }
      
      public function get labelForSorting() : String
      {
         return (this is AS3Package ? "0" : "1") + this.label;
      }
   }
}

