package mx.collections
{
   public interface ISummaryCalculator
   {
      function summaryCalculationBegin(param1:SummaryField2) : Object;
      
      function calculateSummary(param1:Object, param2:SummaryField2, param3:Object) : void;
      
      function returnSummary(param1:Object, param2:SummaryField2) : Number;
      
      function summaryOfSummaryCalculationBegin(param1:Object, param2:SummaryField2) : Object;
      
      function calculateSummaryOfSummary(param1:Object, param2:Object, param3:SummaryField2) : void;
      
      function returnSummaryOfSummary(param1:Object, param2:SummaryField2) : Number;
   }
}

