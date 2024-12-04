package com.bigpoint.zoomumba.view.windows.events
{
   import buttons.extended.ButtonBuy;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventRewardVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.babyEvent.BabyEventProxy;
   import com.bigpoint.zoomumba.model.events.babyEvent.vo.BabyEventConfigVO;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemType;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.info.ItemToInventoryInfoInitParams;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.events.CardSexChangeEvent;
   import custom.generic.GenericCircularBuyItem;
   import custom.generic.GenericCircularCounter;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.babyEvent.BabyEventContent;
   import windows.custom.events.babyEvent.BabyEventWindow;
   
   public class BabyEventWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BabyEventWindowMediator";
      
      private const FILES_TB_LOADED:int = 2;
      
      private var eventProxy:BabyEventProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var rewardsProxy:EventRewardsProxy;
      
      private var filesLoaded:int = 0;
      
      private var bitmapFocus:BitmapData;
      
      private var rewards:Vector.<EventRewardVO>;
      
      private var maleSelected:Boolean = true;
      
      public function BabyEventWindowMediator(param1:BabyEventWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.BABY_EVENT_SLIDER_VALUE_UPDATE,Note.RELOAD_INVENTORY,PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.updateTradeStepperMaxValues();
               this.updateAmounts();
               break;
            case Note.BABY_EVENT_SLIDER_VALUE_UPDATE:
               this.updateSliderValue(param1.getBody() as int);
               break;
            case Note.RELOAD_INVENTORY:
               this.updateAmounts();
               break;
            case PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED:
               this.updateAmounts();
         }
      }
      
      private function updateSliderValue(param1:int) : void
      {
         this.content.slider.value = param1;
         this.enableRewards();
      }
      
      override public function onRegister() : void
      {
         this.eventProxy = facade.retrieveProxy(BabyEventProxy.NAME) as BabyEventProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.rewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.setHeader();
         this.setEventText();
         this.setAmounts();
         this.setSlider();
         this.setButtons();
         this.setBalanceValues();
         this.updateAmounts();
         this.window.preloaderVisibility = true;
         this.filesLoaded = 0;
         AssetLibrary.sendAssetToFunction(this.config.eventAvatarFileId,this.returnBabyAsset);
         AssetLibrary.sendAssetToFunction("Bubbles",this.returnBubbleAsset);
      }
      
      private function drawFocus(param1:int, param2:int = -225, param3:int = 225) : void
      {
         if(this.bitmapFocus)
         {
            this.content.draw.graphics.clear();
            this.content.draw.graphics.beginBitmapFill(this.bitmapFocus);
            this.content.draw.graphics.moveTo(param1,0);
            this.content.draw.graphics.lineTo(param3 + 20,125);
            this.content.draw.graphics.lineTo(param2 - 20,125);
            this.content.draw.graphics.lineTo(param1,0);
            this.content.draw.graphics.endFill();
         }
      }
      
      private function returnBabyAsset(param1:SWFAsset) : void
      {
         this.bitmapFocus = param1.getEmbededBitmapData(this.config.eventAvatarAssetFocusPatternId);
         this.content.slider.thumbContent = param1.getEmbededObject(this.config.eventAvatarAssetBarSliderId);
         this.content.barBubbleL.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetBarSliderBubbleId);
         this.content.barBubbleR.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetBarSliderBubbleId);
         this.content.barFluid.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetBarLiquidId);
         this.content.barBG.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetBarBGId);
         this.content.barScroll.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetBarFrontId);
         this.content.iconImage.displayClass = param1.getEmbededObject(this.config.eventAvatarAssetIconId);
         this.sliderChanged(null);
         ++this.filesLoaded;
         this.clearPreloader();
      }
      
      private function returnBubbleAsset(param1:SWFAsset) : void
      {
         this.content.bubble.displayClass = param1.getEmbededObject("BubbleBig");
         ++this.filesLoaded;
         this.clearPreloader();
      }
      
      private function clearPreloader() : void
      {
         if(this.filesLoaded == this.FILES_TB_LOADED)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      private function setHeader() : void
      {
         this.window.header.filePath = this.netHelperProxy.getHeaderPath(this.config.headerFilename);
      }
      
      private function setEventText() : void
      {
         this.content.infoText.htmlText = TextResourceModule.getText(this.config.eventInfoTextId);
      }
      
      private function setSlider() : void
      {
         this.content.slider.minimum = this.config.eventSliderMin;
         this.content.slider.maximum = this.config.eventSliderMax;
         this.content.slider.value = this.eventProxy.sliderValue;
         this.content.slider.addEventListener(Event.CHANGE,this.sliderChanged);
      }
      
      private function sliderChanged(param1:Event) : void
      {
         this.content.barFluid.horizontalCenter = this.content.slider.value * 0.9;
         this.enableRewards();
      }
      
      private function enableRewards() : void
      {
         var _loc3_:GenericCircularBuyItem = null;
         var _loc1_:int = this.eventProxy.sliderValue;
         var _loc2_:int = this.inventoryProxy.getAnimalCountById(this.config.eventBabyAnimalId);
         var _loc4_:Array = [-225,-125,-40,40,125,225];
         var _loc5_:int = 225;
         var _loc6_:int = -225;
         var _loc7_:int = 0;
         while(_loc7_ < this.rewards.length)
         {
            _loc3_ = this.content.getButton(this.config.eventButtonValues[_loc7_][0]);
            if(this.rewards[_loc7_].unlockMin <= _loc1_ && this.rewards[_loc7_].unlockMax >= _loc1_)
            {
               _loc3_.enabled = true;
               _loc3_.toolTip = null;
               _loc6_ = _loc4_[_loc7_] > _loc6_ ? int(_loc4_[_loc7_]) : _loc6_;
               _loc5_ = _loc4_[_loc7_] < _loc5_ ? int(_loc4_[_loc7_]) : _loc5_;
            }
            else
            {
               _loc3_.enabled = false;
               if(_loc7_ <= 2)
               {
                  _loc3_.toolTip = TextResourceModule.getTextReplaced("zoo.event.halloween.tooltip.treats.missing",Vector.<TextReplace>([new TextReplace("%x%",Math.abs(this.rewards[_loc7_].unlockMax - _loc1_).toString())]));
               }
               else
               {
                  _loc3_.toolTip = TextResourceModule.getTextReplaced("zoo.event.halloween.tooltip.tricks.missing",Vector.<TextReplace>([new TextReplace("%x%",(this.rewards[_loc7_].unlockMin - _loc1_).toString())]));
               }
            }
            _loc7_++;
         }
         this.drawFocus(this.content.slider.value * 0.9,_loc5_,_loc6_);
      }
      
      private function setButtons() : void
      {
         var _loc2_:GenericCircularBuyItem = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         this.rewards = this.rewardsProxy.getRewardsForEvent(this.config.eventId);
         var _loc1_:int = 0;
         for each(_loc3_ in this.config.eventButtonValues)
         {
            _loc2_ = this.content.addButton(_loc3_[0]);
            _loc2_.enabled = false;
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.showRange);
            _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.clearRange);
            _loc2_.button.addEventListener(MouseEvent.CLICK,this.handleRedeem);
            _loc2_.display.displayImg.automaticCentralize = false;
            _loc2_.display.displayImg.currentState = "normal";
            if(this.rewards[_loc1_].itemId > 0)
            {
               _loc4_ = this.rewards[_loc1_].itemId;
            }
            else
            {
               _loc4_ = int(this.rewards[_loc1_].itemIds[0]);
            }
            if(this.rewards[_loc1_].categoryId == Categories.ANIMAL)
            {
               _loc2_.currentState = "normalSex";
               _loc2_.addEventListener(CardSexChangeEvent.CHANGED,this.sexChanged);
            }
            _loc2_.display.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(this.rewards[_loc1_].categoryId,_loc4_),AssetConfig.DEFAULT_OBJECT_SPR,-1,-1,50);
            _loc2_.button.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(this.rewards[_loc1_].currency.category,this.rewards[_loc1_].currency.itemId),AssetConfig.DEFAULT_OBJECT_SPR,0,-1,20));
            _loc2_.button.label.value = this.rewards[_loc1_].currency.count;
            _loc2_.index = _loc1_;
            _loc2_.button.index = _loc1_;
            _loc1_++;
         }
         this.content.rightTradeButton.addEventListener(MouseEvent.CLICK,this.handleTradeRight);
         this.content.leftTradeButton.addEventListener(MouseEvent.CLICK,this.handleTradeLeft);
      }
      
      private function handleRedeem(param1:MouseEvent) : void
      {
         var _loc2_:ItemPackVO = new ItemPackVO();
         var _loc3_:EventRewardVO = this.rewards[(param1.currentTarget as ButtonBuy).index];
         var _loc4_:int = this.inventoryProxy.getAnimalCountById(this.config.eventBabyAnimalId);
         _loc2_.category = this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].categoryId;
         if(_loc4_ < _loc3_.currency.count)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.halloween.layer.noSuccess.title"),TextResourceModule.getText("zoo.event.halloween.layer.noSuccess.text"))));
            return;
         }
         if(this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].categoryId == Categories.ANIMAL)
         {
            if(this.maleSelected)
            {
               sendNotification(NET.BABY_EVENT_REDEEM,[this.config.eventId,(param1.currentTarget as ButtonBuy).index + 1,this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemIds[0]]);
               _loc2_.itemId = this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemIds[0];
            }
            else
            {
               sendNotification(NET.BABY_EVENT_REDEEM,[this.config.eventId,(param1.currentTarget as ButtonBuy).index + 1,this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemIds[1]]);
               _loc2_.itemId = this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemIds[1];
            }
         }
         else
         {
            sendNotification(NET.BABY_EVENT_REDEEM,[this.config.eventId,(param1.currentTarget as ButtonBuy).index + 1,this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemId]);
            _loc2_.itemId = this.rewardsProxy.getRewardsForEvent(this.config.eventId)[(param1.currentTarget as ButtonBuy).index].itemId;
         }
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_TO_INVENTORY_INFO,"",new ItemToInventoryInfoInitParams(_loc2_)));
      }
      
      private function sexChanged(param1:CardSexChangeEvent) : void
      {
         this.maleSelected = param1.isMale;
         var _loc2_:GenericCircularBuyItem = param1.currentTarget as GenericCircularBuyItem;
         _loc2_.display.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(this.rewards[_loc2_.index].categoryId,this.rewards[_loc2_.index].itemIds[this.maleSelected ? 0 : 1]),AssetConfig.DEFAULT_OBJECT_SPR,-1,-1,50);
      }
      
      private function handleTradeRight(param1:MouseEvent) : void
      {
         sendNotification(NET.BABY_EVENT_TRADE_COLLECTABLE,[CollectableItemType.TRICKS,this.content.rightStepper.value]);
         this.updateTradeStepperMaxValues();
      }
      
      private function handleTradeLeft(param1:MouseEvent) : void
      {
         sendNotification(NET.BABY_EVENT_TRADE_COLLECTABLE,[CollectableItemType.TREATS,this.content.leftStepper.value]);
         this.updateTradeStepperMaxValues();
      }
      
      private function setBalanceValues() : void
      {
         this.content.displayLeft.displayImg.automaticCentralize = false;
         this.content.displayLeft.displayImg.currentState = "normal";
         this.content.displayLeft.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(this.config.eventExchange1Cat,this.config.eventExchange1Id),AssetConfig.DEFAULT_OBJECT_SPR,-1,-1,80);
         this.content.displayRight.displayImg.automaticCentralize = false;
         this.content.displayRight.displayImg.currentState = "normal";
         this.content.displayRight.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(this.config.eventExchange2Cat,this.config.eventExchange2Id),AssetConfig.DEFAULT_OBJECT_SPR,-1,-1,80);
         this.updateTradeStepperMaxValues();
      }
      
      private function updateTradeStepperMaxValues() : void
      {
         this.content.leftTradeButton.enabled = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TREATS) > 0;
         this.content.rightTradeButton.enabled = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TRICKS) > 0;
         var _loc1_:int = this.eventProxy.sliderValue;
         this.content.leftStepper.maximum = _loc1_ + 225;
         this.content.rightStepper.maximum = 225 - _loc1_;
         if(this.collectablesProxy.getCollectableAmmount(CollectableItemType.TREATS) < Math.abs(this.content.leftStepper.maximum))
         {
            this.content.leftStepper.maximum = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TREATS);
         }
         if(this.collectablesProxy.getCollectableAmmount(CollectableItemType.TRICKS) < Math.abs(this.content.rightStepper.maximum))
         {
            this.content.rightStepper.maximum = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TRICKS);
         }
      }
      
      private function updateAmounts() : void
      {
         var _loc1_:int = this.inventoryProxy.getAnimalCountById(this.config.eventBabyAnimalId);
         this.content.getDisplay(this.config.eventDisplayValues[0][0]).counter.value = _loc1_;
         this.content.getDisplay(this.config.eventDisplayValues[1][0]).counter.value = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TREATS);
         this.content.getDisplay(this.config.eventDisplayValues[2][0]).counter.value = this.collectablesProxy.getCollectableAmmount(CollectableItemType.TRICKS);
      }
      
      private function setAmounts() : void
      {
         var _loc1_:GenericCircularCounter = null;
         var _loc2_:Array = null;
         for each(_loc2_ in this.config.eventDisplayValues)
         {
            _loc1_ = this.content.addDisplay(_loc2_[0]);
            _loc1_.toolTip = TextResourceModule.getText(_loc2_[3]);
            _loc1_.button.displayImg.automaticCentralize = false;
            _loc1_.button.displayImg.currentState = "normal";
            _loc1_.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(_loc2_[1],_loc2_[2]),AssetConfig.DEFAULT_OBJECT_SPR,-1,-1,50);
         }
      }
      
      private function showRange(param1:MouseEvent) : void
      {
         var _loc2_:GenericCircularBuyItem = param1.currentTarget as GenericCircularBuyItem;
         var _loc3_:EventRewardVO = this.rewards[_loc2_.index];
         var _loc4_:int = _loc3_.unlockMax - _loc3_.unlockMin;
         var _loc5_:int = 10;
         this.content.rect.graphics.beginFill(65280);
         if(_loc4_ == 0 && _loc3_.unlockMin < 0)
         {
            this.content.rect.graphics.drawRoundRect(_loc3_.unlockMin * 0.95,4,_loc5_,12,22,22);
         }
         else if(_loc4_ == 0 && _loc3_.unlockMin > 0)
         {
            this.content.rect.graphics.drawRoundRect(_loc3_.unlockMin * 0.95 - _loc5_ - 1,4,_loc5_,12,22,22);
         }
         else
         {
            this.content.rect.graphics.drawRoundRect(_loc3_.unlockMin * 0.95,0,_loc4_ * 0.945,21,22,22);
         }
         this.content.rect.graphics.endFill();
      }
      
      private function clearRange(param1:MouseEvent) : void
      {
         this.content.rect.graphics.clear();
      }
      
      private function get config() : BabyEventConfigVO
      {
         return this.eventProxy.config;
      }
      
      private function get content() : BabyEventContent
      {
         return this.window.getContent() as BabyEventContent;
      }
      
      private function get window() : BabyEventWindow
      {
         return this.viewComponent as BabyEventWindow;
      }
      
      override public function dispose() : void
      {
         var _loc1_:GenericCircularBuyItem = null;
         for each(_loc1_ in this.content.buttons)
         {
            if(_loc1_.hasEventListener(CardSexChangeEvent.CHANGED))
            {
               _loc1_.removeEventListener(CardSexChangeEvent.CHANGED,this.sexChanged);
            }
            if(_loc1_.hasEventListener(MouseEvent.MOUSE_OVER))
            {
               _loc1_.removeEventListener(MouseEvent.MOUSE_OVER,this.showRange);
            }
            if(_loc1_.hasEventListener(MouseEvent.MOUSE_OUT))
            {
               _loc1_.removeEventListener(MouseEvent.MOUSE_OUT,this.clearRange);
            }
            if(_loc1_.button.hasEventListener(MouseEvent.CLICK))
            {
               _loc1_.button.removeEventListener(MouseEvent.CLICK,this.handleRedeem);
            }
         }
         if(this.content.slider.hasEventListener(Event.CHANGE))
         {
            this.content.slider.removeEventListener(Event.CHANGE,this.sliderChanged);
         }
         this.content.destroy();
      }
   }
}

