package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class RoadData extends FieldItemData
   {
      public function RoadData()
      {
         super();
         this._category = Categories.ROAD;
      }
      
      public function set rId(param1:int) : void
      {
         itemId = param1;
      }
      
      public function set trashbin(param1:int) : void
      {
      }
      
      public function set deco(param1:int) : void
      {
      }
   }
}

