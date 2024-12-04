package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RemoveItemFromShopCommand extends SimpleCommand
   {
      public function RemoveItemFromShopCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:AnimalSpeciesVO = null;
         var _loc6_:ShopItemData = null;
         var _loc2_:ItemPackVO = param1.getBody() as ItemPackVO;
         var _loc3_:ShopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         var _loc4_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         if(_loc2_.category == Categories.SPECIES)
         {
            _loc5_ = _loc4_.getShopAnimalSpecie(_loc2_.itemId);
            _loc5_.mbuyable = [0,0,0];
            _loc5_.buyable = 0;
         }
         else
         {
            _loc6_ = _loc4_.getItemById(_loc2_.itemId,_loc2_.category);
            _loc6_.buyable = 0;
         }
         _loc3_.reload = true;
      }
   }
}

