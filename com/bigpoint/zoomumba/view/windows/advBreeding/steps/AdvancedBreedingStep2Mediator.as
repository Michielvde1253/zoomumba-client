package com.bigpoint.zoomumba.view.windows.advBreeding.steps
{
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.card.component.CardGroupHolder;
   import custom.generic.FillableSpot;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep1;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep2;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep3;
   
   public class AdvancedBreedingStep2Mediator extends Mediator
   {
      public static const NAME:String = "AdvancedBreedingStep2Mediator";
      
      private var _window:AdvancedBreedingWindow;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var breedingLabProxy:BreedingLabProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _winParams:AdvancedBreedingWindowInitParams;
      
      public function AdvancedBreedingStep2Mediator(param1:AdvancedBreedingWindow, param2:AdvancedBreedingStep2, param3:AdvancedBreedingWindowInitParams)
      {
         this._window = param1;
         this._winParams = param3;
         super(NAME,param2);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ADVANCED_BREEDING_ADD_ANIMAL,Note.CARD_GROUP_HOLDER_CREATE_CARDS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.ADVANCED_BREEDING_ADD_ANIMAL:
               this.useAnimal(param1.getBody() as int);
               break;
            case Note.CARD_GROUP_HOLDER_CREATE_CARDS:
               if(param1.getBody() as int == CardHolderModes.BREEDING_LAB_STEP_2)
               {
                  this.updateCardsViaNotification();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this._window.preloaderVisibility = false;
         this.breedingLabProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,this._winParams.categoryId,this._winParams.uniqueId)) as BreedingLabProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.content.addEventListener("goBackClicked",this.handleGoBack);
         this.content.addEventListener("continueClicked",this.handleContinue);
         this._window.addEventListener("spotDisposed",this.handleSpotRemoved);
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.advancedBreed.info.2");
         this.content.btnContinue.label = TextResourceModule.getText("zoo.window.general.next");
         this.content.btnGoBack.label = TextResourceModule.getText("zoo.window.general.prev");
         this.content.clock.text = TimeFormat.secondsToTimeString(this.breedingLabProxy.selectedBreedingTime);
         this.content.btnContinue.enabled = false;
         this.initCardGroupHolder();
         this.updateSpotsView();
      }
      
      private function handleSpotRemoved(param1:Event) : void
      {
         var _loc2_:AnimalShopData = this.itemConfigProxy.getAnimalData((param1.target as FillableSpot).value as int);
         sendNotification(Note.ADVANCED_BREEDING_REMOVE_ANIMAL,_loc2_.itemId);
         sendNotification(Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE,[_loc2_.male,true]);
         (param1.target as FillableSpot).value = null;
         this.removeAnimal(_loc2_.itemId);
      }
      
      private function updateSpotsView() : void
      {
         this.content.btnContinue.enabled = AutomatorAdvFillableSpot.fillAnimals(this.breedingLabProxy.selectedAnimals,this.itemConfigProxy,this.content,"spot",[AutomatorAdvFillableSpot.STATE_ANIMAL_MALE_ADDED,AutomatorAdvFillableSpot.STATE_ANIMAL_FEMALE_ADDED]);
         this.content.clock.text = TimeFormat.secondsToTimeString(this.breedingLabProxy.selectedBreedingTime);
         this.updateCardsViaNotification(true);
      }
      
      private function useAnimal(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.breedingLabProxy.selectedAnimals.length);
         while(_loc2_ < _loc3_)
         {
            if(this.breedingLabProxy.selectedAnimals[_loc2_] == -1)
            {
               this.breedingLabProxy.selectedAnimals[_loc2_] = param1;
               break;
            }
            _loc2_++;
         }
         this.updateSpotsView();
      }
      
      private function removeAnimal(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.breedingLabProxy.selectedAnimals.length)
         {
            if(this.breedingLabProxy.selectedAnimals[_loc2_] == param1)
            {
               this.breedingLabProxy.selectedAnimals[_loc2_] = -1;
               break;
            }
            _loc2_++;
         }
         this.updateSpotsView();
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_LAB_STEP_2.toString());
         }
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.cardGroupHolder,CardHolderModes.BREEDING_LAB_STEP_2);
         this.cardGroupHolderMediator.currentPage = 0;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.drawCards();
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.cardGroupHolderMediator.mode = CardHolderModes.BREEDING_LAB_STEP_2;
         this.cardGroupHolderMediator.dataProvider = this.breedingLabProxy.getCardsForStep2();
         this.cardGroupHolderMediator.currentPage = 0;
         this.updateCardsViaNotification();
      }
      
      private function updateCardsViaNotification(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         for each(_loc2_ in this.breedingLabProxy.selectedAnimals)
         {
            if(_loc2_ != -1)
            {
               sendNotification(Note.ADVANCED_BREEDING_UPDATE_BUTTON_STATE,[this.itemConfigProxy.getAnimalData(_loc2_).male,false]);
               if(!param1)
               {
                  sendNotification(Note.ADVANCED_BREEDING_USED_ANIMALS,_loc2_);
               }
            }
         }
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("goBackClicked",this.handleGoBack);
         this.content.removeEventListener("continueClicked",this.handleContinue);
         this._window.removeEventListener("spotDisposed",this.handleSpotRemoved);
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_LAB_STEP_2.toString());
         }
      }
      
      private function handleGoBack(param1:Event) : void
      {
         this._window.content = AdvancedBreedingStep1;
      }
      
      private function handleContinue(param1:Event) : void
      {
         this._window.content = AdvancedBreedingStep3;
      }
      
      private function get cardGroupHolder() : CardGroupHolder
      {
         return this.content.cardGroupHolder as CardGroupHolder;
      }
      
      private function get content() : AdvancedBreedingStep2
      {
         return this.viewComponent as AdvancedBreedingStep2;
      }
   }
}

