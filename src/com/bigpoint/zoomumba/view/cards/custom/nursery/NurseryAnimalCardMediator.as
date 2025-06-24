package com.bigpoint.zoomumba.view.cards.custom.nursery
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
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
   
   public class NurseryAnimalCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "NurseryAnimalCardMediator_";
      
      public var cardData:AnimalShopData;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var amountInInventory:int = 0;
      
      private var enabled:Boolean = true;
      
      public function NurseryAnimalCardMediator(param1:AnimalShopData)
      {
         this.cardData = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,Categories.ANIMAL,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function handleUseItem(param1:MouseEvent) : void
      {
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.topGroup.currentState = "counter";
         card.buyGroup.currentState = "buttonLabel";
         card.rightGroup.currentState = this.getSex();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.amountInInventory;
         if(this.amountInInventory > 0)
         {
            card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         }
         else
         {
            card.buyGroup.button.enabled = false;
         }
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         sendNotification(Note.NURSERY_USE_THIS_BABY,this.cardData.animalId);
         sendNotification(SHOP.DISABLE_ALL_SHOPCARDS);
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
      
      override public function listNotificationInterests() : Array
      {
         return [SHOP.DISABLE_ALL_SHOPCARDS,SHOP.ENABLE_ALL_SHOPCARDS,Note.NURSERY_USE_THIS_BABY,Note.NURSERY_REMOVE_THIS_BABY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case SHOP.DISABLE_ALL_SHOPCARDS:
               card.buyGroup.buttonLabel.enabled = false;
               break;
            case SHOP.ENABLE_ALL_SHOPCARDS:
               card.buyGroup.buttonLabel.enabled = true;
               break;
            case Note.NURSERY_USE_THIS_BABY:
               if(Boolean(param1.getBody()) && param1.getBody() as int == this.cardData.itemId)
               {
                  --card.topGroup.counter.value;
               }
               break;
            case Note.NURSERY_REMOVE_THIS_BABY:
               if(Boolean(param1.getBody()) && param1.getBody() as int == this.cardData.itemId)
               {
                  card.topGroup.counter.value += 1;
               }
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
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId);
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

