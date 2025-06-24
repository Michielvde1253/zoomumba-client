package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$datamanagement_properties extends ResourceBundle
   {
      public function en_US$datamanagement_properties()
      {
         super("en_US","datamanagement");
      }
      
      override protected function getContent() : Object
      {
         return {
            "Branch":"Branch {0}",
            "repeatColumnsNotAllowed":"Same column object cannot be used more than once"
         };
      }
   }
}

