package com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step3
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class BreedingResourceCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "BreedingResourceCardMediator_";
      
      public var cardData:ResourceShopData;
      
      private var resourcesProxy:ResourcesProxy;
      
      private var netProxy:NetProxy;
      
      private var resourceAmount:int = 0;
      
      private var substractAmount:int = 0;
      
      public function BreedingResourceCardMediator(param1:ResourceShopData)
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
         return [SHOP.DISABLE_ALL_SHOPCARDS,SHOP.ENABLE_ALL_SHOPCARDS,Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM,Note.ADVANCED_BREEDING_USED_CHANCE_ITEM,Note.ADVANCED_BREEDING_BUY_RESOURCE];
      }
      
      override protected function setPrice() : void
      {
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:ResourceShopData = null;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case SHOP.DISABLE_ALL_SHOPCARDS:
               card.buyGroup.buttonLabel.enabled = card.buyGroup.button.enabled = false;
               break;
            case SHOP.ENABLE_ALL_SHOPCARDS:
               card.buyGroup.buttonLabel.enabled = card.buyGroup.button.enabled = true;
               break;
            case Note.ADVANCED_BREEDING_USED_CHANCE_ITEM:
               _loc2_ = param1.getBody() as Object;
               if(_loc2_["category"] == Categories.RESOURCES && _loc2_["itemId"] == this.cardData.itemId)
               {
                  ++this.substractAmount;
               }
               this.setResourceAmount();
               break;
            case Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM:
               _loc3_ = param1.getBody() as Object;
               if(_loc3_["category"] == Categories.RESOURCES && _loc3_["itemId"] == this.cardData.itemId)
               {
                  --this.substractAmount;
               }
               this.setResourceAmount();
               break;
            case Note.ADVANCED_BREEDING_BUY_RESOURCE:
               _loc4_ = param1.getBody() as ResourceShopData;
               if(_loc4_.itemId == this.cardData.itemId)
               {
                  sendNotification(SHOP.DISABLE_ALL_SHOPCARDS);
                  this.netProxy.callServer(NET.BUY_RESOURCE,[_loc4_.itemId,1,_loc4_.getBuyReal() > 0]).addCallbackIfTrue(SHOP.ENABLE_ALL_SHOPCARDS,_loc4_.itemId).addCallbackIfTrue(Note.ADVANCED_BREEDING_ADD_CHANCE_ITEM,{
                     "category":_loc4_.categoryId,
                     "itemId":_loc4_.itemId
                  }).addCallbackIfTrue(Note.ADVANCED_BREEDING_USED_CHANCE_ITEM,{
                     "category":_loc4_.categoryId,
                     "itemId":_loc4_.itemId
                  }).addCallbackIfFalse(SHOP.ENABLE_ALL_SHOPCARDS).sendNow();
               }
         }
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         this.setResourceAmount();
         if(this.resourceAmount > 0)
         {
            sendNotification(Note.ADVANCED_BREEDING_ADD_CHANCE_ITEM,{
               "category":Categories.RESOURCES,
               "itemId":this.cardData.itemId
            });
            ++this.substractAmount;
            this.setResourceAmount();
         }
         else if(!this.cardData.price.userCanBuy)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else if(this.cardData.price.userCanBuy && this.cardData.price.userResource == UserResources.REAL_MONEY)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.cardData.getBuyReal() * this.cardData.itemsSelectedForBuy),new WindowParams("",null,"",null,Note.ADVANCED_BREEDING_BUY_RESOURCE,this.cardData)));
         }
         else
         {
            sendNotification(Note.ADVANCED_BREEDING_BUY_RESOURCE,this.cardData);
         }
      }
      
      override protected function setResourceAmount() : void
      {
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.resourceAmount = this.resourcesProxy.getResourseAmmount(this.cardData.itemId) - this.substractAmount;
         card.topGroup.counter.value = this.resourceAmount;
         if(this.resourceAmount > 0)
         {
            card.buyGroup.currentState = "buttonLabel";
            card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         }
         else
         {
            super.setPrice();
         }
         card.buyGroup.button.enabled = card.buyGroup.buttonLabel.enabled;
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.RESOURCES,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.RESOURCES,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

