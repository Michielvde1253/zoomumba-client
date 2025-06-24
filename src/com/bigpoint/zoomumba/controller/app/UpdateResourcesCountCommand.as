package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UpdateResourcesCountCommand extends SimpleCommand
   {
      public function UpdateResourcesCountCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ItemPackVO = param1.getBody() as ItemPackVO;
         switch(_loc2_.category)
         {
            case Categories.USER:
               this.updateUserResources(_loc2_);
               break;
            case Categories.RESOURCES:
               this.updateResources(_loc2_);
         }
      }
      
      private function updateUserResources(param1:ItemPackVO) : void
      {
         var _loc2_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         _loc2_.increaseCurrency(param1.itemId,param1.count);
      }
      
      private function updateResources(param1:ItemPackVO) : void
      {
         var _loc2_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         _loc2_.increaseResource(param1.itemId,param1.count);
      }
   }
}

