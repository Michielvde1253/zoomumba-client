package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantVO;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardNumericStepperChangeEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class AssistantCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "AssistantCardMediator_";
      
      public var cardData:AssistanceShopData;
      
      private var assistantProxy:AssistancesProxy;
      
      private var timerStarted:Boolean = false;
      
      public function AssistantCardMediator(param1:AssistanceShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),this.cardData,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         param1.content.verticalCenter = -4;
         card.decoBackContent.currentState = "circle";
         card.decoBackContent.scale = 0.65;
         if(this.cardData.itemId == MainConstants.PREMIUM_ID_ZOO_DIRECTOR)
         {
            param1.content.verticalCenter = 0;
            card.decoBackContent.verticalCenter = 14;
            card.decoBackContent.scale = 0.8;
         }
         card.buyGroup.currentState = "button";
         card.topGroup.currentState = "active";
         card.bottomGroup.currentState = "time";
         card.bottomGroup.clockDisplay.text = "24:00:00";
      }
      
      override protected function updateAssistantState() : void
      {
         if(this.cardData.assistId == 0)
         {
            card.bottomGroup.visible = false;
            card.topGroup.active.selected = this.assistantProxy.haveAllAssistantsActive;
         }
         var _loc1_:AssistantVO = this.assistantProxy.getAssistantData(this.cardData.itemId);
         if(_loc1_)
         {
            card.topGroup.active.selected = _loc1_.isActive;
            if(!_loc1_.isActive)
            {
               card.buyGroup.button.currentState = "normal";
               card.bottomGroup.currentState = "amount";
               card.bottomGroup.amountStepper.valueFormatFunction = this.stepperFormatter;
               card.bottomGroup.amountStepper.valueParseFunction = this.valueParseFunction;
               card.bottomGroup.amountStepper.maximum = this.cardData.assistLifeTimers.length - 1;
               card.bottomGroup.amountStepper.minimum = 0;
               card.bottomGroup.amountStepper.stepSize = 1;
               card.buyGroup.button.label.text = this.cardData.assistBuyReal[0];
               this.cardData.selectedType = 1;
               card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
               card.buyGroup.button.enabled = true;
               this.stopTimeTrack();
            }
            else
            {
               card.bottomGroup.currentState = "time";
               card.buyGroup.button.enabled = false;
            }
            if(_loc1_.isActive && !this.timerStarted)
            {
               TimeManager.registerTickFunction(this.updateTimer);
               this.timerStarted = true;
            }
            return;
         }
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent) : void
      {
         this.cardData.selectedType = param1.value + 1;
         card.buyGroup.button.label.text = this.cardData.assistBuyReal[param1.value];
      }
      
      private function stepperFormatter(param1:int) : String
      {
         var _loc2_:int = this.cardData.assistLifeTimers[param1] / 3600 / 24;
         if(_loc2_ > 1)
         {
            return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.days");
         }
         return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.day");
      }
      
      private function valueParseFunction(param1:String) : int
      {
         var _loc2_:int = int(param1.split(" ")[0]);
         return this.cardData.assistLifeTimers.indexOf(_loc2_ * 3600 * 24);
      }
      
      private function updateTimer() : void
      {
         var _loc1_:AssistantVO = this.assistantProxy.getAssistantData(this.cardData.itemId);
         var _loc2_:int = _loc1_.endTimeStamp - TimeManager.currentTime - 3;
         if(_loc2_ <= 0)
         {
            _loc2_ = 0;
         }
         card.bottomGroup.clockDisplay.text = TimeFormat.secondsToBigTimeString(_loc2_);
      }
      
      private function stopTimeTrack() : void
      {
         if(this.timerStarted)
         {
            TimeManager.unregisterTickFunction(this.updateTimer);
            this.timerStarted = false;
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,SHOP.REFRESH_ASSISTANTS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case SHOP.REFRESH_ASSISTANTS:
               this.updateAssistantState();
         }
      }
      
      override protected function setPrice() : void
      {
         super.setPrice();
         if(this.cardData.hideBuyButton)
         {
            card.buyGroup.visible = false;
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.ASSISTANCE,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.ASSISTANCE,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRemove() : void
      {
         if(this.timerStarted)
         {
            this.stopTimeTrack();
         }
      }
      
      override public function onRegister() : void
      {
         this.assistantProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         usePremiumMultiplier = false;
         super.onRegister();
      }
   }
}

