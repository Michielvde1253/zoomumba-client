package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenExternalPaymentCommand extends SimpleCommand
   {
      public function OpenExternalPaymentCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PaymentUrlProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         var _loc3_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(_loc2_.paymentUrlVO.ajaxPay.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + _loc2_.paymentUrlVO.ajaxPay + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(_loc2_.paymentUrlVO.urlPay),"_blank");
         }
      }
   }
}

