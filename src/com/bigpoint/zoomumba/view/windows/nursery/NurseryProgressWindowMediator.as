package com.bigpoint.zoomumba.view.windows.nursery
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.FeatureConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.nursery.progress.NurseryProgressContent;
   import windows.custom.nursery.progress.NurseryProgressWindow;
   
   public class NurseryProgressWindowMediator extends WindowMediator
   {
      public static const NAME:String = "NurseryProgressWindowMediator";
      
      private var _currentLoadStep:int = 0;
      
      private var _assets:Dictionary;
      
      private var nurseryId:int = -1;
      
      private var nuseryProxy:NurseryProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var resourcesProxy:ResourcesProxy;
      
      private var featureProxy:FeatureConfigProxy;
      
      private var useInstant:Boolean = false;
      
      private var winParams:NurseryWindowInitParams;
      
      public function NurseryProgressWindowMediator(param1:NurseryProgressWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RESOURCES_UPDATED,Note.NURSERY_DISABLE_POTION_BUTTON,Note.NURSERY_ENABLE_POTION_BUTTON];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.RESOURCES_UPDATED:
               this.updatePotionCount();
               break;
            case Note.NURSERY_DISABLE_POTION_BUTTON:
               this.content.btnPotionRaise.enabled = false;
               break;
            case Note.NURSERY_ENABLE_POTION_BUTTON:
               this.content.btnPotionRaise.enabled = true;
         }
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.featureProxy = facade.retrieveProxy(FeatureConfigProxy.NAME) as FeatureConfigProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.winParams = param1 as NurseryWindowInitParams;
         this.nurseryId = this.winParams.uniqueId;
         this.nuseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.content.addEventListener("instantRaiseClicked",this.handleInstantRaiseClicked);
         this.content.addEventListener("potionRaiseClicked",this.handlePotionRaiseClicked);
         this.content.header.text = TextResourceModule.getText("zoo.nursery.layer.inProgress.title");
         this.content.textMain.text = TextResourceModule.getText("zoo.nursery.layer.inProgress.text");
         this.content.textUp.text = TextResourceModule.getText("zoo.nursery.layer.inProgress.time");
         this.updateTimer();
         TimeManager.registerTickFunction(this.updateTimer);
         this.window.preloaderVisibility = true;
         this._assets = new Dictionary(true);
         this._currentLoadStep = 0;
         AssetLibrary.sendAssetToFunction("ShadowIconSmall",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SoniaRaiseSmall",this.handleAssets);
         AssetLibrary.sendAssetToFunction("RaiseIcons",this.handleAssets);
         AssetLibrary.sendAssetToFunction("resource_preview_12",this.handleAssets);
         var _loc2_:AnimalSpeciesVO = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.nuseryProxy.selectedAnimals[0]);
         var _loc3_:ItemServerVO = new ItemServerVO();
         ObjectHelper.copyData(_loc3_,_loc2_.raisingDirectCost[0]);
         this.content.instantBreedConst.value = _loc3_.cnt;
         this.content.instantBreedConst.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(_loc3_.type),_loc3_.id),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,20,-1));
      }
      
      private function updatePotionCount() : void
      {
         this.content.potionAmount.value = this.resourcesProxy.potion;
      }
      
      private function enableInstantRaise() : void
      {
         this.content.title2.text = TextResourceModule.getText("zoo.nursery.layer.instantRaise.title");
         this.content.textDown.text = TextResourceModule.getText("zoo.nursery.layer.instantRaise.text");
         this.content.btnInstantRaise.label = TextResourceModule.getText("zoo.nursery.button.instantRaise");
         this.content.sprite3.displayClass = this._assets["RaiseInstantIcon"];
      }
      
      private function enablePotionRaise() : void
      {
         this.content.title2Potion.text = TextResourceModule.getText("zoo.window.shopResourceInfo.titel_12");
         this.content.textDownPotion.text = TextResourceModule.getText("zoo.nursery.layer.elixir.text");
         this.content.btnPotionRaise.label = TextResourceModule.getText("zoo.nursery.button.elixir");
         this.content.sprite2.displayClass = this._assets["potion_preview"];
         this.content.sprite2.displayScale = 1;
         this.content.potionAmount.value = this.resourcesProxy.potion;
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "ShadowIconSmall":
            case "ShadowIconSmall.swf":
               this._assets["ShadowIconSmall"] = param1.getEmbededBitmapData("ShadowIconSmall");
               break;
            case "SoniaRaiseSmall":
            case "SoniaRaiseSmall.swf":
               this._assets["SoniaRaiseSmall"] = param1.getEmbededBitmapData("SoniaRaiseSmall");
               break;
            case "RaiseIcons":
            case "RaiseIcons.swf":
               this._assets["RaiseIcon"] = param1.getEmbededSprite("RaiseIcon");
               this._assets["RaiseInstantIcon"] = param1.getEmbededSprite("RaiseInstantIcon");
               break;
            case "resource_preview_12":
            case "resource_preview_12.swf":
               this._assets["potion_preview"] = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         }
         if(++this._currentLoadStep == 4)
         {
            this.start();
         }
      }
      
      private function start() : void
      {
         if(this.content == null)
         {
            return;
         }
         this.window.preloaderVisibility = false;
         this.content.sonia.displayClass = this._assets["SoniaRaiseSmall"];
         this.content.shadow1.displayClass = this._assets["ShadowIconSmall"];
         this.content.sprite1.displayClass = this._assets["RaiseIcon"];
         this.content.shadow2.displayClass = this._assets["ShadowIconSmall"];
         this.content.shadow3.displayClass = this._assets["ShadowIconSmall"];
         AutomatorAdvFillableSpot.fillAnimals(this.nuseryProxy.selectedAnimals,this.itemConfigProxy,this.content,"spot",[AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_BABY]);
         this.enableInstantRaise();
         this.enablePotionRaise();
      }
      
      private function updateTimer() : void
      {
         this.content.timeLeft.text = TimeFormat.secondsToTimeString(this.remainingTime);
         if(this.remainingTime <= 0)
         {
            TimeManager.unregisterTickFunction(this.updateTimer);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW));
         }
      }
      
      private function handleInstantRaiseClicked(param1:Event) : void
      {
         this.instantRaise();
      }
      
      private function handlePotionRaiseClicked(param1:Event) : void
      {
         this.potionRaise();
      }
      
      private function potionRaise() : void
      {
         var _loc1_:NetProxy = null;
         if(this.resourcesProxy.potion > 0)
         {
            sendNotification(Note.NURSERY_DISABLE_POTION_BUTTON);
            _loc1_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            _loc1_.callServer(NET.USE_RAISING_POTION,[this.nurseryId]).addCallbackIfTrue(Note.NURSERY_ENABLE_POTION_BUTTON).addCallbackIfFalse(Note.NURSERY_ENABLE_POTION_BUTTON).sendNow();
         }
         else
         {
            sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW));
         }
      }
      
      private function instantRaise() : void
      {
         var _loc1_:ItemServerVO = new ItemServerVO();
         var _loc2_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc3_:AnimalSpeciesVO = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.nuseryProxy.selectedAnimals[0]);
         ObjectHelper.copyData(_loc1_,_loc3_.raisingDirectCost[0]);
         if(_loc1_.cnt > _loc2_.realMoney)
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW));
         }
         else
         {
            sendNotification(NET.INSTANT_NURSERY_BREEDING,[this.winParams.uniqueId,this.nuseryProxy.selectedAnimals[0]]);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW));
         }
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
      
      private function get remainingTime() : int
      {
         return this.nuseryProxy.nursery.end - TimeManager.currentTime as int;
      }
      
      private function get content() : NurseryProgressContent
      {
         return this.window.getContent() as NurseryProgressContent;
      }
      
      private function get window() : NurseryProgressWindow
      {
         return this.viewComponent as NurseryProgressWindow;
      }
   }
}

