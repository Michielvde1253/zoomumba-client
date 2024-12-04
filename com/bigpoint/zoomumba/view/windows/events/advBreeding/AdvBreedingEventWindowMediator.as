package com.bigpoint.zoomumba.view.windows.events.advBreeding
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.events.advBreeding.AdvBreedingEventProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.advBreeding.AdvBreedingEventContent;
   import windows.custom.events.advBreeding.AdvBreedingEventWindow;
   
   public class AdvBreedingEventWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvBreedingEventWindowMediator";
      
      private var advBreedingEventProxy:AdvBreedingEventProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var resourceLoaderProxy:ResourceLoaderProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function AdvBreedingEventWindowMediator(param1:AdvBreedingEventWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.advBreedingEventProxy = facade.retrieveProxy(AdvBreedingEventProxy.NAME) as AdvBreedingEventProxy;
         this.resourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
      }
      
      override public function onRemove() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_EVENT.toString());
         }
         this.advBreedingEventProxy.reset();
         this.content.removeEventListener("tradeClicked",this.handleTrade);
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_trade");
         var _loc2_:ItemConfigProxy = facade.getProxy(ItemConfigProxy);
         var _loc3_:AnimalSpeciesVO = _loc2_.getShopAnimalSpecie(this.advBreedingEventProxy.currencies[0].id);
         var _loc4_:String = TextIdHelper.getCardName(this.advBreedingEventProxy.currencies[0].category,this.advBreedingEventProxy.currencies[0].id);
         var _loc5_:String = TextIdHelper.getCardName(this.advBreedingEventProxy.currencies[0].category,this.advBreedingEventProxy.currencies[0].id,_loc3_.genusId);
         var _loc6_:String = TextIdHelper.getName(this.advBreedingEventProxy.rewards[0].category,this.advBreedingEventProxy.rewards[0].id);
         this.content.textBubble.text = TextResourceModule.getTextReplaced("zoo.eventABtrade.layer.intro",new <TextReplace>[new TextReplace("%rewardSpecies%",_loc6_),new TextReplace("%priceSpecies%",_loc4_),new TextReplace("%priceGenus%",_loc5_)]);
         this.content.btnTrade.label = TextResourceModule.getText("zoo.eventABtrade.button.trade");
         this.resourceLoaderProxy.bulkLoad("advBreedingEvent",new <String>["BubbleBig.swf","AdvBreedingEvent.swf","JeanMed.swf"],this.handleResourcesLoaded);
         this.content.groupSex.addEventListener(Event.CHANGE,this.drawCards);
         this.content.groupSex.selectedValue = this.advBreedingEventProxy.selectedGender;
         this.content.btnTrade.enabled = false;
         this.content.addEventListener("tradeClicked",this.handleTrade);
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         this.initCardGroupHolder();
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_NEWS_WINDOW));
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.BREEDING_EVENT.toString());
         }
         this.content.cardGroupHolder.paginator.entriesPerPage = 4;
         this.content.cardGroupHolder.layoutDisplay.horizontalGap = 130;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.BREEDING_EVENT);
         this.cardGroupHolderMediator.currentPage = 0;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.drawCards();
      }
      
      private function drawCards(param1:Event = null) : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.advBreedingEventProxy.selectedGender = int(this.content.groupSex.selectedValue);
         var _loc2_:Vector.<Object> = this.advBreedingEventProxy.getCards();
         this.cardGroupHolderMediator.mode = CardHolderModes.BREEDING_EVENT;
         this.cardGroupHolderMediator.dataProvider = _loc2_;
         this.cardGroupHolderMediator.currentPage = 0;
         this.content.btnTrade.enabled = this.advBreedingEventProxy.canTrade;
      }
      
      private function handleResourcesLoaded(param1:Dictionary) : void
      {
         var _loc2_:SWFAsset = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.id)
            {
               case "BubbleBig.swf":
                  this.content.bubble.displayClass = _loc2_.getEmbededBitmapData("BubbleBig");
                  break;
               case "AdvBreedingEvent.swf":
                  this.content.arrow.displayClass = _loc2_.getEmbededBitmapData("TradeArrows");
                  break;
               case "JeanMed.swf":
                  this.content.jean.displayClass = _loc2_.getEmbededBitmapData("JeanMed");
                  break;
            }
         }
         this.window.preloaderVisibility = false;
      }
      
      private function handleTrade(param1:Event) : void
      {
         sendNotification(NET.ADVANCED_BREEDING_EVENT_REDEEM,[this.advBreedingEventProxy.selectedUniqueIDs]);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADV_BREEDING_EVENT_WINDOW));
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADV_BREEDING_EVENT_REWARD_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.animalInInventory.text"),this.advBreedingEventProxy.reward)));
      }
      
      private function get content() : AdvBreedingEventContent
      {
         return this.window.getContent() as AdvBreedingEventContent;
      }
      
      private function get window() : AdvBreedingEventWindow
      {
         return this.viewComponent as AdvBreedingEventWindow;
      }
   }
}

