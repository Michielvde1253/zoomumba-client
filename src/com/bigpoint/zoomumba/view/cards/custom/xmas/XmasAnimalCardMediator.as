package com.bigpoint.zoomumba.view.cards.custom.xmas
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
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
   
   public class XmasAnimalCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "XmasAnimalCardMediator_";
      
      public var cardData:AnimalShopData;
      
      private var inventoryProxy:InventoryProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var amountInInventory:int = 0;
      
      public function XmasAnimalCardMediator(param1:AnimalShopData)
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
         card.buyGroup.currentState = "buttonLabel";
         card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
      }
      
      override public function onRegister() : void
      {
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId);
         super.onRegister();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.amountInInventory;
         card.buyGroup.button.enabled = true;
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         this.cardData.uniqueId = this.inventoryProxy.getAnimalUid(this.cardData.animalId);
         sendNotification(Note.INVENTORY_USE_ITEM,this.cardData);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_WINDOW));
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

