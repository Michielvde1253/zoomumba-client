package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.gameItem.sell.GameItemSellWindowInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class InventoryCageCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "InventoryCageCardMediator_";
      
      public var cardData:CageShopData;
      
      public var datas:Array;
      
      public function InventoryCageCardMediator(param1:Array)
      {
         this.cardData = param1[0];
         this.datas = param1;
         _inventoryMode = true;
         super(getNameFromPrefix(NAME,Categories.CAGE,this.cardData.itemId),param1[0],new ItemCard());
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
      
      override protected function config(param1:AbstractCard) : void
      {
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
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.datas.length;
      }
      
      override protected function handleUseItem(param1:MouseEvent) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.INVENTORY));
         sendNotification(Note.INVENTORY_USE_ITEM,this.cardData);
      }
      
      override protected function handleSellItem(param1:MouseEvent) : void
      {
         var _loc2_:ItemPackVO = new ItemPackVO();
         _loc2_.count = this.cardData.getSellVirtual();
         _loc2_.category = Categories.USER;
         _loc2_.itemId = UserResources.VIRTUAL_MONEY;
         var _loc3_:ItemPackVO = new ItemPackVO();
         _loc3_.category = this.cardData.categoryId;
         _loc3_.itemId = this.cardData.itemId;
         _loc3_.count = this.datas.length;
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < this.datas.length)
         {
            _loc4_.push(CageShopData(this.datas[_loc5_]).uniqueId);
            _loc5_++;
         }
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GAME_ITEM_SELL_WINDOW,"",new GameItemSellWindowInitParams(TextResourceModule.getText("zoo.tooltip.multitool.sell"),TextResourceModule.getText("zoo.inventory.sell.info"),this.datas.length,_loc2_,_loc3_,_loc4_)));
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,CARDS.CHANGE_INVENTORY_AMOUNT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case CARDS.CHANGE_INVENTORY_AMOUNT:
               _loc2_ = param1.getBody() as Array;
               if(this.datas.length == 0)
               {
                  return;
               }
               if(_loc2_[0] != this.cardData.categoryId || _loc2_[1][0] != CageShopData(this.datas[0]).uniqueId)
               {
                  return;
               }
               _loc3_ = int(_loc2_[1].length);
               _loc4_ = int(this.datas.length);
               this.datas.splice(0,_loc3_);
               card.topGroup.counter.value = _loc4_ - _loc3_;
               if(_loc4_ - _loc3_ == 0)
               {
                  sendNotification(Note.FORCE_RELOAD_INVENTORY);
               }
               break;
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.CAGE,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.CAGE,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId,this.cardData.level);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
   }
}

