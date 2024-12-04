package com.bigpoint.zoorama.core
{
   import com.bigpoint.utils.cookieModule.CookieModule;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementRewardsData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.tempView.MediatorDispachingEvents;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.features.adamPenguin.AdamMediator;
   import com.bigpoint.zoomumba.view.features.collectables.CollectablesPanelMediator;
   import com.bigpoint.zoomumba.view.gui.header.HeaderPanelMediator;
   import com.bigpoint.zoomumba.view.gui.main.MainPanelMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.core.feature.InfoWindowManager;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariNotAvaliableWindow;
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariWelcomeWindow;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialLevelNotice;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.fortuneWheel.FortuneWheelRewardWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedSuccessWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ConfirmationWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ConstructionWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.SaveScreenshotNotice;
   import com.bigpoint.zoorama.notices.gui.window.WelcomeBackWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.view.bank.BankWindow;
   import com.bigpoint.zoorama.view.gui.GUInterface;
   import com.bigpoint.zoorama.view.gui.GuiNotice;
   import com.bigpoint.zoorama.view.gui.win.AnimalBreedFailedWindow;
   import com.bigpoint.zoorama.view.gui.win.AnimalBreedProgressWindow;
   import com.bigpoint.zoorama.view.gui.win.AnimalBreedSuccessWindow;
   import com.bigpoint.zoorama.view.gui.win.AnimalBreedWindow;
   import com.bigpoint.zoorama.view.gui.win.BonusCodeWindow;
   import com.bigpoint.zoorama.view.gui.win.ConstructionWindow;
   import com.bigpoint.zoorama.view.gui.win.FortuneWheelAskExtraTurn;
   import com.bigpoint.zoorama.view.gui.win.FortuneWheelFreeTurn;
   import com.bigpoint.zoorama.view.gui.win.FortuneWheelPrice;
   import com.bigpoint.zoorama.view.gui.win.IndividualAchievementWindow;
   import com.bigpoint.zoorama.view.gui.win.LevelupWindow;
   import com.bigpoint.zoorama.view.gui.win.MiniTutorialWindow;
   import com.bigpoint.zoorama.view.gui.win.PuzzleUnlockedWindow;
   import com.bigpoint.zoorama.view.gui.win.SaveScreenshotWindow;
   import com.bigpoint.zoorama.view.gui.win.WindowForgottenZooUnlock;
   import com.bigpoint.zoorama.view.gui.win.WindowStorageUnlock;
   import com.bigpoint.zoorama.view.gui.win.WindowVisitorWishes;
   import com.bigpoint.zoorama.view.gui.win.WindowWelcomeBack;
   import com.bigpoint.zoorama.view.gui.win.ZDResourceConfirmationWindow;
   import com.bigpoint.zoorama.view.gui.win.ZooMeterWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.gui.win.generics.MessageWindow;
   import com.bigpoint.zoorama.view.gui.win.generics.MiniMessageWindow;
   import com.bigpoint.zoorama.view.gui.win.generics.QuestionWindow;
   import com.bigpoint.zoorama.view.quickInfo.QuickInfoModule;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.bigpoint.zoorama.view.windows.WindowReferences;
   import com.greensock.TweenLite;
   import custom.mainInterface.collectables.CollectablesPanel;
   import flash.display.Sprite;
   import flash.events.Event;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.facade.Facade;
   import spark.components.Group;
   
   public class GUInterfaceManager extends MediatorDispachingEvents
   {
      public static const NAME:String = "GUInterfaceManager";
      
      private var notifier:Notifier;
      
      public var guiInterface:GUInterface;
      
      private var quickInfo:QuickInfoModule;
      
      private var windowManager:WindowManager;
      
      private var infoWindowManager:InfoWindowManager;
      
      private var bankWindow:BankWindow;
      
      private var bonusCodeWindow:BonusCodeWindow;
      
      private var _menuWindowId:int = GUInterface.WINDOW_NOT_OPENED;
      
      private var miniTutorialWindow:MiniTutorialWindow;
      
      private var mouseModule:MouseModule;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var adamLayer:Group;
      
      private var hackedInResourceBuy:ItemPackVO;
      
      private var achievementsProxy:AchievementProxy;
      
      public function GUInterfaceManager(param1:Notifier, param2:UIComponent)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.windowManager = WindowManager.getInstance();
         this.mouseModule = MouseModule.getInstance();
         this.quickInfo = new QuickInfoModule();
         this.quickInfo.mouseEnabled = false;
         this.quickInfo.mouseChildren = false;
         param2.addChild(this.quickInfo);
         this.guiInterface = new GUInterface(this.notifier,param2);
         this.showMinitutorialForFirstLogin();
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().injectGuiInterfaceManager(this);
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.PREMIUM_PACK_CHANGED,GUINote.SHOP_MENU_BUTTON_CLICKED,GUINote.BANK_MENU_BUTTON_CLICKED,GUINote.MENU_SETTINGS_BUTTON_CLICKED,Note.INVENTORY_SHOW_SELL_ITEM_WINDOW,Note.SHOP_NOTICE,Note.EXPANSION_CHANGED,Note.QUICK_INFO_NOTICE,Note.OPEN_OLD_WINDOW,Note.SHOW_CONFIRMATION_FOR_RESOURCE_BUY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.PREMIUM_PACK_CHANGED:
               break;
            case Note.SHOW_CONFIRMATION_FOR_RESOURCE_BUY:
               this.confirmZDResourceBuy(param1.getBody() as ItemPackVO);
               break;
            case GUINote.SHOP_MENU_BUTTON_CLICKED:
               break;
            case GUINote.BANK_MENU_BUTTON_CLICKED:
               sendNotification(WinNote.CLOSE_ALL_WINDOWS);
               if(!this.bankWindow)
               {
                  this.bankWindow = new BankWindow(this.notifier);
               }
               this.windowManager.showWindow(this.bankWindow as Window);
               break;
            case GUINote.MENU_SETTINGS_BUTTON_CLICKED:
               this.openSettingsWindow();
               break;
            case Note.INVENTORY_SHOW_SELL_ITEM_WINDOW:
            case Note.SHOP_NOTICE:
               break;
            case Note.QUICK_INFO_NOTICE:
               this.showQuickInfo(param1.getBody() as QuickInfoNotice);
               break;
            case Note.OPEN_OLD_WINDOW:
               this.handleOpenWindowGeneral(param1.getBody() as WindowNotice);
               break;
            case Note.EXPANSION_CHANGED:
               this.handleExpansionChanged();
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         facade.registerMediator(this.guiInterface);
         facade.registerMediator(this.windowManager);
         facade.registerMediator(this.mouseModule);
         var _loc1_:CollectablesPanel = new CollectablesPanel();
         var _loc2_:MainPanelMediator = facade.retrieveMediator(MainPanelMediator.NAME) as MainPanelMediator;
         var _loc3_:HeaderPanelMediator = facade.retrieveMediator(HeaderPanelMediator.NAME) as HeaderPanelMediator;
         _loc2_.mainPanel.addElement(_loc1_);
         facade.registerMediator(new CollectablesPanelMediator(_loc1_));
         this.adamLayer = new Group();
         var _loc4_:AdamMediator = new AdamMediator(this.adamLayer);
         facade.registerMediator(_loc4_);
         _loc3_.addAdamLayer(this.adamLayer);
         this.achievementsProxy = facade.retrieveProxy(AchievementProxy.NAME) as AchievementProxy;
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc5_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         sendNotification(Note.APP_RESIZED,_loc5_.application);
      }
      
      public function enable() : void
      {
         this.guiInterface.enable();
      }
      
      public function init() : void
      {
         this.notifier.registerNoticeListener(GuiNotice.OPEN_MAIN_WINDOW,this.handleMainWindowOpen);
         this.notifier.registerNoticeListener(GuiNotice.CLOSE_MAIN_WINDOW,this.handleMainWindowClose);
      }
      
      public function handleMainWindowClose(param1:GuiNotice = null) : void
      {
         this.menuWindowId = GUInterface.WINDOW_NOT_OPENED;
      }
      
      private function handleMainWindowOpen(param1:GuiNotice) : void
      {
         this.menuWindowId = param1.windowId;
      }
      
      public function showQuickInfo(param1:QuickInfoNotice) : void
      {
         this.quickInfo.showQuickInfo(param1);
      }
      
      protected function replaceTextPlaceholders(param1:String, param2:Object) : String
      {
         var _loc3_:String = null;
         if(param2)
         {
            for(_loc3_ in param2)
            {
               param1 = param1.split("%" + _loc3_).join(param2[_loc3_]);
            }
         }
         return param1;
      }
      
      public function handleOpenWindowGeneral(param1:WindowNotice) : void
      {
         var _loc3_:ConfirmationWindowNotice = null;
         var _loc4_:ConfirmationWindowNotice = null;
         var _loc5_:SaveScreenshotNotice = null;
         var _loc6_:SaveScreenshotWindow = null;
         var _loc7_:AnimalBreedWindowNotice = null;
         var _loc8_:WindowButtonParams = null;
         var _loc9_:AnimalBreedProgressWindow = null;
         var _loc10_:AnimalBreedSuccessWindowNotice = null;
         var _loc11_:WindowNotice = null;
         var _loc12_:ConstructionWindowNotice = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:WindowButtonParams = null;
         var _loc16_:WindowButtonParams = null;
         var _loc17_:ZooMeterWindow = null;
         var _loc18_:FortuneWheelFreeTurn = null;
         var _loc19_:FortuneWheelPrice = null;
         var _loc20_:FortuneWheelAskExtraTurn = null;
         var _loc21_:WindowWelcomeBack = null;
         var _loc22_:SafariNotAvaliableWindow = null;
         var _loc23_:WindowVisitorWishes = null;
         var _loc24_:WindowForgottenZooUnlock = null;
         var _loc25_:Object = null;
         var _loc26_:MessageWindow = null;
         var _loc27_:String = null;
         var _loc28_:String = null;
         var _loc29_:MiniMessageWindow = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:Object = null;
         var _loc33_:QuestionWindow = null;
         var _loc34_:AnimalBreedWindow = null;
         var _loc35_:String = null;
         var _loc36_:String = null;
         var _loc37_:WindowButtonParams = null;
         var _loc38_:AnimalBreedSuccessWindow = null;
         var _loc39_:String = null;
         var _loc40_:String = null;
         var _loc41_:WindowButtonParams = null;
         var _loc42_:AnimalBreedFailedWindow = null;
         var _loc43_:ConstructionWindow = null;
         var _loc44_:WindowButtonParams = null;
         var _loc45_:LevelupWindow = null;
         var _loc46_:WindowStorageUnlock = null;
         var _loc2_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         switch(param1.windowTypeId)
         {
            case OldWindowTypes.BANK:
               if(!this.bankWindow)
               {
                  this.bankWindow = new BankWindow(this.notifier);
               }
               this.windowManager.showWindow(this.bankWindow as Window);
               break;
            case OldWindowTypes.MESSAGE:
               _loc3_ = param1 as ConfirmationWindowNotice;
               if(_loc3_)
               {
                  if(_loc3_.titleId)
                  {
                     _loc27_ = TextResourceModule.getText(_loc3_.titleId);
                  }
                  else
                  {
                     _loc27_ = _loc3_.titleText;
                  }
                  if(_loc3_.textId)
                  {
                     _loc28_ = TextResourceModule.getText(_loc3_.textId);
                  }
                  else
                  {
                     _loc28_ = _loc3_.messageText;
                  }
                  _loc25_ = _loc3_.replaceVars;
                  if(_loc25_)
                  {
                     _loc27_ = this.replaceTextPlaceholders(_loc27_,_loc25_);
                     _loc28_ = this.replaceTextPlaceholders(_loc28_,_loc25_);
                  }
                  _loc26_ = new MessageWindow(this.notifier,_loc27_,_loc28_,_loc3_.windowButtonParams);
                  this.windowManager.showWindow(_loc26_);
               }
               break;
            case OldWindowTypes.MINI_MESSAGE:
               _loc3_ = param1 as ConfirmationWindowNotice;
               if(_loc3_)
               {
                  if(_loc3_.titleId)
                  {
                     _loc27_ = TextResourceModule.getText(_loc3_.titleId);
                  }
                  else
                  {
                     _loc27_ = _loc3_.titleText;
                  }
                  if(_loc3_.textId)
                  {
                     _loc28_ = TextResourceModule.getText(_loc3_.textId);
                  }
                  else
                  {
                     _loc28_ = _loc3_.messageText;
                  }
                  _loc25_ = _loc3_.replaceVars;
                  if(_loc25_)
                  {
                     _loc27_ = this.replaceTextPlaceholders(_loc27_,_loc25_);
                     _loc28_ = this.replaceTextPlaceholders(_loc28_,_loc25_);
                  }
                  _loc29_ = new MiniMessageWindow(this.notifier,_loc27_,_loc28_,_loc3_.windowButtonParams);
                  this.windowManager.showWindow(_loc29_);
               }
               break;
            case OldWindowTypes.QUESTION:
               _loc4_ = param1 as ConfirmationWindowNotice;
               if(_loc4_)
               {
                  _loc30_ = TextResourceModule.getText(_loc4_.titleId);
                  _loc31_ = TextResourceModule.getText(_loc4_.textId);
                  _loc32_ = _loc4_.replaceVars;
                  if(_loc32_)
                  {
                     _loc30_ = this.replaceTextPlaceholders(_loc30_,_loc32_);
                     _loc31_ = this.replaceTextPlaceholders(_loc31_,_loc32_);
                  }
                  _loc33_ = new QuestionWindow(this.notifier,_loc30_,_loc31_,_loc4_.windowButtonParams,_loc4_.sellPrice);
                  this.windowManager.showWindow(_loc33_);
               }
               break;
            case OldWindowTypes.SAVE_SCREENSHOT:
               _loc5_ = param1 as SaveScreenshotNotice;
               _loc6_ = new SaveScreenshotWindow(this.notifier,_loc5_.image,_loc5_.windowButtonParams);
               this.windowManager.showWindow(_loc6_);
               break;
            case OldWindowTypes.ANIMALBREED:
               _loc7_ = param1 as AnimalBreedWindowNotice;
               if(_loc7_)
               {
                  _loc34_ = new AnimalBreedWindow(this.notifier,_loc7_.itemCategory,_loc7_.itemUniqueId,_loc7_.breedTimeStamp,_loc7_.breedTime,_loc7_.directBreedReal,_loc7_.canDirectBreed,_loc7_.breedCostReal,_loc7_.breedCostVirtual,_loc7_.breedExperience,_loc7_.cage,_loc7_.cagePosition);
                  this.windowManager.showWindow(_loc34_);
               }
               break;
            case OldWindowTypes.ANIMALBREED_IN_PROGRESS:
               _loc8_ = new WindowButtonParams();
               _loc9_ = new AnimalBreedProgressWindow(this.notifier,_loc8_);
               this.windowManager.showWindow(_loc9_);
               break;
            case OldWindowTypes.ANIMALBREED_SUCCESS:
               _loc10_ = param1 as AnimalBreedSuccessWindowNotice;
               if(_loc10_)
               {
                  _loc35_ = TextResourceModule.getText("zoo.window.animalbreed.success.title");
                  _loc36_ = TextResourceModule.getText("zoo.window.animalbreed.success.info");
                  _loc37_ = new WindowButtonParams();
                  _loc38_ = new AnimalBreedSuccessWindow(this.notifier,_loc35_,_loc36_,_loc10_,_loc37_);
                  this.windowManager.showWindow(_loc38_);
               }
               break;
            case OldWindowTypes.ANIMALBREED_FAILED:
               _loc11_ = param1 as WindowNotice;
               if(_loc11_)
               {
                  _loc39_ = TextResourceModule.getText("zoo.window.animalbreed.failed.title");
                  _loc40_ = TextResourceModule.getText("zoo.window.animalbreed.failed.info");
                  _loc41_ = param1.windowButtonParams;
                  _loc42_ = new AnimalBreedFailedWindow(this.notifier,_loc39_,_loc40_,_loc41_);
                  WindowManager.getInstance().showWindow(_loc42_);
               }
               break;
            case OldWindowTypes.CONSTRUCTION:
               _loc12_ = param1 as ConstructionWindowNotice;
               if(_loc12_)
               {
                  _loc43_ = new ConstructionWindow(this.notifier,_loc12_.itemCategory,_loc12_.itemUniqueId,_loc12_.buildTimeStamp,_loc12_.buildTime,_loc12_.directBuildReal);
                  this.windowManager.showWindow(_loc43_);
               }
               break;
            case OldWindowTypes.LEVELUP:
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  _loc44_ = new WindowButtonParams(this.sendCheckLevelForTutorialNotification,null,this.sendCheckLevelForTutorialNotification,null,this.sendCheckLevelForTutorialNotification);
                  _loc45_ = new LevelupWindow(this.notifier,_loc44_);
                  _loc45_.levelID = _loc2_.userLevel;
                  this.windowManager.showWindow(_loc45_);
                  if(_loc2_.userLevel == 7)
                  {
                     TweenLite.delayedCall(0.3,this.openRecyclingCrafingUpdate);
                  }
               }
               break;
            case OldWindowTypes.ITEM_BUY_ONCE:
            case OldWindowTypes.ASSISTANCE_RENEVAL:
               break;
            case OldWindowTypes.BONUS_CODE_WINDOW:
               sendNotification(Note.EXIT_FULLSCREEN_MODE);
               _loc13_ = TextResourceModule.getText("zoo.window.bonus.main.title");
               _loc14_ = TextResourceModule.getText("zoo.window.bonus.main.info");
               _loc15_ = new WindowButtonParams(null,null,this.sendBonusCode);
               if(!this.bonusCodeWindow)
               {
                  this.bonusCodeWindow = new BonusCodeWindow(this.notifier,_loc13_,_loc14_,_loc15_);
               }
               WindowManager.getInstance().showWindow(this.bonusCodeWindow);
               break;
            case OldWindowTypes.ZOO_METER:
               _loc16_ = param1.windowButtonParams;
               _loc17_ = new ZooMeterWindow(this.notifier,_loc16_);
               WindowManager.getInstance().showWindow(_loc17_);
               break;
            case OldWindowTypes.MINIGAME_FORTUNE_DAYLY_TICKET:
               _loc18_ = new FortuneWheelFreeTurn(this.notifier,null,param1.windowButtonParams);
               this.windowManager.showWindow(_loc18_);
               break;
            case OldWindowTypes.MINIGAME_FORTUNE_WHEEL_PRICE:
               _loc19_ = new FortuneWheelPrice(this.notifier,FortuneWheelRewardWindowNotice(param1).rewardData,null,param1.windowButtonParams);
               this.windowManager.showWindow(_loc19_);
               break;
            case OldWindowTypes.MINIGAME_FORTUNE_BUY_TICKET:
               _loc20_ = new FortuneWheelAskExtraTurn(this.notifier,null,param1.windowButtonParams);
               this.windowManager.showWindow(_loc20_);
               break;
            case OldWindowTypes.WELCOME_BACK:
               _loc21_ = WindowManagerNew.openWindow(WindowReferences.WINDOW_WELCOMEBACK_CLASS,AssetConfig.ASSET_WINDOW_INTERMEDIATE) as WindowWelcomeBack;
               _loc21_.updateData(param1 as WelcomeBackWindowNotice,this.notifier);
               break;
            case OldWindowTypes.MINIGAME_SAFARI_NOT_AVALIABLE:
               _loc22_ = new SafariNotAvaliableWindow(this.notifier);
               this.windowManager.showWindow(_loc22_);
               break;
            case OldWindowTypes.MINIGAME_SAFARI_WELCOME:
               this.handleShowSafariWelcomeWindow(param1);
               break;
            case OldWindowTypes.STORAGE_UNLOCK:
               if(FeatureActiveReference.storage)
               {
                  _loc46_ = WindowManagerNew.openWindow(WindowReferences.WINDOW_STORAGE_UNLOCK_CLASS,AssetConfig.ASSET_WINDOW_INTERMEDIATE,[param1,this.notifier]) as WindowStorageUnlock;
                  _loc46_.updateData();
               }
               break;
            case OldWindowTypes.STORAGE_CAPACITY:
               if(FeatureActiveReference.storage)
               {
               }
               break;
            case OldWindowTypes.VISITOR_WISHES:
               _loc23_ = WindowManagerNew.openWindow(WindowReferences.WINDOW_VISITOR_WISHES_CLASS,AssetConfig.ASSET_WINDOW_SMALL,[param1,this.notifier]) as WindowVisitorWishes;
               _loc23_.updateData();
               break;
            case OldWindowTypes.FORGOTTEN_ZOO_UNLOCK:
               _loc24_ = WindowManagerNew.openWindow(WindowReferences.WINDOW_FORGOTTEN_ZOO_UNLOCK_CLASS,AssetConfig.ASSET_WINDOW_SMALL,[param1,this.notifier]) as WindowForgottenZooUnlock;
               _loc24_.updateData();
               break;
            case OldWindowTypes.SEND_TO_INVENTORY:
               WindowManagerNew.openWindow(WindowReferences.WINDOW_SEND_ITEM_TO_INVENTORY,AssetConfig.ASSET_WINDOW_MINI,[param1,this.notifier]);
         }
      }
      
      private function openRecyclingCrafingUpdate() : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.UNLOCK_CRAFTING_RECYCLING_WINDOW,"UNLOCK_CRAFTING_RECYCLING_WINDOW"));
      }
      
      private function confirmZDResourceBuy(param1:ItemPackVO) : void
      {
         this.hackedInResourceBuy = param1;
         var _loc2_:WindowButtonParams = new WindowButtonParams(null,null,this.handleConfirmBuy);
         var _loc3_:ZDResourceConfirmationWindow = new ZDResourceConfirmationWindow(this.notifier,param1,_loc2_);
         WindowManager.getInstance().showWindow(_loc3_);
      }
      
      private function handleConfirmBuy() : void
      {
         sendNotification(Note.BUY_REAL_CURRENCY_RESOURCE,this.hackedInResourceBuy);
         var _loc1_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.hackedInResourceBuy = null;
      }
      
      private function handleExpansionChanged() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         if(_loc1_.fieldSize == 12 && this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
         {
            this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.FORGOTTEN_ZOO_UNLOCK));
         }
      }
      
      private function sendCheckLevelForTutorialNotification() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         var _loc2_:int = this.playfieldProxy.getItemCount(Categories.STORAGE,0,true,MainConstants.STORAGE_WATERTTANK);
         var _loc3_:int = this.playfieldProxy.getItemCount(Categories.STORAGE,0,true,MainConstants.STORAGE_STOREHOUSE);
         if(_loc1_.fieldSize <= 11 && _loc2_ == 1 && _loc3_ == 1 && this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
         {
            this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.STORAGE_UNLOCK));
         }
         else if(_loc1_.fieldSize == 13 && this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
         {
         }
         this.notifier.dispatchNotice(new TutorialLevelNotice(TutorialLevelNotice.CHECK_LEVEL_FOR_TUTORIAL));
         if(_loc1_.userLevel == 5)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_UNLOCK_WINDOW));
         }
      }
      
      private function handleShowSafariWelcomeWindow(param1:WindowNotice) : void
      {
         var _loc4_:WindowButtonParams = null;
         var _loc5_:SafariWelcomeWindow = null;
         var _loc2_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         var _loc3_:String = "showedSafariWelcome_" + _loc2_.userId;
         if(CookieModule.getValue(_loc3_))
         {
            sendNotification(Note.CHANGE_APP_MODE,AppMode.SAFARI);
         }
         else
         {
            CookieModule.setValue(_loc3_,1);
            _loc4_ = param1.windowButtonParams;
            _loc5_ = new SafariWelcomeWindow(this.notifier,_loc4_);
            this.windowManager.showWindow(_loc5_);
         }
      }
      
      private function sellItemRequest() : void
      {
      }
      
      private function sendBonusCode() : void
      {
         facade.sendNotification(NET.REDEEM_BONUS_CODE,[this.bonusCodeWindow.bonusCodeText.text]);
         this.bonusCodeWindow.resetTextField();
      }
      
      public function handleCloseWindowGeneral(param1:WindowNotice) : void
      {
         var _loc2_:String = param1.windowTypeId.toString();
         this.windowManager.hideWindowWithID(_loc2_);
      }
      
      private function showMinitutorialForFirstLogin() : void
      {
         if(Settings.isFirstLogin)
         {
            this.menuWindowId = GUInterface.WINDOW_MINI_TUTORIAL;
         }
      }
      
      public function set menuWindowId(param1:int) : void
      {
         this._menuWindowId = param1;
         this.updateMenuWindows();
      }
      
      private function updateMenuWindows() : void
      {
         this.guiInterface.setGUIPanelLayerVisibility(true);
         switch(this._menuWindowId)
         {
            case GUInterface.WINDOW_BUY_CREDITS:
               this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
               break;
            case GUInterface.WINDOW_INVENTORY:
               this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.INVENTORY));
               break;
            case GUInterface.WINDOW_SETTINGS:
               this.openSettingsWindow();
               break;
            case GUInterface.WINDOW_MINI_TUTORIAL:
               this.openMiniTutorialWindow();
               break;
            case GUInterface.WINDOW_NOT_OPENED:
               this.closeAllMainWIndows();
         }
      }
      
      public function showPuzzleUnlocked(param1:AchievementRewardsData) : void
      {
         var _loc2_:PuzzleUnlockedWindow = new PuzzleUnlockedWindow(this.notifier);
         _loc2_.setData(param1);
         _loc2_.updateView();
         this.windowManager.showWindow(_loc2_);
      }
      
      public function handleTheAchievementCompleteData(param1:Vector.<AchievementData>) : void
      {
         var _loc2_:AchievementData = null;
         for each(_loc2_ in param1)
         {
            if(this.achievementsProxy.stageChanged(_loc2_))
            {
               this.showIndividualAchievFinished(_loc2_);
            }
         }
      }
      
      public function showIndividualAchievFinished(param1:AchievementData) : void
      {
         var _loc2_:IndividualAchievementWindow = new IndividualAchievementWindow(this.notifier);
         _loc2_.setData(param1);
         _loc2_.updateView();
         this.windowManager.showWindow(_loc2_);
      }
      
      private function closeAllMainWIndows() : void
      {
         this.windowManager.hideAllWindows();
      }
      
      private function openSettingsWindow(param1:Sprite = null) : void
      {
      }
      
      public function openMiniTutorialWindow() : void
      {
      }
      
      private function handleWindowShowToHidePanels(param1:Event) : void
      {
         this.guiInterface.setGUIPanelLayerVisibility(false);
      }
      
      private function handleWindowHideToShowPanels(param1:Event) : void
      {
         this.guiInterface.setGUIPanelLayerVisibility(true);
      }
      
      public function closeAllWindowns() : void
      {
         this.windowManager.hideAllWindows();
      }
   }
}

