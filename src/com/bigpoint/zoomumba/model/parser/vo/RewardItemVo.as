package com.bigpoint.zoomumba.model.parser.vo
{
   public class RewardItemVo
   {
      public var categoryId:int = -1;
      
      public var amount:int = 0;
      
      public var id:int = -1;
      
      public function RewardItemVo(param1:int = -1, param2:int = -1, param3:int = -1)
      {
         super();
         this.id = param1;
         this.amount = param2;
         this.categoryId = param3;
      }
   }
}

