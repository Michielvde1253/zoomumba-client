package com.bigpoint.zoomumba.controller.shop
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BuyRealCurrencyResourcesCommand extends SimpleCommand
   {
      public function BuyRealCurrencyResourcesCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ItemPackVO = param1.getBody() as ItemPackVO;
         var _loc3_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc4_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         sendNotification(NET.BUY_RESOURCE,[_loc2_.itemId,_loc2_.count,_loc2_.packId]);
         _loc3_.reduceCurrency(UserResources.REAL_MONEY,_loc2_.count * 2);
         _loc4_.increaseResource(_loc2_.itemId,_loc2_.count);
      }
   }
}

