package com.bigpoint.zoomumba.view.cards.custom
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardNumericStepperChangeEvent;
   
   public class RecyclingProduceCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "RecyclingCardMediator_";
      
      public var cardData:MaterialShopData;
      
      private var _lastValue:int;
      
      private var _recyclingProxy:RecyclingProxy;
      
      public var _resourcesProxy:ResourcesProxy;
      
      public var _materialProxy:MaterialProxy;
      
      public function RecyclingProduceCardMediator(param1:MaterialShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.internalType,this.cardData.itemId),param1,new ItemCard());
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         card.topGroup.currentState = "recyclingProduce";
         card.bottomGroup.currentState = "recyclingProduce";
         card.background.currentState = "recycling";
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         var _loc2_:int = this.recyclingProxy.recyclingConfigVo.maxStack;
         var _loc3_:int = this.materialProxy.getMaxMaterial(this.cardData.itemId) - this.cardData.count;
         if(_loc2_ > _loc3_)
         {
            _loc2_ = _loc3_;
         }
         card.bottomGroup.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
         card.bottomGroup.clockDisplay.text = "00:00:00";
         card.bottomGroup.amountStepper.maximum = _loc2_;
         card.bottomGroup.amountStepper.minimum = 1;
         card.bottomGroup.amountStepper.stepSize = 1;
         card.bottomGroup.amountStepper.value = 1;
         this._lastValue = card.bottomGroup.amountStepper.value;
         card.bottomGroup.amountStepperGroup.paddingBottom = -30;
         card.bottomGroup.clockDisplayGroup.paddingBottom = -4;
         this.handleNumericChange();
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent = null) : void
      {
         var _loc2_:Number = this.cardData.craftVirtual * card.bottomGroup.amountStepper.value;
         var _loc3_:Number = this.cardData.craftTrash * card.bottomGroup.amountStepper.value;
         this._lastValue = card.bottomGroup.amountStepper.value;
         var _loc4_:int = this._lastValue * this.cardData.craftDuration;
         card.bottomGroup.clockDisplay.text = TimeFormat.secondsToBigTimeString(_loc4_);
         card.bottomGroup.amountStepper.value = this._lastValue;
         sendNotification(GUINote.RECYCLING_PRODUCE_CARD_STEP_EVENT,this._lastValue);
      }
      
      override protected function onPressActionButton(param1:ButtonAction) : void
      {
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setCardName() : void
      {
         this.cardData.localisedTitle = TextResourceModule.getText(TextIdHelper.getCardName(Categories.MATERIAL,this.cardData.itemId));
         super.setCardName();
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.cardData.count;
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.MATERIAL,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      public function get resourcesProxy() : ResourcesProxy
      {
         if(this._resourcesProxy == null)
         {
            this._resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         }
         return this._resourcesProxy;
      }
      
      public function get recyclingProxy() : RecyclingProxy
      {
         if(this._recyclingProxy == null)
         {
            this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         }
         return this._recyclingProxy;
      }
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.getProxy(MaterialProxy) as MaterialProxy;
         }
         return this._materialProxy;
      }
   }
}

