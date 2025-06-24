package com.bigpoint.zoomumba.model.windowSystem
{
   import com.bigpoint.zoomumba.model.windowSystem.vo.OpenStrategies;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowTypeDefitinion;
   import com.bigpoint.zoomumba.view.windows.adam.AdamWindowMediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.AdvancedBreedingEndedWindowMediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.AdvancedBreedingProgressWindowMediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.AdvancedBreedingWindowMediator;
   import com.bigpoint.zoomumba.view.windows.anniversary.GenericComicWindowMediator;
   import com.bigpoint.zoomumba.view.windows.assistants.AssistantsRenewalWindowMediator;
   import com.bigpoint.zoomumba.view.windows.avatar.AvatarWindowMediator;
   import com.bigpoint.zoomumba.view.windows.babyCaravan.BabyCaravanInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.babyCaravan.BabyCaravanWindowMediator;
   import com.bigpoint.zoomumba.view.windows.brawserBar.BrowserBarRewordWindowMediator;
   import com.bigpoint.zoomumba.view.windows.cacheResources.CacheResourcesWindowMediator;
   import com.bigpoint.zoomumba.view.windows.cageUpgrade.CageUpgradeWindowMediator;
   import com.bigpoint.zoomumba.view.windows.cinema.CinemaWindowMediator;
   import com.bigpoint.zoomumba.view.windows.collectionSets.CollectionSetCongratulationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.collectionSets.CollectionSetRewordWindowMediator;
   import com.bigpoint.zoomumba.view.windows.confirmation.ConfirmationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.confirmation.extended.BuyConfirmationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.confirmation.extended.BuyOnceWindowMediator;
   import com.bigpoint.zoomumba.view.windows.confirmation.extended.BuyTwoCurrencyConfirmationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.confirmation.extended.ExtendedBuyConfirmationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.BlueprintCrafingRewardMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.ChooseCraftingMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.IntroCraftingMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.ProduceCraftingMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.ProgressCraftingMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.SuccessCraftingMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.helpComic.CraftingComicWindowMediator;
   import com.bigpoint.zoomumba.view.windows.dailyLogin.DailyLoginMediator;
   import com.bigpoint.zoomumba.view.windows.demo.DemoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.doubleXp.DoubleXpWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.BabyEventWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.CircusRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.CircusWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.advBreeding.AdvBreedingEventEndWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.advBreeding.AdvBreedingEventRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.advBreeding.AdvBreedingEventWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.ballonEventSell.BallonEventSellMediator;
   import com.bigpoint.zoomumba.view.windows.events.boardGamePayPackage.BoardgamePayPackageWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.BoardgameEventMediator;
   import com.bigpoint.zoomumba.view.windows.events.boardgameReward.BoardgameRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.christmas.ChristmasEndedWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.christmas.ChristmasRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.christmas.ChristmasWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.community.GenericCommunityEventHelpWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.community.GenericCommunityEventWindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.easter.EasterEventMediator;
   import com.bigpoint.zoomumba.view.windows.events.frogEvent.FrogEventMediator;
   import com.bigpoint.zoomumba.view.windows.fortuneWheel.BuySpinMediator;
   import com.bigpoint.zoomumba.view.windows.fortuneWheel.FortuneWheelWindowMediator;
   import com.bigpoint.zoomumba.view.windows.fortuneWheel.FreeSpinWindowMediator;
   import com.bigpoint.zoomumba.view.windows.fortuneWheel.RewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.friends.DeleteFriendWindowMediator;
   import com.bigpoint.zoomumba.view.windows.friends.FriendInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.friends.FriendsWindowMediator;
   import com.bigpoint.zoomumba.view.windows.friends.InviteFriendWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.info.ItemInfoBaseWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.info.ItemInfoMaterialWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.info.ItemInfoSpecieStaticWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.info.ItemInfoSpecieWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.info.ItemInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.sell.GameItemPayinWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gameItem.sell.GameItemSellWindowMediator;
   import com.bigpoint.zoomumba.view.windows.gifts.GiftsWindowMediator;
   import com.bigpoint.zoomumba.view.windows.happyHour.HappyHourWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.ItemBigInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.ItemToInventoryItemWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.MainItemBigInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.RewardInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.SingleItemPackInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.info.SuperPackInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.information.InformationWindowMediator;
   import com.bigpoint.zoomumba.view.windows.inventory.AnimalToInventoryWindowMediator;
   import com.bigpoint.zoomumba.view.windows.inventory.InventoryWindowMediator;
   import com.bigpoint.zoomumba.view.windows.levelUp.AdvBreedingUnlockWindowMediator;
   import com.bigpoint.zoomumba.view.windows.levelUp.RecylingCraftingUnlockWindowMediator;
   import com.bigpoint.zoomumba.view.windows.mail.MailReadWindowMediator;
   import com.bigpoint.zoomumba.view.windows.mail.MailWindowMediator;
   import com.bigpoint.zoomumba.view.windows.mainBuildingSelect.MainBuildingSelectionWindowMediator;
   import com.bigpoint.zoomumba.view.windows.news.NewsWindowMediator;
   import com.bigpoint.zoomumba.view.windows.news.events.AdvancedBreedingNewsMediator;
   import com.bigpoint.zoomumba.view.windows.news.events.CircusNewsMediator;
   import com.bigpoint.zoomumba.view.windows.nowInShop.NowInShopWindowMediator;
   import com.bigpoint.zoomumba.view.windows.nursery.NurseryProgressWindowMediator;
   import com.bigpoint.zoomumba.view.windows.nursery.NurserySuccessWindowMediator;
   import com.bigpoint.zoomumba.view.windows.nursery.NurseryWindowMediator;
   import com.bigpoint.zoomumba.view.windows.ocean.helpComic.OceanWorldComicWindowMediator;
   import com.bigpoint.zoomumba.view.windows.quests.QuestsWindowMediator;
   import com.bigpoint.zoomumba.view.windows.quests.infoWindows.QuestExampleInfoWindowMediator;
   import com.bigpoint.zoomumba.view.windows.quests.reword.QuestRewordWindowMediator;
   import com.bigpoint.zoomumba.view.windows.recycling.RecyclingRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.recycling.RecyclingWindowChooseMediator;
   import com.bigpoint.zoomumba.view.windows.recycling.RecyclingWindowMediator;
   import com.bigpoint.zoomumba.view.windows.recycling.RecyclingWindowProduceMediator;
   import com.bigpoint.zoomumba.view.windows.recycling.helpComic.RecyclingComicWindowMediator;
   import com.bigpoint.zoomumba.view.windows.safari.SafariBuyFuelWindowMediator;
   import com.bigpoint.zoomumba.view.windows.safari.SafariShowItemWindowMediator;
   import com.bigpoint.zoomumba.view.windows.settings.SettingsWindowMediator;
   import com.bigpoint.zoomumba.view.windows.shop.ShopWindowMediator;
   import com.bigpoint.zoomumba.view.windows.specialCurrencies.SpecialCurrenciesWindowMediator;
   import com.bigpoint.zoomumba.view.windows.specialCurrencies.oceanworld.SpecialCurrenciesOceanWorldWindowMediator;
   import com.bigpoint.zoomumba.view.windows.specialOffer.SpecialOfferWindowMediator;
   import com.bigpoint.zoomumba.view.windows.superPack.SuperPackWindowMediator;
   import com.bigpoint.zoomumba.view.windows.testGUI.TestGUIWindowMediator;
   import com.bigpoint.zoomumba.view.windows.toolExchange.ToolExchangeWindowMediator;
   import com.bigpoint.zoomumba.view.windows.valentines.ValentiensWindowMediator;
   import com.bigpoint.zoomumba.view.windows.valentines.Valentines2013PayPackageWindowMediator;
   import com.bigpoint.zoomumba.view.windows.valentines.ValentinesEndWindowMediator;
   import com.bigpoint.zoomumba.view.windows.valentines.ValentinesRewardWindowMediator;
   import com.bigpoint.zoomumba.view.windows.waterStoreHouse.WaterStoreHouseUpdateWindowMediator;
   import com.bigpoint.zoomumba.view.windows.waterStoreHouse.WaterStoreHouseWindowMediator;
   import windows.custom.adam.AdamWindow;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.ended.AdvancedBreedingEndedWindow;
   import windows.custom.advBreeding.progress.AdvancedBreedingProgressWindow;
   import windows.custom.assistants.AssistantRenewWindow;
   import windows.custom.avatar.AvatarWindow;
   import windows.custom.babyCaravan.BabyCaravanInfoWindow;
   import windows.custom.babyCaravan.BabyCaravanWindow;
   import windows.custom.cacheResources.CacheResourcesWindow;
   import windows.custom.cageUpgrade.CageUpgradeWindow;
   import windows.custom.cinema.CinemaWindow;
   import windows.custom.collectionSets.CollectionSetCongratulationWindow;
   import windows.custom.collectionSets.CollectionSetRewordWindow;
   import windows.custom.collectionSets.ItemBigInfoWindow;
   import windows.custom.confirmation.ConfirmationWindow;
   import windows.custom.confirmation.extended.BuyConfirmationWindow;
   import windows.custom.confirmation.extended.BuyOnceWindow;
   import windows.custom.confirmation.extended.BuyTwoCurrencyConfirmationWindow;
   import windows.custom.confirmation.extended.ExtendedBuyConfirmationWindow;
   import windows.custom.crafting.BlueprintCraftingRewardWindow;
   import windows.custom.crafting.ChooseCraftingWindow;
   import windows.custom.crafting.IntroCraftingWindow;
   import windows.custom.crafting.ProduceCraftingWindow;
   import windows.custom.crafting.ProgressCraftingWindow;
   import windows.custom.crafting.SuccessCraftingWindow;
   import windows.custom.currencies.SpecialsCurrenciesWindow;
   import windows.custom.dailyLogin.DailyLoginWindow;
   import windows.custom.demo.DemoWindow;
   import windows.custom.doubleXp.DoubleXpWindow;
   import windows.custom.events.advBreeding.AdvBreedingEventEndWindow;
   import windows.custom.events.advBreeding.AdvBreedingEventWindow;
   import windows.custom.events.babyEvent.BabyEventWindow;
   import windows.custom.events.ballonEventSell.BallonEventSellWindow;
   import windows.custom.events.boardgame.BoardgameWindow;
   import windows.custom.events.boardgamePaypackage.BoardgamePayPackageWindow;
   import windows.custom.events.boardgameReward.BoardgameRewardWindow;
   import windows.custom.events.christmas.ChristmasSleighWindow;
   import windows.custom.events.christmas.ended.ChristmasEndedWindow;
   import windows.custom.events.christmas.reward.ChristmasRewardWindow;
   import windows.custom.events.circus.CircusWindow;
   import windows.custom.events.circus.reward.CircusRewardWindow;
   import windows.custom.events.community.GenericCommunityEventHelpWindow;
   import windows.custom.events.community.GenericCommunityEventWindow;
   import windows.custom.events.easter.EasterWindow;
   import windows.custom.events.frogEvent.FrogWindow;
   import windows.custom.events.valentines2013.Valentines2013PayPackageWindow;
   import windows.custom.friends.DeleteFriendWindow;
   import windows.custom.friends.FriendInfoWindow;
   import windows.custom.friends.FriendsWindow;
   import windows.custom.friends.InviteFriendWindow;
   import windows.custom.gameItems.info.GameItemInfoWindow;
   import windows.custom.gameItems.info.infoBase.ItemInfoBaseWindow;
   import windows.custom.gameItems.info.infoMaterial.ItemInfoMaterialWindow;
   import windows.custom.gameItems.info.infoSpecie.ItemInfoSpecieWindow;
   import windows.custom.gameItems.info.infoSpecieStatic.ItemInfoSpecieStaticWindow;
   import windows.custom.gameItems.sell.GameItemSellWindow;
   import windows.custom.generic.comic.GenericComicWindow;
   import windows.custom.gifts.GiftsWindow;
   import windows.custom.gifts.SingleItemPackInfoWindow;
   import windows.custom.happyHour.HappyHourWindow;
   import windows.custom.information.InformationWindow;
   import windows.custom.inventoryWindow.AnimalToInventoryWindow;
   import windows.custom.inventoryWindow.InventoryWindow;
   import windows.custom.inventoryWindow.ItemToInvontoryInfoWindow;
   import windows.custom.levelUp.AdvBreedingUnlockWindow;
   import windows.custom.levelUp.RecylingCraftingUnlockWindow;
   import windows.custom.mail.MailWindow;
   import windows.custom.mail.readMail.MailReadWindow;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionWindow;
   import windows.custom.news.NewsWindow;
   import windows.custom.news.events.advBreeding.EventNewsWindow;
   import windows.custom.nowInShop.NowInShopWindow;
   import windows.custom.nursery.NurseryWindow;
   import windows.custom.nursery.progress.NurseryProgressWindow;
   import windows.custom.nursery.success.NurserySuccessWindow;
   import windows.custom.questsWindow.QuestsWindowTabs;
   import windows.custom.questsWindow.infoWindows.QuestExampleInfoWindow;
   import windows.custom.questsWindow.rewordWindow.QuestRewordWindow;
   import windows.custom.recycling.RecyclingChooseWindow;
   import windows.custom.recycling.RecyclingProduceWindow;
   import windows.custom.recycling.RecyclingRewardWindow;
   import windows.custom.recycling.RecyclingWindow;
   import windows.custom.reward.RewardInfoWindow;
   import windows.custom.safari.SafariBuyFuelWindow;
   import windows.custom.safari.SafariItemWindow;
   import windows.custom.settings.SettingsWindow;
   import windows.custom.shop.ShopWindow;
   import windows.custom.specialOffer.SpecialOfferWindow;
   import windows.custom.superPack.SuperPackInfoWindow;
   import windows.custom.superPack.SuperPackWindow;
   import windows.custom.testGUI.TestGUIWindow;
   import windows.custom.toolExchange.ToolExchangeWindow;
   import windows.custom.toolbar.BrowserBarRewordWindow;
   import windows.custom.valentines.ValentiensEndWindow;
   import windows.custom.valentines.ValentineRewardWindow;
   import windows.custom.valentines.ValentinesWindow;
   import windows.custom.waterStoreHouse.WaterStoreHouseUpdateWindow;
   import windows.custom.waterStoreHouse.WaterStoreHouseWindow;
   import windows.custom.zooWheel.ZooWheelWindow;
   import windows.custom.zooWheel.buySpin.BuySpinWindow;
   import windows.custom.zooWheel.freeSpin.FreeSpinWindow;
   import windows.custom.zooWheel.reward.ZooWheelRewardWindow;
   
   public class WindowTypes
   {
      public static const BROWSER_TOOLBAR_REWORD:WindowTypeDefitinion = new WindowTypeDefitinion(BrowserBarRewordWindowMediator,BrowserBarRewordWindow);
      
      public static const ITEM_TO_INVENTORY_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(ItemToInventoryItemWindowMediator,ItemToInvontoryInfoWindow);
      
      public static const INVENTORY:WindowTypeDefitinion = new WindowTypeDefitinion(InventoryWindowMediator,InventoryWindow);
      
      public static const ANIMAL_TO_INVENTORY:WindowTypeDefitinion = new WindowTypeDefitinion(AnimalToInventoryWindowMediator,AnimalToInventoryWindow);
      
      public static const QUESTS:WindowTypeDefitinion = new WindowTypeDefitinion(QuestsWindowMediator,QuestsWindowTabs);
      
      public static const QUEST_EXAMPLE_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(QuestExampleInfoWindowMediator,QuestExampleInfoWindow);
      
      public static const QUEST_REWORD:WindowTypeDefitinion = new WindowTypeDefitinion(QuestRewordWindowMediator,QuestRewordWindow);
      
      public static const SEND_GIFT:WindowTypeDefitinion = new WindowTypeDefitinion(GiftsWindowMediator,GiftsWindow);
      
      public static const SINGLE_ITEM_PACK_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(SingleItemPackInfoWindowMediator,SingleItemPackInfoWindow);
      
      public static const CONFIRMATION:WindowTypeDefitinion = new WindowTypeDefitinion(ConfirmationWindowMediator,ConfirmationWindow);
      
      public static const INFORMATION:WindowTypeDefitinion = new WindowTypeDefitinion(InformationWindowMediator,InformationWindow);
      
      public static const BUY_CONFIRMATION:WindowTypeDefitinion = new WindowTypeDefitinion(BuyConfirmationWindowMediator,BuyConfirmationWindow);
      
      public static const BUY_TWO_CURRENCY_CONFIRMATION:WindowTypeDefitinion = new WindowTypeDefitinion(BuyTwoCurrencyConfirmationWindowMediator,BuyTwoCurrencyConfirmationWindow);
      
      public static const EXTENDED_BUY_CONFIRMATION:WindowTypeDefitinion = new WindowTypeDefitinion(ExtendedBuyConfirmationWindowMediator,ExtendedBuyConfirmationWindow);
      
      public static const SUPER_PACK_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(SuperPackInfoWindowMediator,SuperPackInfoWindow);
      
      public static const COLLECTABLE_ITEM_BIG_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(ItemBigInfoWindowMediator,ItemBigInfoWindow);
      
      public static const COLLECTABLE_MAIN_ITEM_BIG_INFO:WindowTypeDefitinion = new WindowTypeDefitinion(MainItemBigInfoWindowMediator,ItemBigInfoWindow);
      
      public static const COLLECTION_SET_CONGRATULATION:WindowTypeDefitinion = new WindowTypeDefitinion(CollectionSetCongratulationWindowMediator,CollectionSetCongratulationWindow,OpenStrategies.QUEUE);
      
      public static const COLLECTION_SET_REWORD:WindowTypeDefitinion = new WindowTypeDefitinion(CollectionSetRewordWindowMediator,CollectionSetRewordWindow);
      
      public static const SUPER_PACK:WindowTypeDefitinion = new WindowTypeDefitinion(SuperPackWindowMediator,SuperPackWindow);
      
      public static const ASSISTANT_RENEW:WindowTypeDefitinion = new WindowTypeDefitinion(AssistantsRenewalWindowMediator,AssistantRenewWindow,OpenStrategies.QUEUE);
      
      public static const ZOO_WHEEL:WindowTypeDefitinion = new WindowTypeDefitinion(FortuneWheelWindowMediator,ZooWheelWindow);
      
      public static const ZOO_WHEEL_FREE_SPIN:WindowTypeDefitinion = new WindowTypeDefitinion(FreeSpinWindowMediator,FreeSpinWindow);
      
      public static const ZOO_WHEEL_BUY_SPIN:WindowTypeDefitinion = new WindowTypeDefitinion(BuySpinMediator,BuySpinWindow);
      
      public static const ZOO_WHEEL_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RewardWindowMediator,ZooWheelRewardWindow);
      
      public static const MAIN_BUILDING_SELECTION:WindowTypeDefitinion = new WindowTypeDefitinion(MainBuildingSelectionWindowMediator,MainBuildingSelectionWindow);
      
      public static const CAGE_UPGRADE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CageUpgradeWindowMediator,CageUpgradeWindow);
      
      public static const SETTINGS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SettingsWindowMediator,SettingsWindow);
      
      public static const SPECIAL_CURRENCIES_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SpecialCurrenciesWindowMediator,SpecialsCurrenciesWindow);
      
      public static const SPECIAL_CURRENCIES_OCEAN_WORLD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SpecialCurrenciesOceanWorldWindowMediator,SpecialsCurrenciesWindow);
      
      public static const ADAM_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdamWindowMediator,AdamWindow);
      
      public static const GAME_ITEM_SELL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(GameItemSellWindowMediator,GameItemSellWindow);
      
      public static const GAME_ITEM_PAYIN_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(GameItemPayinWindowMediator,GameItemSellWindow);
      
      public static const GAME_ITEM_INFO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ItemInfoWindowMediator,GameItemInfoWindow);
      
      public static const GENERIC_COMIC_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(GenericComicWindowMediator,GenericComicWindow);
      
      public static const HAPPY_HOUR_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(HappyHourWindowMediator,HappyHourWindow);
      
      public static const NOW_IN_SHOP:WindowTypeDefitinion = new WindowTypeDefitinion(NowInShopWindowMediator,NowInShopWindow);
      
      public static const DOUBLE_XP_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(DoubleXpWindowMediator,DoubleXpWindow);
      
      public static const TRIPLE_XP_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(DoubleXpWindowMediator,DoubleXpWindow);
      
      public static const DAILY_LOGIN_BONUS:WindowTypeDefitinion = new WindowTypeDefitinion(DailyLoginMediator,DailyLoginWindow);
      
      public static const CIRCUS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CircusWindowMediator,CircusWindow);
      
      public static const CIRCUS_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CircusRewardWindowMediator,CircusRewardWindow);
      
      public static const BABY_EVENT_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BabyEventWindowMediator,BabyEventWindow);
      
      public static const ADV_BREEDING_EVENT_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvBreedingEventWindowMediator,AdvBreedingEventWindow);
      
      public static const ADV_BREEDING_EVENT_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvBreedingEventRewardWindowMediator,RewardInfoWindow);
      
      public static const ADV_BREEDING_EVENT_ENDED_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvBreedingEventEndWindowMediator,AdvBreedingEventEndWindow);
      
      public static const TEST_GUI_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(TestGUIWindowMediator,TestGUIWindow);
      
      public static const DEMO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(DemoWindowMediator,DemoWindow);
      
      public static const SHOP_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ShopWindowMediator,ShopWindow);
      
      public static const SHOP_BUY_ONCE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BuyOnceWindowMediator,BuyOnceWindow);
      
      public static const ITEM_INFO_BASE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ItemInfoBaseWindowMediator,ItemInfoBaseWindow);
      
      public static const ITEM_INFO_SPECIE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ItemInfoSpecieWindowMediator,ItemInfoSpecieWindow);
      
      public static const ITEM_INFO_ANIMAL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ItemInfoSpecieStaticWindowMediator,ItemInfoSpecieStaticWindow);
      
      public static const ITEM_INFO_MATERIAL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ItemInfoMaterialWindowMediator,ItemInfoMaterialWindow);
      
      public static const SAFARI_BUY_FUEL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SafariBuyFuelWindowMediator,SafariBuyFuelWindow);
      
      public static const SAFARI_SHOW_ITEM_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SafariShowItemWindowMediator,SafariItemWindow);
      
      public static const FRIENDS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(FriendsWindowMediator,FriendsWindow);
      
      public static const FRIEND_INFO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(FriendInfoWindowMediator,FriendInfoWindow);
      
      public static const DELETE_FRIEND_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(DeleteFriendWindowMediator,DeleteFriendWindow);
      
      public static const INVITE_FRIEND_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(InviteFriendWindowMediator,InviteFriendWindow);
      
      public static const AVATAR_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AvatarWindowMediator,AvatarWindow);
      
      public static const NEWS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(NewsWindowMediator,NewsWindow);
      
      public static const ADVANCED_BREEDING_NEWS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvancedBreedingNewsMediator,EventNewsWindow);
      
      public static const CIRCUS_NEWS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CircusNewsMediator,EventNewsWindow);
      
      public static const MAIL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(MailWindowMediator,MailWindow);
      
      public static const MAIL_READ_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(MailReadWindowMediator,MailReadWindow);
      
      public static const BABY_CARAVAN_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BabyCaravanWindowMediator,BabyCaravanWindow);
      
      public static const BABY_CARAVAN_INFO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BabyCaravanInfoWindowMediator,BabyCaravanInfoWindow);
      
      public static const ADVANCED_BREEDING_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvancedBreedingWindowMediator,AdvancedBreedingWindow);
      
      public static const ADVANCED_BREEDING_PROGRESS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvancedBreedingProgressWindowMediator,AdvancedBreedingProgressWindow);
      
      public static const ADVANCED_BREEDING_ENDED_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvancedBreedingEndedWindowMediator,AdvancedBreedingEndedWindow);
      
      public static const ADVANCED_BREEDING_UNLOCK_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(AdvBreedingUnlockWindowMediator,AdvBreedingUnlockWindow);
      
      public static const NURSERY_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(NurseryWindowMediator,NurseryWindow);
      
      public static const NURSERY_RAISING_PROGRESS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(NurseryProgressWindowMediator,NurseryProgressWindow);
      
      public static const NURSERY_RAISING_ENDED_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(NurserySuccessWindowMediator,NurserySuccessWindow);
      
      public static const CACHE_RESOURCES_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CacheResourcesWindowMediator,CacheResourcesWindow);
      
      public static const CHRISTMAS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ChristmasWindowMediator,ChristmasSleighWindow);
      
      public static const CHRISTMAS_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ChristmasRewardWindowMediator,ChristmasRewardWindow);
      
      public static const CHRISTMAS_ENDED_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ChristmasEndedWindowMediator,ChristmasEndedWindow);
      
      public static const TOOLEXCHANGE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ToolExchangeWindowMediator,ToolExchangeWindow);
      
      public static const CINEMA_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CinemaWindowMediator,CinemaWindow);
      
      public static const RECYCLING_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecyclingWindowMediator,RecyclingWindow);
      
      public static const RECYCLING_CHOOSE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecyclingWindowChooseMediator,RecyclingChooseWindow);
      
      public static const RECYCLING_PRODUCE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecyclingWindowProduceMediator,RecyclingProduceWindow);
      
      public static const RECYCLING_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecyclingRewardWindowMediator,RecyclingRewardWindow);
      
      public static const RECYCLING_COMIC_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecyclingComicWindowMediator,GenericComicWindow);
      
      public static const CRAFTING_INTRO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(IntroCraftingMediator,IntroCraftingWindow);
      
      public static const CRAFTING_CHOOSE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ChooseCraftingMediator,ChooseCraftingWindow);
      
      public static const CRAFTING_PRODUCE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ProduceCraftingMediator,ProduceCraftingWindow);
      
      public static const CRAFTING_PROGRESS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ProgressCraftingMediator,ProgressCraftingWindow);
      
      public static const CRAFTING_SUCCESS_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SuccessCraftingMediator,SuccessCraftingWindow);
      
      public static const CRAFTING_BLUEPRINT_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BlueprintCrafingRewardMediator,BlueprintCraftingRewardWindow);
      
      public static const CRAFTING_COMIC_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(CraftingComicWindowMediator,GenericComicWindow);
      
      public static const OCEAN_COMIC_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(OceanWorldComicWindowMediator,GenericComicWindow);
      
      public static const UNLOCK_CRAFTING_RECYCLING_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RecylingCraftingUnlockWindowMediator,RecylingCraftingUnlockWindow);
      
      public static const VALENTINES_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ValentiensWindowMediator,ValentinesWindow);
      
      public static const VALENTINES_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ValentinesRewardWindowMediator,ValentineRewardWindow);
      
      public static const VALENTINES_END_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(ValentinesEndWindowMediator,ValentiensEndWindow);
      
      public static const VALENTINES_2013_PAY_PACKAGE:WindowTypeDefitinion = new WindowTypeDefitinion(Valentines2013PayPackageWindowMediator,Valentines2013PayPackageWindow);
      
      public static const SPECIAL_OFFER_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(SpecialOfferWindowMediator,SpecialOfferWindow);
      
      public static const REWARD_INFO_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(RewardInfoWindowMediator,RewardInfoWindow);
      
      public static const EASTER_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(EasterEventMediator,EasterWindow);
      
      public static const FROG_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(FrogEventMediator,FrogWindow);
      
      public static const BOARDGAME_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BoardgameEventMediator,BoardgameWindow);
      
      public static const BOARDGAME_PAY_PACKAGE:WindowTypeDefitinion = new WindowTypeDefitinion(BoardgamePayPackageWindowMediator,BoardgamePayPackageWindow);
      
      public static const BOARDGAME_REWARD_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BoardgameRewardWindowMediator,BoardgameRewardWindow);
      
      public static const WATERSTOREHOUSE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(WaterStoreHouseWindowMediator,WaterStoreHouseWindow);
      
      public static const WATERSTOREHOUSEUPDATE_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(WaterStoreHouseUpdateWindowMediator,WaterStoreHouseUpdateWindow);
      
      public static const BALLONSELL_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(BallonEventSellMediator,BallonEventSellWindow);
      
      public static const COMMUNITY_EVENT_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(GenericCommunityEventWindowMediator,GenericCommunityEventWindow);
      
      public static const COMMUNITY_EVENT_HELP_WINDOW:WindowTypeDefitinion = new WindowTypeDefitinion(GenericCommunityEventHelpWindowMediator,GenericCommunityEventHelpWindow);
      
      public function WindowTypes()
      {
         super();
      }
   }
}

