package com.bigpoint.zoomumba.view.windows.events.christmas
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.BitmapData;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.christmas.ChristmasSleighContent;
   import windows.custom.events.christmas.ChristmasSleighWindow;
   
   public class ChristmasWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ChristmasWindowMediator";
      
      private var netHelperProxy:NetHelperProxy;
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var xmasProxy:XmasProxy;
      
      private var _currentLoadStep:int = 0;
      
      private var _noReindeersBmpData:BitmapData;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function ChristmasWindowMediator(param1:ChristmasSleighWindow)
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
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.xmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_helpSanta");
         this.content.textBubble.text = TextResourceModule.getText("zoo.event.christmas.layer.reward.bubble");
         this.content.timeText.text = TextResourceModule.getText("zoo.event.christmas.layer.reward.countdown");
         this._currentLoadStep = 0;
         AssetLibrary.sendAssetToFunction("BubbleBig",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SantaMed",this.handleAssets);
         AssetLibrary.sendAssetToFunction("Christmas2011",this.handleAssets);
         this.content.clock.text = TimeFormat.secondsToBigTimeString(this.globalEventProxy.getGlobalEvent(EventTypes.XMAS_EVENT).endDate - TimeManager.currentTime);
         TimeManager.registerTickFunction(this.updateTimer);
         this.initCardGroupHolder();
      }
      
      public function updateTimer() : void
      {
         this.content.clock.text = TimeFormat.secondsToBigTimeString(this.globalEventProxy.getGlobalEvent(EventTypes.XMAS_EVENT).endDate - TimeManager.currentTime);
         if(this.globalEventProxy.getGlobalEvent(EventTypes.XMAS_EVENT).endDate - TimeManager.currentTime <= 0)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_WINDOW));
         }
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "BubbleBig":
            case "BubbleBig.swf":
               this.content.bubble.displayClass = param1.getEmbededBitmapData(param1.id);
               break;
            case "SantaMed":
            case "SantaMed.swf":
               this.content.santa.displayClass = param1.getEmbededBitmapData(param1.id);
               break;
            case "Christmas2011":
            case "Christmas2011.swf":
               this._noReindeersBmpData = param1.getEmbededBitmapData("NoReindeers");
         }
         if(++this._currentLoadStep == 3)
         {
            this.start();
         }
      }
      
      private function start() : void
      {
         this.window.preloaderVisibility = false;
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.XMAS.toString());
         }
         this.content.cardGroupHolder.paginator.entriesPerPage = 4;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.XMAS);
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
         this.cardGroupHolderMediator.mode = CardHolderModes.XMAS;
         var _loc1_:Vector.<Object> = this.xmasProxy.getCardsForXmas();
         this.cardGroupHolderMediator.dataProvider = _loc1_;
         this.cardGroupHolderMediator.currentPage = 0;
         if(_loc1_.length <= 0)
         {
            this.content.noReindeers.displayClass = this._noReindeersBmpData;
         }
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
      
      override public function onRemove() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.XMAS.toString());
         }
      }
      
      private function get content() : ChristmasSleighContent
      {
         return this.window.getContent() as ChristmasSleighContent;
      }
      
      private function get window() : ChristmasSleighWindow
      {
         return this.viewComponent as ChristmasSleighWindow;
      }
   }
}

