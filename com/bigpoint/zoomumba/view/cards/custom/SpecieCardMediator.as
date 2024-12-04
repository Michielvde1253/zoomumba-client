package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenMax;
   import components.arrow.TutorialArrowAnim;
   import custom.card.core.AbstractCard;
   import custom.card.custom.SpecieCard;
   import custom.card.events.CardEvent;
   import custom.card.events.CardSexChangeEvent;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   
   public class SpecieCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "SpecieCardMediator_";
      
      public var cardData:AnimalSpeciesVO;
      
      public function SpecieCardMediator(param1:AnimalSpeciesVO)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,Categories.SPECIES,this.cardData.itemId),param1,new SpecieCard());
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.rightGroup.currentState = "switchSex";
         card.rightGroup.addEventListener("componentUpdateComplete",this.handleSexComponentCreation);
      }
      
      private function handleSexComponentCreation(param1:Event) : void
      {
         this.setLastSexSelected();
      }
      
      override protected function handleSexChangedClicked(param1:CardSexChangeEvent) : void
      {
         this.cardData.isMaleSelected = param1.isMale;
         this.cardData.selectedId = this.getSelectedAnimalId(param1.isMale);
         card.addContent(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.cardData.selectedId),AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc2_:TutorialArrowAnim = null;
         var _loc3_:TutorialArrowAnim = null;
         if(Settings.TUTORIAL_ACTIVE)
         {
            if(TutorialInjectionManager.getInstance().parrotMalePlaced && !TutorialInjectionManager.getInstance().parrotFemalePlaced)
            {
               if(!this.cardData.isMaleSelected)
               {
                  super.handleBuyClicked(param1);
                  return;
               }
               _loc2_ = new TutorialArrowAnim();
               _loc2_.rotation = 90;
               _loc2_.x = 200;
               _loc2_.y = -30;
               card.content.addElement(_loc2_);
               return;
            }
            if(TutorialInjectionManager.getInstance().parrotFemalePlaced && !TutorialInjectionManager.getInstance().parrotMalePlaced)
            {
               if(this.cardData.isMaleSelected)
               {
                  super.handleBuyClicked(param1);
                  return;
               }
               _loc3_ = new TutorialArrowAnim();
               _loc3_.rotation = 90;
               _loc3_.x = 200;
               _loc3_.y = 36;
               card.content.addElement(_loc3_);
               return;
            }
         }
         super.handleBuyClicked(param1);
      }
      
      override protected function setLastSexSelected() : void
      {
         card.rightGroup.radioButtonSexGroup.selectedValue = this.cardData.isMaleSelected ? 1 : 0;
         card.addContent(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.cardData.selectedId),AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override protected function setTutorialState() : void
      {
         if(this.cardData.speciesId != 1)
         {
            card.enabled = false;
            TweenMax.to(card,0,{"colorMatrixFilter":{"saturation":0}});
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED];
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(Categories.ANIMAL);
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
         var _loc1_:String = TextIdHelper.getCardName(Categories.SPECIES,this.cardData.speciesId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         if(Settings.DEBUG_MODE)
         {
            if(this.cardData.speciesId == 96)
            {
            }
            this.cardData.localisedTitle += "\n" + this.cardData.itemId.toString();
         }
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.SPECIES,this.cardData.speciesId,this.cardData.genusId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.maleAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,this.cardData.animalIds[0]);
         this.cardData.femaleAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,this.cardData.animalIds[1]);
         this.cardData.childAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,this.cardData.animalIds[2]);
      }
      
      private function getSelectedAnimalId(param1:Boolean) : int
      {
         if(param1)
         {
            return this.cardData.animalIds[0];
         }
         return this.cardData.animalIds[1];
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         card.rightGroup.removeEventListener("componentUpdateComplete",this.handleSexComponentCreation);
         super.onRemove();
      }
   }
}

