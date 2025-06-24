package com.bigpoint.zoomumba.view.windows.events
{
   import buttons.extended.ButtonZoomable;
   import buttons.extended.events.ButtonGUIGenericEvent;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.circus.CircusContent;
   import windows.custom.events.circus.CircusWindow;
   
   public class CircusWindowMediator extends WindowMediator
   {
      public static var NAME:String = "CircusWindowMediator";
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var circusProxy:CircusProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function CircusWindowMediator(param1:CircusWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.CIRCUS_BOUGHT_CRATE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:NetProxy = null;
         switch(param1.getName())
         {
            case Note.CIRCUS_BOUGHT_CRATE:
               this.circusProxy.canBuy = false;
               sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CIRCUS_WINDOW));
               this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,this.itemConfigProxy.getStoreData(34).buyReal);
               _loc2_ = this.circusProxy.getNextFreePosition();
               _loc3_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
               _loc3_.callServer(NET.CIRCUS_BUY_BOX,[_loc2_[0],_loc2_[1]]).addCallback(Note.UNLOCK_CIRCUS_BUY_BUTTON).sendNow();
         }
      }
      
      override public function onRegister() : void
      {
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.circusProxy = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      override public function init(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:WrapedSprite = null;
         this.window.preloaderVisibility = true;
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_circus");
         var _loc6_:int = int(this.circusProxy.speciesId.length);
         while(_loc3_ < _loc6_)
         {
            _loc4_ = this.itemConfigProxy.getMaleAnimalData(this.circusProxy.speciesId[_loc3_]).itemId;
            _loc5_ = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc4_),AssetConfig.DEFAULT_OBJECT_SPR,1,40,-1);
            (this.content["a" + _loc3_] as ButtonZoomable).displayImg.automaticCentralize = false;
            (this.content["a" + _loc3_] as ButtonZoomable).displayImg.maskRectBottom = 17;
            (this.content["a" + _loc3_] as ButtonZoomable).iconClass = _loc5_;
            _loc3_++;
         }
         this.content.buyButton.button.width = 135;
         this.content.buyButton.button.height = 38;
         if(this.currencyProxy.realMoney < this.itemConfigProxy.getStoreData(34).buyReal)
         {
            this.content.buyButton.enabled = false;
         }
         this.content.bubbleText.htmlText = TextResourceModule.getText("zoo.event.circus.bubble");
         this.content.gradientRewardsText.text = TextResourceModule.getText("zoo.event.circus.prizes");
         this.content.buyButton.label.type = "none";
         this.content.buyButton.label.text = this.itemConfigProxy.getStoreData(34).buyReal.toString();
         this.content.buyButton.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.REAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,25));
         this.content.addEventListener(ButtonGUIGenericEvent.CLICK,this.openInfo);
         this.content.buyButton.addEventListener(MouseEvent.CLICK,this.buy);
         AssetLibrary.sendAssetToFunction("Circus",this.assetsLoaded);
      }
      
      private function buy(param1:MouseEvent) : void
      {
         if(this.circusProxy.canBuy)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.itemConfigProxy.getStoreData(34).buyReal),new WindowParams("",null,"",null,Note.CIRCUS_BOUGHT_CRATE,null)));
         }
      }
      
      private function openInfo(param1:ButtonGUIGenericEvent) : void
      {
         var _loc2_:int = this.circusProxy.speciesId[param1.params.id];
         var _loc3_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc4_:AnimalSpeciesVO = _loc3_.getShopAnimalSpecie(_loc2_);
         _loc4_.maleAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc4_.animalIds[0]);
         _loc4_.femaleAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc4_.animalIds[1]);
         _loc4_.childAssetId = AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc4_.animalIds[2]);
         _loc4_.localisedInfoId = TextIdHelper.getCardInfo(Categories.SPECIES,_loc4_.speciesId,_loc4_.genusId);
         var _loc5_:String = TextIdHelper.getCardName(Categories.SPECIES,_loc4_.speciesId);
         _loc4_.localisedTitle = TextResourceModule.getText(_loc5_);
         sendNotification(SHOP.SHOPCARD_INFO_CLICKED,_loc4_);
      }
      
      private function assetsLoaded(param1:SWFAsset) : void
      {
         this.window.preloaderVisibility = false;
         this.content.background.source = param1.getEmbededBitmapData("Background");
      }
      
      private function get content() : CircusContent
      {
         return this.window.getContent(0) as CircusContent;
      }
      
      private function get window() : CircusWindow
      {
         return this.viewComponent as CircusWindow;
      }
      
      override public function dispose() : void
      {
         this.content.removeEventListener(ButtonGUIGenericEvent.CLICK,this.openInfo);
      }
   }
}

