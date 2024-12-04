package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenMax;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import custom.card.events.CardNumericStepperChangeEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.FlexGlobals;
   import mx.events.FlexEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class ResourceCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "ResourceCardMediator_";
      
      public var cardData:ResourceShopData;
      
      private var resourcesProxy:ResourcesProxy;
      
      public function ResourceCardMediator(param1:ResourceShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.topGroup.currentState = "counter";
         card.bottomGroup.currentState = "amount";
         card.bottomGroup.amountStepper.addEventListener(FlexEvent.CREATION_COMPLETE,this.configurateStepper);
         param1.content.verticalCenter = -3;
         usePremiumMultiplier = false;
         card.bottomGroup.amountStepper.value = 1;
         card.bottomGroup.amountStepper.minimum = 1;
         card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleAmountChanged);
      }
      
      private function configurateStepper(param1:FlexEvent) : void
      {
         if(card)
         {
            card.bottomGroup.amountStepper.textDisplay.editable = card.buyGroup.button.enabled;
            card.bottomGroup.amountStepper.textDisplay.addEventListener(MouseEvent.CLICK,this.handleInputValue);
            card.bottomGroup.amountStepper.textDisplay.addEventListener("textChanged",this.updateFromInput);
         }
      }
      
      private function handleInputValue(param1:MouseEvent) : void
      {
         card.bottomGroup.amountStepper.textDisplay.selectAll();
      }
      
      private function updateFromInput(param1:Event) : void
      {
         var _loc2_:int = int(String(card.bottomGroup.amountStepper.textDisplay.text).replace(".",""));
         if(_loc2_ >= card.bottomGroup.amountStepper.maximum)
         {
            (FlexGlobals.topLevelApplication as Zoomumba).stage.focus = (FlexGlobals.topLevelApplication as Zoomumba).stage;
         }
         else
         {
            card.bottomGroup.amountStepper.value = _loc2_;
         }
         card.bottomGroup.dispatchEvent(new CardNumericStepperChangeEvent(CardNumericStepperChangeEvent.CHANGED,_loc2_));
      }
      
      private function handleAmountChanged(param1:CardNumericStepperChangeEvent) : void
      {
         if(this.cardData.buyReal > 0)
         {
            card.buyGroup.button.label.text = String(param1.value * this.cardData.buyReal);
         }
         else
         {
            card.buyGroup.button.label.text = String(param1.value * this.cardData.buyVirtual);
         }
         this.updatePrice(int(card.buyGroup.button.label.text));
      }
      
      protected function updatePrice(param1:int) : void
      {
         var _loc2_:* = false;
         if(this.cardData.getBuyVirtual() > 0)
         {
            _loc2_ = currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= param1;
            this.cardData.price.userCanBuy = _loc2_;
            showBuyButton(param1,_loc2_ ? "normal" : "pale",this.canBuy > 0,true,Categories.USER,UserResources.VIRTUAL_MONEY);
         }
         else if(this.cardData.getBuyReal() > 0)
         {
            _loc2_ = currencyProxy.getCurrency(UserResources.REAL_MONEY) >= this.cardData.getBuyReal();
            this.cardData.price.userCanBuy = _loc2_;
            showBuyButton(param1,_loc2_ ? "normal" : "pale",this.canBuy > 0,true,Categories.USER,UserResources.REAL_MONEY);
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return super.listNotificationInterests().concat([SHOP.REFRESH_RESOURCES]);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case SHOP.REFRESH_RESOURCES:
               this.setResourceAmount();
         }
      }
      
      override protected function setTutorialState() : void
      {
         if(this.cardData.itemId != 5)
         {
            card.enabled = false;
            TweenMax.to(card,0,{"colorMatrixFilter":{"saturation":0}});
         }
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc2_:int = 0;
         if(this.cardData.getBuyReal() > 0)
         {
            _loc2_ = 1;
         }
         if(this.canBuy > 0)
         {
            if(Settings.TUTORIAL_ACTIVE)
            {
               TutorialInjectionManager.getInstance().shopItemSelected(null);
            }
            this.cardData.itemsSelectedForBuy = this.canBuy;
            super.handleBuyClicked(param1);
         }
      }
      
      private function get canBuy() : int
      {
         var _loc1_:int = int(String(card.bottomGroup.amountStepper.value).replace(".",""));
         var _loc2_:int = this.resourcesProxy.getMaxResourse(this.cardData.itemId);
         if(_loc2_ == 0)
         {
            _loc2_ = this.cardData.baseCap;
         }
         var _loc3_:int = int(String(card.bottomGroup.amountStepper.value).replace(".",""));
         if(card.topGroup.counter.value + _loc1_ > _loc2_)
         {
            _loc3_ = _loc2_ - card.topGroup.counter.value;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         return _loc3_;
      }
      
      private function guessAction(param1:int) : void
      {
         card.topGroup.counter.value += param1;
      }
      
      override protected function setResourceAmount() : void
      {
         card.topGroup.counter.value = this.resourcesProxy.getResourseAmmount(this.cardData.itemId);
         if(this.resourcesProxy.getResourseAmmount(this.cardData.itemId) >= this.resourcesProxy.getMaxResourse(this.cardData.itemId))
         {
            card.buyGroup.button.enabled = false;
            if(card.bottomGroup.amountStepper.textDisplay)
            {
               card.bottomGroup.amountStepper.textDisplay.editable = false;
            }
         }
         card.bottomGroup.amountStepper.maximum = this.resourcesProxy.getMaxResourse(this.cardData.itemId) - this.resourcesProxy.getResourseAmmount(this.cardData.itemId);
         this.updatePrice(card.buyGroup.button.label.value);
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.RESOURCES,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.RESOURCES,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         if(card.bottomGroup.amountStepper.textDisplay)
         {
            if(card.bottomGroup.amountStepper.textDisplay.hasEventListener(MouseEvent.CLICK))
            {
               card.bottomGroup.amountStepper.textDisplay.removeEventListener(MouseEvent.CLICK,this.handleInputValue);
            }
            if(card.bottomGroup.amountStepper.textDisplay.hasEventListener("textChanged"))
            {
               card.bottomGroup.amountStepper.textDisplay.removeEventListener("textChanged",this.updateFromInput);
            }
            if(card.bottomGroup.amountStepper.hasEventListener(FlexEvent.CREATION_COMPLETE))
            {
               card.bottomGroup.amountStepper.removeEventListener(FlexEvent.CREATION_COMPLETE,this.configurateStepper);
            }
         }
         super.onRemove();
      }
   }
}

