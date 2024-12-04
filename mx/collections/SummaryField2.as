package mx.collections
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class SummaryField2
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      public var dataField:String;
      
      public var label:String;
      
      public var summaryOperation:Object = "SUM";
      
      public function SummaryField2(param1:String = null, param2:Object = "SUM")
      {
         super();
         this.dataField = param1;
         this.summaryOperation = param2;
      }
   }
}

