package com.flexspy.imp
{
   import flash.events.FocusEvent;
   import mx.controls.DataGrid;
   import mx.core.EventPriority;
   import mx.events.DataGridEvent;
   import mx.events.DataGridEventReason;
   
   public class EditableDataGrid extends DataGrid
   {
      public function EditableDataGrid()
      {
         super();
         editable = true;
         addEventListener(DataGridEvent.ITEM_EDIT_BEGINNING,disableEditing);
         addEventListener(DataGridEvent.ITEM_EDIT_END,onItemEditEnd,false,EventPriority.DEFAULT);
      }
      
      private function disableEditing(param1:DataGridEvent) : void
      {
         param1.preventDefault();
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         editable = false;
         super.focusInHandler(param1);
         editable = true;
      }
      
      private function onItemEditEnd(param1:DataGridEvent) : void
      {
         if(param1.reason == DataGridEventReason.NEW_ROW)
         {
            param1.reason = DataGridEventReason.OTHER;
         }
      }
   }
}

