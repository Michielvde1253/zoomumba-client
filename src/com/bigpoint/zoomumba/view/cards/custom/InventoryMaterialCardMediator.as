package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.gameItem.sell.GameItemSellWindowInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardToggleChangeEvent;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class InventoryMaterialCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "InventoryMaterialCardMediator_";
      
      public var cardData:MaterialShopData;
      
      private var _materialProxy:MaterialProxy;
      
      public var datas:Array;
      
      public function InventoryMaterialCardMediator(param1:Array)
      {
         this.cardData = param1[0] as MaterialShopData;
         this.datas = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,Categories.MATERIAL,this.cardData.itemId),param1[0],new ItemCard());
      }
      
      override protected function handleUseItem(param1:MouseEvent) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.INVENTORY));
         sendNotification(Note.INVENTORY_USE_ITEM,this.cardData);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         if(this.datas.length <= 0)
         {
            this.cardData.visible = false;
         }
         setCardBackground(this.data.bg);
         card.topGroup.currentState = "counter";
         card.bottomGroup.currentState = "inventory";
         card.bottomGroup.button1.toolTip = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         card.bottomGroup.button2.toolTip = TextResourceModule.getText("zoo.tooltip.multitool.sell");
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
         this.cardData.materialCount = this.materialProxy.getMaterialAmount(this.cardData.itemId);
         card.topGroup.counter.value = this.cardData.materialCount;
         card.bottomGroup.button1.visible = false;
         if(this.cardData.sellable == 0)
         {
            card.bottomGroup.button2.visible = false;
         }
         else
         {
            card.bottomGroup.button2.enabled = this.cardData.materialCount > 0;
         }
      }
      
      override protected function handleSellItem(param1:MouseEvent) : void
      {
         var _loc2_:ItemPackVO = null;
         var _loc3_:ItemPackVO = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(card.bottomGroup.button2.enabled == true)
         {
            _loc2_ = new ItemPackVO();
            _loc2_.count = this.cardData.getSellVirtual();
            _loc2_.category = Categories.USER;
            _loc2_.itemId = UserResources.VIRTUAL_MONEY;
            _loc3_ = new ItemPackVO();
            _loc3_.category = this.cardData.categoryId;
            _loc3_.itemId = this.cardData.itemId;
            _loc3_.count = this.cardData.materialCount;
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < this.cardData.materialCount)
            {
               _loc4_.push(this.cardData.itemId);
               _loc5_++;
            }
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GAME_ITEM_SELL_WINDOW,"",new GameItemSellWindowInitParams(TextResourceModule.getText("zoo.tooltip.multitool.sell"),TextResourceModule.getText("zoo.inventory.sell.info"),this.cardData.materialCount,_loc2_,_loc3_,_loc4_)));
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,CARDS.CHANGE_INVENTORY_AMOUNT,Note.MATERIALS_UPDATED,SHOP.REFRESH_RESOURCES,SHOP.REFRESH_MATERIAL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case CARDS.CHANGE_INVENTORY_AMOUNT:
            case SHOP.REFRESH_MATERIAL:
            case Note.MATERIALS_UPDATED:
            case SHOP.REFRESH_RESOURCES:
               this.setTopCounter();
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.MATERIAL,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.MATERIAL,this.cardData.itemId);
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
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.getProxy(MaterialProxy) as MaterialProxy;
         }
         return this._materialProxy;
      }
   }
}

