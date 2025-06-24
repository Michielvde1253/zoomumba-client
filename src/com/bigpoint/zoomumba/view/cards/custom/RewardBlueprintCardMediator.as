package com.bigpoint.zoomumba.view.cards.custom
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
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
   import custom.card.skin.ItemCardCraftingSkin;
   import org.puremvc.as3.interfaces.INotification;
   
   public class RewardBlueprintCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "RewardBlueprintCardMediator_";
      
      public var cardData:ShopItemData;
      
      private var _craftingProxy:CraftingProxy;
      
      public function RewardBlueprintCardMediator(param1:ShopItemData)
      {
         param1.bg = CARDS.CARD_BACKGROUND_STYLE_BLUEPRINT;
         this.cardData = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard(),ItemCardCraftingSkin);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.topGroup.currentState = "none";
         card.buyGroup.currentState = "none";
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED];
      }
      
      override protected function onPressActionButton(param1:ButtonAction) : void
      {
         sendNotification(GUINote.CRAFTING_CHOOSE_PRODUCE_ITEM,this.cardData);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
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
      
      override public function onRegister() : void
      {
         super.onRegister();
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
      
      override public function onRemove() : void
      {
         if(card.hasEventListener(CardToggleChangeEvent.CHANGED))
         {
            card.removeEventListener(CardToggleChangeEvent.CHANGED,this.changeAsset);
         }
         super.onRemove();
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy;
         }
         return this._craftingProxy;
      }
   }
}

