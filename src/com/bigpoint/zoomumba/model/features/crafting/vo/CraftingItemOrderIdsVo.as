package com.bigpoint.zoomumba.model.features.crafting.vo
{
   public class CraftingItemOrderIdsVo
   {
      public var itemId:int;
      
      public var categorieId:int;
      
      public var blueprintId:int;
      
      public var shopOrder:int;
      
      public function CraftingItemOrderIdsVo(param1:int = -1, param2:int = -1, param3:int = -1, param4:int = -1)
      {
         super();
         this.itemId = param1;
         this.categorieId = param2;
         this.blueprintId = param3;
         this.shopOrder = param4;
      }
   }
}

