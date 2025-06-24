package fr.kapit.components
{
   import fr.kapit.controls.kDataGrid;
   import fr.kapit.utils.stack.CallStack;
   import mx.controls.dataGridClasses.DataGridColumn;
   
   public class StackDataGrid extends kDataGrid
   {
      private var _columns:Array;
      
      public function StackDataGrid()
      {
         var _loc2_:Object = null;
         var _loc3_:DataGridColumn = null;
         var _loc4_:String = null;
         this._columns = [{
            "dataField":"@num",
            "headerText":"#",
            "width":20
         },{
            "dataField":"@class",
            "headerText":"Class"
         },{
            "dataField":"@function",
            "headerText":"Function"
         },{
            "dataField":"@line",
            "headerText":"line"
         },{
            "dataField":"@package",
            "headerText":"package"
         }];
         super();
         var _loc1_:Array = [];
         for each(_loc2_ in this._columns)
         {
            _loc3_ = new DataGridColumn();
            for(_loc4_ in _loc2_)
            {
               _loc3_[_loc4_] = _loc2_[_loc4_];
            }
            _loc1_.push(_loc3_);
         }
         columns = _loc1_;
      }
      
      public function set callStack(param1:CallStack) : void
      {
         this.dataProvider = param1.getCalls();
      }
      
      private function _sortNumber(param1:XML, param2:XML) : int
      {
         return int(param1.@num) - int(param2.@num);
      }
   }
}

