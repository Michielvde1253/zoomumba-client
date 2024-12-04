package com.bigpoint.zoorama.data.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   
   public class TrashRoadData extends FieldItemData
   {
      public var trashAmount:int = -1;
      
      public function TrashRoadData()
      {
         super();
         _category = Categories.TRASHROAD;
      }
      
      override public function toString() : String
      {
         return "TrashRoadData:{" + " category:" + _category + " uniqueId:" + uniqueId + " itemId:" + itemId + " active:" + active + " posX:" + posX + " posY:" + posY + " buildTimeStamp:" + buildTimeStamp + " rotatePos:" + rotatePos + " del:" + del + " | " + " trashAmount:" + this.trashAmount + "}";
      }
   }
}

