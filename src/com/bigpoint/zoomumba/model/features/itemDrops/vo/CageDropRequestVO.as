package com.bigpoint.zoomumba.model.features.itemDrops.vo
{
   public class CageDropRequestVO
   {
      public var cageId:int;
      
      public var cageActionType:int;
      
      public function CageDropRequestVO(param1:int, param2:int)
      {
         super();
         this.cageId = param1;
         this.cageActionType = param2;
      }
   }
}

