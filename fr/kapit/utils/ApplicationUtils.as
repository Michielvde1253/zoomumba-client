package fr.kapit.utils
{
   import mx.core.FlexGlobals;
   import mx.core.UIComponent;
   
   public class ApplicationUtils
   {
      public function ApplicationUtils()
      {
         super();
      }
      
      public static function getApplication() : UIComponent
      {
         return FlexGlobals.topLevelApplication as UIComponent;
      }
      
      public static function get application() : UIComponent
      {
         return getApplication();
      }
   }
}

