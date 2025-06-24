package com.bigpoint.zoorama.core
{
   import com.bigpoint.utils.DebugView;
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.cookieModule.CookieModule;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.EVENT;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.features.crafting.vo.BlueprintRewardVo;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.ItemDropProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingSlotDataVo;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.RoadData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.TrashBinData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel.RewardData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResourceDifferenceData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementRewardsData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.news.NewsProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.AssistantTypeVO;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.events.UserEventProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.SnapShotProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.vo.UserDataSnapShotVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.browserBar.BrowserToolbarInitParams;
   import com.bigpoint.zoomumba.model.windows.info.ItemToInventoryInfoInitParams;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.safari.SafariManager;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialOverlay;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialStyleOverlay;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialLevelNotice;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import com.bigpoint.zoorama.notices.core.ExternalLinkNotice;
   import com.bigpoint.zoorama.notices.core.TypingKeyNotice;
   import com.bigpoint.zoorama.notices.gui.window.ItemWindowActionNotice;
   import com.bigpoint.zoorama.notices.gui.window.WelcomeBackWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.notices.itemDrop.ItemDropNotice;
   import com.bigpoint.zoorama.notices.settings.KeyboardControllNotice;
   import com.bigpoint.zoorama.notices.user.AssistanceNotice;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuTypes;
   import com.bigpoint.zoorama.view.field.PlayFieldNotice;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.FieldItemStateNotice;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.gui.GuiNotice;
   import com.bigpoint.zoorama.view.gui.mainmenu.MouseToolNotice;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.gui.win.generics.QuestionWindow;
   import com.bigpoint.zoorama.view.itemDrop.ItemDropTypes;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.bigpoint.zoorama.view.windows.WindowReferences;
   import com.greensock.TweenLite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class GameManager extends Mediator
   {
      public static const NAME:String = "GameManager";
      
      public static var enableGameFocus:Boolean = true;
      
      Settings.DISABLE_ALL_KEYS = false;
      
      private var appProxy:AppProxy;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var resourceProxy:ResourcesProxy;
      
      private var snapShotProxy:SnapShotProxy;
      
      private var netProxy:NetProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var userProxy:UserProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var newsProxy:NewsProxy;
      
      private var playFieldManager:PlayFieldManager;
      
      private var guInterfaceManager:GUInterfaceManager;
      
      private var safariManager:SafariManager;
      
      private var featureManager:FeatureManager;
      
      private var gameStage:Stage;
      
      private var notifier:Notifier;
      
      public var windowsManager:WindowManagerNew;
      
      public var enableGameFocus:Boolean = true;
      
      private var isUpPressed:Boolean;
      
      private var isDownPressed:Boolean;
      
      private var isLeftPressed:Boolean;
      
      private var isRightPressed:Boolean;
      
      private var isMoving:Boolean;
      
      private var isInitialized:Boolean = false;
      
      private var tutorialLayer:TutorialOverlay;
      
      private var tutorialStyleLayer:TutorialStyleOverlay;
      
      private var lastTimePressed:Number = 0;
      
      private var windowCountWithKeyInput:int = 0;
      
      private var isFortuneWheelBuyHandled:Boolean = false;
      
      private var blockFreeTicketMessageHack:Boolean = false;
      
      private var debugView:DebugView;
      
      private var gameContainer:UIComponent;
      
      private var paymentProxy:PaymentUrlProxy;
      
      private var appConfig:AppConfigProxy;
      
      public function GameManager(param1:UIComponent)
      {
         super(NAME,this);
         this.gameContainer = param1;
         this.gameStage = param1.stage;
         DisplayObjectHelper.debugStage = this.gameStage;
         this.notifier = new Notifier();
         sendNotification(Note.REGISTER_MANAGMENTCENTER_MEDIATOR,this.gameContainer);
         sendNotification(Note.INIT_MAP_SYSTEM_COMMAND,this.gameContainer);
         this.safariManager = new SafariManager(this.notifier,this.gameContainer);
         this.playFieldManager = new PlayFieldManager(this.notifier,this.gameContainer);
         if(Settings.TUTORIAL_ACTIVE)
         {
            this.tutorialStyleLayer = new TutorialStyleOverlay(this.notifier,this.playFieldManager);
            this.gameContainer.addChild(this.tutorialStyleLayer);
         }
         this.guInterfaceManager = new GUInterfaceManager(this.notifier,this.gameContainer);
         this.featureManager = new FeatureManager(this.notifier,this.playFieldManager);
         if(Settings.TUTORIAL_ACTIVE)
         {
            this.tutorialLayer = new TutorialOverlay();
            this.gameStage.addChild(this.tutorialLayer);
         }
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().addOverlay(this.tutorialLayer);
            TutorialInjectionManager.getInstance().addStyleOverlay(this.tutorialStyleLayer);
            TutorialInjectionManager.getInstance().setNotifier(this.notifier);
         }
         TooltipNewManager.init(this.gameStage);
         WindowManagerNew.setGameDims(MainConfig.STAGE_WIDTH,MainConfig.STAGE_HEIGHT);
         this.gameStage.addEventListener(KeyboardEvent.KEY_UP,this.handleKeyUp);
         this.gameStage.addEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
         this.gameStage.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
         if(!CookieModule.getValue("lastLoginDate"))
         {
            CookieModule.setValue("lastLoginDate",0);
         }
         if(!CookieModule.getValue("nextNewsShow"))
         {
            CookieModule.setValue("nextNewsShow",0);
         }
         if(Settings.TUTORIAL_ACTIVE)
         {
            TweenLite.delayedCall(2,this.makeCallToStartTutorial);
         }
      }
      
      public function initGame() : void
      {
         this.playFieldManager.init();
         this.guInterfaceManager.init();
         this.notifier.registerNoticeListener(QuickInfoNotice.INCREASE_RESOURCE,this.handleQuickinfoChange);
         this.notifier.registerNoticeListener(QuickInfoNotice.REDUCE_RESOURCE,this.handleQuickinfoChange);
         this.notifier.registerNoticeListener(QuickInfoNotice.INCREASE_CURRENCY,this.handleQuickinfoChange);
         this.notifier.registerNoticeListener(QuickInfoNotice.REDUCE_CURRENCY,this.handleQuickinfoChange);
         this.notifier.registerNoticeListener(GuiNotice.ZOOM_IN_CLICK,this.handleZoomInClick);
         this.notifier.registerNoticeListener(GuiNotice.ZOOM_OUT_CLICK,this.handleZoomOutClick);
         this.notifier.registerNoticeListener(GuiNotice.LOG_OUT,this.handleLogOut);
         this.notifier.registerNoticeListener(GuiNotice.CLOSE_MAIN_WINDOW,this.handleCloseMainWindow);
         this.notifier.registerNoticeListener(MouseToolNotice.INIT_MOVE_TOOL,this.handleInitTool);
         this.notifier.registerNoticeListener(MouseToolNotice.INIT_FLIP_TOOL,this.handleInitTool);
         this.notifier.registerNoticeListener(MouseToolNotice.INIT_SELL_TOOL,this.handleInitTool);
         this.notifier.registerNoticeListener(MouseToolNotice.INIT_STORE_TOOL,this.handleInitTool);
         this.notifier.registerNoticeListener(MouseToolNotice.INIT_HALT_ACTIONS,this.handleInitTool);
         this.notifier.registerNoticeListener(MouseToolNotice.DEFAULT,this.handleInitTool);
         this.notifier.registerNoticeListener(WindowNotice.OPEN_WINDOW,this.handleOpenWindowGeneral);
         this.notifier.registerNoticeListener(WindowNotice.CLOSE_WINDOW,this.handleCloseWindowGeneral);
         this.notifier.registerNoticeListener(ItemWindowActionNotice.BUY_INSTANT_BUILD,this.handleItemWindowAction);
         this.notifier.registerNoticeListener(ItemWindowActionNotice.BUY_INSTANT_BREED,this.handleItemWindowAction);
         this.notifier.registerNoticeListener(ItemWindowActionNotice.START_BREED,this.handleItemWindowAction);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT,this.handleExternalPaymentOpen);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT_PREMIUM,this.handleExternalPaymentPremiumOpen);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT_STARTER_PACK,this.handleExternalPaymentStarterPackOpen);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT_PAW_PRINT,this.handleExternalPaymentPawPrintOpen);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_BUY_TOOLBAR,this.handleExternalBuyToolbarOpen);
         this.notifier.registerNoticeListener(ExternalLinkNotice.OPEN_EXTERNAL_CASH_OFFERS,this.handleExternalCashOffersOpen);
         this.notifier.registerNoticeListener(GuiNotice.VOLUME_SWITCH_CLICK,this.handleVolumeSwitch);
         this.notifier.registerNoticeListener(ActionMenuNotice.OPEN_ACTION_MENU,this.handleActionMenuAction);
         this.notifier.registerNoticeListener(ActionMenuNotice.TOGGLE_ACTION_MENU,this.handleActionMenuAction);
         this.notifier.registerNoticeListener(ActionMenuNotice.CLOSE_ACTION_MENU,this.handleActionMenuAction);
         this.notifier.registerNoticeListener(AssistanceNotice.REFUSE_RENEW_ASSIST_CANTRACT,this.handleAssitanceAction);
         this.notifier.registerNoticeListener(PlayFieldNotice.ACTIVATE_EXPAND_BUY,this.handleOpenExpandBuyPrompt);
         this.notifier.registerNoticeListener(PlayFieldNotice.REMOVE_ALL_ITEMS,this.handleRemoveAllItems);
         this.notifier.registerNoticeListener(KeyboardControllNotice.SPACE_KEY_DISABLE,this.handleSpaceKeyDisable);
         this.notifier.registerNoticeListener(KeyboardControllNotice.SPACE_KEY_ENABLE,this.handleSpaceKeyEnable);
         this.notifier.registerNoticeListener(TypingKeyNotice.ENABLE,this.handleTypingKeysEnable);
         this.notifier.registerNoticeListener(TypingKeyNotice.DISABLE,this.handleTypingKeysDisable);
         this.notifier.registerNoticeListener(FieldItemStateNotice.CHANGE_ITEM_STATE,this.handleFieldItemStateChange);
         this.notifier.registerNoticeListener(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,this.handleFieldItemStateChange);
         this.notifier.registerNoticeListener(TutorialNotices.MAXIMISE_WINDOW,this.handleTutorialWindow);
         this.notifier.registerNoticeListener(TutorialNotices.MINIMISE_WINDOW,this.handleTutorialWindow);
         this.notifier.registerNoticeListener(TutorialNotices.TUTORIAL_SKIPPED,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.TUTORIAL_STARTED,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.TUTORIAL_COMPLETED,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.OPEN_WINDOW_SINGLE_STEP,this.handleTutorialWindow);
         this.notifier.registerNoticeListener(TutorialNotices.COMPLETE_SINGLE_STEP,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.NEXT_STEP,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.STEP_SKIPPED,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.STEP_COMPLETED,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.TASK_COMPLETE,this.handleTutorialActions);
         this.notifier.registerNoticeListener(TutorialNotices.HIGHLIGHT_CORRECT_SEX,this.handleHighlightCorrectSex);
         this.notifier.registerNoticeListener(TutorialNotices.SHOP_ITEM_SELECTED,this.handleTutorialShopItemSelected);
         this.notifier.registerNoticeListener(TutorialNotices.SHOP_WINDOW_CLOSED,this.handleTutorialShopWindowClosed);
         this.notifier.registerNoticeListener(TutorialNotices.CLOSE_TUTORIAL_WINDOW,this.handleTutorialCloseWindow);
         this.notifier.registerNoticeListener(TutorialLevelNotice.CHECK_LEVEL_FOR_TUTORIAL,this.checkLevelStatusForTutorial);
         sendNotification(Note.GET_USER_WITH_EVENTS);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.USER_LEVEL_UP,SHOP.CANCEL_SHOP_ITEM_DRAG,Note.USE_SAFARI_JOKER,ResponseName.CLIENT_SETTINGS,ResponseName.INVENTORY_ANIMALS_DATA,ResponseName.INVENTORY_CAGES_DATA,ResponseName.INVENTORY_DECORATIONS_DATA,ResponseName.INVENTORY_STORES_DATA,ResponseName.RESOURCE_DIFF_DATA,ResponseName.USER_ASSISTANTS,Note.USER_DATA_UPDATED,ResponseName.CAGES,ResponseName.DECORATIONS,ResponseName.ROADS,ResponseName.STORES,ResponseName.TRASHBINS,ResponseName.NEIGHBOUR_CAGES,ResponseName.NEIGHBOUR_DECORATIONS,ResponseName.NEIGHBOUR_ROADS,ResponseName.NEIGHBOUR_STORES,ResponseName.NEIGHBOUR_TRASHBINS,ResponseName.EVENT_DATA,ResponseName.QUEST_DAILY_DATA,ResponseName.MAIL_INBOX_DATA,ResponseName.MAIL_OUTBOX_DATA,ResponseName.MAIL_UNREAD_STATUS_DATA,ResponseName.ACHIEVEMENTS,ResponseName.ACHIEVEMENTS_COMPLETE,ResponseName.ACHIEVEMENTS_PUZZLE_COMPLETE_DATA,ResponseName.ITEM_DROP_HASH,ResponseName.ITEM_DROP_TIMER,ResponseName.NEWS,ResponseName.FORTUNE_WHEEL_DATA,ResponseName.SAFARI_CONFIG_DATA,ResponseName
         .SAFARI_DATA,ResponseName.EVENT_OBJECT,ResponseName.TOOL_BAR_REWORD,Note.OPEN_WINDOW,GUINote.MENU_TOGGLE_SOUND_BUTTON_CLICKED,GUINote.MENU_LOGOUT_BUTTON_CLICKED,DataNote.APP_MODE_CHANGED,Note.SHOP_ITEM_NOTICE,Note.ENABLE_GAME_VOLUME,Note.DISABLE_GAME_VOLUME,Note.CHANGE_STAGE_QUALITY,Note.APP_SETTINGS_STORED,Note.FORCE_LOGOUT,Note.CHANGE_CURSOR,Note.XMAS2012_PAY_PACKAGE,Note.VALENTINE2013_PAY_PACKAGE,Note.BOARDGAME_PAY_PACKAGE,Note.SAFARI_SHOW,EVENT.START,EVENT.END,TutorialNotices.SHOP_WINDOW_CLOSED,TutorialNotices.SHOP_ITEM_SELECTED,"TestWindowOpenNote","TestWindowCloseNote","TestWindowConfirmNote","TestWindowCancelNote"];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:AppCookieProxy = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:* = false;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:WindowButtonParams = null;
         switch(param1.getName())
         {
            case Note.SAFARI_SHOW:
               if(this.userProxy.userLevel >= MainConfig.SAFARI_ENABLED_LEVEL)
               {
                  _loc8_ = new WindowButtonParams(null,null,this.handleOpenSafariGame);
                  this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.MINIGAME_SAFARI_WELCOME,_loc8_));
               }
               else
               {
                  this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.MINIGAME_SAFARI_NOT_AVALIABLE));
               }
               break;
            case Note.CHANGE_CURSOR:
               this.handleInitTool(new MouseToolNotice(param1.getBody() as String));
               break;
            case "TestWindowOpenNote":
            case "TestWindowCloseNote":
            case "TestWindowConfirmNote":
            case "TestWindowCancelNote":
               break;
            case GUINote.MENU_LOGOUT_BUTTON_CLICKED:
               this.handleLogOut(null);
               break;
            case Note.FORCE_LOGOUT:
               this.handleCloseGame();
               break;
            case Note.USER_LEVEL_UP:
               this.handleUserLevelChange();
               break;
            case ResponseName.EVENT_OBJECT:
               this.handleEventObject(param1.getBody() as Object);
               break;
            case Note.USER_DATA_UPDATED:
               this.handleUserData();
               break;
            case ResponseName.RESOURCE_DIFF_DATA:
               this.handleResourceDiff(param1.getBody() as ResourceDifferenceData);
               break;
            case ResponseName.CAGES:
               this.handleCagesData(param1.getBody() as Vector.<FieldItemData>);
               break;
            case ResponseName.DECORATIONS:
               this.handleDecorsData(param1.getBody() as Vector.<DecorData>);
               break;
            case ResponseName.ROADS:
               this.handleRoadsData(param1.getBody() as Vector.<RoadData>);
               break;
            case ResponseName.STORES:
               this.handleStoresData(param1.getBody() as Vector.<StoreData>);
               break;
            case ResponseName.TRASHBINS:
               this.handleTrashbinsData(param1.getBody() as Vector.<TrashBinData>);
               break;
            case ResponseName.ACHIEVEMENTS_COMPLETE:
               this.guInterfaceManager.handleTheAchievementCompleteData(param1.getBody() as Vector.<AchievementData>);
               break;
            case ResponseName.ACHIEVEMENTS_PUZZLE_COMPLETE_DATA:
               this.guInterfaceManager.showPuzzleUnlocked(param1.getBody() as AchievementRewardsData);
               break;
            case ResponseName.NEIGHBOUR_CAGES:
               this.handleNeighbourCagesData(param1.getBody() as CageData);
               break;
            case ResponseName.NEIGHBOUR_DECORATIONS:
               this.handleNeighbourDecorsData(param1.getBody() as DecorData);
               break;
            case ResponseName.NEIGHBOUR_ROADS:
               this.handleNeighbourRoadsData(param1.getBody() as RoadData);
               break;
            case ResponseName.NEIGHBOUR_STORES:
               this.handleNeighbourStoresData(param1.getBody() as StoreData);
               break;
            case ResponseName.NEIGHBOUR_TRASHBINS:
               this.handleNeighbourTrashbinsData(param1.getBody() as TrashBinData);
               break;
            case ResponseName.NEIGHBOUR_NURSERY:
               this.handleNeighbourNurseryData(param1.getBody() as NurseryVO);
               break;
            case ResponseName.NEIGHBOUR_BREEDING_LAB:
               this.handleNeighbourBreedingLabData(param1.getBody() as BreedingLabVO);
               break;
            case ResponseName.ITEM_DROP_TIMER:
               break;
            case ResponseName.NEWS:
               this.handleNewsData(param1.getBody() as Object);
               break;
            case ResponseName.SAFARI_CONFIG_DATA:
               this.handleSafariConfigData(param1.getBody() as SafariConfigData);
               break;
            case ResponseName.SAFARI_DATA:
               this.handleSafariData(param1.getBody() as SafariData);
               break;
            case ResponseName.TOOL_BAR_REWORD:
               this.handleToolBarReword(param1.getBody() as RewardData);
               break;
            case Note.OPEN_WINDOW:
               this.handleWindowOpening(param1.getBody());
               break;
            case DataNote.APP_MODE_CHANGED:
               this.handleAppModeChange();
               break;
            case GUINote.MENU_TOGGLE_SOUND_BUTTON_CLICKED:
               this.handleVolumeSwitch(new GuiNotice(GuiNotice.VOLUME_SWITCH_CLICK));
               break;
            case Note.CHANGE_STAGE_QUALITY:
               this.handleStageQualityChange(param1.getBody() as String);
               break;
            case Note.APP_SETTINGS_STORED:
               this.enableApp();
               break;
            case Note.USE_SAFARI_JOKER:
               this.useSafariJoker(param1.getBody() as SafariShopData);
               break;
            case SHOP.CANCEL_SHOP_ITEM_DRAG:
               this.handleShopCancelSelect();
               break;
            case Note.VALENTINE2013_PAY_PACKAGE:
               _loc6_ = param1.getBody().valentinepay;
               if((Boolean(_loc6_)) && (Boolean(_loc6_.hasOwnProperty("pack1")) || Boolean(_loc6_.hasOwnProperty("pack2"))))
               {
                  _loc2_ = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
                  _loc3_ = uint(_loc2_.getCookie(Note.VALENTINE2013_PAY_PACKAGE));
                  _loc4_ = uint(TimeManager.currentTime - _loc3_);
                  _loc5_ = _loc4_ > TimeManager.SECONDS_IN_HOUR * 4;
                  if(_loc5_)
                  {
                     _loc2_.setCookie(Note.VALENTINE2013_PAY_PACKAGE,TimeManager.currentTime);
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.VALENTINES_2013_PAY_PACKAGE,"",param1.getBody().valentinepay));
                  }
               }
               break;
            case Note.BOARDGAME_PAY_PACKAGE:
               if(param1.getBody()[ResponseName.BOARDGAME_PAY_THANKSGIVING])
               {
                  _loc7_ = param1.getBody()[ResponseName.BOARDGAME_PAY_THANKSGIVING];
               }
               else
               {
                  _loc7_ = param1.getBody()[ResponseName.BOARDGAME_PAY];
               }
               if(Boolean(_loc7_) && (Boolean(_loc7_.hasOwnProperty("pack1")) || Boolean(_loc7_.hasOwnProperty("pack2"))))
               {
                  _loc2_ = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
                  _loc3_ = uint(_loc2_.getCookie(Note.BOARDGAME_PAY_PACKAGE));
                  _loc4_ = uint(TimeManager.currentTime - _loc3_);
                  _loc5_ = _loc4_ > TimeManager.SECONDS_IN_HOUR * 4;
                  if(_loc5_)
                  {
                     _loc2_.setCookie(Note.BOARDGAME_PAY_PACKAGE,TimeManager.currentTime);
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BOARDGAME_PAY_PACKAGE,"",_loc7_));
                  }
               }
               break;
            case TutorialNotices.SHOP_WINDOW_CLOSED:
               this.handleTutorialShopWindowClosed(null);
               break;
            case TutorialNotices.SHOP_ITEM_SELECTED:
               this.handleTutorialShopItemSelected(null);
               break;
            case EVENT.START:
               this.onEventStart(param1);
               break;
            case EVENT.END:
               this.onEventEnd(param1);
               break;
            default:
               sendNotification(Note.WARNING_REPORT,"GameManager dosn\'t handle notice : " + param1.getName());
         }
      }
      
      private function handleShopCancelSelect() : void
      {
         this.playFieldManager.stopDragShopItem();
         this.handleActionMenuAction(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGESLOTS));
      }
      
      private function useSafariJoker(param1:SafariShopData) : void
      {
         if(param1.useMode)
         {
            this.safariManager.activateJokerAction(param1.itemId);
            if(param1.itemId != 2 || param1.jokerUsePosX != -1 && param1.jokerUsePosY != -1)
            {
               sendNotification(NET.USE_SAFARI_JOKER,[param1.itemId,param1.jokerUsePosX,param1.jokerUsePosY]);
               sendNotification(Note.REFRESH_JOKER_LIST);
            }
         }
      }
      
      private function enableApp() : void
      {
         var _loc1_:AppSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         if(this.isInitialized == false)
         {
            this.isInitialized = true;
            this.playFieldManager.enable();
            this.guInterfaceManager.enable();
         }
         if(!_loc1_.hasBackgroundSounds)
         {
            sendNotification(Note.SOUND_BUTTON_STATE_OFF);
         }
      }
      
      private function handleAppModeChange() : void
      {
         var _loc1_:UserEventProxy = null;
         switch(this.appProxy.currentAppMode)
         {
            case AppMode.SAFARI:
               SoundManager.getInstance().changeBackGroundMode(SoundManager.BACKGROUND_MODE_SAFARI);
               break;
            case AppMode.MANAGMENT_CENTER:
               SoundManager.getInstance().changeBackGroundMode(SoundManager.BACKGROUND_MODE_CITY);
               break;
            case AppMode.MAP_OVERVIEW:
               SoundManager.getInstance().changeBackGroundMode(SoundManager.BACKGROUND_MODE_MAP);
               break;
            case AppMode.VISIT_NEIGHBOUR:
               _loc1_ = facade.retrieveProxy(UserEventProxy.NAME) as UserEventProxy;
               _loc1_.clearEsterDataUsage();
               break;
            case AppMode.MAP_OVERVIEW:
               SoundManager.getInstance().changeBackGroundMode(SoundManager.BACKGROUND_MODE_CITY);
               break;
            default:
               SoundManager.getInstance().changeBackGroundMode(SoundManager.BACKGROUND_MODE_NORMAL);
         }
      }
      
      override public function onRegister() : void
      {
         facade.registerMediator(this.guInterfaceManager);
         facade.registerMediator(this.playFieldManager);
         facade.registerMediator(this.featureManager);
         facade.registerMediator(this.safariManager);
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.resourceProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.snapShotProxy = facade.retrieveProxy(SnapShotProxy.NAME) as SnapShotProxy;
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.newsProxy = facade.retrieveProxy(NewsProxy.NAME) as NewsProxy;
         this.paymentProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         this.appConfig = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
      }
      
      private function checkLevelStatusForTutorial(param1:TutorialLevelNotice) : void
      {
         if(this.userProxy.userLevel == 5)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.OPEN_WINDOW_SINGLE_STEP,13));
         }
         else if(this.userProxy.userLevel == 7)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.OPEN_WINDOW_SINGLE_STEP,14));
         }
      }
      
      private function handleRemoveAllItems(param1:PlayFieldNotice) : void
      {
         this.playFieldManager.removeAllItems(param1.clearFor);
      }
      
      private function handleWindowOpening(param1:Object) : void
      {
         switch(param1.cla)
         {
            case WindowReferences.WINDOW_BANK_CLASS:
               this.notifier.dispatchNoticeToRoot(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
         }
      }
      
      private function handleTutorialCloseWindow(param1:TutorialNotices) : void
      {
         this.featureManager.closeTutorialWindow();
      }
      
      private function makeCallToStartTutorial() : void
      {
         this.featureManager.setTutorialWindowButton(this.gameContainer);
         this.featureManager.openTutorialWindow();
      }
      
      private function handleTutorialWindow(param1:TutorialNotices) : void
      {
         if(param1.type == TutorialNotices.MAXIMISE_WINDOW)
         {
            this.featureManager.maximiseTutorialWindow();
         }
         else if(param1.type == TutorialNotices.MINIMISE_WINDOW)
         {
            this.featureManager.minimiseTutorialWindow();
         }
         else if(param1.type == TutorialNotices.OPEN_WINDOW_SINGLE_STEP)
         {
            if(!this.tutorialStyleLayer)
            {
               TutorialInjectionManager.getInstance().setNotifier(this.notifier);
               this.tutorialStyleLayer = new TutorialStyleOverlay(this.notifier,this.playFieldManager);
               this.gameContainer.addChild(this.tutorialStyleLayer);
               TutorialInjectionManager.getInstance().addStyleOverlay(this.tutorialStyleLayer);
            }
            this.featureManager.openTutorialForSingleStep(param1.Id);
         }
      }
      
      private function handleTutorialActions(param1:TutorialNotices) : void
      {
         if(param1.type == TutorialNotices.TUTORIAL_STARTED)
         {
            this.featureManager.updateTutorialData(param1.Id);
         }
         else if(param1.type == TutorialNotices.TUTORIAL_SKIPPED)
         {
            this.featureManager.tutorialHasBeenSkipped();
         }
         else if(param1.type == TutorialNotices.STEP_COMPLETED)
         {
            this.featureManager.updateStepCompletionStatus(param1.Id);
         }
         else if(param1.type == TutorialNotices.STEP_SKIPPED)
         {
            this.featureManager.updateStepSkippedStatus(param1.Id);
         }
         else if(param1.type == TutorialNotices.NEXT_STEP)
         {
            this.featureManager.updateMoveToNextStep(param1.Id);
         }
         else if(param1.type == TutorialNotices.TASK_COMPLETE)
         {
            this.featureManager.updateTaskCompletion(param1.Id);
         }
         else if(param1.type == TutorialNotices.TUTORIAL_COMPLETED)
         {
            this.featureManager.tutorialHasBeenCompleted();
         }
         else if(param1.type == TutorialNotices.COMPLETE_SINGLE_STEP)
         {
            this.featureManager.closeTutorialAfterSingleStep();
         }
      }
      
      private function handleHighlightCorrectSex(param1:TutorialNotices) : void
      {
         this.featureManager.handleHighlightCorrectSex(param1);
      }
      
      private function handleTutorialShopItemSelected(param1:TutorialNotices) : void
      {
         TutorialInjectionManager.getInstance().shopItemSelected(param1);
      }
      
      private function handleTutorialShopWindowClosed(param1:TutorialNotices) : void
      {
         TutorialInjectionManager.getInstance().shopWindowClosed(param1);
      }
      
      private function handleCloseMainWindow(param1:GuiNotice) : void
      {
         WindowManagerNew.closeAllWindows();
         this.guInterfaceManager.closeAllWindowns();
      }
      
      private function handleResourceDiff(param1:ResourceDifferenceData) : void
      {
      }
      
      private function handleExternalPaymentOpen(param1:ExternalLinkNotice) : void
      {
         if(this.paymentProxy.paymentUrlVO.ajaxPay.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + this.paymentProxy.paymentUrlVO.ajaxPay + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlPay),"_blank");
         }
      }
      
      private function handleExternalPaymentPremiumOpen(param1:ExternalLinkNotice) : void
      {
         if(this.paymentProxy.paymentUrlVO.ajaxPrem.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + this.paymentProxy.paymentUrlVO.ajaxPrem + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlPrem),"_blank");
         }
      }
      
      private function handleExternalPaymentStarterPackOpen(param1:ExternalLinkNotice) : void
      {
         if(this.paymentProxy.paymentUrlVO.ajaxStart.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + this.paymentProxy.paymentUrlVO.ajaxStart + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlStart),"_blank");
         }
      }
      
      private function handleExternalPaymentPawPrintOpen(param1:ExternalLinkNotice) : void
      {
         navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlPaw),"_blank");
      }
      
      private function handleExternalBuyToolbarOpen(param1:ExternalLinkNotice) : void
      {
         ExternalInterface.call("faLoadPage(\'/_ajax.php?action=toolbar\')");
      }
      
      private function handleExternalCashOffersOpen(param1:ExternalLinkNotice) : void
      {
         if(this.paymentProxy.paymentUrlVO.ajaxStart.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'/_ajax.php?action=cashforaction\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlCash),"cashOffers");
         }
      }
      
      private function handleSpaceKeyDisable(param1:KeyboardControllNotice) : void
      {
         this.playFieldManager.diactivateScreenDrag();
      }
      
      private function handleSpaceKeyEnable(param1:KeyboardControllNotice) : void
      {
         this.playFieldManager.activateScreenDrag();
      }
      
      private function handleUserData() : void
      {
         var _loc1_:UserDataSnapShotVO = this.snapShotProxy.getSnapShotForCommandId(this.netProxy.lastParsedResponse);
         if(_loc1_)
         {
            TweenLite.killDelayedCallsTo(this.calculateUserDataDiff);
            TweenLite.delayedCall(0.1,this.calculateUserDataDiff,[_loc1_]);
         }
      }
      
      private function handleCagesData(param1:Vector.<FieldItemData>) : void
      {
         var _loc2_:AssistancesProxy = null;
         var _loc3_:int = 0;
         var _loc4_:CageDropRequestVO = null;
         var _loc5_:CageDropRequestVO = null;
         var _loc6_:CageDropRequestVO = null;
         var _loc7_:CageDropRequestVO = null;
         var _loc8_:CageDropRequestVO = null;
         var _loc9_:CageDropRequestVO = null;
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
            _loc2_ = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
            if(_loc2_.lastAssistCID != -1 && this.netProxy.lastParsedResponse >= _loc2_.lastAssistCID)
            {
               _loc3_ = 0;
               while(_loc3_ < param1.length)
               {
                  if((_loc2_.lastAssistType == AssistantTypeVO.FEED_ASSISTANT || _loc2_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.FEED,param1[_loc3_]))
                  {
                     _loc4_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.FEED);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc4_);
                  }
                  if(_loc2_.lastAssistType == AssistantTypeVO.SUPER_FEED_ASSISTANT && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.SUPER_FEED,param1[_loc3_]))
                  {
                     _loc5_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.SUPERFEED);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc5_);
                  }
                  if(_loc2_.lastAssistType == AssistantTypeVO.POWER_FEED_ASSISTANT && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.POWER_FEED,param1[_loc3_]))
                  {
                     _loc6_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.POWERFEED);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc6_);
                  }
                  if((_loc2_.lastAssistType == AssistantTypeVO.CUDDLE_ASSISTANT || _loc2_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.CUDDLE,param1[_loc3_]))
                  {
                     _loc7_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.CUDDLE);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc7_);
                  }
                  if((_loc2_.lastAssistType == AssistantTypeVO.WATER_ASSISTANT || _loc2_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.WATER,param1[_loc3_]))
                  {
                     _loc8_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.WATER);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc8_);
                  }
                  if((_loc2_.lastAssistType == AssistantTypeVO.CLEAN_ASSISTANT || _loc2_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(param1[_loc3_].uniqueId,ActionType.CLEAN,param1[_loc3_]))
                  {
                     _loc9_ = new CageDropRequestVO(param1[_loc3_].uniqueId,CageActionIds.CLEAN);
                     sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc9_);
                  }
                  _loc3_++;
               }
               _loc2_.assistatDataParsed();
            }
         }
      }
      
      private function actionPerformed(param1:int, param2:int, param3:FieldItemData) : Boolean
      {
         var _loc8_:Cage = null;
         var _loc10_:UserResourcesProxy = null;
         var _loc11_:ResourcesProxy = null;
         var _loc12_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:CageData = CageData(param3);
         var _loc6_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc7_:Vector.<ItemAbstract> = _loc6_.getItemsByCategory(Categories.CAGE);
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc7_[_loc9_].uniqueId == param1)
            {
               _loc8_ = _loc7_[_loc9_] as Cage;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            return false;
         }
         _loc10_ = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
         _loc11_ = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         _loc12_ = 0;
         switch(param2)
         {
            case ActionType.SUPER_FEED:
               _loc12_ = _loc10_.getResourseUsedAmount(_loc8_,ActionType.SUPER_FEED);
               if(_loc5_.feedTimeStamp != _loc8_.feedTimeStamp && _loc5_.feedTimeStamp != 0 && _loc11_.superfood >= _loc12_)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.POWER_FEED:
               _loc12_ = _loc10_.getResourseUsedAmount(_loc8_,ActionType.POWER_FEED);
               if(_loc5_.feedTimeStamp != _loc8_.feedTimeStamp && _loc5_.feedTimeStamp != 0 && _loc11_.powerfood >= _loc12_)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.FEED:
               _loc12_ = _loc10_.getResourseUsedAmount(_loc8_,ActionType.FEED);
               if(_loc5_.feedTimeStamp != _loc8_.feedTimeStamp && _loc5_.feedTimeStamp != 0 && _loc11_.getResourseAmmount(_loc8_.foodId) >= _loc12_)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.CUDDLE:
               if(_loc5_.cuddleTimeStamp != _loc8_.cuddleTimeStamp && _loc5_.cuddleTimeStamp != 0)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.WATER:
               _loc12_ = _loc10_.getResourseUsedAmount(_loc8_,ActionType.WATER);
               if(_loc5_.waterTimeStamp != _loc8_.waterTimeStamp && _loc5_.waterTimeStamp != 0 && _loc11_.water >= _loc12_)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.CLEAN:
               if(_loc5_.cleanTimeStamp != _loc8_.cleanTimeStamp && _loc5_.cleanTimeStamp != 0)
               {
                  _loc4_ = true;
               }
         }
         return _loc4_;
      }
      
      private function handleNeighbourCagesData(param1:CageData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setCageFields(param1);
         }
      }
      
      private function handleStoresData(param1:Vector.<StoreData>) : void
      {
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
         }
      }
      
      private function handleNeighbourStoresData(param1:StoreData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setStoreFields(param1);
         }
      }
      
      private function handleDecorsData(param1:Vector.<DecorData>) : void
      {
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
         }
      }
      
      private function handleNeighbourDecorsData(param1:DecorData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setDecorFields(param1);
         }
      }
      
      private function calculateUserDataDiff(param1:UserDataSnapShotVO) : void
      {
         var _loc2_:int = 650;
         var _loc3_:int = 500;
         if(Settings.SCALE_TEST)
         {
            _loc2_ = 450;
            _loc3_ = 300;
         }
         var _loc4_:int = 40;
         var _loc5_:Point = this.playFieldManager.stageToFieldCords(new Point(730,350));
         var _loc6_:Number = 0;
         var _loc7_:ItemDropProxy = facade.retrieveProxy(ItemDropProxy.NAME) as ItemDropProxy;
         if(_loc7_.stackedPaws > 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.PET_POWNS,_loc7_.stackedPaws,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
            _loc7_.clearStackedPaws();
         }
         if(_loc7_.stackedPearls > 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.PEARLS,_loc7_.stackedPearls,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
            _loc7_.clearStackedPearls();
         }
         _loc6_ = this.currencyProxy.getCurrency(UserResources.EXPERIENCE) - param1.userExperience;
         if(_loc6_ > 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc6_,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
         }
         else if(_loc6_ < 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.EXPERIENCE,-_loc6_,new Point(400,300)));
            _loc3_ -= _loc4_;
         }
         _loc6_ = this.userProxy.virtualAmount - param1.virtualAmount;
         if(_loc6_ > 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc6_,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
         }
         else if(_loc6_ < 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,-_loc6_,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
         }
         _loc6_ = this.userProxy.realAmount - param1.realAmount;
         if(_loc6_ > 0)
         {
            this.notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.SHOW_DROP,ItemDropTypes.ACTION_ASSISTANT,ItemDropTypes.ITEM_ZD,_loc6_,_loc5_,null));
            _loc3_ -= _loc4_;
         }
         else if(_loc6_ < 0)
         {
            this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,-_loc6_,new Point(_loc2_,_loc3_)));
            _loc3_ -= _loc4_;
         }
         _loc6_ = this.userProxy.petPaws - param1.petPaws;
         if(_loc6_ > 0)
         {
            this.notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.SHOW_DROP,ItemDropTypes.ACTION_ASSISTANT,ItemDropTypes.ITEM_PAW,_loc6_,_loc5_,null));
         }
         else if(_loc6_ < 0)
         {
         }
         _loc6_ = this.userProxy.pearls - param1.pearls;
         if(_loc6_ > 0)
         {
            this.notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.SHOW_DROP,ItemDropTypes.ACTION_ASSISTANT,ItemDropTypes.ITEM_PEARL,_loc6_,_loc5_,null));
         }
         else if(_loc6_ < 0)
         {
         }
         var _loc8_:int = 0;
         while(_loc8_ < Resources.MAX_RESOURCE_ID)
         {
            _loc6_ = this.resourceProxy.getResourseAmmount(_loc8_) - param1.userResourses[_loc8_];
            if(_loc6_ > 0)
            {
               this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.INCREASE_RESOURCE,_loc8_,_loc6_,new Point(_loc2_,_loc3_)));
               _loc3_ -= _loc4_;
            }
            else if(_loc6_ < 0)
            {
               this.handleQuickinfoChange(new QuickInfoNotice(QuickInfoNotice.REDUCE_RESOURCE,_loc8_,-_loc6_,new Point(_loc2_,_loc3_)));
               _loc3_ -= _loc4_;
            }
            _loc8_++;
         }
      }
      
      private function handleQuickinfoChange(param1:QuickInfoNotice) : void
      {
         this.guInterfaceManager.showQuickInfo(param1);
      }
      
      private function handleRoadsData(param1:Vector.<RoadData>) : void
      {
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
         }
      }
      
      private function handleNeighbourRoadsData(param1:RoadData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setRoadFields(param1);
         }
      }
      
      private function handleTrashbinsData(param1:Vector.<TrashBinData>) : void
      {
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
         }
      }
      
      private function handleNeighbourTrashbinsData(param1:TrashBinData) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setTrashBinFields(param1);
         }
      }
      
      private function handleNeighbourBreedingLabData(param1:BreedingLabVO) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setBreedingLabFields(param1);
         }
      }
      
      private function handleNeighbourNurseryData(param1:NurseryVO) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.playFieldManager.setNurseryFields(param1);
         }
      }
      
      private function handleZoomOutClick(param1:GuiNotice) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.playFieldManager.zoomOut();
         }
      }
      
      private function handleZoomInClick(param1:GuiNotice) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.playFieldManager.zoomIn();
         }
      }
      
      private function handleLogOut(param1:GuiNotice) : void
      {
         var _loc2_:QuestionWindow = new QuestionWindow(this.notifier,TextResourceModule.getText("zoo.window.confirmation.closegame.title"),TextResourceModule.getText("zoo.window.confirmation.closegame.info"),new WindowButtonParams(null,null,this.handleCloseGame));
         WindowManager.getInstance().showWindow(_loc2_);
      }
      
      private function handleCloseGame() : void
      {
         var _loc1_:String = "/index.php";
         _loc1_ = "/index.php?action=externalLogout&aid=" + Settings.AID + "&aip=" + Settings.AIP;
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         navigateToURL(_loc2_,"_self");
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
      }
      
      private function handleInitTool(param1:MouseToolNotice) : void
      {
         this.playFieldManager.initTool(param1.type);
      }
      
      private function handleGameVolumeSettingsChanged(param1:Boolean) : void
      {
      }
      
      private function handleVolumeSwitch(param1:GuiNotice) : void
      {
         var _loc2_:AppSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         var _loc3_:AppSettingsVO = _loc2_.getData() as AppSettingsVO;
         var _loc4_:SoundManager = SoundManager.getInstance();
         if(_loc4_.hasBackgroundSound() || _loc4_.hasSoundEffects())
         {
            _loc3_.se = 0;
            _loc3_.sb = 0;
         }
         else
         {
            _loc3_.se = 1;
            _loc3_.sb = 1;
         }
         sendNotification(Note.UPDATE_APP_SETTINGS,_loc3_);
         sendNotification(Note.SERVER_SAVE_APP_SETTINGS);
      }
      
      private function handleActionMenuAction(param1:ActionMenuNotice) : void
      {
         this.playFieldManager.handleActionMenuNotice(param1);
      }
      
      private function handleStageQualityChange(param1:String) : void
      {
         this.gameStage.quality = param1;
      }
      
      private function handleOpenWindowGeneral(param1:WindowNotice) : void
      {
         this.guInterfaceManager.handleOpenWindowGeneral(param1);
      }
      
      private function handleCloseWindowGeneral(param1:WindowNotice) : void
      {
         this.guInterfaceManager.handleCloseWindowGeneral(param1);
      }
      
      private function handleAssitanceAction(param1:AssistanceNotice) : void
      {
         sendNotification(NET.CLEAR_ASSISTANT_TIMER,[param1.assistanceId]);
      }
      
      private function handleEventObject(param1:Object) : void
      {
         if(param1.pPaws)
         {
            if(param1.pPaws > 0)
            {
            }
         }
      }
      
      private function handleNewsData(param1:Object) : void
      {
         TweenLite.delayedCall(10,this.handleReactivation);
      }
      
      private function handleReactivation() : void
      {
         var _loc1_:WelcomeBackWindowNotice = null;
         if(Settings.REACTIVATED)
         {
            _loc1_ = new WelcomeBackWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.WELCOME_BACK);
            _loc1_.prices = ConfigurationModule.getInstance().getWelcomeBackItems(Settings.REACTIVATED);
            this.notifier.dispatchNotice(_loc1_);
         }
      }
      
      private function handleOpenExpandBuyPrompt(param1:PlayFieldNotice) : void
      {
         if(this.appProxy.currentAppMode == AppMode.NORMAL)
         {
            sendNotification(Note.BUY_EXPANSION,MainConstants.EXPANSION_BUY_FROM_FIELD);
         }
      }
      
      private function handleSafariConfigData(param1:SafariConfigData) : void
      {
         this.safariManager.storeConfigData(param1);
      }
      
      private function handleSafariData(param1:SafariData) : void
      {
         this.safariManager.updateSafariState(param1);
      }
      
      private function handleToolBarReword(param1:RewardData) : void
      {
         var _loc2_:ItemPackVO = new ItemPackVO();
         _loc2_.category = ItemTypeHelper.typeToCategory(param1.type);
         _loc2_.itemId = param1.itemId;
         _loc2_.count = param1.count;
         if(_loc2_.category == Categories.USER)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BROWSER_TOOLBAR_REWORD,"",new BrowserToolbarInitParams(_loc2_)));
         }
         else
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_TO_INVENTORY_INFO,"",new ItemToInventoryInfoInitParams(_loc2_)));
         }
      }
      
      private function openDelayedWindow(param1:WindowNotice) : void
      {
         if(WindowManager.getInstance().openWindowCount <= 0 && WindowManagerNew.openWindowCount <= 0)
         {
            if(!this.blockFreeTicketMessageHack || param1.windowTypeId != OldWindowTypes.MINIGAME_FORTUNE_DAYLY_TICKET)
            {
               this.notifier.dispatchNotice(param1);
            }
         }
         else
         {
            TweenLite.delayedCall(0.5,this.openDelayedWindow,[param1]);
         }
      }
      
      private function handleUserLevelChange() : void
      {
         this.playFieldManager.handleUserLevelChange();
         this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.LEVELUP));
      }
      
      private function handleTypingKeysEnable(param1:TypingKeyNotice) : void
      {
         --this.windowCountWithKeyInput;
      }
      
      private function handleTypingKeysDisable(param1:TypingKeyNotice) : void
      {
         ++this.windowCountWithKeyInput;
      }
      
      private function handleFieldItemStateChange(param1:FieldItemStateNotice) : void
      {
         this.playFieldManager.handleFieldItemStateChange(param1);
      }
      
      private function get canBePressedAgain() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Number = getTimer();
         if(_loc2_ - this.lastTimePressed > 300)
         {
            _loc1_ = true;
            this.lastTimePressed = _loc2_;
         }
         return _loc1_;
      }
      
      private function debugFPS() : void
      {
         if(this.debugView)
         {
            this.debugView.visible = !this.debugView.visible;
         }
         else
         {
            this.gameStage.addChild(this.debugView = new DebugView());
         }
      }
      
      private function handleKeyUp(param1:KeyboardEvent) : void
      {
         if(!Settings.DISABLE_ALL_KEYS)
         {
            if(!Settings.DISABLE_SHORTCUT_KEYS)
            {
               if(param1.keyCode == Keyboard.CONTROL)
               {
                  sendNotification(Note.KEYBOARD_CTRL_UP);
                  return;
               }
            }
         }
         if(this.gameContainer.stage.focus != null)
         {
            return;
         }
         if(!Settings.DISABLE_ALL_KEYS)
         {
            if(!Settings.DISABLE_MOVEMENT_KEYS)
            {
               switch(param1.keyCode)
               {
                  case 38:
                     this.isUpPressed = false;
                     break;
                  case 40:
                     this.isDownPressed = false;
                     break;
                  case 37:
                     this.isLeftPressed = false;
                     break;
                  case 39:
                     this.isRightPressed = false;
               }
            }
            if(!Settings.DISABLE_SHORTCUT_KEYS)
            {
               switch(param1.keyCode)
               {
                  case Keyboard.CONTROL:
                     break;
                  case 70:
                     if(this.windowCountWithKeyInput <= 0)
                     {
                        if(Settings.DEBUG_MODE || this.userProxy.userMode == MainConstants.ACCOUNT_MODE_ADMIMN)
                        {
                           this.debugFPS();
                        }
                     }
                     break;
                  case 49:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ANIMALS);
                     }
                     break;
                  case 50:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.CAGES);
                     }
                     break;
                  case 51:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.SHOPS);
                     }
                     break;
                  case 52:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.DECORATIONS);
                     }
                     break;
                  case 53:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
                     }
                     break;
                  case 54:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ASSISTANTS);
                     }
                     break;
                  case 55:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.SPECIALS);
                     }
                     break;
                  case 56:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain)
                     {
                        sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ROADS);
                     }
                     break;
                  case 109:
                     this.playFieldManager.zoomOut();
                     break;
                  case 107:
                     this.playFieldManager.zoomIn();
                     break;
                  case Keyboard.BACKSPACE:
                  case 81:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain && !WindowManager.getInstance().hasSomeWindowOpened())
                     {
                        this.handleInitTool(new MouseToolNotice(MouseToolNotice.DEFAULT));
                        sendNotification(GUINote.ACTIVATE_SELECT_SUBTOOL);
                        this.playFieldManager.stopDragShopItem();
                        this.playFieldManager.handleActionMenuNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
                     }
                     break;
                  case Keyboard.HOME:
                  case 87:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain && !WindowManager.getInstance().hasSomeWindowOpened())
                     {
                        this.handleInitTool(new MouseToolNotice(MouseToolNotice.INIT_MOVE_TOOL));
                        sendNotification(GUINote.ACTIVATE_MOVE_SUBTOOL);
                        this.playFieldManager.stopDragShopItem();
                     }
                     break;
                  case Keyboard.INSERT:
                  case 69:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain && !WindowManager.getInstance().hasSomeWindowOpened())
                     {
                        this.handleInitTool(new MouseToolNotice(MouseToolNotice.INIT_FLIP_TOOL));
                        sendNotification(GUINote.ACTIVATE_ROTATE_SUBTOOL);
                        this.playFieldManager.stopDragShopItem();
                     }
                     break;
                  case Keyboard.END:
                  case 82:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain && !WindowManager.getInstance().hasSomeWindowOpened())
                     {
                        this.handleInitTool(new MouseToolNotice(MouseToolNotice.INIT_SELL_TOOL));
                        sendNotification(GUINote.ACTIVATE_SELL_SUBTOOL);
                        this.playFieldManager.stopDragShopItem();
                     }
                     break;
                  case Keyboard.PAGE_UP:
                  case 84:
                     if(this.windowCountWithKeyInput <= 0 && this.canBePressedAgain && !WindowManager.getInstance().hasSomeWindowOpened())
                     {
                        this.handleInitTool(new MouseToolNotice(MouseToolNotice.INIT_STORE_TOOL));
                        sendNotification(GUINote.ACTIVATE_STORE_SUBTOOL);
                        this.playFieldManager.stopDragShopItem();
                     }
                     break;
                  case Keyboard.TAB:
                     this.playFieldManager.keyRotateItem();
                     break;
                  case Keyboard.SPACE:
                     this.playFieldManager.diactivateScreenDrag();
               }
            }
         }
      }
      
      private function handleKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:RecyclingCardInfoVo = null;
         var _loc3_:BlueprintRewardVo = null;
         var _loc4_:Vector.<BlueprintRewardVo> = null;
         if(!Settings.DISABLE_ALL_KEYS)
         {
            if(!Settings.DISABLE_SHORTCUT_KEYS)
            {
               switch(param1.keyCode)
               {
                  case Keyboard.SPACE:
                     if(Settings.SPACE_TRIGGER_ENABLED && this.windowCountWithKeyInput <= 0)
                     {
                        this.playFieldManager.activateScreenDrag();
                     }
                     break;
                  case Keyboard.CONTROL:
                     if(this.windowCountWithKeyInput <= 0)
                     {
                        sendNotification(Note.KEYBOARD_CTRL_DOWN);
                     }
               }
            }
            if(!Settings.DISABLE_MOVEMENT_KEYS && this.windowCountWithKeyInput <= 0)
            {
               switch(param1.keyCode)
               {
                  case 38:
                     this.isUpPressed = true;
                     this.activateMove();
                     break;
                  case 40:
                     this.isDownPressed = true;
                     this.activateMove();
                     break;
                  case 37:
                     this.isLeftPressed = true;
                     this.activateMove();
                     break;
                  case 39:
                     this.isRightPressed = true;
                     this.activateMove();
               }
            }
         }
         if(Settings.DEBUG_MODE || this.userProxy.userMode == MainConstants.ACCOUNT_MODE_ADMIMN)
         {
            switch(param1.keyCode)
            {
               case Keyboard.F1:
                  break;
               case Keyboard.F2:
                  sendNotification(Note.BABY_CARAVAN_EVENT_END);
                  break;
               case Keyboard.F3:
                  sendNotification(Note.MANAGMENTCENTER_REFRESH);
                  break;
               case Keyboard.F4:
                  break;
               case Keyboard.F5:
                  this.netProxy.debugPush();
                  break;
               case Keyboard.F6:
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.UNLOCK_CRAFTING_RECYCLING_WINDOW,"UNLOCK_CRAFTING_RECYCLING_WINDOW"));
                  break;
               case Keyboard.F7:
                  _loc2_ = new RecyclingCardInfoVo();
                  _loc2_.slotDataVo = new RecyclingSlotDataVo();
                  _loc2_.slotDataVo.materialId = 1;
                  _loc2_.slotDataVo.slotId = 1;
                  _loc2_.materialShopData = new MaterialShopData();
                  _loc2_.materialShopData.rareDropId = 2;
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_PRODUCE_WINDOW));
                  break;
               case Keyboard.F8:
                  _loc4_ = new Vector.<BlueprintRewardVo>();
                  _loc3_ = new BlueprintRewardVo();
                  _loc3_.blueprintId = 8;
                  _loc4_.push(_loc3_);
                  sendNotification(Note.OPEN_BLUEPRINT_REWARD_WINDOW,_loc4_);
                  break;
               case Keyboard.F9:
               case Keyboard.F10:
            }
         }
      }
      
      private function handleMouseWheel(param1:MouseEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            if(param1.delta > 0)
            {
               this.playFieldManager.zoomIn();
            }
            else
            {
               this.playFieldManager.zoomOut();
            }
         }
      }
      
      private function handleOpenSafariGame() : void
      {
         sendNotification(Note.CHANGE_APP_MODE,AppMode.SAFARI);
      }
      
      private function activateMove() : void
      {
         if(!this.isMoving)
         {
            this.gameStage.addEventListener(Event.ENTER_FRAME,this.handleMove);
            this.isMoving = true;
         }
      }
      
      private function handleMove(param1:Event) : void
      {
         var _loc2_:Point = new Point();
         if(this.isUpPressed)
         {
            _loc2_.y -= 10;
         }
         if(this.isDownPressed)
         {
            _loc2_.y += 10;
         }
         if(this.isLeftPressed)
         {
            _loc2_.x -= 10;
         }
         if(this.isRightPressed)
         {
            _loc2_.x += 10;
         }
         if(!this.isUpPressed && !this.isDownPressed && !this.isLeftPressed && !this.isRightPressed)
         {
            this.gameStage.removeEventListener(Event.ENTER_FRAME,this.handleMove);
            this.isMoving = false;
         }
         else
         {
            this.playFieldManager.movePlayField(_loc2_);
         }
      }
      
      private function handleItemWindowAction(param1:ItemWindowActionNotice) : void
      {
         this.playFieldManager.handleItemWindowAction(param1);
      }
      
      private function onEventStart(param1:INotification) : void
      {
         this.netProxy.callConfigAndStoreDataPush();
      }
      
      private function onEventEnd(param1:INotification) : void
      {
         this.netProxy.callConfigStoreDataPush();
      }
   }
}

