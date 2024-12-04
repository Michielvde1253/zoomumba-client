package mx.collections.errors
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class ChildItemPendingError extends ItemPendingError
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      public function ChildItemPendingError(param1:String)
      {
         super(param1);
      }
   }
}

