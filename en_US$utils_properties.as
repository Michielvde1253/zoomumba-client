package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$utils_properties extends ResourceBundle
   {
      public function en_US$utils_properties()
      {
         super("en_US","utils");
      }
      
      override protected function getContent() : Object
      {
         return {"partialBlockDropped":"A partial block ({0} of 4 bytes) was dropped. Decoded data is probably truncated!"};
      }
   }
}

