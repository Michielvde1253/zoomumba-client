package com.bigpoint.zoomumba.model.windows.gameItem.sell
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class GameItemSellWindowInitParams
   {
      public var data:ItemPackVO;
      
      public var title:String;
      
      public var info:String;
      
      public var availableAmount:int;
      
      public var price:ItemPackVO;
      
      public var ids:Array;
      
      public function GameItemSellWindowInitParams(param1:String, param2:String, param3:int, param4:ItemPackVO, param5:ItemPackVO, param6:Array)
      {
         super();
         this.data = param5;
         this.title = param1;
         this.info = param2;
         this.availableAmount = param3;
         this.price = param4;
         this.ids = param6;
      }
   }
}

