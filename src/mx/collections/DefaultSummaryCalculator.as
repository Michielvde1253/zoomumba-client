package mx.collections
{
   public class DefaultSummaryCalculator implements ISummaryCalculator
   {
      public function DefaultSummaryCalculator()
      {
         super();
      }
      
      public function summaryCalculationBegin(param1:SummaryField2) : Object
      {
         var _loc2_:String = param1.dataField;
         var _loc3_:Object = {};
         switch(param1.summaryOperation)
         {
            case "SUM":
               _loc3_[_loc2_] = 0;
               break;
            case "MIN":
               _loc3_[_loc2_] = Number.MAX_VALUE;
               break;
            case "MAX":
               _loc3_[_loc2_] = -Number.MAX_VALUE;
               break;
            case "COUNT":
               _loc3_[_loc2_] = [];
               _loc3_[_loc2_ + "Counter"] = 0;
               break;
            case "AVG":
               _loc3_[_loc2_] = 0;
               _loc3_[_loc2_ + "Count"] = 0;
         }
         return _loc3_;
      }
      
      public function calculateSummary(param1:Object, param2:SummaryField2, param3:Object) : void
      {
         var _loc4_:String = param2.dataField;
         var _loc5_:Number = Number(param3[_loc4_]);
         if("number" == "xml")
         {
            _loc5_ = Number(_loc5_.toString());
         }
         switch(param2.summaryOperation)
         {
            case "SUM":
               if(!param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = _loc5_;
               }
               else
               {
                  param1[_loc4_] += _loc5_;
               }
               break;
            case "MIN":
               if(!param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = _loc5_;
               }
               else
               {
                  param1[_loc4_] = param1[_loc4_] < _loc5_ ? param1[_loc4_] : _loc5_;
               }
               break;
            case "MAX":
               if(!param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = _loc5_;
               }
               else
               {
                  param1[_loc4_] = param1[_loc4_] > _loc5_ ? param1[_loc4_] : _loc5_;
               }
               break;
            case "COUNT":
               if(!param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = [param3[_loc4_]];
                  param1[_loc4_ + "Counter"] = 1;
               }
               else
               {
                  param1[_loc4_].push(param3[_loc4_]);
                  param1[_loc4_ + "Counter"] += 1;
               }
               break;
            case "AVG":
               if(!param1.hasOwnProperty(_loc4_))
               {
                  param1[_loc4_] = _loc5_;
                  param1[_loc4_ + "Count"] = 1;
               }
               else
               {
                  param1[_loc4_] += _loc5_;
                  param1[_loc4_ + "Count"] += 1;
               }
         }
      }
      
      public function returnSummary(param1:Object, param2:SummaryField2) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:String = param2.dataField;
         switch(param2.summaryOperation)
         {
            case "SUM":
            case "MIN":
            case "MAX":
               _loc3_ = Number(param1[_loc4_]);
               break;
            case "COUNT":
               _loc3_ = Number(param1[_loc4_ + "Counter"]);
               break;
            case "AVG":
               _loc3_ = param1[_loc4_] / param1[_loc4_ + "Count"];
         }
         return _loc3_;
      }
      
      public function summaryOfSummaryCalculationBegin(param1:Object, param2:SummaryField2) : Object
      {
         var _loc4_:String = null;
         var _loc3_:Object = {};
         for(_loc4_ in param1)
         {
            _loc3_[_loc4_] = param1[_loc4_];
         }
         return _loc3_;
      }
      
      public function calculateSummaryOfSummary(param1:Object, param2:Object, param3:SummaryField2) : void
      {
         var _loc4_:String = null;
         switch(param3.summaryOperation)
         {
            case "AVG":
            case "SUM":
               for(_loc4_ in param2)
               {
                  param1[_loc4_] += param2[_loc4_];
               }
               break;
            case "MIN":
               for(_loc4_ in param2)
               {
                  param1[_loc4_] = param1[_loc4_] < param2[_loc4_] ? param1[_loc4_] : param2[_loc4_];
               }
               break;
            case "MAX":
               for(_loc4_ in param2)
               {
                  param1[_loc4_] = param1[_loc4_] > param2[_loc4_] ? param1[_loc4_] : param2[_loc4_];
               }
               break;
            case "COUNT":
               for(_loc4_ in param2)
               {
                  if(param1[_loc4_] is Array)
                  {
                     param1[_loc4_] = param1[_loc4_].concat(param2[_loc4_]);
                  }
                  else
                  {
                     param1[_loc4_] += param2[_loc4_];
                  }
               }
         }
      }
      
      public function returnSummaryOfSummary(param1:Object, param2:SummaryField2) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:String = param2.dataField;
         switch(param2.summaryOperation)
         {
            case "SUM":
            case "MIN":
            case "MAX":
               _loc3_ = Number(param1[_loc4_]);
               break;
            case "COUNT":
               _loc3_ = Number(param1[_loc4_ + "Counter"]);
               break;
            case "AVG":
               _loc3_ = param1[_loc4_] / param1[_loc4_ + "Count"];
         }
         return _loc3_;
      }
   }
}

