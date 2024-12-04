package com.bigpoint.zoomumba.model.windows.confirmation.extended
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class ExtendedBuyConfirmationWindowInitParams
   {
      public var title:String;
      
      public var text:String;
      
      public var item:ItemPackVO;
      
      public function ExtendedBuyConfirmationWindowInitParams(param1:String, param2:String, param3:ItemPackVO)
      {
         super();
         this.title = param1;
         this.text = param2;
         this.item = param3;
      }
   }
}

