package mx.collections
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class SummaryRow
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      public var fields:Array;
      
      public var summaryPlacement:String = "last";
      
      public var summaryObjectFunction:Function;
      
      public function SummaryRow()
      {
         super();
      }
   }
}

