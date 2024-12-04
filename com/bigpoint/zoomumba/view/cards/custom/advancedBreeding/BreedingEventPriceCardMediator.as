package com.bigpoint.zoomumba.view.cards.custom.advancedBreeding
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.advBreeding.AdvBreedingEventProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
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
   
   public class BreedingEventPriceCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "BreedingAnimalCardMediator_";
      
      public var cardData:AnimalShopData;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var advBreedingEventProxy:AdvBreedingEventProxy;
      
      private var amountInInventory:int = 0;
      
      public function BreedingEventPriceCardMediator(param1:AnimalShopData)
      {
         this.cardData = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,Categories.ANIMAL,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.topGroup.currentState = "counter";
         card.rightGroup.currentState = this.getSex();
         card.buyGroup.visible = false;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ADVANCED_BREEDING_EVENT_ADD_ANIMAL,Note.ADVANCED_BREEDING_EVENT_REMOVE_ANIMAL,Note.ADVANCED_BREEDING_EVENT_USED_ANIMALS,Note.ADVANCED_BREEDING_EVENT_UPDATE_BUTTON_STATE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:AnimalShopData = param1.getBody().data as AnimalShopData;
         switch(param1.getName())
         {
            case Note.ADVANCED_BREEDING_EVENT_ADD_ANIMAL:
            case Note.ADVANCED_BREEDING_EVENT_USED_ANIMALS:
               if(_loc2_.animalId == this.cardData.animalId)
               {
                  --this.amountInInventory;
                  this.setTopCounter();
               }
               break;
            case Note.ADVANCED_BREEDING_EVENT_REMOVE_ANIMAL:
               if(_loc2_.animalId == this.cardData.animalId)
               {
                  ++this.amountInInventory;
                  this.setTopCounter();
               }
               break;
            case Note.ADVANCED_BREEDING_EVENT_UPDATE_BUTTON_STATE:
               if(_loc2_.speciesId == this.cardData.speciesId)
               {
                  card.buyGroup.button.enabled = card.buyGroup.buttonLabel.enabled = Boolean(param1.getBody().enabled) && this.amountInInventory > 0;
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId);
         this.advBreedingEventProxy = facade.getProxy(AdvBreedingEventProxy);
         super.onRegister();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.amountInInventory;
         card.buyGroup.currentState = "buttonLabel";
         card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         card.buyGroup.button.enabled = card.buyGroup.buttonLabel.enabled = Boolean(card.buyGroup.buttonLabel.enabled) && this.amountInInventory > 0;
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(this.amountInInventory > 0)
         {
            sendNotification(Note.ADVANCED_BREEDING_EVENT_ADD_ANIMAL,{"data":this.cardData});
         }
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
      
      override protected function postRegisterConfig() : void
      {
         if(!this.advBreedingEventProxy.isPrice(this.cardData))
         {
            card.topGroup.currentState = "none";
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
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.SPECIES,this.cardData.speciesId,this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.cardData.itemId).genusId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override protected function handleSellItem(param1:MouseEvent) : void
      {
      }
      
      override protected function handleUseItem(param1:MouseEvent) : void
      {
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

