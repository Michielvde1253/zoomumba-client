package com.bigpoint.zoomumba.model.windows.confirmation.extended
{
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   
   public class BuyOnceConfirmationInitParams
   {
      public var item:InheritedShopData;
      
      public function BuyOnceConfirmationInitParams(param1:InheritedShopData)
      {
         super();
         this.item = param1;
      }
   }
}

