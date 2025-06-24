package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class TrashBinData extends FieldItemData
   {
      public var cleantTimeStamp:int = -1;
      
      public function TrashBinData()
      {
         super();
         this._category = Categories.TRASHBIN;
      }
      
      public function set tbId(param1:int) : void
      {
         itemId = param1;
      }
      
      public function set clean(param1:int) : void
      {
         this.cleantTimeStamp = param1;
      }
      
      override public function toString() : String
      {
         return "TrashBinData:{" + " category:" + _category + " uniqueId:" + uniqueId + " itemId:" + itemId + " active:" + active + " posX:" + posX + " posY:" + posY + " buildTimeStamp:" + buildTimeStamp + " rotatePos:" + rotatePos + " del:" + del + " | " + " cleantTimeStamp:" + this.cleantTimeStamp + "}";
      }
   }
}

