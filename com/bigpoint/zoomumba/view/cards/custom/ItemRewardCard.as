package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardToggleChangeEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class ItemRewardCard extends BaseCardMediator
   {
      public static const NAME:String = "ItemRewardCard_";
      
      public var cardData:ShopItemData;
      
      public var datas:Array;
      
      public function ItemRewardCard(param1:Array)
      {
         this.cardData = param1[0] as ShopItemData;
         this.datas = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1[0],new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         if(this.datas.length <= 0)
         {
            this.cardData.visible = false;
         }
         card.topGroup.currentState = "counter";
         card.bottomGroup.currentState = "none";
         this.refreshAmount();
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         var _loc1_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
      }
      
      private function changeAsset(param1:CardToggleChangeEvent) : void
      {
         if(param1.isOn)
         {
            card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_MC));
         }
         else
         {
            card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
         }
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.cardData.count;
         card.bottomGroup.button1.visible = false;
         if(this.cardData.sellable == 0)
         {
            card.bottomGroup.button2.visible = false;
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
      }
      
      private function refreshAmount() : void
      {
         card.topGroup.counter.value = this.cardData.count;
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(this.cardData.categoryId,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(this.cardData.categoryId,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRemove() : void
      {
         if(card.hasEventListener(CardToggleChangeEvent.CHANGED))
         {
            card.removeEventListener(CardToggleChangeEvent.CHANGED,this.changeAsset);
         }
         super.onRemove();
      }
   }
}

