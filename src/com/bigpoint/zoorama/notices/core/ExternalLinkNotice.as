package com.bigpoint.zoorama.notices.core
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class ExternalLinkNotice extends Notice
   {
      public static const OPEN_EXTERNAL_PAYMENT:String = "openExternalPayment";
      
      public static const OPEN_EXTERNAL_PAYMENT_PREMIUM:String = "openExternalPremium";
      
      public static const OPEN_EXTERNAL_PAYMENT_STARTER_PACK:String = "openExternalStarterpack";
      
      public static const OPEN_EXTERNAL_PAYMENT_PAW_PRINT:String = "openExternalPawPrint";
      
      public static const OPEN_EXTERNAL_BUY_TOOLBAR:String = "openExternalBuyToolbar";
      
      public static const OPEN_EXTERNAL_CASH_OFFERS:String = "openExternalCashOffers";
      
      public function ExternalLinkNotice(param1:String)
      {
         super(param1);
      }
   }
}

