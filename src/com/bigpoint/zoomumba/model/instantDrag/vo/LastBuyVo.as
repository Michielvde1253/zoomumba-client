package com.bigpoint.zoomumba.model.instantDrag.vo
{
   public class LastBuyVo
   {
      public var categorieId:int;
      
      public var itemId:int;
      
      public var buyMode:Boolean;
      
      public var price:Number;
      
      public var uniqueId:int;
      
      public function LastBuyVo(param1:int, param2:int, param3:Boolean, param4:Number = 0, param5:Number = -1)
      {
         super();
         this.categorieId = param1;
         this.itemId = param2;
         this.buyMode = param3;
         this.price = param4;
         this.uniqueId = param5;
      }
   }
}

