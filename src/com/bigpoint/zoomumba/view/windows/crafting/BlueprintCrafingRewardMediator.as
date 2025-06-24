package com.bigpoint.zoomumba.view.windows.crafting
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.TweenLite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.crafting.BlueprintCraftingRewardContent;
   import windows.custom.crafting.BlueprintCraftingRewardWindow;
   
   public class BlueprintCrafingRewardMediator extends WindowMediator
   {
      public static const NAME:String = "BlueprintCrafingRewardMediator";
      
      private var window:BlueprintCraftingRewardWindow;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var _inventoryProxy:InventoryProxy;
      
      private var _selectedSlotItem:RecyclingCardInfoVo;
      
      private var _blueprintShopItems:Vector.<ShopItemData>;
      
      private var _cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _asset:SWFAsset;
      
      public function BlueprintCrafingRewardMediator(param1:BlueprintCraftingRewardWindow)
      {
         super(NAME,param1);
         this.window = param1;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this._blueprintShopItems = param1 as Vector.<ShopItemData>;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("blueprintRewardWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this._asset = param1;
         this.buildContentDisplay();
      }
      
      private function buildContentDisplay() : void
      {
         if(this.content)
         {
            this.content.background.source = this._asset.getEmbededBitmapData("background");
            this.content.uschi.source = this._asset.getEmbededBitmapData("uschiBubble");
            this.content.stars.source = this._asset.getEmbededBitmapData("stars");
            this.content.subtext.text = TextResourceModule.getText("zoo.window.crafting.blueprint.text");
            this.createRewardCards();
            this.window.preloaderVisibility = false;
         }
         else
         {
            TweenLite.delayedCall(2,this.buildContentDisplay);
         }
      }
      
      private function createRewardCards() : void
      {
         var _loc2_:ShopItemData = null;
         if(this._blueprintShopItems.length == 1)
         {
            this.content.cardGroupHolder.width = 130;
            this.content.cardGroupHolder.horizontalCenter = 130;
         }
         else if(this._blueprintShopItems.length == 2)
         {
            this.content.cardGroupHolder.width = 260;
            this.content.cardGroupHolder.horizontalCenter = 100;
         }
         else
         {
            this.content.cardGroupHolder.width = 390;
            this.content.cardGroupHolder.horizontalCenter = 65;
         }
         if(this._cardGroupHolderMediator == null)
         {
            this._cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.CRAFTING_REWARD_MODE);
            facade.registerMediator(this._cardGroupHolderMediator);
            this.content.cardGroupHolder.paginator.entriesPerPage = 3;
         }
         this._cardGroupHolderMediator.forceRemoveItems();
         this._cardGroupHolderMediator.onRemove();
         this._cardGroupHolderMediator.mode = CardHolderModes.CRAFTING_REWARD_MODE;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         for each(_loc2_ in this._blueprintShopItems)
         {
            _loc1_.push(_loc2_);
         }
         this._cardGroupHolderMediator.dataProvider = _loc1_;
      }
      
      public function get content() : BlueprintCraftingRewardContent
      {
         return this.window.getContent(0) as BlueprintCraftingRewardContent;
      }
      
      public function get inventoryProxy() : InventoryProxy
      {
         if(this._inventoryProxy == null)
         {
            this._inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         }
         return this._inventoryProxy;
      }
      
      private function removeView() : void
      {
         if(this._cardGroupHolderMediator)
         {
            this._cardGroupHolderMediator.forceRemoveItems();
            this._cardGroupHolderMediator.onRemove();
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.CRAFTING_REWARD_MODE.toString());
            this._cardGroupHolderMediator = null;
         }
      }
      
      override public function dispose() : void
      {
         this.removeView();
         super.dispose();
      }
      
      override public function onRemove() : void
      {
         this.removeView();
         super.onRemove();
      }
   }
}

