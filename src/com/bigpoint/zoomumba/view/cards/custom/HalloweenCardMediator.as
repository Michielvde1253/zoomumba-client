package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.events.babyEvent.BabyEventProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.HalloweenShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import custom.card.events.CardNumericStepperChangeEvent;
   
   public class HalloweenCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "HalloweenCardMediator_";
      
      public var cardData:HalloweenShopData;
      
      private var babyEventProxy:BabyEventProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var priceValue:int = -1;
      
      public function HalloweenCardMediator(param1:HalloweenShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.content.verticalCenter = -6;
         card.buyGroup.currentState = "button";
         card.bottomGroup.currentState = "amount";
      }
      
      override public function onRegister() : void
      {
         this.babyEventProxy = facade.retrieveProxy(BabyEventProxy.NAME) as BabyEventProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         super.onRegister();
         card.bottomGroup.amountStepper.minimum = 10;
         card.bottomGroup.amountStepper.maximum = 1000;
         card.bottomGroup.amountStepper.stepSize = 10;
         card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
      }
      
      override protected function setPrice() : void
      {
         var _loc1_:int = this.inventoryProxy.getAnimalCountById(this.babyEventProxy.config.eventBabyAnimalId);
         this.priceValue = this.priceValue == -1 ? int(this.cardData.currency["amount"]) : this.priceValue;
         this.cardData.buyCount = this.priceValue;
         showBuyButton(this.priceValue,"normal",_loc1_ >= this.priceValue,true,Categories.ANIMAL,this.babyEventProxy.config.eventBabyAnimalId);
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         sendNotification(NET.BUY_PREMIUM_WITH_COUT,[this.cardData.itemId,this.cardData.buyCount]);
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent) : void
      {
         this.priceValue = this.cardData.currency["amount"] * param1.value / 10;
         this.setPrice();
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.PREMIUM,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.PREMIUM,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRemove() : void
      {
         if(card.bottomGroup.hasEventListener(CardNumericStepperChangeEvent.CHANGED))
         {
            card.bottomGroup.removeEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
         }
         super.onRemove();
      }
   }
}

