package fr.kapit.components
{
   import fr.kapit.controls.kDataGrid;
   import mx.binding.BindingManager;
   import mx.controls.dataGridClasses.DataGridColumn;
   import mx.core.IFlexModuleFactory;
   
   public class StatisticsDataGrid extends kDataGrid
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function StatisticsDataGrid()
      {
         super();
         this.columns = [this._StatisticsDataGrid_DataGridColumn1_c(),this._StatisticsDataGrid_DataGridColumn2_c(),this._StatisticsDataGrid_DataGridColumn3_c()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _StatisticsDataGrid_DataGridColumn1_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.dataField = "type";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _StatisticsDataGrid_DataGridColumn2_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.dataField = "count";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _StatisticsDataGrid_DataGridColumn3_c() : DataGridColumn
      {
         var _loc1_:DataGridColumn = new DataGridColumn();
         _loc1_.dataField = "size";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
   }
}

