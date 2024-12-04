package com.bigpoint.zoomumba.view.cards.custom
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.inventory.vo.InventoryTabs;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
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
   
   public class CraftingDecoCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "CraftingDecoCardMediator_";
      
      public var cardData:ShopItemData;
      
      private var _craftingProxy:CraftingProxy;
      
      private var _fieldProxy:PlayFieldProxy;
      
      private var _inventoryProxy:InventoryProxy;
      
      public function CraftingDecoCardMediator(param1:ShopItemData)
      {
         param1.bg = CARDS.CARD_BACKGROUND_STYLE_BLUEPRINT;
         this.cardData = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard(),ItemCardCraftingSkin);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.topGroup.currentState = "counter";
         card.buyGroup.currentState = "button";
         if(this.craftingProxy.canCraftItem(this.cardData.itemId,this.cardData.categoryId))
         {
            card.canCraft.currentState = "possible";
         }
         else
         {
            card.canCraft.currentState = "none";
         }
         showActionButton(true,TextResourceModule.getText("zoo.window.recycling.card.create"));
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
      
      override protected function setTopCounter() : void
      {
         var _loc1_:int = -1;
         if(data.categoryId == Categories.DECOR)
         {
            _loc1_ = InventoryTabs.DECORATIONS;
         }
         else if(data.categoryId == Categories.TRASHBIN)
         {
            _loc1_ = InventoryTabs.ROADS;
         }
         else if(data.categoryId == Categories.ROAD)
         {
            _loc1_ = InventoryTabs.ROADS;
         }
         else if(data.categoryId == Categories.STORE)
         {
            _loc1_ = InventoryTabs.SHOPS;
         }
         else if(data.categoryId == Categories.CAGE)
         {
            _loc1_ = InventoryTabs.CAGES;
         }
         var _loc2_:int = this.inventoryProxy.getItemCountById(data.itemId,_loc1_);
         card.topGroup.counter.value = _loc2_;
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
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
      
      public function get fieldProxy() : PlayFieldProxy
      {
         if(this._fieldProxy == null)
         {
            this._fieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         }
         return this._fieldProxy;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      public function get inventoryProxy() : InventoryProxy
      {
         if(this._inventoryProxy == null)
         {
            this._inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         }
         return this._inventoryProxy;
      }
   }
}

