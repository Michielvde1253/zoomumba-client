package com.bigpoint.zoomumba.view.windows.babyCaravan
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import windows.core.AbstractWindow;
   import windows.custom.babyCaravan.BabyCaravanContent;
   import windows.custom.babyCaravan.BabyCaravanWindow;
   
   public class BabyCaravanWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BabyCaravanWindowMediator";
      
      private var caravanProxy:BabyCaravanProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private const ASSET_BUNDLE_LOAD:int = 3;
      
      private var currentAssetsLoaded:int = 0;
      
      public function BabyCaravanWindowMediator(param1:AbstractWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.currentAssetsLoaded = 0;
         this.caravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         AssetLibrary.sendAssetToFunction("PatternBabyCaravanWood",this.handleAssets);
         AssetLibrary.sendAssetToFunction("BubbleBabyCaravan",this.handleAssets);
         AssetLibrary.sendAssetToFunction("BabyCaravanComponents",this.handleAssets);
         var _loc2_:String = this.caravanProxy.animalName;
         this.content.speechBubbleText.text = TextResourceModule.getTextReplaced("zoo.event.caravan.bubble",Vector.<TextReplace>([new TextReplace("%species%",_loc2_),new TextReplace("%amount%",this.caravanProxy.getRewardPrice().toString())]));
         if(!this.borrowed)
         {
            this.content.addEventListener("borrowCaravanAnimals",this.handleBorrowCaravanAnimals);
            this.content.borrowAnimals.label = TextResourceModule.getText("zoo.event.caravan.borrow");
         }
         else
         {
            this.setBorrowedPerspective();
         }
         var _loc3_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc3_.getHeaderPath("header_caravan");
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.BABY_CARAVAN_LOAN_SUCCESS,Note.BABY_CARAVAN_LOAN_FAILED,PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.BABY_CARAVAN_LOAN_SUCCESS:
               this.setBorrowedPerspective();
               break;
            case Note.BABY_CARAVAN_LOAN_FAILED:
               this.window.preloaderVisibility = false;
               break;
            case PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED:
               this.updateInventoryCount();
         }
      }
      
      private function setBorrowedPerspective() : void
      {
         this.content.borrowAnimals.visible = false;
         this.content.animalsPic.visible = false;
         this.content.eventStarted.visible = true;
         this.initCards();
         var _loc1_:String = TextResourceModule.getText("zoo.event.caravan.tooltip.counter");
         var _loc2_:String = this.caravanProxy.animalName;
         _loc1_ = _loc1_.replace("%species%",_loc2_);
         this.content.animalCounter.toolTip = _loc1_;
         this.content.animalCounter.button.displayImg.automaticCentralize = false;
         this.content.animalCounter.button.imgBackground.verticalCenter = 0;
         this.content.animalCounter.button.imgBackground.horizontalCenter = 0;
         this.content.animalCounter.button.bitmapDisplayPosX = 0;
         this.content.animalCounter.button.bitmapDisplayPosY = 0;
         this.content.animalCounter.counter.right = -25;
         this.content.animalCounter.counter.bottom = -25;
         this.content.animalCounter.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.caravanProxy.childId),AssetConfig.DEFAULT_OBJECT_SPR,1,40,-1);
         this.content.animalCounter.button.displayImg.maskRectBottom = 45;
         this.startCountdown();
         this.updateInventoryCount();
         this.window.preloaderVisibility = false;
      }
      
      private function updateInventoryCount() : void
      {
         if(this.content)
         {
            this.content.animalCounter.counter.value = this.inventoryProxy.getAnimalCountById(this.caravanProxy.childId);
         }
      }
      
      private function startCountdown() : void
      {
         TimeManager.registerTickFunction(this.updateTimer);
      }
      
      private function updateTimer() : void
      {
         var _loc1_:String = null;
         if(this.content)
         {
            this.content.countdown.text = TimeFormat.secondsToTimeString(this.caravanProxy.eventEnd - TimeManager.currentTime);
            _loc1_ = TextResourceModule.getText("zoo.event.caravan.tooltip.timer");
            _loc1_ = _loc1_.replace("%count%",String(TimeFormat.secondsToHours(this.caravanProxy.eventEnd - TimeManager.currentTime)));
            this.content.countdown.toolTip = _loc1_;
         }
      }
      
      private function initCards() : void
      {
         this.content.cardHolder.paginator.entriesPerPage = 2;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardHolder,CardHolderModes.BABY_CARAVAN_MODE);
         facade.registerMediator(this.cardGroupHolderMediator);
         this.cardGroupHolderMediator.mode = CardHolderModes.BABY_CARAVAN_MODE;
         this.cardGroupHolderMediator.dataProvider = this.caravanProxy.rewardsData;
         this.content.cardHolder.layoutDisplay.horizontalGap = 40;
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "PatternBabyCaravanWood":
            case "PatternBabyCaravanWood.swf":
               this.window.backgroundPattern = param1.getEmbededObject("PatternBabyCaravanWood").constructor;
               break;
            case "BubbleBabyCaravan":
            case "BubbleBabyCaravan.swf":
               this.content.speechBubble.source = param1.getEmbededBitmapData("BubbleBabyCaravan");
               break;
            case "BabyCaravanComponents":
            case "BabyCaravanComponents.swf":
               this.content.soniaPic.source = param1.getEmbededBitmapData("BubblePic_" + this.caravanProxy.caravanId.toString());
               if(!this.borrowed)
               {
                  this.content.animalsPic.source = param1.getEmbededBitmapData("AnimalPicStart_" + this.caravanProxy.caravanId.toString());
               }
         }
         if(++this.currentAssetsLoaded >= this.ASSET_BUNDLE_LOAD)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      private function handleBorrowCaravanAnimals(param1:Event) : void
      {
         this.window.preloaderVisibility = true;
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.BABY_CARAVAN_DO_LOAN,[EventTypes.BABY_CARAVAN_EVENT]).addCallbackIfFalse(Note.BABY_CARAVAN_LOAN_SUCCESS).sendNow();
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
         super.dispose();
      }
      
      private function get borrowed() : Boolean
      {
         return this.caravanProxy.borrowed;
      }
      
      private function get content() : BabyCaravanContent
      {
         return this.window.getContent() as BabyCaravanContent;
      }
      
      private function get window() : BabyCaravanWindow
      {
         return viewComponent as BabyCaravanWindow;
      }
   }
}

