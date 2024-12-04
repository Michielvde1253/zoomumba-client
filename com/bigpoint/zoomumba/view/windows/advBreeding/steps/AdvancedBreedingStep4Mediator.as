package com.bigpoint.zoomumba.view.windows.advBreeding.steps
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep3;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep4;
   
   public class AdvancedBreedingStep4Mediator extends Mediator
   {
      public static const NAME:String = "AdvancedBreedingStep4Mediator";
      
      private var _window:AdvancedBreedingWindow;
      
      private var _winParams:AdvancedBreedingWindowInitParams;
      
      private var breedingLabProxy:BreedingLabProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      public function AdvancedBreedingStep4Mediator(param1:AdvancedBreedingWindow, param2:AdvancedBreedingStep4, param3:AdvancedBreedingWindowInitParams)
      {
         this._window = param1;
         this._winParams = param3;
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this._window.preloaderVisibility = false;
         this.breedingLabProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,this._winParams.categoryId,this._winParams.uniqueId)) as BreedingLabProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.content.addEventListener("goBackClicked",this.handleGoBack);
         this.content.addEventListener("startClicked",this.handleStart);
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.advancedBreed.info.4");
         this.content.gradientText.htmlText = TextResourceModule.getText("zoo.advancedBreed.summary");
         this.content.btnStart.label = TextResourceModule.getText("zoo.advancedBreed.button.start");
         this.content.btnGoBack.label = TextResourceModule.getText("zoo.window.general.prev");
         this.content.labelClock.text = TimeFormat.secondsToTimeString(this.breedingLabProxy.selectedBreedingTime);
         var _loc1_:ItemServerVO = this.breedingLabProxy.breedingPrice;
         this.content.labelPrice.value = _loc1_.cnt;
         this.content.labelPrice.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(_loc1_.type),_loc1_.id),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,30));
         AutomatorAdvFillableSpot.fillAnimals(this.breedingLabProxy.selectedAnimals,this.itemConfigProxy,this.content,"spotAnimal",[AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_MALE,AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_FEMALE]);
         AutomatorAdvFillableSpot.fillChance(this.breedingLabProxy.selectedChanceItems,this.content,"spotChance",AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY,true);
      }
      
      private function handleGoBack(param1:Event) : void
      {
         this._window.content = AdvancedBreedingStep3;
      }
      
      private function handleStart(param1:Event) : void
      {
         if(this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) < this.breedingLabProxy.breedingPrice.cnt)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else
         {
            sendNotification(Note.START_ADVANCED_BREEDING,this._winParams);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_WINDOW));
         }
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("goBackClicked",this.handleGoBack);
         this.content.removeEventListener("startClicked",this.handleStart);
      }
      
      private function get content() : AdvancedBreedingStep4
      {
         return this.viewComponent as AdvancedBreedingStep4;
      }
   }
}

