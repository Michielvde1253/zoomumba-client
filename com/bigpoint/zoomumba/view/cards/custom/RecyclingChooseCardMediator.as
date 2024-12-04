package com.bigpoint.zoomumba.view.cards.custom
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   
   public class RecyclingChooseCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "RecyclingCardMediator_";
      
      public var cardData:MaterialShopData;
      
      private var _resourcesProxy:ResourcesProxy;
      
      public var _materialProxy:MaterialProxy;
      
      private var _recyclingProxy:RecyclingProxy;
      
      public function RecyclingChooseCardMediator(param1:MaterialShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.internalType,this.cardData.itemId),param1,new ItemCard());
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         card.topGroup.currentState = "recyclingChoose";
         card.background.currentState = "recycling";
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         showActionButton(true,TextResourceModule.getText("zoo.window.recycling.slot.button.chooseItem"));
         var _loc2_:int = this.materialProxy.getMaxMaterial(this.cardData.itemId);
         if(_loc2_ > this.cardData.count)
         {
            if(currencyProxy.virtualMoney >= this.cardData.craftVirtual && this.recyclingProxy.trashAmount >= this.cardData.craftTrash)
            {
               card.canCraft.currentState = "possible";
            }
            else
            {
               card.canCraft.currentState = "none";
            }
            card.actionGroup.button.enabled = true;
         }
         else
         {
            card.actionGroup.button.enabled = false;
         }
      }
      
      override protected function onPressActionButton(param1:ButtonAction) : void
      {
         sendNotification(GUINote.RECYCLING_CHOOSE_MATERIAL,this.cardData);
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
         this.cardData.localisedTitle = TextResourceModule.getText(TextIdHelper.getCardName(Categories.MATERIAL,this.cardData.itemId));
         super.setCardName();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.cardData.count;
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      public function get resourcesProxy() : ResourcesProxy
      {
         if(this._resourcesProxy == null)
         {
            this._resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         }
         return this._resourcesProxy;
      }
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.getProxy(MaterialProxy) as MaterialProxy;
         }
         return this._materialProxy;
      }
      
      public function get recyclingProxy() : RecyclingProxy
      {
         if(this._recyclingProxy == null)
         {
            this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         }
         return this._recyclingProxy;
      }
   }
}

