package com.bigpoint.zoomumba.model.windows.info
{
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   
   public class ItemBigInfoInitParams
   {
      public var item:ItemVO;
      
      public var setCategory:int = -1;
      
      public var setItemId:int = -1;
      
      public var pageId:int = -1;
      
      public function ItemBigInfoInitParams(param1:ItemVO, param2:int, param3:int, param4:int)
      {
         super();
         this.item = param1;
         this.pageId = param2;
         this.setItemId = param4;
         this.setCategory = param3;
      }
   }
}

