package com.bigpoint.zoomumba.view.cards.custom
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.RecyclingConst;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyOnceConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import custom.card.events.CardNumericStepperChangeEvent;
   
   public class RecyclingCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "RecyclingCardMediator_";
      
      private var _produceTimerStarted:Boolean = false;
      
      private var _slotTimerStarted:Boolean = false;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var _rentPrice:int;
      
      public function RecyclingCardMediator(param1:RecyclingCardInfoVo)
      {
         super(getNameFromPrefix(NAME,param1.internalType,param1.slotDataVo.slotId),param1,new ItemCard());
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         card.topGroup.currentState = "recycling";
         card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange,false,0,true);
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent) : void
      {
         this.refreshBuyStepperChange(param1.value);
      }
      
      private function refreshBuyStepperChange(param1:int) : void
      {
         this._rentPrice = this.recyclingProxy.getSlotRentVoByIndex(param1).rc;
         var _loc2_:* = currencyProxy.getCurrency(UserResources.REAL_MONEY) >= this._rentPrice;
         showBuyButton(this._rentPrice,_loc2_ ? "normal" : "pale",true,true,Categories.USER,UserResources.REAL_MONEY);
         this.cardData.price.userResource = UserResources.REAL_MONEY;
         this.cardData.price.amount = this.recyclingProxy.getSlotRentVoByIndex(param1).days;
         this.cardData.price.userCanBuy = _loc2_;
         this.cardData.slotDataVo.amount = this.cardData.price.amount;
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         this.setButtonsInView();
      }
      
      private function setButtonsInView() : void
      {
         switch(this.cardData.state)
         {
            case RecyclingConst.SLOT_TYPE_FREE:
               showActionButton(true,TextResourceModule.getText("zoo.window.recycling.slot.button.start"));
               break;
            case RecyclingConst.SLOT_TYPE_READY_FOR_COLLECT:
               showActionButton(true,TextResourceModule.getText("zoo.window.recycling.slot.button.processfinished"));
               break;
            case RecyclingConst.SLOT_TYPE_PRODUCE:
               if(this._produceTimerStarted == false)
               {
                  TimeManager.registerTickFunction(this.updateProduceTimer);
                  this.updateProduceTimer();
                  this._produceTimerStarted = true;
               }
               break;
            case RecyclingConst.SLOT_TYPE_BUY:
               this.refreshBuyStepperChange(0);
         }
      }
      
      private function updateProduceTimer() : void
      {
         var _loc1_:int = this.cardData.slotDataVo.finishTime - TimeManager.currentTime;
         if(this.cardData.slotDataVo.amount * this.cardData.materialShopData.craftDuration < _loc1_)
         {
            _loc1_ = this.cardData.slotDataVo.amount * this.cardData.materialShopData.craftDuration;
         }
         if(_loc1_ < 0)
         {
            sendNotification(GUINote.RECYCLING_SLOT_TIMER_COMPLETE,this.cardData);
            TimeManager.unregisterTickFunction(this.updateProduceTimer);
            this._produceTimerStarted = false;
         }
         else
         {
            card.bottomGroup.clockDisplay.text = TimeFormat.secondsToBigTimeString(_loc1_);
         }
      }
      
      private function updateSlotTimer() : void
      {
         var _loc1_:int = this.cardData.slotDataVo.endTime - TimeManager.currentTime;
         if(_loc1_ < 0)
         {
            sendNotification(GUINote.RECYCLING_SLOT_TIMER_ENDED,this.cardData);
            TimeManager.unregisterTickFunction(this.updateSlotTimer);
            this._slotTimerStarted = false;
         }
         else
         {
            card.bottomGroup.clockDisplay.text = TimeFormat.secondsToBigTimeString(_loc1_);
         }
      }
      
      override protected function onPressActionButton(param1:ButtonAction) : void
      {
         sendNotification(GUINote.RECYCLING_SLOT_ITEM_CHOOSE,this.cardData);
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = null;
         switch(this.cardData.state)
         {
            case RecyclingConst.SLOT_TYPE_PRODUCE:
            case RecyclingConst.SLOT_TYPE_READY_FOR_COLLECT:
               _loc1_ = TextIdHelper.getCardName(Categories.MATERIAL,this.cardData.slotDataVo.materialId);
               this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
               break;
            case RecyclingConst.SLOT_TYPE_BUY:
               this.cardData.localisedTitle = TextResourceModule.getText("zoo.window.recycling.slot.title.buy");
               break;
            case RecyclingConst.SLOT_TYPE_FREE:
               this.cardData.localisedTitle = TextResourceModule.getText("zoo.window.recycling.slot.title.chooseItem");
         }
         super.setCardName();
      }
      
      override protected function loadImageAsset() : void
      {
         if(card)
         {
            switch(this.cardData.state)
            {
               case RecyclingConst.SLOT_TYPE_PRODUCE:
                  this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
                  card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR,0,-1,-1,0.75));
                  card.bottomGroup.currentState = "recyclingProducing";
                  break;
               case RecyclingConst.SLOT_TYPE_READY_FOR_COLLECT:
                  this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
                  card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
                  break;
               case RecyclingConst.SLOT_TYPE_FREE:
                  card.ready.currentState = "ready";
                  if(this.cardData.slotDataVo.slotId != 1 && this.cardData.slotDataVo.endTime > 0)
                  {
                     card.bottomGroup.currentState = "time";
                     if(this._slotTimerStarted == false)
                     {
                        TimeManager.registerTickFunction(this.updateSlotTimer);
                        this.updateSlotTimer();
                        this._slotTimerStarted = true;
                     }
                  }
                  break;
               case RecyclingConst.SLOT_TYPE_BUY:
                  card.bottomGroup.amountStepper.valueFormatFunction = this.stepperFormatter;
                  card.bottomGroup.amountStepper.valueParseFunction = this.valueParseFunction;
                  card.bottomGroup.amountStepper.minimum = 0;
                  card.bottomGroup.amountStepper.maximum = this.recyclingProxy.slotRentMax - 1;
                  card.bottomGroup.amountStepper.stepSize = 1;
                  card.bottomGroup.amountStepper.value = 0;
                  this.cardData.slotDataVo.amount = this.recyclingProxy.getSlotRentVoByIndex(0).days;
                  card.bottomGroup.currentState = "recyclingBuy";
                  card.lock.currentState = "locked";
            }
         }
      }
      
      private function stepperFormatter(param1:int) : String
      {
         var _loc2_:int = 0;
         if(param1 <= this.recyclingProxy.slotRentMax - 1)
         {
            _loc2_ = this.recyclingProxy.getSlotRentVoByIndex(param1).days;
            if(_loc2_ > 1)
            {
               return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.days");
            }
            return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.day");
         }
         return "";
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(this.cardData.state == RecyclingConst.SLOT_TYPE_BUY)
         {
            if(!card)
            {
               return;
            }
            if(!this.cardData.price.userCanBuy)
            {
               sendNotification(WinNote.CLOSE_ALL_WINDOWS);
               sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            }
            else if(userProxy.userLevel < this.cardData.getUserLevelRequired())
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SHOP_BUY_ONCE_WINDOW,"",new BuyOnceConfirmationInitParams(this.cardData)));
            }
            else if(this.cardData.price.userCanBuy && this.cardData.price.userResource == UserResources.REAL_MONEY)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this._rentPrice),new WindowParams("",null,"",null,SHOPCARD_BUY_CLICKED,this.cardData)));
            }
         }
         else
         {
            super.handleBuyClicked(param1);
         }
      }
      
      private function valueParseFunction(param1:String) : int
      {
         var _loc2_:int = int(param1.split(" ")[0]);
         return this.recyclingProxy.getSlotIndexVoByDays(_loc2_);
      }
      
      override public function onRemove() : void
      {
         card.bottomGroup.removeEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
         if(this._produceTimerStarted)
         {
            TimeManager.unregisterTickFunction(this.updateProduceTimer);
         }
         if(this._slotTimerStarted)
         {
            TimeManager.unregisterTickFunction(this.updateSlotTimer);
         }
         super.onRemove();
      }
      
      public function get cardData() : RecyclingCardInfoVo
      {
         return data as RecyclingCardInfoVo;
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

