package com.bigpoint.zoorama.core.feature.safari
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.StartingFuelData;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.safari.SafariBuyGasWindowInitParams;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariNotice;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariOpenBuyGasNotice;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariRegionNotice;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariBuyGasWindow;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariMinigameWindow;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariRegionInfoWindow;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariShopWindow;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.gui.btn.SimpleButtonController;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.bigpoint.zoorama.view.windows.WindowReferences;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class SafariManager extends Mediator
   {
      public static const NAME:String = "SafariManager";
      
      public static const DEFALT_MAP_X:int = -250;
      
      public static const DEFALT_MAP_Y:int = -50;
      
      private var appProxy:AppProxy;
      
      private var notifier:Notifier;
      
      private var gameContainer:UIComponent;
      
      private var safariConfig:SafariConfigData;
      
      private var safariData:SafariData;
      
      private var baseFuelAmmount:int;
      
      private var safariShopWindow:SafariShopWindow;
      
      private var safariMinigameWindow:SafariMinigameWindow;
      
      private var buyGasWindow:SafariBuyGasWindow;
      
      private var safariHolder:Sprite;
      
      private var safariBackground:Sprite;
      
      private var safariRegions:SafariRegions;
      
      private var backToGameButton:SimpleButton;
      
      private var loadingIcon:MovieClip;
      
      private var infoButton:SimpleButton;
      
      private var infoButtonController:SimpleButtonController;
      
      private var inScreenDragMode:Boolean = false;
      
      private var lastBgX:int;
      
      private var lastBgY:int;
      
      private var lastMousePosX:int;
      
      private var lastMousePosY:int;
      
      private var applicationMediator:ApplicationMediator;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var guiDone:Boolean = false;
      
      public function SafariManager(param1:Notifier, param2:UIComponent)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.gameContainer = param2;
         this.safariHolder = new Sprite();
         this.safariHolder.alpha = 0;
         this.safariHolder.visible = false;
         this.gameContainer.addChild(this.safariHolder);
         this.notifier.registerNoticeListener(SafariRegionNotice.ACTIVETE_REGION,this.handleRegionActivate);
         this.notifier.registerNoticeListener(SafariRegionNotice.MOUSE_DOWN_REGION,this.handleStartDragOverRegion);
         this.notifier.registerNoticeListener(SafariOpenBuyGasNotice.OPEN_BUY_GAS_WINDOW,this.handleOpenBuyGasWindow);
         this.notifier.registerNoticeListener(SafariOpenBuyGasNotice.OPEN_SKIP_TIMER_WINDOW,this.handleOpenSkiptimerWindow);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.APP_MODE_CHANGED,Note.APP_RESIZED,Note.SAFARI_UPDATE_JOKERS,Note.REFRESH_JOKER_LIST];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.APP_MODE_CHANGED:
               this.changeAppMode();
               break;
            case Note.SAFARI_UPDATE_JOKERS:
               if(this.safariShopWindow)
               {
                  if(this.safariShopWindow.isOpen)
                  {
                     this.safariShopWindow.invalidateJokers();
                  }
               }
               break;
            case Note.REFRESH_JOKER_LIST:
               if(this.safariMinigameWindow)
               {
                  if(this.safariMinigameWindow.isOpen)
                  {
                     this.safariMinigameWindow.refreshJokers = true;
                  }
               }
               break;
            case Note.APP_RESIZED:
               if(this.appProxy.currentAppMode == AppMode.SAFARI)
               {
                  this.fitBgToScreen();
                  this.repositionButtons();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.applicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
      }
      
      private function changeAppMode() : void
      {
         if(this.appProxy.currentAppMode == AppMode.SAFARI)
         {
            if(!this.safariBackground)
            {
               AssetLibrary.sendAssetToFunction("safari_gui",this.handleSafariGui);
            }
            this.safariHolder.visible = true;
            this.safariHolder.alpha = 1;
            if(!this.safariConfig)
            {
               sendNotification(NET.GET_SAFARI_CONFIG);
            }
            sendNotification(NET.GET_SAFARI_SATE);
         }
         else
         {
            if(this.safariBackground)
            {
               TweenLite.to(this.safariHolder,MainConfig.GAME_MODE_TRANSITION_ANIM_TIME,{
                  "alpha":0,
                  "onComplete":this.disposeSafariAssets
               });
            }
            if(!this.infoButton)
            {
            }
            if(!this.backToGameButton)
            {
            }
            if(this.safariShopWindow)
            {
               this.closeSafariShop();
               this.safariShopWindow = null;
            }
            AssetLibrary.clearAsset("africa_back");
            AssetLibrary.clearAsset("asia_back");
         }
      }
      
      public function updateSafariState(param1:SafariData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.SAFARI)
         {
            if(this.safariData)
            {
               if(param1.regeonId != -1)
               {
                  this.safariData.regeonId = param1.regeonId;
               }
               if(param1.fuelAmmount != int.MIN_VALUE)
               {
                  this.safariData.fuelAmmount = param1.fuelAmmount;
               }
               if(param1.nextGameTimeStamp != -1)
               {
                  this.safariData.nextGameTimeStamp = param1.nextGameTimeStamp;
               }
               if(param1.gameStarted != -1)
               {
                  this.safariData.gameStarted = param1.gameStarted;
               }
               if(param1.jokers != null)
               {
                  this.safariData.jokers = param1.jokers;
               }
               if(param1.map != null)
               {
                  this.safariData.map = param1.map;
               }
               if(param1.tokenPosition != null)
               {
                  this.safariData.tokenPosition = param1.tokenPosition;
               }
               if(param1.error != null)
               {
                  this.safariData.error = param1.error;
               }
               this.safariData.revardData = param1.revardData;
               this.handleRewardResponse();
            }
            else
            {
               this.safariData = param1;
               this.showRegions();
            }
            if(this.safariData.gameStarted)
            {
               this.handleStartSafari();
            }
            else
            {
               this.closeSafariMingame();
            }
            if(Boolean(this.safariMinigameWindow) && this.safariMinigameWindow.isOpen)
            {
               this.safariMinigameWindow.updateState(this.safariData);
            }
            if(Boolean(this.safariShopWindow) && this.safariShopWindow.isOpen)
            {
               this.safariShopWindow.updateState(this.safariData,this.baseFuelAmmount);
            }
         }
      }
      
      private function handleRewardResponse() : void
      {
         if(Boolean(this.safariData.revardData) && this.safariData.revardData.type == "collectionItems")
         {
            this.collectablesProxy.increaseCollectableAmount(this.safariData.revardData.id,this.safariData.revardData.count);
         }
      }
      
      public function storeConfigData(param1:SafariConfigData) : void
      {
         var _loc4_:StartingFuelData = null;
         var _loc2_:UserProxy = facade.getProxy(UserProxy);
         this.safariConfig = param1;
         var _loc3_:int = 0;
         while(_loc3_ < this.safariConfig.startingFuel.length)
         {
            _loc4_ = this.safariConfig.startingFuel[_loc3_];
            if(_loc4_.playerLevel <= _loc2_.userLevel)
            {
               if(this.baseFuelAmmount < _loc4_.fuel)
               {
                  this.baseFuelAmmount = _loc4_.fuel;
               }
            }
            _loc3_++;
         }
         this.showRegions();
         if(this.safariData)
         {
            this.updateSafariState(this.safariData);
         }
      }
      
      private function handleSafariGui(param1:SWFAsset) : void
      {
         if(this.appProxy.currentAppMode == AppMode.SAFARI)
         {
            this.safariBackground = new Sprite();
            this.safariHolder.addChild(this.safariBackground);
            this.safariBackground.addChild(param1.getEmbededSprite("SafariBackgroundSPR"));
            this.safariBackground.x = DEFALT_MAP_X;
            this.safariBackground.y = DEFALT_MAP_Y;
            this.loadingIcon = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_PRELOAD_ANIM);
            this.safariHolder.addChild(this.loadingIcon);
            this.loadingIcon.x = 986 >> 1;
            this.loadingIcon.y = 565 >> 1;
            this.safariRegions = new SafariRegions(this.notifier,param1.getEmbededSprite("SafariRegionsSPR"));
            this.safariHolder.addChild(this.safariRegions);
            this.safariRegions.visible = false;
            this.guiDone = true;
            this.showRegions();
            this.safariRegions.x = DEFALT_MAP_X;
            this.safariRegions.y = DEFALT_MAP_Y;
            if(Settings.SCALE_TEST)
            {
               this.safariHolder.scaleX = 0.76;
               this.safariHolder.scaleY = 0.76;
            }
            this.backToGameButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"BackToZooBTN");
            this.safariHolder.addChild(this.backToGameButton);
            this.backToGameButton.x = 900;
            this.backToGameButton.y = 95;
            this.backToGameButton.addEventListener(MouseEvent.CLICK,this.handleBackToGame);
            this.backToGameButton.addEventListener(MouseEvent.MOUSE_OVER,this.handleBackToGameOver);
            this.backToGameButton.addEventListener(MouseEvent.MOUSE_OUT,this.handleBackToGameOut);
            this.infoButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"InfoBTN");
            this.safariHolder.addChild(this.infoButton);
            this.infoButton.x = 955;
            this.infoButton.y = 87;
            this.infoButton.addEventListener(MouseEvent.CLICK,this.handleInfoClick);
            this.infoButtonController = new SimpleButtonController(this.infoButton);
            this.infoButtonController.addTooltip(TextResourceModule.getText("zoo.tooltip.infobutton"),true);
            this.infoButtonController.addContrastEffect();
            this.fitBgToScreen();
            this.repositionButtons();
         }
      }
      
      private function repositionButtons() : void
      {
         this.backToGameButton.x = this.applicationMediator.application.width - 120;
         this.infoButton.x = this.applicationMediator.application.width - 70;
      }
      
      private function showRegions() : void
      {
         var _loc2_:int = 0;
         if(!this.guiDone)
         {
            return;
         }
         var _loc1_:UserProxy = facade.getProxy(UserProxy);
         if(Boolean(this.safariData) && Boolean(this.safariConfig))
         {
            this.loadingIcon.visible = false;
            this.safariRegions.visible = true;
            _loc2_ = 1;
            while(_loc2_ < this.safariConfig.regionLevels.length)
            {
               this.safariRegions.storeRegionLevelRequared(_loc2_,this.safariConfig.regionLevels[_loc2_]);
               if(_loc1_.userLevel >= this.safariConfig.regionLevels[_loc2_])
               {
                  this.safariRegions.enableRegionsById(_loc2_);
               }
               else
               {
                  this.safariRegions.disableRegionsById(_loc2_);
               }
               _loc2_++;
            }
            this.safariBackground.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragField);
            this.safariBackground.addEventListener(MouseEvent.MOUSE_UP,this.stopDragField);
         }
      }
      
      private function handleStartDragOverRegion(param1:SafariRegionNotice) : void
      {
         this.startDragField();
      }
      
      private function startDragField(param1:MouseEvent = null) : void
      {
         if(!this.inScreenDragMode)
         {
            this.inScreenDragMode = true;
            this.lastBgX = this.safariBackground.x;
            this.lastBgY = this.safariBackground.y;
            this.lastMousePosX = this.safariHolder.mouseX;
            this.lastMousePosY = this.safariHolder.mouseY;
            this.safariHolder.addEventListener(Event.ENTER_FRAME,this.handleMouseMove);
            this.safariHolder.stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragField);
         }
      }
      
      private function handleMouseMove(param1:Event) : void
      {
         var _loc2_:int = this.lastMousePosX - this.safariHolder.mouseX;
         var _loc3_:int = this.lastMousePosY - this.safariHolder.mouseY;
         if(_loc2_ * _loc2_ > 9 && _loc3_ * _loc3_ > 9)
         {
            MouseModule.getInstance().show(MouseState.MOVE_SCREEN);
         }
         this.safariBackground.x = this.lastBgX - _loc2_;
         this.safariBackground.y = this.lastBgY - _loc3_;
         this.fitBgToScreen();
      }
      
      private function fitBgToScreen() : void
      {
         var _loc1_:ApplicationMediator = null;
         if(this.safariBackground)
         {
            _loc1_ = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
            if(this.safariBackground.x > 0)
            {
               this.safariBackground.x = 0;
            }
            if(this.safariBackground.y > 0)
            {
               this.safariBackground.y = 0;
            }
            if(this.safariBackground.x < _loc1_.STAGE_WIDTH - this.safariBackground.width)
            {
               this.safariBackground.x = _loc1_.STAGE_WIDTH - this.safariBackground.width;
            }
            if(this.safariBackground.y < _loc1_.STAGE_HEIGHT - this.safariBackground.height)
            {
               this.safariBackground.y = _loc1_.STAGE_HEIGHT - this.safariBackground.height;
            }
            if(_loc1_.STAGE_WIDTH > this.safariBackground.width)
            {
               this.safariBackground.x = (_loc1_.STAGE_WIDTH >> 1) - (this.safariBackground.width >> 1);
            }
            if(_loc1_.STAGE_HEIGHT > this.safariBackground.height)
            {
               this.safariBackground.y = (_loc1_.STAGE_HEIGHT >> 1) - (this.safariBackground.height >> 1);
            }
            this.safariRegions.x = this.safariBackground.x;
            this.safariRegions.y = this.safariBackground.y;
         }
      }
      
      private function stopDragField(param1:MouseEvent) : void
      {
         MouseModule.getInstance().show(MouseState.DEFAULT);
         if(this.inScreenDragMode)
         {
            this.inScreenDragMode = false;
            this.safariHolder.removeEventListener(Event.ENTER_FRAME,this.handleMouseMove);
            this.safariHolder.stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragField);
         }
      }
      
      private function handleStartSafari(param1:SafariNotice = null) : void
      {
         this.closeSafariShop();
         if(this.safariConfig)
         {
            if(!this.safariMinigameWindow || !this.safariMinigameWindow.isOpen)
            {
               this.safariMinigameWindow = WindowManagerNew.openWindow(WindowReferences.WINDOW_SAFARI_MINIGAME_CLASS,AssetConfig.ASSET_WINDOW_SAFARI_MEDIUM,[this.notifier,this.safariConfig]) as SafariMinigameWindow;
               this.safariMinigameWindow.updateState(this.safariData);
            }
         }
      }
      
      private function handleRegionActivate(param1:SafariRegionNotice) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this.safariShopWindow || !this.safariShopWindow.isOpen)
         {
            _loc2_ = this.lastMousePosX - this.safariHolder.mouseX;
            _loc3_ = this.lastMousePosY - this.safariHolder.mouseY;
            if(_loc2_ * _loc2_ < 9 && _loc3_ * _loc3_ < 9)
            {
               this.safariShopWindow = WindowManagerNew.openWindow(WindowReferences.WINDOW_SAFARI_SHOP_CLASS,AssetConfig.ASSET_WINDOW_SAFARI_MEDIUM,[this.notifier,this.safariConfig,param1.regionId]) as SafariShopWindow;
               this.safariShopWindow.updateState(this.safariData,this.baseFuelAmmount);
            }
         }
      }
      
      public function activateJokerAction(param1:int) : void
      {
         if(this.safariMinigameWindow)
         {
            this.safariMinigameWindow.activateJokerAction(param1);
         }
      }
      
      private function closeSafariMingame() : void
      {
         if(Boolean(this.safariMinigameWindow) && this.safariMinigameWindow.isOpen)
         {
            WindowManagerNew.closeWindow(this.safariMinigameWindow);
         }
      }
      
      private function closeSafariShop() : void
      {
         if(Boolean(this.safariShopWindow) && this.safariShopWindow.isOpen)
         {
            WindowManagerNew.closeWindow(this.safariShopWindow);
         }
      }
      
      private function handleBackToGameOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(this.backToGameButton,TextResourceModule.getText("zoo.safari.tooltip.backToZoo"),true);
      }
      
      private function handleBackToGameOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleOpenBuyGasWindow(param1:SafariOpenBuyGasNotice) : void
      {
         var _loc2_:TextReplace = null;
         var _loc3_:TextReplace = null;
         var _loc4_:Vector.<TextReplace> = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.safariData.fuelAmmount < this.baseFuelAmmount)
         {
            _loc2_ = new TextReplace("%neededGas%",(param1.fuelAmmount + this.safariData.fuelAmmount).toString());
            _loc3_ = new TextReplace("%missingGas%",this.safariData.fuelAmmount.toString());
            _loc4_ = new Vector.<TextReplace>();
            _loc4_.push(_loc2_);
            _loc4_.push(_loc3_);
            _loc5_ = TextResourceModule.getTextReplaced(param1.infoTextId,_loc4_);
            _loc6_ = param1.fuelAmmount;
            _loc7_ = this.baseFuelAmmount - this.safariData.fuelAmmount;
            TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SAFARI_BUY_FUEL_WINDOW,"",new SafariBuyGasWindowInitParams(_loc5_,this.safariData.fuelAmmount,_loc6_,_loc7_,this.safariConfig.gasPrice)));
         }
      }
      
      private function handleOpenSkiptimerWindow(param1:SafariOpenBuyGasNotice) : void
      {
         var _loc2_:TextReplace = new TextReplace("%skipTimerCost%",this.safariConfig.skipTimerPrice.toString());
         var _loc3_:Vector.<TextReplace> = new Vector.<TextReplace>();
         _loc3_.push(_loc2_);
         var _loc4_:String = TextResourceModule.getTextReplaced("zoo.safari.shopWindow.skipTimerConfirmation",_loc3_);
         TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.safari.title"),_loc4_,this.safariConfig.skipTimerPrice),new WindowParams("",null,"",null,Note.SKIP_SAFARI_TIMER,this)));
      }
      
      public function handleskipTimer() : void
      {
         var _loc1_:UserProxy = facade.getProxy(UserProxy);
         if(this.safariConfig.skipTimerPrice <= _loc1_.realAmount)
         {
            SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_BUY_GASS);
            sendNotification(NET.SKIP_SAFARI_TIMER);
            this.safariShopWindow.disableShopButtons();
         }
         else
         {
            this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
         }
      }
      
      private function handleBuyGas() : void
      {
         var _loc1_:UserProxy = null;
         var _loc2_:int = 0;
         if(this.buyGasWindow)
         {
            _loc1_ = facade.getProxy(UserProxy);
            _loc2_ = this.buyGasWindow.fuelAmount * this.safariConfig.gasPrice;
            if(_loc2_ <= _loc1_.realAmount)
            {
               SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_BUY_GASS);
               sendNotification(NET.BUY_SAFARI_FUEL,[this.buyGasWindow.fuelAmount]);
               this.buyGasWindow.dispose();
               this.buyGasWindow = null;
               this.safariMinigameWindow.disableAllMapActions();
            }
            else
            {
               this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
            }
         }
      }
      
      private function handleInfoClick(param1:MouseEvent) : void
      {
         var _loc2_:SafariRegionInfoWindow = new SafariRegionInfoWindow(this.notifier);
         WindowManager.getInstance().showWindow(_loc2_);
      }
      
      private function handleBackToGame(param1:MouseEvent) : void
      {
         sendNotification(Note.OPEN_MANAGMENT_CENTER);
      }
      
      private function disposeSafariAssets() : void
      {
         this.safariData = null;
         this.safariHolder.removeChild(this.safariBackground);
         this.safariHolder.removeChild(this.infoButton);
         this.safariHolder.removeChild(this.loadingIcon);
         this.safariHolder.removeChild(this.safariRegions);
         this.safariHolder.removeChild(this.backToGameButton);
         this.safariBackground = null;
         this.infoButton = null;
         this.loadingIcon = null;
         this.safariRegions = null;
         this.backToGameButton = null;
      }
   }
}

