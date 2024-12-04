package com.bigpoint.zoomumba.model.payment
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.payment.vo.PaymentUrlVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PaymentUrlProxy extends Proxy
   {
      public static var NAME:String = "PaymentUrlProxy";
      
      public var paymentUrlVO:PaymentUrlVO = new PaymentUrlVO();
      
      public function PaymentUrlProxy()
      {
         super(NAME);
      }
      
      public function parseData(param1:Object) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(Boolean(_loc2_) && _loc2_.open_social)
         {
            if(Boolean(param1.ajaxPay) && param1.ajaxPay.length > 2)
            {
               param1.ajaxPay += "&slim=1";
            }
         }
         ObjectHelper.copyData(this.paymentUrlVO,param1);
      }
   }
}

