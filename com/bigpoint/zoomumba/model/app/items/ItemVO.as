package com.bigpoint.zoomumba.model.app.items
{
   public class ItemVO
   {
      public var category:int = -1;
      
      public var itemId:int = -1;
      
      public var uniqueId:int = -1;
      
      public function ItemVO(param1:int = -1, param2:int = -1, param3:int = -1)
      {
         super();
         this.category = param3;
         this.itemId = param1;
         this.uniqueId = param2;
      }
   }
}

