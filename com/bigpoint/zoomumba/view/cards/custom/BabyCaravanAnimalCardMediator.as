package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventRewardVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class BabyCaravanAnimalCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "BabyCaravanAnimalCardMediator_";
      
      public var cardData:AnimalShopData;
      
      private var inventoryProxy:InventoryProxy;
      
      private var caravanProxy:BabyCaravanProxy;
      
      public function BabyCaravanAnimalCardMediator(param1:AnimalShopData)
      {
         this.cardData = param1;
         _inventoryMode = false;
         super(getNameFromPrefix(NAME,Categories.ANIMAL,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function handleUseItem(param1:MouseEvent) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.INVENTORY));
         sendNotification(Note.INVENTORY_USE_ITEM,this.cardData);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED:
               this.setPrice();
               setCanBuyState();
         }
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.topGroup.currentState = "counter";
         card.rightGroup.currentState = this.getSex();
      }
      
      private function getSex() : String
      {
         if(this.cardData.male == 1)
         {
            return "inventoryMale";
         }
         if(this.cardData.child == 1)
         {
            return "inventoryBaby";
         }
         return "inventoryFemale";
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc2_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc4_:int = _loc2_.getRewardId(this.cardData.animalId);
         _loc3_.callServer(NET.BABY_EVENT_REDEEM,[EventTypes.BABY_CARAVAN_EVENT,_loc4_]).addCallbackIfTrue(Note.BABY_CARAVAN_REDEEM_SUCCESS).sendNow();
      }
      
      override protected function setPrice() : void
      {
         var _loc1_:CounterValuesProxy = facade.retrieveProxy(CounterValuesProxy.NAME) as CounterValuesProxy;
         var _loc2_:EventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         var _loc3_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         var _loc4_:int = this.inventoryProxy.getAnimalCountById(_loc3_.childId);
         showBuyButton(this.cardData.price.amount,"normal",_loc4_ >= this.cardData.price.amount,true,Categories.ANIMAL,_loc3_.childId);
         var _loc5_:EventRewardVO = _loc2_.getRewardByIdForEvent(_loc3_.getRewardId(this.cardData.animalId),EventTypes.BABY_CARAVAN_EVENT);
         card.topGroup.counter.value = _loc5_.limit - _loc1_.getCounterById(_loc5_.counterId).count;
         if(_loc1_.getCounterById(_loc5_.counterId).count >= _loc5_.limit)
         {
            showBuyButton(this.cardData.price.amount,"normal",false,true,Categories.ANIMAL,_loc3_.childId);
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.SPECIES,this.cardData.speciesId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.SPECIES,this.cardData.speciesId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.caravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

