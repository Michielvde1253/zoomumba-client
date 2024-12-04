package com.bigpoint.zoomumba.view.windows.advBreeding.steps
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.advBreed.GenusConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep1;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep2;
   
   public class AdvancedBreedingStep1Mediator extends Mediator
   {
      public static const NAME:String = "AdvancedBreedingStep1Mediator";
      
      private var _window:AdvancedBreedingWindow;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var genusProxy:GenusConfigProxy;
      
      private var genusIds:Vector.<int>;
      
      private var bredingLabProxy:BreedingLabProxy;
      
      private var _winParams:AdvancedBreedingWindowInitParams;
      
      public function AdvancedBreedingStep1Mediator(param1:AdvancedBreedingWindow, param2:AdvancedBreedingStep1, param3:AdvancedBreedingWindowInitParams)
      {
         this._window = param1;
         this._winParams = param3;
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this._window.preloaderVisibility = false;
         this.genusProxy = facade.retrieveProxy(GenusConfigProxy.NAME) as GenusConfigProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.bredingLabProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,this._winParams.categoryId,this._winParams.uniqueId)) as BreedingLabProxy;
         this.content.addEventListener("continueClicked",this.handleContinue);
         this.content.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePaginator);
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.advancedBreed.info.1");
         this.content.btnContinue.label = TextResourceModule.getText("zoo.window.general.next");
         this.genusIds = this.genusProxy.getGenusAdvBreedingids();
         this.content.paginator.maxEntries = this.genusIds.length;
         this.content.paginator.currentPage = this.bredingLabProxy.selectedGenusPage;
      }
      
      private function handlePaginator(param1:PaginatorEvent) : void
      {
         if(this.bredingLabProxy.selectedGenus != this.genusIds[param1.page])
         {
            this.bredingLabProxy.dispose();
            this.bredingLabProxy.selectedGenusPage = param1.page;
            this.bredingLabProxy.selectedGenus = this.genusIds[param1.page];
         }
         this.content.circularDisplay.automaticCentralize = false;
         this.content.circularDisplay.paddingDisplayX = 0;
         this.content.circularDisplay.paddingDisplayY = 0;
         this.content.circularDisplay.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.itemConfigProxy.getMaleAnimalData(this.genusProxy.getSpecieByTier(this.bredingLabProxy.selectedGenus)).itemId),AssetConfig.DEFAULT_CIRCLE_SPR,0,120,-1,1);
      }
      
      private function handleContinue(param1:Event) : void
      {
         this._window.content = AdvancedBreedingStep2;
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("continueClicked",this.handleContinue);
      }
      
      private function get content() : AdvancedBreedingStep1
      {
         return this.viewComponent as AdvancedBreedingStep1;
      }
   }
}

