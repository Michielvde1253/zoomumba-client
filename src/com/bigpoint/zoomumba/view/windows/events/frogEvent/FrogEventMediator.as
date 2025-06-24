package com.bigpoint.zoomumba.view.windows.events.frogEvent
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.frog.FrogProxy;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogFieldVo;
   import com.bigpoint.zoomumba.model.events.frog.vo.FrogRewardVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.frogEvent.components.FrogStepItem;
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
   import windows.custom.events.frogEvent.FrogContent;
   import windows.custom.events.frogEvent.FrogWindow;
   
   public class FrogEventMediator extends WindowMediator
   {
      public static const NAME:String = "FrogEventMediator";
      
      private var eventProxy:FrogProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var rewardsProxy:EventRewardsProxy;
      
      private var networkProxy:NetProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var _assets:SWFAsset;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function FrogEventMediator(param1:FrogWindow)
      {
         super(FrogEventMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.eventProxy = facade.retrieveProxy(FrogProxy.NAME) as FrogProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.rewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         this.networkProxy = super.facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.currencyProxy = super.facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.FROG_GET_EVENT,Note.FROG_PUT_DROPICON];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.updateAmounts();
               this.redrawThings();
               break;
            case Note.FROG_GET_EVENT:
               this.onGetEvent(param1.getBody());
               break;
            case Note.FROG_PUT_DROPICON:
               this.onPutDropicon(param1.getBody());
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.setHeader();
         this.drawCollectables();
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         this.updateAmounts();
         this.networkProxy.callServer(NET.FROG_GET_EVENT,[]).addCallbackIfTrue(Note.FROG_GET_EVENT).sendNow();
      }
      
      private function onPutDropicon(param1:Object) : void
      {
         this.window.preloaderVisibility = false;
         this.eventProxy.parseFrogObject(param1);
         this.redrawThings();
      }
      
      public function onGetEvent(param1:Object) : void
      {
         this.eventProxy.parseFrogObject(param1);
         AssetLibrary.sendAssetToFunction("FrogEvent",this.handleAssetsLoaded);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "FrogEvent":
            case "FrogEvent.swf":
               this._assets = param1;
               this.content.table.source = param1.getEmbededBitmapData("FrogField");
               this.redrawThings();
               this.drawRewards();
               this.window.preloaderVisibility = false;
         }
      }
      
      public function redrawThings() : void
      {
         var field:FrogFieldVo = null;
         var item:FrogStepItem = null;
         var collectable:String = null;
         var tooltipTxt:String = null;
         var rewardVo:FrogRewardVo = null;
         var reward:GenericCircularCounter = null;
         var value:Number = NaN;
         this.content.rewards.removeAllElements();
         this.content.fieldStep.removeAllElements();
         for each(field in this.eventProxy.proxyData.fields)
         {
            if(field.step == this.eventProxy.proxyData.frogObj.currentStep)
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
               switch(field.putDrop)
               {
                  case 305:
                     if(this.collectablesProxy.getCollectableAmmount(305) >= field.putAmount * this.eventProxy.proxyData.frogObj.round)
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
                  case 306:
                     if(this.collectablesProxy.getCollectableAmmount(306) >= field.putAmount * this.eventProxy.proxyData.frogObj.round)
                     {
                        this.content.coll2.button.enabled = true;
                        TweenMax.to(this.content.coll2,1,{"colorMatrixFilter":{
                           "amount":1,
                           "remove":true
                        }});
                        this.content.coll2.addEventListener(MouseEvent.CLICK,this.onMouseClicked);
                     }
                     break;
                  case 307:
                     if(this.collectablesProxy.getCollectableAmmount(307) >= field.putAmount * this.eventProxy.proxyData.frogObj.round)
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
                  this.content.fieldStep.removeElement(field.stepReference);
               }
               catch(e:Error)
               {
               }
               field.stepReference = null;
            }
            if(field.position)
            {
               item = new FrogStepItem();
               item.x = field.position.x;
               item.y = field.position.y;
               item.image = this._assets.getEmbededBitmapData("Step" + field.step);
               collectable = TextResourceModule.getText("zoo.collectableItems.name." + field.putDrop);
               tooltipTxt = TextResourceModule.getText("zoo.tooltip.frogAmount");
               tooltipTxt = tooltipTxt.split("%amount%").join(field.putAmount * this.eventProxy.proxyData.frogObj.round);
               tooltipTxt = tooltipTxt.split("%collectable%").join(collectable);
               item.toolTip = tooltipTxt;
               if(this.eventProxy.proxyData.frogObj.currentStep > field.step)
               {
                  item.active = true;
                  item.current = false;
               }
               else if(this.eventProxy.proxyData.frogObj.currentStep == field.step)
               {
                  item.active = false;
                  item.current = true;
               }
               else
               {
                  item.active = false;
                  item.current = false;
               }
               this.content.fieldStep.addElement(item);
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
                        reward.counter.bottom = -25;
                        reward.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.getCategoryIdFromName(rewardVo.type),rewardVo.id),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
                        reward.button.displayImg.maskRectBottom = 45;
                        if(rewardVo.id == 224 || rewardVo.id == 225)
                        {
                           reward.button.displayImg.paddingDisplayY = 10;
                        }
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
         var _loc1_:FrogFieldVo = null;
         var _loc2_:FrogRewardVo = null;
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
         this.content.fieldStep.removeAllElements();
         this.content.removeEventListener("infoComicClick",this.handleInfoClick);
      }
      
      private function setHeader() : void
      {
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_frog_event");
      }
      
      private function drawCollectables() : void
      {
         var _loc2_:GenericCircularCounter = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.content.counters.numElements)
         {
            _loc2_ = this.content.counters.getElementAt(_loc1_) as GenericCircularCounter;
            _loc2_.button.displayImg.automaticCentralize = false;
            _loc2_.button.imgBackground.verticalCenter = 0;
            _loc2_.button.imgBackground.horizontalCenter = 0;
            _loc2_.button.bitmapDisplayPosX = 0;
            _loc2_.button.bitmapDisplayPosY = 0;
            _loc2_.counter.right = -25;
            _loc2_.counter.bottom = -25;
            _loc1_++;
         }
         this.content.coll1.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,305),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll1.button.displayImg.maskRectBottom = 45;
         this.content.coll2.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,306),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll2.button.displayImg.maskRectBottom = 45;
         this.content.coll3.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,307),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll3.button.displayImg.maskRectBottom = 45;
      }
      
      protected function onMouseClicked(param1:MouseEvent) : void
      {
         this.window.preloaderVisibility = true;
         this.networkProxy.callServer(NET.FROG_PUT_DROPICON,[]).addCallbackIfTrue(Note.FROG_PUT_DROPICON).sendNow();
      }
      
      private function drawRewards() : void
      {
      }
      
      private function updateAmounts() : void
      {
         this.content.coll1.counter.value = this.collectablesProxy.getCollectableAmmount(305);
         this.content.coll2.counter.value = this.collectablesProxy.getCollectableAmmount(306);
         this.content.coll3.counter.value = this.collectablesProxy.getCollectableAmmount(307);
      }
      
      private function handleBuyClicked(param1:Event) : void
      {
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GENERIC_COMIC_WINDOW));
      }
      
      private function get content() : FrogContent
      {
         return this.window.getContent() as FrogContent;
      }
      
      private function get window() : FrogWindow
      {
         return this.viewComponent as FrogWindow;
      }
   }
}

