package com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step3
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.CollectableShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class BreedingCollectableCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "BreedingCollectableCardMediator_";
      
      public var cardData:CollectableShopData;
      
      private var resourcesProxy:ResourcesProxy;
      
      private var collectablesAmount:int = 0;
      
      private var substractAmount:int = 0;
      
      public function BreedingCollectableCardMediator(param1:CollectableShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.topGroup.currentState = "counter";
         card.bottomGroup.currentState = "chance";
         card.bottomGroup.chances.currentState = "chance" + this.cardData.breedChance;
         param1.content.verticalCenter = -3;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [SHOP.DISABLE_ALL_SHOPCARDS,SHOP.ENABLE_ALL_SHOPCARDS,Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM,Note.ADVANCED_BREEDING_USED_CHANCE_ITEM];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case SHOP.DISABLE_ALL_SHOPCARDS:
               card.buyGroup.button.enabled = false;
               break;
            case SHOP.ENABLE_ALL_SHOPCARDS:
               card.buyGroup.button.enabled = true;
               break;
            case Note.ADVANCED_BREEDING_USED_CHANCE_ITEM:
               _loc2_ = param1.getBody() as Object;
               if(_loc2_["category"] == Categories.COLLECTIBLE && _loc2_["itemId"] == this.cardData.itemId)
               {
                  ++this.substractAmount;
               }
               this.setResourceAmount();
               break;
            case Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM:
               _loc3_ = param1.getBody() as Object;
               if(_loc3_["category"] == Categories.COLLECTIBLE && _loc3_["itemId"] == this.cardData.itemId)
               {
                  --this.substractAmount;
               }
               this.setResourceAmount();
         }
      }
      
      override protected function setPrice() : void
      {
         card.buyGroup.button.label.text = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         this.setResourceAmount();
         if(this.collectablesAmount > 0)
         {
            ++this.substractAmount;
            this.setResourceAmount();
            sendNotification(Note.ADVANCED_BREEDING_ADD_CHANCE_ITEM,{
               "category":Categories.COLLECTIBLE,
               "itemId":this.cardData.itemId
            });
         }
      }
      
      override protected function setResourceAmount() : void
      {
         var _loc1_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.collectablesAmount = _loc1_.getCollectableAmmount(this.cardData.itemId) - this.substractAmount;
         card.topGroup.counter.value = this.collectablesAmount;
         card.buyGroup.button.enabled = this.collectablesAmount > 0;
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.COLLECTIBLE,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.COLLECTIBLE,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

