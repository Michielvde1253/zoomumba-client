package com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step2
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
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
   
   public class BreedingAnimalCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "BreedingAnimalCardMediator_";
      
      public var cardData:AnimalShopData;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var netProxy:NetProxy;
      
      private var amountInInventory:int = 0;
      
      public function BreedingAnimalCardMediator(param1:AnimalShopData)
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
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ADVANCED_BREEDING_ADD_ANIMAL,Note.ADVANCED_BREEDING_REMOVE_ANIMAL,Note.ADVANCED_BREEDING_USED_ANIMALS,Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE,Note.ADVANCED_BREEDING_BUY_ANIMAL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:AnimalShopData = null;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case Note.ADVANCED_BREEDING_ADD_ANIMAL:
            case Note.ADVANCED_BREEDING_USED_ANIMALS:
               if(param1.getBody() as int == this.cardData.animalId)
               {
                  this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId) - 1;
                  this.setTopCounter();
               }
               break;
            case Note.ADVANCED_BREEDING_REMOVE_ANIMAL:
               if(param1.getBody() as int == this.cardData.animalId)
               {
                  this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId);
                  this.setTopCounter();
               }
               break;
            case Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE:
               _loc2_ = param1.getBody() as Array;
               if(this.cardData.male == _loc2_[0])
               {
                  card.buyGroup.button.enabled = card.buyGroup.buttonLabel.enabled = _loc2_[1];
               }
               break;
            case Note.ADVANCED_BREEDING_BUY_ANIMAL:
               _loc3_ = param1.getBody() as AnimalShopData;
               if(_loc3_.animalId == this.cardData.animalId)
               {
                  this.netProxy.callServer(NET.BUY_ANIMAL_TO_INVENTORY,[_loc3_.animalId,this.cardData.useRealCurrency]).addCallbackIfTrue(Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE,[_loc3_.male,false]).addCallbackIfFalse(Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE,[_loc3_.male,true]).addCallbackIfTrue(Note.ADVANCED_BREEDING_ADD_ANIMAL,_loc3_.animalId).sendNow();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.amountInInventory = this.inventoryProxy.getAnimalCountById(this.cardData.animalId);
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         super.onRegister();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.amountInInventory;
         if(this.amountInInventory > 0)
         {
            card.buyGroup.currentState = "buttonLabel";
            card.lock.currentState = "none";
            card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         }
         else
         {
            _inventoryMode = false;
            super.setPrice();
            _inventoryMode = true;
         }
         card.buyGroup.button.enabled = card.buyGroup.buttonLabel.enabled;
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(this.amountInInventory <= 0)
         {
            if(!this.cardData.price.userCanBuy)
            {
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
               sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            }
            else if(this.cardData.price.userCanBuy && this.cardData.price.userResource == UserResources.REAL_MONEY)
            {
               this.cardData.useRealCurrency = 1;
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.cardData.getBuyReal() * this.cardData.itemsSelectedForBuy),new WindowParams("",null,"",null,Note.ADVANCED_BREEDING_BUY_ANIMAL,this.cardData)));
            }
            else
            {
               sendNotification(Note.ADVANCED_BREEDING_BUY_ANIMAL,this.cardData);
            }
         }
         else
         {
            sendNotification(Note.ADVANCED_BREEDING_ADD_ANIMAL,this.cardData.animalId);
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

