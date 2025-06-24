package com.bigpoint.zoomumba.view.windows.gameItem.sell
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.windows.gameItem.sell.GameItemSellWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.sell.GameItemSellContent;
   import windows.custom.gameItems.sell.GameItemSellWindow;
   import windows.events.WindowCustomEvent;
   
   public class GameItemPayinWindowMediator extends WindowMediator
   {
      public static const NAME:String = "GameItemPayinWindowMediator";
      
      private var _data:GameItemSellWindowInitParams;
      
      private var sellAmount:int = 1;
      
      public function GameItemPayinWindowMediator(param1:GameItemSellWindow)
      {
         super(GameItemPayinWindowMediator.NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:AnimalShopData = null;
         this._data = param1 as GameItemSellWindowInitParams;
         this.content.countSelector.value = 1;
         this.content.windowIcon.source = new WrapedSprite(AssetConfig.INVENTORY_ASSET_FILE,AssetConfig.INVENTORY_SELL_ICON,PreloaderTypes.MINI);
         this.content.header.text = this._data.title;
         this.content.message.text = this._data.info;
         this.content.itemIcon.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(this._data.data.category,this._data.data.itemId,this._data.data.level),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NORMAL,-1,80));
         if(this._data.data.category != Categories.ANIMAL)
         {
            this.content.sex = "none";
         }
         else
         {
            _loc2_ = ConfigurationModule.getInstance().getAnimalData(this._data.data.itemId);
            if(_loc2_.child == 1)
            {
               this.content.sex = "child";
            }
            else if(_loc2_.male == 1)
            {
               this.content.sex = "male";
            }
            else
            {
               this.content.sex = "female";
            }
         }
         this.content.count.value = this._data.data.count;
         this.content.countSelector.maximum = this._data.data.count;
         this.content.countSelector.minimum = 1;
         this.content.countSelector.addEventListener(Event.CHANGE,this.handleAmountSelection);
         if(Boolean(this._data.price) && Boolean(this._data.price.count))
         {
            this.content.priceTag.value = this._data.price.count;
            this.content.priceTag.setDisplaySize(30,30);
            this.content.priceTag.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(this._data.price.category,this._data.price.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NORMAL,-1,20));
         }
         else
         {
            this.content.priceTag.visible = false;
         }
         this.window.addEventListener(WindowCustomEvent.CONFIRM_CLICKED,this.handleSellConfirm);
      }
      
      private function handleSellConfirm(param1:WindowCustomEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.sellAmount)
         {
            _loc2_.push(this._data.ids[_loc3_]);
            _loc3_++;
         }
         sendNotification(NET.COMMUNITY_PAYIN_PUTDROP,[_loc2_]);
      }
      
      private function handleAmountSelection(param1:Event) : void
      {
         if(Boolean(this._data.price) && Boolean(this._data.price.count))
         {
            this.content.priceTag.value = this._data.price.count * this.content.countSelector.value;
         }
         this.sellAmount = this.content.countSelector.value;
      }
      
      private function get content() : GameItemSellContent
      {
         return this.window.getContent(0) as GameItemSellContent;
      }
      
      private function get window() : GameItemSellWindow
      {
         return this.viewComponent as GameItemSellWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

