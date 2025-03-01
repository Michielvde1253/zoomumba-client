package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$core_properties extends ResourceBundle
   {
      public function en_US$core_properties()
      {
         super("en_US","core");
      }
      
      override protected function getContent() : Object
      {
         return {
            "multipleChildSets_ClassAndInstance":"Multiple sets of visual children have been specified for this component (component definition and component instance).",
            "truncationIndicator":"...",
            "notExecuting":"Repeater is not executing.",
            "nullParameter":"Parameter {0} must be non-null.",
            "versionAlreadyRead":"Compatibility version has already been read.",
            "multipleChildSets_ClassAndSubclass":"Multiple sets of visual children have been specified for this component (base component definition and derived component definition).",
            "fontIncompatible":"warning: incompatible embedded font \'{0}\' specified for {1}. This component requires that the embedded font be declared with embedAsCff={2}.",
            "badParameter":"Parameter {0} must be one of the accepted values.",
            "notImplementedInFTETextField":"\'{0}\' is not implemented in FTETextField.",
            "viewSource":"View Source",
            "unsupportedTypeInFTETextField":"FTETextField does not support setting type to \"input\".",
            "badFile":"File does not exist.",
            "stateUndefined":"Undefined state \'{0}\'.",
            "badIndex":"The supplied index is out of bounds.",
            "versionAlreadySet":"Compatibility version has already been set."
         };
      }
   }
}

