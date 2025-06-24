package com.bigpoint.zoomumba.model.windows.confirmation.extended
{
   public class BuyConfirmationInitParams
   {
      public var price:int;
      
      public var type:int;
      
      public var collType:int;
      
      public var title:String;
      
      public var message:String;
      
      public function BuyConfirmationInitParams(param1:String, param2:String, param3:int, param4:int = -1, param5:int = -1)
      {
         super();
         this.price = param3;
         this.title = param1;
         this.message = param2;
         this.type = param4;
         this.collType = param5;
      }
   }
}

