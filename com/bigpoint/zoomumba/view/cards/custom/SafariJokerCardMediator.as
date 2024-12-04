package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.tick.OkTick;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class SafariJokerCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "SafariJokerCardMediator_";
      
      public var cardData:SafariShopData;
      
      public function SafariJokerCardMediator(param1:SafariShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
         usePremiumMultiplier = false;
      }
      
      override protected function setPrice() : void
      {
         if(this.cardData.useMode)
         {
            card.buyGroup.button.label.visible = false;
            card.buyGroup.button.gradientText.text = TextResourceModule.getText("zoo.safari.button.use");
         }
         else
         {
            super.setPrice();
         }
      }
      
      override protected function setSafariState() : void
      {
         if(this.cardData.active && !this.cardData.useMode)
         {
            _card.content.addElement(new OkTick());
         }
         if(!this.cardData.canActivate && !this.cardData.useMode)
         {
            _card.buyGroup.button.enabled = false;
         }
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.SAFARI_UPDATE_JOKERS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case Note.SAFARI_UPDATE_JOKERS:
         }
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(this.cardData.useMode)
         {
            sendNotification(Note.USE_SAFARI_JOKER,this.cardData);
         }
         else
         {
            super.handleBuyClicked(param1);
         }
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.SAFARI_JOKER,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.SAFARI_JOKER,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
   }
}

