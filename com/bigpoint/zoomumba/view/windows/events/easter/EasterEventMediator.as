package com.bigpoint.zoomumba.view.windows.events.easter
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.easter.EasterProxy;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterFieldVo;
   import com.bigpoint.zoomumba.model.events.easter.vo.EasterRewardVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.easter.components.EasterStepItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenMax;
   import components.counter.CounterRectBigSkin;
   import custom.generic.GenericCircularCounter;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.easter.EasterContent;
   import windows.custom.events.easter.EasterWindow;
   
   public class EasterEventMediator extends WindowMediator
   {
      public static const NAME:String = "EasterEventMediator";
      
      private var eventProxy:EasterProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var rewardsProxy:EventRewardsProxy;
      
      private var networkProxy:NetProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var _assets:SWFAsset;
      
      public function EasterEventMediator(param1:EasterWindow)
      {
         super(EasterEventMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.eventProxy = facade.retrieveProxy(EasterProxy.NAME) as EasterProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.rewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         this.networkProxy = super.facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.currencyProxy = super.facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.EASTER_GET_EVENT,Note.EASTER_PUT_EGG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.updateAmounts();
               this.redrawThings();
               break;
            case Note.EASTER_GET_EVENT:
               this.onEasterGetEvent(param1.getBody());
               break;
            case Note.EASTER_PUT_EGG:
               this.onEasterPutEgg(param1.getBody());
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.setHeader();
         this.drawCollectables();
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         this.content.buyBasket.addEventListener(MouseEvent.CLICK,this.handleBuyClicked);
         this.updateAmounts();
         this.networkProxy.callServer(NET.EASTER_GET_EVENT,[]).addCallbackIfTrue(Note.EASTER_GET_EVENT).sendNow();
      }
      
      private function onEasterPutEgg(param1:Object) : void
      {
         this.eventProxy.parseEasterObject(param1);
         this.redrawThings();
      }
      
      public function onEasterGetEvent(param1:Object) : void
      {
         this.eventProxy.parseEasterObject(param1);
         AssetLibrary.sendAssetToFunction("EasterEvent",this.handleAssetsLoaded);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "EasterEvent":
            case "EasterEvent.swf":
               this._assets = param1;
               this.content.egg.source = param1.getEmbededBitmapData("Egg");
               this.redrawThings();
               this.content.strokes.source = param1.getEmbededBitmapData("Strokes");
               this.drawRewards();
               this.window.preloaderVisibility = false;
         }
      }
      
      public function redrawThings() : void
      {
         var field:EasterFieldVo = null;
         var item:EasterStepItem = null;
         var tooltipTxt:String = null;
         var rewardVo:EasterRewardVo = null;
         var reward:GenericCircularCounter = null;
         var value:Number = NaN;
         this.content.rewards.removeAllElements();
         this.content.easterSteps.removeAllElements();
         for each(field in this.eventProxy.proxyData.fields)
         {
            if(field.step == this.eventProxy.proxyData.easterObj.currentStep)
            {
               this.content.coll1.removeEventListener(MouseEvent.CLICK,this.onMouseClicked);
               this.content.coll2.removeEventListener(MouseEvent.CLICK,this.onMouseClicked);
               this.content.coll3.removeEventListener(MouseEvent.CLICK,this.onMouseClicked);
               TweenMax.to(this.content.coll1,1,{"colorMatrixFilter":{
                  "colorize":13421772,
                  "amount":1
               }});
               TweenMax.to(this.content.coll2,1,{"colorMatrixFilter":{
                  "colorize":13421772,
                  "amount":1
               }});
               TweenMax.to(this.content.coll3,1,{"colorMatrixFilter":{
                  "colorize":13421772,
                  "amount":1
               }});
               this.content.coll1.button.enabled = false;
               this.content.coll2.button.enabled = false;
               this.content.coll3.button.enabled = false;
               switch(field.putEgg)
               {
                  case 153:
                     if(this.collectablesProxy.getCollectableAmmount(153) >= field.putAmount * this.eventProxy.proxyData.easterObj.round)
                     {
                        this.content.coll1.button.enabled = true;
                        TweenMax.to(this.content.coll1,1,{"colorMatrixFilter":{
                           "amount":1,
                           "remove":true
                        }});
                        this.content.coll1.addEventListener(MouseEvent.CLICK,this.onMouseClicked);
                        TweenMax.to(this.content.coll1,1,{"colorMatrixFilter":{
                           "amount":1,
                           "remove":true
                        }});
                     }
                     break;
                  case 154:
                     if(this.collectablesProxy.getCollectableAmmount(154) >= field.putAmount * this.eventProxy.proxyData.easterObj.round)
                     {
                        this.content.coll2.button.enabled = true;
                        TweenMax.to(this.content.coll2,1,{"colorMatrixFilter":{
                           "amount":1,
                           "remove":true
                        }});
                        this.content.coll2.addEventListener(MouseEvent.CLICK,this.onMouseClicked);
                     }
                     break;
                  case 155:
                     if(this.collectablesProxy.getCollectableAmmount(155) >= field.putAmount * this.eventProxy.proxyData.easterObj.round)
                     {
                        this.content.coll3.button.enabled = true;
                        TweenMax.to(this.content.coll3,1,{"colorMatrixFilter":{
                           "amount":1,
                           "remove":true
                        }});
                        this.content.coll3.addEventListener(MouseEvent.CLICK,this.onMouseClicked);
                     }
               }
            }
            if(field.stepReference)
            {
               try
               {
                  this.content.easterSteps.removeElement(field.stepReference);
               }
               catch(e:Error)
               {
               }
               field.stepReference = null;
            }
            if(field.position)
            {
               item = new EasterStepItem();
               item.x = field.position.x;
               item.y = field.position.y;
               item.image = this._assets.getEmbededBitmapData("Step" + field.step);
               tooltipTxt = TextResourceModule.getText("zoo.tooltip.eggAmount");
               tooltipTxt = tooltipTxt.split("%amount%").join(field.putAmount * this.eventProxy.proxyData.easterObj.round);
               item.toolTip = tooltipTxt;
               if(this.eventProxy.proxyData.easterObj.currentStep > field.step)
               {
                  item.active = true;
               }
               else
               {
                  item.active = false;
               }
               this.content.easterSteps.addElement(item);
               field.stepReference = item;
               if(Boolean(field.rewards) && field.rewards.length > 0)
               {
                  for each(rewardVo in field.rewards)
                  {
                     if(rewardVo.itemReference)
                     {
                        try
                        {
                           this.content.rewards.removeElement(rewardVo.itemReference);
                        }
                        catch(e:Error)
                        {
                        }
                        rewardVo.itemReference = null;
                     }
                     if(rewardVo.position)
                     {
                        reward = new GenericCircularCounter();
                        reward.button.displayImg.automaticCentralize = false;
                        reward.button.imgBackground.verticalCenter = 0;
                        reward.button.imgBackground.horizontalCenter = 0;
                        reward.button.bitmapDisplayPosX = 0;
                        reward.button.bitmapDisplayPosY = 0;
                        if(field.step == 1 || field.step == 4 || field.step == 6)
                        {
                           reward.counter.left = -10;
                        }
                        reward.counter.bottom = -25;
                        reward.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.getCategoryIdFromName(rewardVo.type),rewardVo.id),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
                        reward.button.displayImg.maskRectBottom = 45;
                        reward.x = rewardVo.position.x;
                        reward.y = rewardVo.position.y;
                        reward.counter.setStyle("skinClass",CounterRectBigSkin);
                        if(rewardVo.amount > 999)
                        {
                           value = parseInt(String(rewardVo.amount).substring(0,3));
                           reward.counter.toolTip = String(rewardVo.amount);
                           reward.counter.usePoints = true;
                           reward.counter.value = value;
                        }
                        else
                        {
                           reward.counter.usePoints = false;
                           reward.counter.value = rewardVo.amount;
                        }
                        this.content.rewards.addElement(reward);
                        rewardVo.itemReference = reward;
                     }
                  }
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:EasterFieldVo = null;
         var _loc2_:EasterRewardVo = null;
         for each(_loc1_ in this.eventProxy.proxyData.fields)
         {
            _loc1_.stepReference = null;
            if(Boolean(_loc1_.rewards) && _loc1_.rewards.length > 0)
            {
               for each(_loc2_ in _loc1_.rewards)
               {
                  _loc2_.itemReference = null;
               }
            }
         }
         this.content.rewards.removeAllElements();
         this.content.easterSteps.removeAllElements();
         this.content.removeEventListener("infoComicClick",this.handleInfoClick);
         this.content.buyBasket.removeEventListener(MouseEvent.CLICK,this.handleBuyClicked);
      }
      
      private function setHeader() : void
      {
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_easter_event");
      }
      
      private function drawCollectables() : void
      {
         var _loc3_:GenericCircularCounter = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.content.counters.numElements)
         {
            _loc3_ = this.content.counters.getElementAt(_loc1_) as GenericCircularCounter;
            _loc3_.button.displayImg.automaticCentralize = false;
            _loc3_.button.imgBackground.verticalCenter = 0;
            _loc3_.button.imgBackground.horizontalCenter = 0;
            _loc3_.button.bitmapDisplayPosX = 0;
            _loc3_.button.bitmapDisplayPosY = 0;
            _loc3_.counter.right = -25;
            _loc3_.counter.bottom = -25;
            _loc1_++;
         }
         this.content.buyBasket.button.enabled = true;
         this.content.buyBasket.button.currentState = "gold";
         this.content.buyBasket.button.label.value = this.eventProxy.proxyData.basketCR;
         this.content.buyBasket.display.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.EVENTS,34),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.buyBasket.display.displayImg.maskRectBottom = 45;
         this.content.buyBasket.display.imgBackground.verticalCenter = 0;
         this.content.buyBasket.display.imgBackground.horizontalCenter = 0;
         this.content.buyBasket.button.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.REAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         var _loc2_:String = TextResourceModule.getText("zoo.tooltip.eggPackage");
         _loc2_ = _loc2_.split("%amount%").join(this.eventProxy.proxyData.basketAmount);
         this.content.buyBasket.toolTip = _loc2_;
         this.content.coll1.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,153),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll1.button.displayImg.maskRectBottom = 45;
         this.content.coll2.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,154),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll2.button.displayImg.maskRectBottom = 45;
         this.content.coll3.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,155),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll3.button.displayImg.maskRectBottom = 45;
      }
      
      protected function onMouseClicked(param1:MouseEvent) : void
      {
         this.networkProxy.callServer(NET.EASTER_PUT_EGG,[]).addCallbackIfTrue(Note.EASTER_PUT_EGG).sendNow();
      }
      
      private function drawRewards() : void
      {
      }
      
      private function updateAmounts() : void
      {
         this.content.coll1.counter.value = this.collectablesProxy.getCollectableAmmount(153);
         this.content.coll2.counter.value = this.collectablesProxy.getCollectableAmmount(154);
         this.content.coll3.counter.value = this.collectablesProxy.getCollectableAmmount(155);
      }
      
      private function handleBuyClicked(param1:Event) : void
      {
         if(this.currencyProxy.getCurrency(UserResources.REAL_MONEY) < this.eventProxy.proxyData.basketCR)
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            return;
         }
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.eventProxy.proxyData.basketCR),new WindowParams("",null,"",null,NET.EASTER_BUY_EGG)));
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GENERIC_COMIC_WINDOW));
      }
      
      private function get content() : EasterContent
      {
         return this.window.getContent() as EasterContent;
      }
      
      private function get window() : EasterWindow
      {
         return this.viewComponent as EasterWindow;
      }
   }
}

