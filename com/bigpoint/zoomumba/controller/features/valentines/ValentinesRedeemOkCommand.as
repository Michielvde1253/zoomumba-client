package com.bigpoint.zoomumba.controller.features.valentines
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.events.valentines.ValentinesWindowInitParams;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ValentinesRedeemOkCommand extends SimpleCommand
   {
      public function ValentinesRedeemOkCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:int = 0;
         var _loc4_:ValentinesProxy = facade.getProxy(ValentinesProxy) as ValentinesProxy;
         var _loc5_:ValentinesProxy = facade.retrieveProxy(ValentinesProxy.NAME) as ValentinesProxy;
         var _loc6_:ItemConfigProxy = facade.getProxy(ItemConfigProxy);
         var _loc7_:* = !_loc5_.showRefresh;
         _loc7_ = (_loc7_) && (_loc5_.config[_loc2_].rewardId == 0 || _loc5_.rewards[0] == 1);
         _loc7_ = (_loc7_) && (_loc5_.config[_loc2_].rewardId == 4 || _loc5_.rewards[4] == 1);
         _loc5_.rewards[_loc5_.config[_loc2_].rewardId] = 1;
         sendNotification(Note.VALENTINE_REFRESH_BOARD);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.VALENTINES_REWARD_WINDOW,"",new ValentinesWindowInitParams(ItemTypeHelper.typeToCategory(_loc5_.config[_loc2_].category[_loc4_.loop]),_loc5_.config[_loc2_].itemId[_loc4_.loop]),new WindowParams("",null,Note.VALENTINE_ADVICE_REQUEST,_loc7_,Note.VALENTINE_ADVICE_REQUEST,_loc7_)));
         if(ItemTypeHelper.typeToCategory(_loc5_.config[_loc2_].category[_loc4_.loop]) == Categories.CAGE)
         {
            sendNotification(SHOP.ADD_ITEM_FROM_SHOP,new ItemPackVO(_loc5_.config[_loc2_].itemId[_loc4_.loop],Categories.CAGE));
         }
      }
   }
}

