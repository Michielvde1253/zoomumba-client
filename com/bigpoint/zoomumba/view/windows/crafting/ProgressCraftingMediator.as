package com.bigpoint.zoomumba.view.windows.crafting
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingStateVo;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.crafting.ProgressCraftingContent;
   import windows.custom.crafting.ProgressCraftingWindow;
   
   public class ProgressCraftingMediator extends WindowMediator
   {
      public static const NAME:String = "ProgressCraftingMediator";
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _resourcesProxy:ResourcesProxy;
      
      private var _craftingProxy:CraftingProxy;
      
      private var _asset:SWFAsset;
      
      private var useInstant:Boolean = false;
      
      private var winParams:NurseryWindowInitParams;
      
      private var _currencyProxy:CurrencyProxy;
      
      public function ProgressCraftingMediator(param1:ProgressCraftingWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RESOURCES_UPDATED,Note.CRAFTING_DISABLE_POTION_BUTTON,Note.CRAFTING_ENABLE_POTION_BUTTON];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.RESOURCES_UPDATED:
               this.updatePotionCount();
               break;
            case Note.CRAFTING_DISABLE_POTION_BUTTON:
               this.content.btnPotionRaise.enabled = false;
               break;
            case Note.CRAFTING_ENABLE_POTION_BUTTON:
               this.content.btnPotionRaise.enabled = true;
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.content.addEventListener("instantRaiseClicked",this.handleInstantRaiseClicked);
         this.content.addEventListener("potionRaiseClicked",this.handlePotionRaiseClicked);
         this.content.header.text = TextResourceModule.getText("zoo.window.crafting.progress.title");
         this.content.textMain.text = TextResourceModule.getText("zoo.window.crafting.progress.text");
         this.content.textUp.text = TextResourceModule.getText("zoo.window.crafting.progress.time");
         this.updateTimer();
         TimeManager.registerTickFunction(this.updateTimer);
         this.window.preloaderVisibility = true;
         var _loc2_:ItemServerVO = new ItemServerVO();
         AssetLibrary.sendAssetToFunction("CraftingWindow",this.handleAssetLoad);
         this.content.instantBreedConst.value = this.blueprintInfoRewardData.craftInstantReal;
         this.content.instantBreedConst.text = String(this.content.instantBreedConst.value);
         this.content.instantBreedConst.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,1),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,20,-1));
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this._asset = param1;
         var _loc2_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ICON_DYN_BACK);
         _loc2_.scaleX = 1.25;
         _loc2_.scaleX = _loc2_.scaleY;
         this.content.previewBackground.addChild(_loc2_);
         this.content.uschi.displayClass = this._asset.getEmbededBitmapData("uschi");
         var _loc3_:Sprite = new WrapedSprite(AssetIds.getPreviewAssetId(this.blueprintInfoRewardData.category,this.blueprintInfoRewardData.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,1);
         this.content.previewIcon.addEventListener(MouseEvent.ROLL_OUT,this.onRollOutReward,false,0,true);
         this.content.previewIcon.addEventListener(MouseEvent.ROLL_OVER,this.onRollOverReward,false,0,true);
         _loc3_.mouseEnabled = false;
         this.content.previewIcon.addChild(_loc3_);
         this.start();
      }
      
      private function onRollOverReward(param1:MouseEvent) : void
      {
         if(Boolean(this.blueprintInfoRewardData) && Boolean(this.content.previewIcon))
         {
            TooltipNewManager.setToolTip(this.content.previewIcon,TextResourceModule.getText(TextIdHelper.getCardName(this.blueprintInfoRewardData.category,this.blueprintInfoRewardData.itemId)));
         }
      }
      
      private function onRollOutReward(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function start() : void
      {
         if(this.content == null)
         {
            return;
         }
         this.enableInstantRaise();
         this.enablePotionRaise();
         this.window.preloaderVisibility = false;
      }
      
      private function updatePotionCount() : void
      {
         this.content.potionAmount.value = this.resourcesProxy.craftBooster;
      }
      
      private function enableInstantRaise() : void
      {
         this.content.title2.text = TextResourceModule.getText("zoo.window.crafting.progress.instantRaise.title");
         this.content.textDown.text = TextResourceModule.getText("zoo.window.crafting.progress.instantRaise.text");
         this.content.btnInstantRaise.label = TextResourceModule.getText("zoo.window.crafting.progress.instantRaise.button");
         this.content.sprite3.displayClass = this._asset.getEmbededSprite("Hammer");
      }
      
      private function enablePotionRaise() : void
      {
         this.content.title2Potion.text = TextResourceModule.getText("zoo.window.shopResourceInfo.titel_15");
         this.content.textDownPotion.text = TextResourceModule.getText("zoo.window.crafting.progress.layer.elixir.text");
         this.content.btnPotionRaise.label = TextResourceModule.getText("zoo.window.crafting.progress.button.elixir");
         var _loc1_:Sprite = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,Resources.CRAFTING_BOOSTER),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,1);
         this.content.sprite2.displayClass = _loc1_;
         this.content.sprite2.displayScale = 1;
         this.content.potionAmount.value = this.resourcesProxy.craftBooster;
      }
      
      private function updateTimer() : void
      {
         var _loc1_:int = this.remainingTime;
         this.content.timeLeft.text = TimeFormat.secondsToTimeString(_loc1_);
         if(_loc1_ <= 0)
         {
            TimeManager.unregisterTickFunction(this.updateTimer);
            sendNotification(Note.REFRESH_CRAFTING_BUILDING);
            handleWindowCloseClick();
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CRAFTING_PROGRESS_WINDOW));
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
         if(this.resourcesProxy.craftBooster > 0)
         {
            sendNotification(Note.CRAFTING_DISABLE_POTION_BUTTON);
            this.craftingProxy.netSendPotionRaise(Note.CRAFTING_ENABLE_POTION_BUTTON);
         }
         else
         {
            sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.SPECIALS);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CRAFTING_PROGRESS_WINDOW));
            handleWindowCloseClick();
         }
      }
      
      private function instantRaise() : void
      {
         var _loc1_:ItemServerVO = new ItemServerVO();
         if(this.blueprintInfoRewardData.craftInstantReal > this.currencyProxy.realMoney)
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CRAFTING_PROGRESS_WINDOW));
            handleWindowCloseClick();
         }
         else
         {
            this.craftingProxy.netSendInstantFinish(Note.REFRESH_CRAFTING_BUILDING);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CRAFTING_PROGRESS_WINDOW));
            handleWindowCloseClick();
         }
      }
      
      override public function dispose() : void
      {
         this.content.previewIcon.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOutReward);
         this.content.previewIcon.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOverReward);
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
      
      private function get remainingTime() : int
      {
         return this.craftingProxy.craftingData.endTime - TimeManager.currentTime as int;
      }
      
      private function get content() : ProgressCraftingContent
      {
         return this.window.getContent() as ProgressCraftingContent;
      }
      
      private function get window() : ProgressCraftingWindow
      {
         return this.viewComponent as ProgressCraftingWindow;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      public function get resourcesProxy() : ResourcesProxy
      {
         if(this._resourcesProxy == null)
         {
            this._resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         }
         return this._resourcesProxy;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
      
      public function get craftingData() : CraftingStateVo
      {
         return this.craftingProxy.craftingData;
      }
      
      public function get blueprintInfoRewardData() : BlueprintInfoVO
      {
         return this.craftingProxy.getBlueprintInfoByBlueprintId(this.craftingData.blueprintId);
      }
   }
}

