package com.bigpoint.zoomumba.controller.gameItem.buy
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.RecyclingConst;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.data.settings.HalloweenShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.PowerupShopData;
   import com.bigpoint.zoorama.data.settings.PremiumPackShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.SurpriseBoxShopData;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GameItemBuyCommand extends SimpleCommand
   {
      public function GameItemBuyCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:InheritedShopData = param1.getBody() as InheritedShopData;
         var _loc3_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc4_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc5_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         if(!_loc2_.price.userCanBuy)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            return;
         }
         switch(_loc2_.internalType)
         {
            case ItemInternalTypes.SPECIE:
               _loc3_.startDragShopAnimalItem(AnimalSpeciesVO(_loc2_),AnimalSpeciesVO(_loc2_).price.userResource == UserResources.REAL_MONEY);
               WindowManagerNew.closeAllWindows();
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NEWS_WINDOW));
               break;
            case ItemInternalTypes.ASSISTANT:
               sendNotification(NET.BUY_ASSISTANT,[AssistanceShopData(_loc2_).assistId,1,AssistanceShopData(_loc2_).selectedType]);
               break;
            case ItemInternalTypes.RESOURCE:
               sendNotification(NET.BUY_RESOURCE,[ResourceShopData(_loc2_).itemId,ResourceShopData(_loc2_).itemsSelectedForBuy,ResourceShopData(_loc2_).getBuyReal() > 0]);
               break;
            case ItemInternalTypes.POWERUP:
               sendNotification(NET.BUY_POWERUP_SHOP,[PowerupShopData(_loc2_).itemId,1]);
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
               WindowManagerNew.closeAllWindows();
               break;
            case ItemInternalTypes.EXPANSION:
               sendNotification(NET.BUY_PREMIUM,[ExpansionShopData(_loc2_).itemId]);
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
               WindowManagerNew.closeAllWindows();
               if(_loc2_.price.collectable != -1)
               {
                  _loc5_.decreaseCollectableAmount(_loc2_.price.collectable,_loc2_.price.amount);
               }
               break;
            case ItemInternalTypes.ROAD:
            case ItemInternalTypes.TRASHBIN:
            case ItemInternalTypes.DECORATION:
            case ItemInternalTypes.CAGE:
            case ItemInternalTypes.STORE:
            case ItemInternalTypes.STORAGE:
            case ItemInternalTypes.BREEDING_LAB:
            case ItemInternalTypes.NURSERY:
            case ItemInternalTypes.SPECIAL:
               if(_loc2_ is PremiumShopData && MainConstants.PREMIUM_ID_CAKE2014 == PremiumShopData(_loc2_).premiumId)
               {
                  sendNotification(NET.BUY_PREMIUM_WITH_COUT,[PremiumShopData(_loc2_).itemId,1]);
               }
               else
               {
                  _loc3_.startDragShopItem(ShopItemData(_loc2_),_loc2_.price.userResource == UserResources.REAL_MONEY);
                  sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NEWS_WINDOW));
                  sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
                  WindowManagerNew.closeAllWindows();
               }
               break;
            case ItemInternalTypes.SAFARI_JOKER:
               if(!SafariShopData(_loc2_).useMode)
               {
                  sendNotification(NET.SAFARI_BUY_JOKER,[SafariShopData(_loc2_).itemId]);
               }
               else
               {
                  sendNotification(Note.USE_SAFARI_JOKER,SafariShopData(_loc2_));
               }
               break;
            case ItemInternalTypes.HALLOWEEN:
               sendNotification(NET.BUY_PREMIUM_WITH_COUT,[HalloweenShopData(_loc2_).itemId,HalloweenShopData(_loc2_).buyCount / 10]);
               break;
            case ItemInternalTypes.PACK:
               sendNotification(NET.BUY_PREMIUM_WITH_COUT,[PremiumPackShopData(_loc2_).itemId,PremiumPackShopData(_loc2_).selectedType]);
               break;
            case ItemInternalTypes.SUPRISE_BOX:
               (facade.retrieveProxy(RecyclingProxy.NAME) as RecyclingProxy).buySurpriseBox((_loc2_ as SurpriseBoxShopData).boxId);
               break;
            case ItemInternalTypes.RECYCLING_CARD:
               switch((_loc2_ as RecyclingCardInfoVo).state)
               {
                  case RecyclingConst.SLOT_TYPE_BUY:
                     sendNotification(GUINote.RECYCLING_SLOT_ITEM_CHOOSE,_loc2_ as RecyclingCardInfoVo);
                     break;
                  case RecyclingConst.SLOT_TYPE_PRODUCE:
                     sendNotification(GUINote.RECYCLING_SLOT_ITEM_INSTANT_BUY,_loc2_ as RecyclingCardInfoVo);
               }
         }
      }
   }
}

