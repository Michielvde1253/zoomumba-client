package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class DecorData extends FieldItemData
   {
      public var sId:int = -1;
      
      public function DecorData()
      {
         super();
         this._category = Categories.DECOR;
      }
      
      override public function toString() : String
      {
         return "DecorData:{" + " category:" + _category + " uniqueId:" + uniqueId + " itemId:" + itemId + " active:" + active + " posX:" + posX + " posY:" + posY + " buildTimeStamp:" + buildTimeStamp + " | " + "}";
      }
      
      public function set dId(param1:int) : void
      {
         itemId = param1;
      }
      
      public function get storeId() : int
      {
         return this.sId;
      }
   }
}

