package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class StoreData extends FieldItemData
   {
      public var collectTimeStamp:int = -1;
      
      public var sId:int = -1;
      
      public var prod:int = -1;
      
      public function StoreData()
      {
         super();
         this._category = Categories.STORE;
      }
      
      override public function toString() : String
      {
         return "StoreData:{" + " category:" + _category + " uniqueId:" + uniqueId + " itemId:" + itemId + " active:" + active + " posX:" + posX + " posY:" + posY + " buildTimeStamp:" + buildTimeStamp + " rotatePos:" + rotatePos + " | " + " collectTimeStamp:" + this.collectTimeStamp + "}";
      }
      
      public function set collect(param1:int) : void
      {
         this.collectTimeStamp = param1;
      }
      
      public function set stId(param1:int) : void
      {
         this.itemId = param1;
      }
      
      public function get productionTimeStamp() : int
      {
         return this.prod;
      }
   }
}

