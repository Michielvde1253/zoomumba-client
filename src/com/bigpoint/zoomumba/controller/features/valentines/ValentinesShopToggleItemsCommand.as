package com.bigpoint.zoomumba.controller.features.valentines
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ValentinesShopToggleItemsCommand extends SimpleCommand
   {
      public function ValentinesShopToggleItemsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ValentinesProxy = facade.getProxy(ValentinesProxy);
         var _loc3_:ItemConfigProxy = facade.getProxy(ItemConfigProxy);
         var _loc4_:Array = _loc2_.rewards;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_.length)
         {
            if(ItemTypeHelper.typeToCategory(_loc2_.getRewardById(_loc9_).category[_loc2_.loop]) == Categories.CAGE)
            {
               if(_loc4_[_loc9_] == 1)
               {
                  _loc5_ = true;
               }
               _loc7_ = int(_loc2_.getRewardById(_loc9_).itemId[_loc2_.loop]);
            }
            _loc9_++;
         }
         if(!_loc5_)
         {
            sendNotification(SHOP.REMOVE_ITEM_FROM_SHOP,new ItemPackVO(_loc7_,Categories.CAGE));
         }
      }
   }
}

