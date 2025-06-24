package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.settings.PremiumPackShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardNumericStepperChangeEvent;
   import mx.events.FlexEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class PremiumPackCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "PremiumPackCardMediator_";
      
      public var cardData:PremiumPackShopData;
      
      public function PremiumPackCardMediator(param1:PremiumPackShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.buyGroup.button.currentState = "normal";
         card.bottomGroup.currentState = "amount";
         card.bottomGroup.amountStepper.valueFormatFunction = this.stepperFormatter;
         card.bottomGroup.amountStepper.valueParseFunction = this.valueParseFunction;
         card.bottomGroup.amountStepper.maximum = this.cardData.packPrices.prices.length - 1;
         card.bottomGroup.amountStepper.minimum = 0;
         card.bottomGroup.amountStepper.value = 0;
         card.bottomGroup.amountStepper.stepSize = 1;
         card.bottomGroup.amountStepper.width = 100;
         card.bottomGroup.amountStepper.addEventListener(FlexEvent.CREATION_COMPLETE,this.configurateStepper);
         this.cardData.selectedType = 1;
         this.updatePrice();
      }
      
      private function configurateStepper(param1:FlexEvent) : void
      {
         card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent) : void
      {
         this.cardData.selectedType = param1.value + 1;
         this.cardData.buyReal = this.cardData.packPrices.prices[param1.value];
         card.buyGroup.button.label.text = this.cardData.packPrices.prices[param1.value];
      }
      
      public function stepperFormatter(param1:int) : String
      {
         return String(this.cardData.packReward.prices[param1]);
      }
      
      public function valueParseFunction(param1:String) : int
      {
         return int(this.cardData.packReward.prices.indexOf(int(param1)));
      }
      
      private function updatePrice() : void
      {
         this.cardData.buyReal = this.cardData.packPrices.prices[this.cardData.selectedType - 1];
         card.buyGroup.button.label.text = this.cardData.buyReal.toString();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.RESOURCES,this.textId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.RESOURCES,this.textId);
      }
      
      override protected function setPrice() : void
      {
         super.setPrice();
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = "pack_preview_" + this.assetId;
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      private function get assetId() : int
      {
         switch(this.cardData.itemId)
         {
            case 31:
               return 1;
            case 32:
               return 4;
            case 33:
               return 5;
            case 34:
               return 6;
            default:
               return 1;
         }
      }
      
      private function get textId() : int
      {
         switch(this.cardData.itemId)
         {
            case 31:
               return 8;
            case 32:
               return 10;
            case 33:
               return 11;
            case 34:
               return 12;
            default:
               return 1;
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
      }
   }
}

