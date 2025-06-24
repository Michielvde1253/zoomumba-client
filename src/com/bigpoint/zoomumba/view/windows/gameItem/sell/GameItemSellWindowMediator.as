package com.bigpoint.zoomumba.view.windows.gameItem.sell
{
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
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
   
   public class GameItemSellWindowMediator extends WindowMediator
   {
      public static const NAME:String = "GameItemSellWindowMediator";
      
      private var _data:GameItemSellWindowInitParams;
      
      private var sellAmount:int = 1;
      
      public function GameItemSellWindowMediator(param1:GameItemSellWindow)
      {
         super(NAME,param1);
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
         var _loc3_:AnimalShopData = null;
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
            _loc3_ = ConfigurationModule.getInstance().getAnimalData(this._data.data.itemId);
            if(_loc3_.child == 1)
            {
               this.content.sex = "child";
            }
            else if(_loc3_.male == 1)
            {
               this.content.sex = "male";
            }
            else
            {
               this.content.sex = "female";
            }
         }
         var _loc2_:int = this._data.data.count;
         if(_loc2_ > 50)
         {
            _loc2_ = 50;
         }
         this.content.count.value = this._data.data.count;
         this.content.countSelector.maximum = _loc2_;
         this.content.countSelector.minimum = 1;
         this.content.countSelector.addEventListener(Event.CHANGE,this.handleAmountSelection);
         this.content.priceTag.value = this._data.price.count;
         this.content.priceTag.setDisplaySize(30,30);
         this.content.priceTag.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(this._data.price.category,this._data.price.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.NORMAL,-1,20));
         this.window.addEventListener(WindowCustomEvent.CONFIRM_CLICKED,this.handleSellConfirm);
      }
      
      private function handleSellConfirm(param1:WindowCustomEvent) : void
      {
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.sellAmount)
         {
            _loc2_.push(this._data.ids[_loc3_]);
            _loc3_++;
         }
         var _loc4_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         if(this._data.data.category == Categories.BREEDING_LAB || this._data.data.category == Categories.NURSERY)
         {
            this._data.data.category = 5;
         }
         _loc4_.callServer(NET.SELL_ITEM_FROM_INVENTORY,[this._data.data.category,_loc2_]).addCallback(CARDS.CHANGE_INVENTORY_AMOUNT,[this._data.data.category,_loc2_]).sendNow();
      }
      
      private function handleAmountSelection(param1:Event) : void
      {
         this.content.priceTag.value = this._data.price.count * this.content.countSelector.value;
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

