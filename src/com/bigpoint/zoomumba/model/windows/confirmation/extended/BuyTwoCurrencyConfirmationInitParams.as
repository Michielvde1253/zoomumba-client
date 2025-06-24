package com.bigpoint.zoomumba.model.windows.confirmation.extended
{
   public class BuyTwoCurrencyConfirmationInitParams
   {
      public var price:int;
      
      public var type:int;
      
      public var collType:int;
      
      public var price2:int;
      
      public var type2:int;
      
      public var collType2:int;
      
      public var title:String;
      
      public var message:String;
      
      public function BuyTwoCurrencyConfirmationInitParams(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int = -1, param8:int = -1)
      {
         super();
         this.title = param1;
         this.message = param2;
         this.price = param3;
         this.type = param4;
         this.collType = param5;
         this.price2 = param6;
         this.type2 = param7;
         this.collType2 = param8;
      }
   }
}

