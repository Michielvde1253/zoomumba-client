package com.bigpoint.zoomumba
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.EVENT;
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.controller.LockAssistantsUsedCommand;
   import com.bigpoint.zoomumba.controller.actionMenus.CheckCageMenuAutoCloseCommand;
   import com.bigpoint.zoomumba.controller.app.AddItemToShopCommand;
   import com.bigpoint.zoomumba.controller.app.AppCloseCommand;
   import com.bigpoint.zoomumba.controller.app.AppModeChangeCommand;
   import com.bigpoint.zoomumba.controller.app.ClearLocalStorageCommand;
   import com.bigpoint.zoomumba.controller.app.GameCounterChangedCommand;
   import com.bigpoint.zoomumba.controller.app.GetUserWithEventsCommand;
   import com.bigpoint.zoomumba.controller.app.InitResponseCommand;
   import com.bigpoint.zoomumba.controller.app.OnInitThemeCommand;
   import com.bigpoint.zoomumba.controller.app.OpenExternalPaymentCommand;
   import com.bigpoint.zoomumba.controller.app.OpenExternalSetEmailCommand;
   import com.bigpoint.zoomumba.controller.app.OpenXmasCalendarCommannd;
   import com.bigpoint.zoomumba.controller.app.PushResponseCommand;
   import com.bigpoint.zoomumba.controller.app.RemoveItemFromShopCommand;
   import com.bigpoint.zoomumba.controller.app.RenderNeighbourFieldCommand;
   import com.bigpoint.zoomumba.controller.app.StartGameCommand;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.controller.app.UnlockAssistantsUsedCommand;
   import com.bigpoint.zoomumba.controller.app.UpdateResourcesCountCommand;
   import com.bigpoint.zoomumba.controller.app.events.HandeEventDataStoredCommand;
   import com.bigpoint.zoomumba.controller.app.settings.ServerStoreAppSettingsCommand;
   import com.bigpoint.zoomumba.controller.app.settings.SetAppSettingsCommand;
   import com.bigpoint.zoomumba.controller.app.settings.UpdateAppSettingsCommand;
   import com.bigpoint.zoomumba.controller.ballonEvent.RegBallonEventCommand;
   import com.bigpoint.zoomumba.controller.boardgame.BoardGameWeatherCommand;
   import com.bigpoint.zoomumba.controller.boardgame.RegBoardgameCommand;
   import com.bigpoint.zoomumba.controller.collectables.GetCollectionRewardCommand;
   import com.bigpoint.zoomumba.controller.collectables.UpdateCollectablesAmountCommand;
   import com.bigpoint.zoomumba.controller.debug.ErrorReportCommand;
   import com.bigpoint.zoomumba.controller.debug.FeatureTestCommand;
   import com.bigpoint.zoomumba.controller.events.EventEndCommand;
   import com.bigpoint.zoomumba.controller.events.advBreed.AdvBreedingEventEndCommand;
   import com.bigpoint.zoomumba.controller.features.advancedBreeding.OpenBreedingViewCommand;
   import com.bigpoint.zoomumba.controller.features.advancedBreeding.StartAdvancedBreedingCommand;
   import com.bigpoint.zoomumba.controller.features.babyCaravan.BabyCaravanEventEndCommand;
   import com.bigpoint.zoomumba.controller.features.babyCaravan.RewardRedeemSuccessCommand;
   import com.bigpoint.zoomumba.controller.features.cageUpgrade.OpenAniversaryCageUpgradeWindowCommand;
   import com.bigpoint.zoomumba.controller.features.cageUpgrade.OpenCageUgradeWindowCommand;
   import com.bigpoint.zoomumba.controller.features.circus.UnlockCircusBuyButtonCommand;
   import com.bigpoint.zoomumba.controller.features.crafting.OpenBlueprintRewardWindowCommand;
   import com.bigpoint.zoomumba.controller.features.crafting.OpenCraftingWindowCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.BuySpinCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.CancelBuyNewSpinCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.HandleZooWheelWinRewardCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.RequestRewardCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.SpinWheelCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.StartSpinCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.StopSpinWheelCommand;
   import com.bigpoint.zoomumba.controller.features.fortuneWheel.UpdateRewardDataCommand;
   import com.bigpoint.zoomumba.controller.features.itemDrop.CollectDropCommand;
   import com.bigpoint.zoomumba.controller.features.itemDrop.GenerateDropsCommand;
   import com.bigpoint.zoomumba.controller.features.itemDrop.IncreaseCollectableAmountCommand;
   import com.bigpoint.zoomumba.controller.features.misc.AllInInventoryCommand;
   import com.bigpoint.zoomumba.controller.features.nursery.OpenNurseryViewCommand;
   import com.bigpoint.zoomumba.controller.features.powerup.PowerupCommand;
   import com.bigpoint.zoomumba.controller.features.recycling.OpenRecyclingWindowCommand;
   import com.bigpoint.zoomumba.controller.features.safari.CloseSafariGameWindowCommand;
   import com.bigpoint.zoomumba.controller.features.safari.SkipSafariTimerCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ParseValentinesCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ValentineItemMovedErrorCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ValentineItemMovedOkCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ValentineMoveCRCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ValentinesRedeemOkCommand;
   import com.bigpoint.zoomumba.controller.features.valentines.ValentinesShopToggleItemsCommand;
   import com.bigpoint.zoomumba.controller.gameItem.buy.ExpansionBuyCommand;
   import com.bigpoint.zoomumba.controller.gameItem.buy.GameItemBuyCommand;
   import com.bigpoint.zoomumba.controller.gameItem.info.GameItemInfoWindowCommand;
   import com.bigpoint.zoomumba.controller.keyboard.KeyboardCommand;
   import com.bigpoint.zoomumba.controller.lastItemAction.LastItemActionCommand;
   import com.bigpoint.zoomumba.controller.managmentCenter.OnInitManagmentCenterCommand;
   import com.bigpoint.zoomumba.controller.managmentCenter.OnRefreshInitManagmentCenterCommand;
   import com.bigpoint.zoomumba.controller.managmentCenter.OpenManagmentCenterCommand;
   import com.bigpoint.zoomumba.controller.managmentCenter.RefreshManagmentCenterCommand;
   import com.bigpoint.zoomumba.controller.managmentCenter.RegisterManagmentCenterMediatorCommand;
   import com.bigpoint.zoomumba.controller.map.InitMapSystemCommand;
   import com.bigpoint.zoomumba.controller.map.OpenMapCommand;
   import com.bigpoint.zoomumba.controller.net.ConfigurationParserCommand;
   import com.bigpoint.zoomumba.controller.net.ResponseParserCommand;
   import com.bigpoint.zoomumba.controller.net.handlers.HandleBlueprintDataCommand;
   import com.bigpoint.zoomumba.controller.net.handlers.HandleMaterialDataCommand;
   import com.bigpoint.zoomumba.controller.net.handlers.HandleResourceDataCommand;
   import com.bigpoint.zoomumba.controller.net.handlers.HandleResponseIdCommand;
   import com.bigpoint.zoomumba.controller.net.handlers.HandleResponsesCommand;
   import com.bigpoint.zoomumba.controller.net2.ErrorHandlerCommand;
   import com.bigpoint.zoomumba.controller.playfield.DropItemCommand;
   import com.bigpoint.zoomumba.controller.playfield.EnablePlayfieldAnimationCommand;
   import com.bigpoint.zoomumba.controller.playfield.ExpandPlayfieldCommand;
   import com.bigpoint.zoomumba.controller.playfield.ExtendForgottenPlayfieldToolsCommand;
   import com.bigpoint.zoomumba.controller.playfield.HideLoaderCommand;
   import com.bigpoint.zoomumba.controller.playfield.ItemFromPlayfieldToInventoryCommand;
   import com.bigpoint.zoomumba.controller.playfield.ManageAnimationsWithWindowsCommand;
   import com.bigpoint.zoomumba.controller.playfield.ManagePlayfieldAnimationsCommand;
   import com.bigpoint.zoomumba.controller.playfield.PlayFieldAnimationEndedCommand;
   import com.bigpoint.zoomumba.controller.playfield.PlayFieldViewChangeCommand;
   import com.bigpoint.zoomumba.controller.playfield.PlayfieldItemChangedCommand;
   import com.bigpoint.zoomumba.controller.playfield.SellItemCommand;
   import com.bigpoint.zoomumba.controller.playfield.SellPlayfieldNewBuildingCommand;
   import com.bigpoint.zoomumba.controller.playfield.SetFieldCommand;
   import com.bigpoint.zoomumba.controller.playfield.ShowLoaderCommand;
   import com.bigpoint.zoomumba.controller.playfield.StoreAllItemsCommand;
   import com.bigpoint.zoomumba.controller.playfield.StorePlayfieldNewBuildingCommand;
   import com.bigpoint.zoomumba.controller.playfield.StorePlayfieldRoadCommand;
   import com.bigpoint.zoomumba.controller.playfield.SwitchPlayfieldCommand;
   import com.bigpoint.zoomumba.controller.playfield.VisitorEnterZooCommand;
   import com.bigpoint.zoomumba.controller.playfield.VisitorLeavesZooCommand;
   import com.bigpoint.zoomumba.controller.playfield.assistantActions.AssistantFeedCommand;
   import com.bigpoint.zoomumba.controller.playfield.assistantActions.UseAssistantCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageBreedActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageCleanActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageCuddleActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageFeedActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageHealActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageInstantBreedActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageInstantHealActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageMoveAnimalToInventoryCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CagePowerFeedActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageSuperFeedActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageUpgradeActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.cageActions.CageWaterActionCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.AnimalItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.BreedingLabItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.CageItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.DecoItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.MaterialItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.NurseryItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.RoadItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.StoreItemParsedCommand;
   import com.bigpoint.zoomumba.controller.playfield.items.TrashbinItemParsedCommand;
   import com.bigpoint.zoomumba.controller.shop.BuyCakesForZDCommand;
   import com.bigpoint.zoomumba.controller.shop.BuyRealCurrencyResourcesCommand;
   import com.bigpoint.zoomumba.controller.shop.OpenInventoryOnTabCommand;
   import com.bigpoint.zoomumba.controller.shop.OpenShopOnTabCommand;
   import com.bigpoint.zoomumba.controller.startup.InitAssetLoaderCommand;
   import com.bigpoint.zoomumba.controller.startup.InitCommunicationCommand;
   import com.bigpoint.zoomumba.controller.startup.InitLoadCommand;
   import com.bigpoint.zoomumba.controller.startup.InitPreloaderCommand;
   import com.bigpoint.zoomumba.controller.startup.InitSettingCommand;
   import com.bigpoint.zoomumba.controller.startup.LoadCvTagsCommand;
   import com.bigpoint.zoomumba.controller.startup.LounchGameCommand;
   import com.bigpoint.zoomumba.controller.startup.ParseCvTagsCommand;
   import com.bigpoint.zoomumba.controller.startup.StartupCommand;
   import com.bigpoint.zoomumba.controller.user.UserGetInventoryCommand;
   import com.bigpoint.zoomumba.controller.user.UserGetShopItemsCommand;
   import com.bigpoint.zoomumba.controller.user.UserGetUserCommand;
   import com.bigpoint.zoomumba.controller.user.UserLevelChangedCommand;
   import com.bigpoint.zoomumba.controller.user.assistants.HandleAssistantDataCommand;
   import com.bigpoint.zoomumba.controller.user.assistants.RejectAssistantRenewalCommand;
   import com.bigpoint.zoomumba.controller.user.contactList.ReturnToOwnZooCommand;
   import com.bigpoint.zoomumba.controller.user.contactList.UserIdByUserNameCommand;
   import com.bigpoint.zoomumba.controller.user.contactList.VisitFriendZooCommand;
   import com.bigpoint.zoomumba.controller.user.mails.MarkMessageAsReadCommand;
   import com.bigpoint.zoomumba.controller.user.snapShot.MakeUserDataSnapShotCommand;
   import com.bigpoint.zoomumba.controller.user.timing.ShowAnniversaryEndScreenCommand;
   import com.bigpoint.zoomumba.controller.visitorWishes.CalculateVisitorWishesCommand;
   import flash.external.ExternalInterface;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class ApplicationFacade extends Facade
   {
      public function ApplicationFacade()
      {
         super();
      }
      
      public static function getInstance() : ApplicationFacade
      {
         if(instance == null)
         {
            instance = new ApplicationFacade();
         }
         return instance as ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("sendToActionScript",this.onASCallback);
         }
         super.initializeController();
         registerCommand(Note.PARSE_CV_TAGS,ParseCvTagsCommand);
         registerCommand(Note.ERROR_REPORT,ErrorReportCommand);
         registerCommand(Note.STARTUP,StartupCommand);
         registerCommand(Note.GET_USER_WITH_EVENTS,GetUserWithEventsCommand);
         registerCommand(Note.PRELOAD,InitPreloaderCommand);
         registerCommand(Note.INIT_SETTING_COMMAND,InitSettingCommand);
         registerCommand(Note.APP_CONFIG_LOADED,InitCommunicationCommand);
         registerCommand(Note.COMMUNICATION_MANAGER_INITED,InitAssetLoaderCommand);
         registerCommand(Note.ASSET_LIBRARY_INITED,LoadCvTagsCommand);
         registerCommand(Note.APP_CV_TAGS_LOADED,InitLoadCommand);
         registerCommand(Note.LAUNCH_GAME,LounchGameCommand);
         registerCommand(Note.JSON_RESPONSE_RECEIVED,ResponseParserCommand);
         registerCommand(Note.CONFIGURATION_RESPONSE_RECEIVED,ConfigurationParserCommand);
         registerCommand(Note.OPEN_EXTERNAL_PAYMENT,OpenExternalPaymentCommand);
         registerCommand(Note.OPEN_EXTERNAL_SET_EMAIL,OpenExternalSetEmailCommand);
         registerCommand(Note.NEIGHBOUR_RENDER_FIELD,RenderNeighbourFieldCommand);
         registerCommand(ResponseName.USER_RESOURCES_DATA,HandleResourceDataCommand);
         registerCommand(ResponseName.USER_MATERIAL_DATA,HandleMaterialDataCommand);
         registerCommand(ResponseName.USER_BLUEPRINT_DATA,HandleBlueprintDataCommand);
         registerCommand(ResponseName.FIELD_SETTINGS,StartGameCommand);
         registerCommand(ResponseName.RESPONSES_STATUS,HandleResponsesCommand);
         registerCommand(Note.CHANGE_APP_MODE,AppModeChangeCommand);
         registerCommand(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand);
         registerCommand(Note.GAME_CHANGE_PLAYFIELD,SetFieldCommand);
         registerCommand(Note.SWITCH_PLAYFIELD,SwitchPlayfieldCommand);
         registerCommand(Note.ALL_ITEMS_MOVED_TO_INVENTORY,StoreAllItemsCommand);
         registerCommand(Note.VISITOR_ENTER_ZOO,VisitorEnterZooCommand);
         registerCommand(Note.VISITOR_LEAVE_ZOO,VisitorLeavesZooCommand);
         registerCommand(Note.VISITOR_CALCULATE_WISHES,CalculateVisitorWishesCommand);
         registerCommand(Note.TEST_FEATURE,FeatureTestCommand);
         registerCommand(Note.POWERUP_ITEM_ADDED,PowerupCommand);
         registerCommand(DataNote.GLOBAL_EVENT_DATA_STORED,HandeEventDataStoredCommand);
         registerCommand(Note.CAGE_FEED_ACTION,CageFeedActionCommand);
         registerCommand(Note.CAGE_SUPER_FEED_ACTION,CageSuperFeedActionCommand);
         registerCommand(Note.CAGE_POWER_FEED_ACTION,CagePowerFeedActionCommand);
         registerCommand(Note.CAGE_BREED_ACTION,CageBreedActionCommand);
         registerCommand(Note.CAGE_CLEAN_ACTION,CageCleanActionCommand);
         registerCommand(Note.CAGE_CUDDLE_ACTION,CageCuddleActionCommand);
         registerCommand(Note.CAGE_UPGRADE_ACTION,CageUpgradeActionCommand);
         registerCommand(Note.CAGE_WATER_ACTION,CageWaterActionCommand);
         registerCommand(Note.CAGE_INSTANT_BREED_ACTION,CageInstantBreedActionCommand);
         registerCommand(Note.CAGE_INSTANT_HEAL_ACTION,CageInstantHealActionCommand);
         registerCommand(Note.CAGE_HEAL_ACTION,CageHealActionCommand);
         registerCommand(Note.CHECK_CAGE_MENU_AUTOCLOSE,CheckCageMenuAutoCloseCommand);
         registerCommand(Note.COLLECT_DROP,CollectDropCommand);
         registerCommand(Note.GENERATE_DROPS,GenerateDropsCommand);
         registerCommand(Note.GENERATE_DROPS_STACK_PAWS,GenerateDropsCommand);
         registerCommand(Note.INCREASE_COLLECTABLE_AMOUNT,IncreaseCollectableAmountCommand);
         registerCommand(Note.ASSISTANT_FEED,AssistantFeedCommand);
         registerCommand(Note.USE_ASSISTANT,UseAssistantCommand);
         registerCommand(ResponseName.USER_ASSISTANTS,HandleAssistantDataCommand);
         registerCommand(Note.COMMAND_ID_RESPONSE,HandleResponseIdCommand);
         registerCommand(Note.UPDATE_RESOURCE_COUNT,UpdateResourcesCountCommand);
         registerCommand(DataNote.USER_LEVEL,UserLevelChangedCommand);
         registerCommand(Note.MAKE_USERDATA_SNAPSHOT,MakeUserDataSnapShotCommand);
         registerCommand(Note.REFUSE_BUY_ASSISTANT,RejectAssistantRenewalCommand);
         registerCommand(Note.GET_COLLECTION_SET_REWARD,GetCollectionRewardCommand);
         registerCommand(Note.CLOSE_GAME,AppCloseCommand);
         registerCommand(Note.STOP_SPIN_WHEEL,StopSpinWheelCommand);
         registerCommand(Note.BUY_SPIN,BuySpinCommand);
         registerCommand(Note.UPDATE_REWARD_DATA,UpdateRewardDataCommand);
         registerCommand(Note.STOP_WHEEL_SPIN,StopSpinWheelCommand);
         registerCommand(Note.SPIN_WHEEL,SpinWheelCommand);
         registerCommand(Note.REQUEST_REWARD,RequestRewardCommand);
         registerCommand(Note.START_SPIN,StartSpinCommand);
         registerCommand(Note.CANCEL_BUY_NEW_SPIN,CancelBuyNewSpinCommand);
         registerCommand(Note.HANDLE_ZOO_WHEEL_WIN_REWARD,HandleZooWheelWinRewardCommand);
         registerCommand(Note.PLAY_FIELD_VIEW_PORT_CHANGED,PlayFieldViewChangeCommand);
         registerCommand(Note.PLAY_FIELD_ANIMATION_ENDED,PlayFieldAnimationEndedCommand);
         registerCommand(Note.MANAGE_PLAYFIELD_ANIMATIONS,ManagePlayfieldAnimationsCommand);
         registerCommand(DataNote.WINDOW_COUNT_CHANGED,ManageAnimationsWithWindowsCommand);
         registerCommand(PLAYFIELD.PF_PLAYFIELD_TO_INVENTORY,ItemFromPlayfieldToInventoryCommand);
         registerCommand(PLAYFIELD.PF_ITEM_SELL,SellItemCommand);
         registerCommand(PLAYFIELD.ENABLE_ANIMATION,EnablePlayfieldAnimationCommand);
         registerCommand(Note.OPEN_CAGE_UPGRADE_WINDOW,OpenCageUgradeWindowCommand);
         registerCommand(Note.OPEN_ANIVERSARY_CAGE_UPGRADE_WINDOW,OpenAniversaryCageUpgradeWindowCommand);
         registerCommand(ResponseName.CLIENT_SETTINGS,SetAppSettingsCommand);
         registerCommand(Note.UPDATE_APP_SETTINGS,UpdateAppSettingsCommand);
         registerCommand(Note.SERVER_SAVE_APP_SETTINGS,ServerStoreAppSettingsCommand);
         registerCommand(Note.BUY_REAL_CURRENCY_RESOURCE,BuyRealCurrencyResourcesCommand);
         registerCommand(SHOP.SHOPCARD_INFO_CLICKED,GameItemInfoWindowCommand);
         registerCommand(SHOP.SHOPCARD_BUY_CLICKED,GameItemBuyCommand);
         registerCommand(DataNote.COLLECTABLE_UPDATED,UpdateCollectablesAmountCommand);
         registerCommand(Note.ANNIVERSARY_BUY_CAKE_FOR_ZD,BuyCakesForZDCommand);
         registerCommand(Note.ON_THEME_INIT,OnInitThemeCommand);
         registerCommand(SHOP.OPEN_SHOP_ON_TAB,OpenShopOnTabCommand);
         registerCommand(SHOP.SHOPCARD_IN_INVENTORY_CLICKED,OpenInventoryOnTabCommand);
         registerCommand(Note.SHOW_ANNIVERSARY_END_SCREEN,ShowAnniversaryEndScreenCommand);
         registerCommand(Note.PUSH_RESPONSE,PushResponseCommand);
         registerCommand(Note.INIT_RESPONSE,InitResponseCommand);
         registerCommand(Note.JSON_SERVER_ERROR,ErrorHandlerCommand);
         registerCommand(Note.ON_REGISTER_BOARDGAME,RegBoardgameCommand);
         registerCommand(Note.ON_REGISTER_BALLONS,RegBallonEventCommand);
         registerCommand(Note.MAP_SHOW,OpenMapCommand);
         registerCommand(PLAYFIELD.PF_CAGE_PARSED,CageItemParsedCommand);
         registerCommand(PLAYFIELD.PF_DECO_PARSED,DecoItemParsedCommand);
         registerCommand(PLAYFIELD.PF_MATERIAL_PARSED,MaterialItemParsedCommand);
         registerCommand(PLAYFIELD.PF_ROAD_PARSED,RoadItemParsedCommand);
         registerCommand(PLAYFIELD.PF_STORE_PARSED,StoreItemParsedCommand);
         registerCommand(PLAYFIELD.PF_TRASHBIN_PARSED,TrashbinItemParsedCommand);
         registerCommand(PLAYFIELD.PF_ANIMAL_PARSED,AnimalItemParsedCommand);
         registerCommand(PLAYFIELD.PF_BREEDING_LAB_PARSED,BreedingLabItemParsedCommand);
         registerCommand(PLAYFIELD.PF_NURSERY_PARSED,NurseryItemParsedCommand);
         registerCommand(PLAYFIELD.EXPAND_PLAYFIELD,ExpandPlayfieldCommand);
         registerCommand(Note.CLOSE_SAFARI_GAME_WINDOW,CloseSafariGameWindowCommand);
         registerCommand(Note.SKIP_SAFARI_TIMER,SkipSafariTimerCommand);
         registerCommand(Note.BUY_EXPANSION,ExpansionBuyCommand);
         registerCommand(Note.UNLOCK_CIRCUS_BUY_BUTTON,UnlockCircusBuyButtonCommand);
         registerCommand(Note.OPEN_CRAFTING_WINDOW,OpenCraftingWindowCommand);
         registerCommand(Note.OPEN_RECYCLING_WINDOW,OpenRecyclingWindowCommand);
         registerCommand(Note.OPEN_BLUEPRINT_REWARD_WINDOW,OpenBlueprintRewardWindowCommand);
         registerCommand(Note.MOVE_ANIMAL_TO_INVENTORY,CageMoveAnimalToInventoryCommand);
         registerCommand(FRIENDS.VISIT_FRIEND_ZOO,VisitFriendZooCommand);
         registerCommand(FRIENDS.RETURN_TO_OWN_ZOO,ReturnToOwnZooCommand);
         registerCommand(Note.USERNAME_SEARCH_LIST_RESPONSE,UserIdByUserNameCommand);
         registerCommand(Note.SHOW_LOADER_LAYER,ShowLoaderCommand);
         registerCommand(Note.HIDE_LOADER_LAYER,HideLoaderCommand);
         registerCommand(Note.EXTEND_FORGOTTEN_ZOO_TOOLS,ExtendForgottenPlayfieldToolsCommand);
         registerCommand(Note.MARK_MESAGE_AS_READ,MarkMessageAsReadCommand);
         registerCommand(Note.BABY_CARAVAN_EVENT_END,BabyCaravanEventEndCommand);
         registerCommand(PLAYFIELD.PLAYFIELD_UPDATE_ITEM_CHANGED,PlayfieldItemChangedCommand);
         registerCommand(Note.BABY_CARAVAN_REDEEM_SUCCESS,RewardRedeemSuccessCommand);
         registerCommand(Note.START_ADVANCED_BREEDING,StartAdvancedBreedingCommand);
         registerCommand(Note.OPEN_BREEDING_VIEW,OpenBreedingViewCommand);
         registerCommand(Note.OPEN_NURSERY_VIEW,OpenNurseryViewCommand);
         registerCommand(SHOP.REMOVE_ITEM_FROM_SHOP,RemoveItemFromShopCommand);
         registerCommand(SHOP.ADD_ITEM_FROM_SHOP,AddItemToShopCommand);
         registerCommand(Note.SELL_PLAYFIELD_NEW_BUILDING,SellPlayfieldNewBuildingCommand);
         registerCommand(Note.STORE_PLAYFIELD_NEW_BUILDING,StorePlayfieldNewBuildingCommand);
         registerCommand(Note.STORE_PLAYFIELD_ROAD,StorePlayfieldRoadCommand);
         registerCommand(Note.LOCK_ASSISTANTS_USED,LockAssistantsUsedCommand);
         registerCommand(Note.UNLOCK_ASSISTANTS_USED,UnlockAssistantsUsedCommand);
         registerCommand(Note.CLEAR_LOCAL_STORAGE,ClearLocalStorageCommand);
         registerCommand(Note.DROP_ITEM_SUCCESSFUL,DropItemCommand);
         registerCommand(Note.GAME_COUNTER_UPDATED,GameCounterChangedCommand);
         registerCommand(Note.PARSE_VALENTINES_CONFIG,ParseValentinesCommand);
         registerCommand(Note.VALENTINE_MOVED_OK,ValentineItemMovedOkCommand);
         registerCommand(Note.VALENTINE_MOVED_ERROR,ValentineItemMovedErrorCommand);
         registerCommand(Note.VALENTINE_REDEEM_OK,ValentinesRedeemOkCommand);
         registerCommand(Note.VALENTINE_REFRESH_SHOP_ITEMS,ValentinesShopToggleItemsCommand);
         registerCommand(Note.VALENTINE_MOVE_CR,ValentineMoveCRCommand);
         registerCommand(EVENT.END,EventEndCommand);
         registerCommand(Note.ADVANCED_BREEDING_EVENT_END,AdvBreedingEventEndCommand);
         registerCommand(Note.XMAS2012_OPEN_CALENDAR_COMMAND,OpenXmasCalendarCommannd);
         registerCommand(Note.INVENTORY_GET,UserGetInventoryCommand);
         registerCommand(Note.SHOP_ITEMS_GET,UserGetShopItemsCommand);
         registerCommand(Note.USER_GET,UserGetUserCommand);
         registerCommand(Note.KEYBOARD_CTRL_DOWN,KeyboardCommand);
         registerCommand(Note.KEYBOARD_CTRL_UP,KeyboardCommand);
         registerCommand(Note.SAVE_LAST_DRAG_ITEM,LastItemActionCommand);
         registerCommand(Note.CLEAR_LAST_DRAG_ITEM,LastItemActionCommand);
         registerCommand(Note.FINISHED_DRAG_ITEM,LastItemActionCommand);
         registerCommand(Note.START_BOARDGAME_WEATHER,BoardGameWeatherCommand);
         registerCommand(Note.REGISTER_MANAGMENTCENTER_MEDIATOR,RegisterManagmentCenterMediatorCommand);
         registerCommand(Note.INIT_MAP_SYSTEM_COMMAND,InitMapSystemCommand);
         registerCommand(Note.OPEN_MANAGMENT_CENTER,OpenManagmentCenterCommand);
         registerCommand(Note.MANAGMENTCENTER_INIT_DATA,OnInitManagmentCenterCommand);
         registerCommand(Note.MANAGMENTCENTER_REFRESH_INIT_DATA,OnRefreshInitManagmentCenterCommand);
         registerCommand(Note.MANAGMENTCENTER_REFRESH,RefreshManagmentCenterCommand);
         registerCommand(Note.SEND_ALL_TO_INVENTORY,AllInInventoryCommand);
      }
      
      private function onASCallback(param1:String) : void
      {
         if(Boolean(param1) && param1 != "")
         {
            sendNotification(param1);
         }
      }
      
      public function startup(param1:Object) : void
      {
         sendNotification(Note.STARTUP,param1);
      }
   }
}

