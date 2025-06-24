package com.bigpoint.zoomumba.view.windows.advBreeding.steps
{
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.generic.FillableSpot;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep2;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep3;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep4;
   
   public class AdvancedBreedingStep3Mediator extends Mediator
   {
      public static const NAME:String = "AdvancedBreedingStep3Mediator";
      
      private var _window:AdvancedBreedingWindow;
      
      private var _showWarning:Boolean = true;
      
      private var _winParams:AdvancedBreedingWindowInitParams;
      
      private var breedingLabProxy:BreedingLabProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function AdvancedBreedingStep3Mediator(param1:AdvancedBreedingWindow, param2:AdvancedBreedingStep3, param3:AdvancedBreedingWindowInitParams)
      {
         this._window = param1;
         this._winParams = param3;
         super(NAME,param2);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ADVANCED_BREEDING_ADD_CHANCE_ITEM,Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM,Note.CARD_GROUP_HOLDER_CREATE_CARDS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Object = null;
         switch(param1.getName())
         {
            case Note.ADVANCED_BREEDING_ADD_CHANCE_ITEM:
               this.useChanceItem(param1.getBody() as Object);
               break;
            case Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM:
               this.removeChanceItem(param1.getBody() as Object);
               break;
            case Note.CARD_GROUP_HOLDER_CREATE_CARDS:
               if(param1.getBody() as int == CardHolderModes.BREEDING_LAB_STEP_3)
               {
                  _loc2_ = true;
                  for each(_loc3_ in this.breedingLabProxy.selectedChanceItems)
                  {
                     if(_loc3_ != null)
                     {
                        sendNotification(Note.ADVANCED_BREEDING_USED_CHANCE_ITEM,_loc3_);
                     }
                     _loc2_ &&= _loc3_ != null;
                  }
                  if(_loc2_)
                  {
                     sendNotification(SHOP.DISABLE_ALL_SHOPCARDS);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this._window.preloaderVisibility = false;
         this._showWarning = true;
         this.breedingLabProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,this._winParams.categoryId,this._winParams.uniqueId)) as BreedingLabProxy;
         this.content.addEventListener("goBackClicked",this.handleGoBack);
         this.content.addEventListener("continueClicked",this.handleContinue);
         this._window.addEventListener("spotDisposed",this.handleSpotRemoved);
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.advancedBreed.info.3");
         this.content.btnContinue.label = TextResourceModule.getText("zoo.window.general.next");
         this.content.btnGoBack.label = TextResourceModule.getText("zoo.window.general.prev");
         this.initCardGroupHolder();
         this.updateSpotsView();
      }
      
      private function handleSpotRemoved(param1:Event) : void
      {
         var _loc2_:Object = (param1.target as FillableSpot).value as Object;
         sendNotification(Note.ADVANCED_BREEDING_REMOVE_CHANCE_ITEM,_loc2_);
         (param1.target as FillableSpot).value = null;
         this.updateSpotsView();
      }
      
      private function updateSpotsView() : void
      {
         var _loc1_:Object = null;
         if(AutomatorAdvFillableSpot.fillChance(this.breedingLabProxy.selectedChanceItems,this.content,"spot",AutomatorAdvFillableSpot.STATE_ITEM_ADDED))
         {
            sendNotification(SHOP.DISABLE_ALL_SHOPCARDS);
         }
         this._showWarning = true;
         for each(_loc1_ in this.breedingLabProxy.selectedChanceItems)
         {
            if(_loc1_ != null)
            {
               this._showWarning = false;
               break;
            }
         }
      }
      
      private function useChanceItem(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.breedingLabProxy.selectedChanceItems.length);
         while(_loc2_ < _loc3_)
         {
            if(this.breedingLabProxy.selectedChanceItems[_loc2_] == null)
            {
               this.breedingLabProxy.selectedChanceItems[_loc2_] = param1;
               this.breedingLabProxy.selectedChanceItems[_loc2_].index = _loc2_;
               break;
            }
            _loc2_++;
         }
         this.updateSpotsView();
      }
      
      private function removeChanceItem(param1:Object) : void
      {
         if(this.breedingLabProxy.selectedChanceItems[param1.index])
         {
            this.breedingLabProxy.selectedChanceItems[param1.index] = null;
         }
         sendNotification(SHOP.ENABLE_ALL_SHOPCARDS);
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_LAB_STEP_3.toString());
         }
         this.content.cardGroupHolder.paginator.entriesPerPage = 4;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.BREEDING_LAB_STEP_3);
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
         this.cardGroupHolderMediator.mode = CardHolderModes.BREEDING_LAB_STEP_3;
         this.cardGroupHolderMediator.dataProvider = this.breedingLabProxy.getCardsForStep3();
         this.cardGroupHolderMediator.currentPage = 0;
      }
      
      private function handleGoBack(param1:Event) : void
      {
         this._window.content = AdvancedBreedingStep2;
      }
      
      private function handleContinue(param1:Event) : void
      {
         if(this._showWarning)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.advancedBreed.layer.noItems")),new WindowParams("",null,"",null,Note.ADVANCED_BREEDING_SWITCH_STEP,3)));
         }
         else
         {
            this._window.content = AdvancedBreedingStep4;
         }
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("goBackClicked",this.handleGoBack);
         this.content.removeEventListener("continueClicked",this.handleContinue);
         this._window.removeEventListener("spotDisposed",this.handleSpotRemoved);
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_LAB_STEP_3.toString());
         }
      }
      
      private function get content() : AdvancedBreedingStep3
      {
         return this.viewComponent as AdvancedBreedingStep3;
      }
   }
}

