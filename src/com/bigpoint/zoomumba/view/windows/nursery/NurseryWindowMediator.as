package com.bigpoint.zoomumba.view.windows.nursery
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.component.CardGroupHolder;
   import custom.generic.FillableSpot;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.nursery.NurseryContent;
   import windows.custom.nursery.NurseryWindow;
   
   public class NurseryWindowMediator extends WindowMediator
   {
      public static const NAME:String = "NurseryWindowMediator";
      
      private var _currentLoadStep:int = 0;
      
      private var _assets:Dictionary;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var nurseryProxy:NurseryProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var netProxy:NetProxy;
      
      private var _winParams:NurseryWindowInitParams;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function NurseryWindowMediator(param1:NurseryWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.NURSERY_USE_THIS_BABY,Note.CARD_GROUP_HOLDER_CREATE_CARDS,Note.REFRESH_NURSERY_BUILDING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.NURSERY_USE_THIS_BABY:
               this.useAnimal(param1.getBody() as int);
               break;
            case Note.CARD_GROUP_HOLDER_CREATE_CARDS:
               if(param1.getBody() as int == CardHolderModes.NURSERY)
               {
                  if(this.nurseryProxy.selectedAnimals[0] != -1)
                  {
                     sendNotification(Note.NURSERY_USE_THIS_BABY,this.nurseryProxy.selectedAnimals[0]);
                     sendNotification(SHOP.DISABLE_ALL_SHOPCARDS);
                  }
                  else
                  {
                     sendNotification(SHOP.ENABLE_ALL_SHOPCARDS);
                  }
               }
               break;
            case Note.REFRESH_NURSERY_BUILDING:
               this.refreshNurseryData();
         }
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this._winParams = param1 as NurseryWindowInitParams;
         this.nurseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.window.preloaderVisibility = true;
         this._assets = new Dictionary(true);
         this._currentLoadStep = 0;
         this.content.btnStart.enabled = false;
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_nursery");
         this.content.addEventListener("startClicked",this.handleStart);
         this.window.addEventListener("spotDisposed",this.handleSpotRemoved);
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.nursery.info");
         this.content.btnStart.label = TextResourceModule.getText("zoo.nursery.button.raise");
         AssetLibrary.sendAssetToFunction("BubbleBig",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SoniaRaiseMed",this.handleAssets);
         AssetLibrary.sendAssetToFunction("PatternNurseryWood",this.handleAssets);
      }
      
      private function handleStart(param1:Event) : void
      {
         var _loc2_:InventoryProxy = null;
         if(this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) < this.nurseryProxy.selectedPrice.cnt)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else
         {
            this.window.preloaderVisibility = true;
            _loc2_ = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
            this.netProxy.callServer(NET.START_NURSERY_BREEDING,[this._winParams.uniqueId,_loc2_.getAnimalUid(this.nurseryProxy.selectedAnimals[0])]).addCallbackIfFalse(Note.RESET_NURSERY_BUILDING).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW,"",new NurseryWindowInitParams(Categories.NURSERY,this._winParams.uniqueId))).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH).sendNow();
         }
      }
      
      private function breedingStarted() : void
      {
         this.window.preloaderVisibility = false;
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NURSERY_WINDOW));
      }
      
      private function handleSpotRemoved(param1:Event) : void
      {
         var _loc2_:AnimalShopData = this.itemConfigProxy.getAnimalData((param1.target as FillableSpot).value as int);
         sendNotification(Note.NURSERY_REMOVE_THIS_BABY,_loc2_.itemId);
         sendNotification(SHOP.ENABLE_ALL_SHOPCARDS);
         (param1.target as FillableSpot).value = null;
         this.removeAnimal(_loc2_.itemId);
      }
      
      private function updateSpotsView() : void
      {
         this.content.btnStart.enabled = AutomatorAdvFillableSpot.fillAnimals(this.nurseryProxy.selectedAnimals,this.itemConfigProxy,this.content,"spot",[AutomatorAdvFillableSpot.STATE_ANIMAL_BABY_ADDED]);
         this.content.clock.text = TimeFormat.secondsToTimeString(this.nurseryProxy.selectedRaiseTime);
         if(this.nurseryProxy.selectedPrice.type)
         {
            this.content.money.visible = true;
            this.content.money.value = this.nurseryProxy.selectedPrice.cnt;
            this.content.money.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this.nurseryProxy.selectedPrice.type),this.nurseryProxy.selectedPrice.id),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,25));
         }
         else
         {
            this.content.money.visible = false;
         }
      }
      
      private function useAnimal(param1:int) : void
      {
         this.nurseryProxy.selectedAnimals = new <int>[param1];
         var _loc2_:AnimalSpeciesVO = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(param1);
         ObjectHelper.copyData(this.nurseryProxy.selectedPrice,_loc2_.raisingCost[0]);
         ObjectHelper.copyData(this.nurseryProxy.raiseInstantPrice,_loc2_.raisingDirectCost[0]);
         this.nurseryProxy.selectedRaiseTime = _loc2_.raisingTime;
         this.updateSpotsView();
      }
      
      private function removeAnimal(param1:int) : void
      {
         this.nurseryProxy.dispose();
         this.updateSpotsView();
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.NURSERY.toString());
         }
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.cardGroupHolder,CardHolderModes.NURSERY);
         this.cardGroupHolderMediator.currentPage = 0;
         if(!facade.hasMediator(CardGroupHolderMediator.NAME))
         {
            facade.registerMediator(this.cardGroupHolderMediator);
         }
         this.drawCards();
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.cardGroupHolderMediator.mode = CardHolderModes.NURSERY;
         this.cardGroupHolderMediator.dataProvider = this.nurseryProxy.getCardsForBabys();
         this.cardGroupHolderMediator.currentPage = 0;
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "BubbleBig":
            case "BubbleBig.swf":
               this._assets["BubbleBig"] = param1.getEmbededBitmapData("BubbleBig");
               break;
            case "SoniaRaiseMed":
            case "SoniaRaiseMed.swf":
               this._assets["SoniaRaiseMed"] = param1.getEmbededBitmapData("SoniaRaiseMed");
               break;
            case "PatternNurseryWood":
            case "PatternNurseryWood":
               this.window.backgroundPattern = param1.getEmbededObject("PatternNurseryWood").constructor;
         }
         if(++this._currentLoadStep == 3)
         {
            this.start();
         }
      }
      
      private function start() : void
      {
         this.netProxy.callServer(NET.GET_SPECIALS_DATA,[]).addCallbackIfFalse(Note.RESET_NURSERY_BUILDING).addCallbackIfTrue(Note.REFRESH_NURSERY_BUILDING).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH).sendNow();
      }
      
      private function refreshNurseryData() : void
      {
         if(this.nurseryProxy.currentState == NurseryProxy.STATE_RUNNING)
         {
            this.breedingStarted();
         }
         else
         {
            this.nurseryFullyInitiated();
         }
      }
      
      private function nurseryFullyInitiated() : void
      {
         this.window.preloaderVisibility = false;
         this.content.bubble.displayClass = this._assets["BubbleBig"];
         this.content.sonia.displayClass = this._assets["SoniaRaiseMed"];
         this.initCardGroupHolder();
      }
      
      override public function onRemove() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.NURSERY.toString());
         }
      }
      
      override public function dispose() : void
      {
         this.content.removeEventListener("startClicked",this.handleStart);
         this.window.removeEventListener("spotDisposed",this.handleSpotRemoved);
      }
      
      private function get cardGroupHolder() : CardGroupHolder
      {
         return this.content.cardGroupHolder as CardGroupHolder;
      }
      
      private function get content() : NurseryContent
      {
         return this.window.getContent() as NurseryContent;
      }
      
      private function get window() : NurseryWindow
      {
         return this.viewComponent as NurseryWindow;
      }
   }
}

