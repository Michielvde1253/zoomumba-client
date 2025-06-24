package com.bigpoint.zoomumba.controller.net
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.features.crafting.vo.BlueprintRewardVo;
   import com.bigpoint.zoomumba.controller.game.GameProxy;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.app.items.DropVO;
   import com.bigpoint.zoomumba.model.app.items.GiftPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.items.fieldItems.ItemBlueprintVo;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieVO;
   import com.bigpoint.zoomumba.model.events.advBreeding.AdvBreedingEventProxy;
   import com.bigpoint.zoomumba.model.events.babyEvent.vo.LoanedItemVO;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementProxy;
   import com.bigpoint.zoomumba.model.features.adamPenguin.AdamProxy;
   import com.bigpoint.zoomumba.model.features.adamPenguin.vo.AdamViewVO;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.cinema.CinemaProxy;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemVO;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingRewardVo;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingStateVo;
   import com.bigpoint.zoomumba.model.features.dailyLogin.DailyLoginProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelVO;
   import com.bigpoint.zoomumba.model.features.gifts.GiftsProxy;
   import com.bigpoint.zoomumba.model.features.mainBuildingSelect.MainBuildingSelectionProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemVO;
   import com.bigpoint.zoomumba.model.features.ranknig.RanknigProxy;
   import com.bigpoint.zoomumba.model.features.ranknig.vo.RankingListVO;
   import com.bigpoint.zoomumba.model.features.ranknig.vo.RankingVO;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingSlotDataVo;
   import com.bigpoint.zoomumba.model.features.safari.SafariProxy;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.EventDatas;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.RoadData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.TrashBinData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel.RewardData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.AssistanceData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.MaterialData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResourceData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResourceDifferenceData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResponceData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementRewardsData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestRewardData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestTaskData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariJokerConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariRewardData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariTileData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.StartingFuelData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.news.NewsProxy;
   import com.bigpoint.zoomumba.model.parser.ParserProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.core.vo.UserAccountCenterVO;
   import com.bigpoint.zoomumba.model.user.events.UserEventProxy;
   import com.bigpoint.zoomumba.model.user.events.vo.UserEventVO;
   import com.bigpoint.zoomumba.model.user.messageSystem.UserMessagesProxy;
   import com.bigpoint.zoomumba.model.user.messageSystem.vo.UserMessageVO;
   import com.bigpoint.zoomumba.model.user.quests.QuestsProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoomumba.model.windows.ranking.RanknigWindowProxy;
   import com.bigpoint.zoomumba.view.windows.toolExchange.vo.ToolExchangeVo;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import mx.collections.ArrayCollection;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ResponseParserCommand extends SimpleCommand
   {
      private static var traceSkip:int = 4;
      
      private var badlyHackedInVariable:int = -1;
      
      private var avatarProxy:AvatarProxy;
      
      public function ResponseParserCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:String = null;
         var _loc4_:AppProxy = null;
         var _loc2_:Object = param1.getBody();
         if(_loc2_)
         {
            if(_loc2_[ResponseName.FIELD_IDS])
            {
               this.parsePlayfieldIdsData(_loc2_[ResponseName.FIELD_IDS]);
            }
            if(_loc2_[ResponseName.SERVER_DATA])
            {
               this.parseServerData(_loc2_[ResponseName.SERVER_DATA]);
            }
            if(_loc2_[ResponseName.ACTIVE_FIELD_ID])
            {
               this.parseActiveFieldId(_loc2_[ResponseName.ACTIVE_FIELD_ID]);
            }
            if(_loc2_[ResponseName.FIELD_SETTINGS])
            {
               this.parsePlayfieldSettings(_loc2_[ResponseName.FIELD_SETTINGS]);
            }
            if(_loc2_[ResponseName.USER_DATA])
            {
               this.parseUserData(_loc2_[ResponseName.USER_DATA]);
            }
            if(_loc2_[ResponseName.SWF_COOKIES])
            {
               this.parseSwfCookies(_loc2_[ResponseName.SWF_COOKIES]);
            }
            if(_loc2_[ResponseName.VALENTINES_OBJECT])
            {
               this.parseValentineData(_loc2_[ResponseName.VALENTINES_OBJECT]);
            }
         }
         for(_loc3_ in _loc2_)
         {
            switch(_loc3_)
            {
               case ResponseName.GAME_CONFIGURATION:
                  sendNotification(Note.CONFIGURATION_RESPONSE_RECEIVED,_loc2_);
                  break;
               case ResponseName.ZOO_SESSION_ID:
                  _loc4_ = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
                  _loc4_.setZooSessionId(_loc2_[_loc3_]);
                  break;
               case ResponseName.GAME_ITEMS:
                  this.parseNewGameItems(_loc2_);
                  break;
               case ResponseName.CLIENT_SETTINGS:
                  this.parseClientSettings(_loc2_[_loc3_]);
                  break;
               case ResponseName.USERNAME_SEARCH_LIST:
                  sendNotification(Note.USERNAME_SEARCH_LIST_RESPONSE,_loc2_[_loc3_]);
                  break;
               case ResponseName.EVENT_OBJECT:
                  sendNotification(ResponseName.EVENT_OBJECT,_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_RESOURCES_DATA:
                  this.parseUserResourcesData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_MATERIAL_DATA:
                  this.parseUserMaterialData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_BLUEPRINT_DATA:
                  this.parseUserBlueprintData(_loc2_[_loc3_]);
                  break;
               case ResponseName.BLUEPRINT_REWARD:
                  this.parseBlueprintReward(_loc2_[_loc3_]);
                  break;
               case ResponseName.SHOW_ANNIVERSARY_END_SCREEN:
                  sendNotification(Note.SHOW_ANNIVERSARY_END_SCREEN);
                  break;
               case ResponseName.RESOURCE_DIFF_DATA:
                  this.parseResourceDifferenceData(_loc2_[_loc3_]);
                  break;
               case ResponseName.COUNTER_NAME:
                  this.parseCounterValues(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_ASSISTANTS:
                  this.parseUserAssistancesData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_COLLECTABLES:
                  this.parseUserCollectables(_loc2_[_loc3_]);
                  break;
               case ResponseName.FIELD_OBJECTS:
                  TutorialInjectionManager.getInstance().pushArrived();
                  this.parsePlayfieldItemsData(_loc2_[_loc3_]);
                  break;
               case ResponseName.TOOLS_TO_XP:
                  this.parsePlayfieldItemsData(_loc2_[_loc3_]);
                  break;
               case ResponseName.RESPONSES_STATUS:
                  this.parseResponsesStatusData(_loc2_[_loc3_]);
                  break;
               case ResponseName.EVENT_DATA:
                  this.parseEventData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_EVENT_DATA:
                  this.parseUserEventData(_loc2_[_loc3_]);
                  break;
               case ResponseName.QUEST_DATA:
                  this.parseQuestData(_loc2_[_loc3_]);
                  break;
               case ResponseName.EVENTS_CONFIG_OBJECT_IN_PUSH:
                  this.parseEventItems(_loc2_[_loc3_]);
                  break;
               case ResponseName.PUSH_OBJECT:
                  sendNotification(Note.PUSH_RESPONSE);
                  break;
               case ResponseName.INIT_OBJECT:
                  sendNotification(Note.INIT_RESPONSE);
                  break;
               case ResponseName.MAIL_DATA:
                  this.parseAllMailData(_loc2_[_loc3_]);
                  break;
               case ResponseName.ACHIEVEMENTS_DATA:
                  this.parseAchievementData(_loc2_[_loc3_]);
                  break;
               case ResponseName.RECYCLING_SLOTS:
                  this.parseRecyclingSlotData(_loc2_[_loc3_]);
                  break;
               case ResponseName.CRAFT_STATE:
                  this.parseCrafingData(_loc2_[_loc3_]);
                  break;
               case ResponseName.CRAFT_REWARD:
                  this.parseCrafingRewardData(_loc2_[_loc3_]);
                  break;
               case ResponseName.ACCOUNT_CENTER:
                  this.parseAccountCenterData(_loc2_[_loc3_]);
                  break;
               case ResponseName.ACHIEVEMENTS_COMPLETE:
                  this.parseAchievementComplete(_loc2_[_loc3_]);
                  break;
               case ResponseName.ACHIEVEMENTS_PUZZLE_COMPLETE_DATA:
                  this.parseAchievementPuzzleCompleteData(_loc2_[_loc3_]);
                  break;
               case ResponseName.ITEM_DROP_HASH:
                  this.parseItemDropHash(_loc2_[_loc3_]);
                  break;
               case ResponseName.ITEM_DROP_TIMER:
                  this.parseItemDropTimer(_loc2_[_loc3_]);
                  break;
               case ResponseName.NEWS:
                  this.parseNewsItems(_loc2_[_loc3_]);
                  break;
               case ResponseName.FORTUNE_WHEEL_DATA:
                  this.parseFortuneWheelData(_loc2_[_loc3_]);
                  break;
               case ResponseName.SAFARI_CONFIG_DATA:
                  this.parseSafariConfigData(_loc2_[_loc3_]);
                  break;
               case ResponseName.SAFARI_DATA:
                  this.parseSafariStateData(_loc2_[_loc3_]);
                  break;
               case ResponseName.NEYBOUR_DATA:
                  this.parseNeybourData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_POWERUPS:
                  this.parseUserPowerups(_loc2_[_loc3_]);
                  break;
               case ResponseName.TOOL_BAR_REWORD:
                  this.parseToolbarReward(_loc2_[_loc3_]);
                  break;
               case ResponseName.RANK_LIST_DATA:
                  this.parseRankListData(_loc2_[_loc3_]);
                  break;
               case ResponseName.USER_GIFTS_DATA:
                  this.parseUserGifts(_loc2_[_loc3_]);
                  break;
               case ResponseName.ADAM_PENGUIN:
                  this.parseAdamData(_loc2_[_loc3_]);
                  break;
               case ResponseName.CIRCUS_REWARD:
                  this.parseCircus(_loc2_[_loc3_]);
                  break;
               case ResponseName.ANIMALS_INIT_OBJ:
                  this.parseAnimalsInitObject(_loc2_[_loc3_]);
                  break;
               case ResponseName.PLAYER_HAS_ENTRANCE_DATA:
                  this.parseHasEntrance(_loc2_[_loc3_]);
                  break;
               case ResponseName.AVATAR_INVENTORY:
                  this.parseAvatarInventoryData(_loc2_[_loc3_]);
                  break;
               case ResponseName.DAILY_LOGIN:
                  this.parseDailyLoginData(_loc2_[_loc3_]);
                  break;
               case ResponseName.DAILY_LOGIN_REWARD:
                  this.parseDailyLoginRewardData(_loc2_[_loc3_]);
                  break;
               case ResponseName.FRIENDS_LIST:
               case ResponseName.FRIENDS_RECEIVED_INVITATIONS:
               case ResponseName.FRIENDS_SENT_INVITATIONS:
                  this.parseFriends(_loc3_,_loc2_[_loc3_]);
                  break;
               case ResponseName.USERNAMES_LIST:
                  this.parseUsernamesList(_loc2_[_loc3_]);
                  break;
               case ResponseName.AVATAR_CONFIG:
                  this.avatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
                  this.avatarProxy.parseConfig(_loc2_[_loc3_]);
                  break;
               case ResponseName.AVATAR_DATA:
                  this.avatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
                  this.avatarProxy.parseAvatar(_loc2_[_loc3_]);
                  break;
               case ResponseName.LOAN_OBJECT:
                  this.parseLoanObject(_loc2_[_loc3_]);
                  break;
               case ResponseName.BABY_CARAVAN_END:
                  sendNotification(Note.BABY_CARAVAN_EVENT_END);
                  break;
               case ResponseName.CINEMA:
                  this.parseCinemaObject(_loc2_[_loc3_]);
                  break;
               case ResponseName.ADV_BREEDING_EVENT_CONFIG:
                  facade.registerProxy(new AdvBreedingEventProxy(_loc2_[_loc3_]));
                  break;
               case ResponseName.XMAS:
                  sendNotification(Note.XMAS2012_PAY_PACKAGE,_loc2_);
                  break;
               case ResponseName.VALENTINES_2013_PAY:
                  sendNotification(Note.VALENTINE2013_PAY_PACKAGE,_loc2_);
                  break;
               case ResponseName.BOARDGAME_PAY_THANKSGIVING:
                  sendNotification(Note.BOARDGAME_PAY_PACKAGE,_loc2_);
                  break;
               case ResponseName.BOARDGAME_PAY:
                  sendNotification(Note.BOARDGAME_PAY_PACKAGE,_loc2_);
                  break;
               case ResponseName.BOARDGAME_EVENT_REWARD:
               case ResponseName.COMMUNITY_EVENT_REWARD:
                  if(ResponseName.BOARDGAME_EVENT_REWARD)
                  {
                     this._showRewards(_loc2_[_loc3_],Note.BOARDGAME_REWARD_WINDOW_CLOSED);
                  }
                  else
                  {
                     this._showRewards(_loc2_[_loc3_]);
                  }
                  break;
               case ResponseName.ITEM_LAYER:
                  this.parseRewardItems(_loc2_[_loc3_]);
                  break;
               case ResponseName.OCEAN_WORLD_UNLOCKED:
                  this.parseOceanWorldUnlocked(_loc2_[_loc3_]);
                  break;
               case ResponseName.COMMUNITY_EVENT_PAYIN:
                  this.parseCommunityEventPayin(_loc2_[_loc3_]);
                  break;
               default:
                  sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : Response object " + _loc3_ + " is not handled.");
                  break;
            }
         }
      }
      
      private function parseCrafingRewardData(param1:Object) : void
      {
         var _loc2_:CraftingRewardVo = new CraftingRewardVo();
         _loc2_.itemVo = new ItemVO();
         _loc2_.xp = param1.xp;
         _loc2_.itemVo.category = ItemTypeHelper.typeToCategory(param1.item.type);
         _loc2_.itemVo.itemId = parseInt(param1.item.id);
         (facade.getProxy(CraftingProxy) as CraftingProxy).setRewardData(_loc2_);
      }
      
      private function parseCrafingData(param1:Object) : void
      {
         var _loc2_:CraftingStateVo = ObjectHelper.copyData(new CraftingStateVo(),param1);
         (facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy).setCraftingState(_loc2_);
      }
      
      private function parseEventItems(param1:Object) : void
      {
         (facade.getProxy(ParserProxy) as ParserProxy).parseGlobalEventConfigData(param1);
         sendNotification(Note.PUSH_RESPONSE);
      }
      
      public function parseCommunityEventPayin(param1:Object) : void
      {
         (facade.getProxy(ParserProxy) as ParserProxy).parseCommunityPayinConfig(param1);
      }
      
      public function parseRewardItems(param1:Object) : void
      {
         (facade.getProxy(ParserProxy) as ParserProxy).parseRewardItems(param1);
      }
      
      public function parseOceanWorldUnlocked(param1:Object) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.OCEAN_COMIC_WINDOW));
      }
      
      private function parseAccountCenterData(param1:Object) : void
      {
         var _loc2_:UserProxy = facade.getProxy(UserProxy) as UserProxy;
         var _loc3_:UserAccountCenterVO = new UserAccountCenterVO();
         if(param1.link)
         {
            _loc3_.link = param1.link;
         }
         _loc2_.accountCenterVo = _loc3_;
      }
      
      private function parseDailyLoginData(param1:Object) : void
      {
         this.dailyLoginProxy.setDailyLoginData(param1);
      }
      
      private function parseDailyLoginRewardData(param1:Object) : void
      {
         this.dailyLoginProxy.setCurrentReward(param1);
      }
      
      private function get dailyLoginProxy() : DailyLoginProxy
      {
         var _loc1_:DailyLoginProxy = null;
         if(facade.getProxy(DailyLoginProxy) as DailyLoginProxy == null)
         {
            _loc1_ = new DailyLoginProxy();
            facade.registerProxy(_loc1_);
            return _loc1_;
         }
         return facade.getProxy(DailyLoginProxy) as DailyLoginProxy;
      }
      
      private function _showRewards(param1:Array, param2:String = "") : void
      {
         var _loc3_:Object = null;
         for each(_loc3_ in param1)
         {
            this._showRewardLayer(_loc3_,param2);
         }
      }
      
      private function _showRewardLayer(param1:Object, param2:String = "") : void
      {
         var _loc3_:CurrencyVO = new CurrencyVO();
         _loc3_.amount = param1["amount"];
         _loc3_.id = param1["id"];
         _loc3_.type = ItemTypeHelper.typeToCategory(param1["type"]);
         if(_loc3_.type == Categories.SPECIES)
         {
            _loc3_.id = param1["displayId"];
            _loc3_.type = Categories.ANIMAL;
            _loc3_.amount *= 2;
         }
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.REWARD_INFO_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.frog2012.success1"),_loc3_,""),new WindowParams("","",param2)));
      }
      
      private function parseUsernamesList(param1:Object) : void
      {
      }
      
      private function parseFriends(param1:String, param2:Object) : void
      {
         var _loc3_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         _loc3_.setFriendsData(param1,param2);
      }
      
      private function parseCinemaObject(param1:Object) : void
      {
         var _loc2_:CinemaProxy = null;
         var _loc3_:CurrencyVO = null;
         var _loc4_:Object = null;
         if(facade.retrieveProxy(CinemaProxy.NAME) != null)
         {
            _loc2_ = facade.retrieveProxy(CinemaProxy.NAME) as CinemaProxy;
         }
         if(_loc2_ != null)
         {
            _loc2_.tickets = param1.tickets;
            _loc2_.time = param1.time;
         }
         if(param1.lastTransactions)
         {
            for each(_loc4_ in param1.lastTransactions)
            {
               _loc3_ = ObjectHelper.copyData(new CurrencyVO(),_loc4_);
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.REWARD_INFO_WINDOW,"",new RewardInfoInitParams(TextResourceModule.getText("zoo.window.general.congrats"),TextResourceModule.getText("zoo.window.infoLayers.cinema.success1"),_loc3_,TextResourceModule.getText("zoo.window.infoLayers.cinema.success2"))));
            }
         }
      }
      
      private function parseAvatarInventoryData(param1:Object) : void
      {
         if(!this.avatarProxy)
         {
            this.avatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
         }
         this.avatarProxy.parseInventory(param1);
      }
      
      private function parseHasEntrance(param1:Object) : void
      {
         var _loc2_:MainBuildingSelectionProxy = facade.retrieveProxy(MainBuildingSelectionProxy.NAME) as MainBuildingSelectionProxy;
         _loc2_.showData = param1;
      }
      
      private function parseCircus(param1:Object) : void
      {
         var data:Object = param1;
         var circusProxy:CircusProxy = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
         try
         {
            circusProxy.setReward(data["id"],data["type"]);
            sendNotification(Note.CIRCUS_REWARD_ARRIVED);
         }
         catch(error:Error)
         {
         }
      }
      
      private function parseValentineData(param1:Object) : void
      {
         var _loc2_:ValentinesProxy = facade.retrieveProxy(ValentinesProxy.NAME) as ValentinesProxy;
         _loc2_.currentPosition = param1["pos"];
         _loc2_.rewards = ObjectHelper.objToArray(param1["rewards"]);
         _loc2_.loop = param1["loop"];
         sendNotification(Note.VALENTINE_REFRESH_BOARD);
      }
      
      private function parseCounterValues(param1:Object) : void
      {
         var _loc2_:CounterValuesProxy = facade.retrieveProxy(CounterValuesProxy.NAME) as CounterValuesProxy;
         _loc2_.parseCounters(param1,true);
      }
      
      private function parseAdamData(param1:Object) : void
      {
         var adamViewVo:AdamViewVO = null;
         var adamProxy:AdamProxy = null;
         var data:Object = param1;
         if(!Settings.TUTORIAL_ACTIVE)
         {
            adamViewVo = new AdamViewVO();
            try
            {
               adamViewVo.type = data["type"];
               adamViewVo.itemId = data["itemId"];
               adamViewVo.url = data["url"];
               adamViewVo.ajax = data["ajax"];
            }
            catch(error:Error)
            {
            }
            adamProxy = facade.retrieveProxy(AdamProxy.NAME) as AdamProxy;
            adamProxy.pushAdam(adamViewVo);
         }
      }
      
      private function parseAnimalsInitObject(param1:Object) : void
      {
         var _loc2_:AnimalData = null;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         for(_loc3_ in param1)
         {
            if(_loc3_ == "0")
            {
               _loc4_ = param1[_loc3_]["0"];
               for(_loc5_ in _loc4_)
               {
                  _loc2_ = new AnimalData();
                  ObjectHelper.copyData(_loc2_,_loc4_[_loc5_]);
                  _loc2_.uniqueId = int(_loc5_);
                  sendNotification(PLAYFIELD.PF_ANIMAL_PARSED,{
                     "animal":_loc2_,
                     "fieldId":int(_loc3_)
                  });
               }
            }
            else
            {
               _loc6_ = param1[_loc3_];
               for(_loc7_ in _loc6_)
               {
                  for(_loc8_ in _loc6_[_loc7_])
                  {
                     _loc2_ = new AnimalData();
                     ObjectHelper.copyData(_loc2_,_loc6_[_loc7_][_loc8_]);
                     sendNotification(PLAYFIELD.PF_ANIMAL_PARSED,{
                        "animal":_loc2_,
                        "fieldId":int(_loc3_)
                     });
                  }
               }
            }
         }
      }
      
      private function handlehappyHourHACK(param1:Object) : void
      {
         var attributeName:String = null;
         var globalEventVO:GlobalEventVO = null;
         var globalEventData:Object = null;
         var eventAtribbName:String = null;
         var data:Object = param1;
         var globalEventProxy:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         for(attributeName in data)
         {
            globalEventVO = new GlobalEventVO();
            globalEventData = data[attributeName];
            for(eventAtribbName in globalEventData)
            {
               try
               {
                  if(eventAtribbName == "params")
                  {
                     globalEventVO.params = this.parseDinamicData(data[eventAtribbName]);
                  }
                  else
                  {
                     globalEventVO[eventAtribbName] = globalEventData[eventAtribbName];
                  }
               }
               catch(error:Error)
               {
                  sendNotification(Note.WARNING_REPORT,"ConfigurationParserCommand : parseGlobalEventConfigData()" + error);
               }
            }
            if(!globalEventProxy.getGlobalEvent(EventTypes.HAPPY_HOUR_EVENT) && globalEventVO.eventId == EventTypes.HAPPY_HOUR_EVENT)
            {
               globalEventProxy.storeGlobalEventData(globalEventVO);
            }
         }
      }
      
      private function parseUserGifts(param1:Object) : void
      {
         var objectName:String = null;
         var giftItem:Object = null;
         var giftVO:GiftPackVO = null;
         var dataName:String = null;
         var data:Object = param1;
         var giftProxy:GiftsProxy = facade.retrieveProxy(GiftsProxy.NAME) as GiftsProxy;
         giftProxy.refreshDatas();
         for(objectName in data)
         {
            giftItem = data[objectName];
            giftVO = new GiftPackVO();
            for(dataName in giftItem)
            {
               if(dataName == "itemType")
               {
                  giftVO.category = ItemTypeHelper.typeToCategory(giftItem[dataName]);
                  addr103:
                  continue;
               }
               giftVO[dataName] = giftItem[dataName];
               §§goto(addr103);
               error = §§pop();
            }
            giftProxy.addGift(giftVO);
         }
         sendNotification(ResponseName.USER_GIFTS_DATA);
      }
      
      private function parseUserPowerups(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc2_:PowerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         for(_loc3_ in param1)
         {
            _loc2_.addPowerupItem(this.parseUserPowerup(param1[_loc3_]));
         }
      }
      
      private function parseUserPowerup(param1:Object) : PowerupItemVO
      {
         var attributeName:String = null;
         var data:Object = param1;
         var powerupItem:PowerupItemVO = new PowerupItemVO();
         for(attributeName in data)
         {
            try
            {
               powerupItem[attributeName] = data[attributeName];
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseUserPowerup()" + error);
            }
         }
         return powerupItem;
      }
      
      private function parseNewGameItems(param1:Object) : void
      {
         var _loc2_:ParserProxy = facade.retrieveProxy(ParserProxy.NAME) as ParserProxy;
         var _loc3_:Object = param1[ResponseName.GAME_ITEMS];
         _loc2_.parseInventoryData(_loc3_);
         sendNotification(SHOP.REFRESH_TAB_ITEMS);
      }
      
      private function parseClientSettings(param1:Object) : void
      {
         var userAttributeName:String = null;
         var data:Object = param1;
         var appSettingsVO:AppSettingsVO = new AppSettingsVO();
         for(userAttributeName in data)
         {
            try
            {
               appSettingsVO[userAttributeName] = data[userAttributeName];
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseClientSettings()" + error);
            }
         }
         sendNotification(ResponseName.CLIENT_SETTINGS,appSettingsVO);
      }
      
      private function parseUserData(param1:Object) : void
      {
         var _loc2_:UserProxy = facade.getProxy(UserProxy);
         _loc2_.storeData(param1);
      }
      
      private function parseUserResourcesData(param1:Object) : void
      {
         var resources:Vector.<ResourceData> = null;
         var name:String = null;
         var resourceDataVO:ResourceData = null;
         var resourceData:Object = null;
         var resourceDataAttributeName:String = null;
         var data:Object = param1;
         if(data)
         {
            resources = new Vector.<ResourceData>();
            for(name in data)
            {
               if(name)
               {
                  resourceDataVO = new ResourceData();
                  resourceData = data[name];
                  for(resourceDataAttributeName in resourceData)
                  {
                     try
                     {
                        resourceDataVO[resourceDataAttributeName] = resourceData[resourceDataAttributeName];
                     }
                     catch(error:Error)
                     {
                        sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseUserInventoryResourcesData()" + error);
                     }
                  }
                  resources.push(resourceDataVO);
               }
            }
            sendNotification(ResponseName.USER_RESOURCES_DATA,resources);
         }
      }
      
      private function parseUserMaterialData(param1:Object) : void
      {
         var materials:Vector.<MaterialData> = null;
         var name:String = null;
         var materialDataVO:MaterialData = null;
         var materialData:Object = null;
         var materialDataAttributeName:String = null;
         var data:Object = param1;
         if(data)
         {
            materials = new Vector.<MaterialData>();
            for(name in data)
            {
               if(name)
               {
                  materialDataVO = new MaterialData();
                  materialData = data[name];
                  for(materialDataAttributeName in materialData)
                  {
                     try
                     {
                        materialDataVO[materialDataAttributeName] = materialData[materialDataAttributeName];
                     }
                     catch(error:Error)
                     {
                        sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseUserInventoryResourcesData()" + error);
                     }
                  }
                  materials.push(materialDataVO);
               }
            }
            sendNotification(ResponseName.USER_MATERIAL_DATA,materials);
         }
      }
      
      private function parseBlueprintReward(param1:Object) : void
      {
         var _loc2_:BlueprintRewardVo = null;
         var _loc3_:Vector.<BlueprintRewardVo> = null;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc3_ = new Vector.<BlueprintRewardVo>();
            for each(_loc4_ in param1)
            {
               _loc2_ = new BlueprintRewardVo();
               _loc2_.blueprintId = _loc4_;
               _loc3_.push(_loc2_);
            }
            sendNotification(Note.OPEN_BLUEPRINT_REWARD_WINDOW,_loc3_);
         }
      }
      
      private function parseUserBlueprintData(param1:Object) : void
      {
         var name:String = null;
         var blueprints:Vector.<ItemBlueprintVo> = null;
         var itemBlueprintVo:ItemBlueprintVo = null;
         var blueprintData:Object = null;
         var blueprintDataAttributeName:String = null;
         var data:Object = param1;
         if(data)
         {
            blueprints = new Vector.<ItemBlueprintVo>();
            for(name in data)
            {
               if(name)
               {
                  itemBlueprintVo = new ItemBlueprintVo();
                  blueprintData = data[name];
                  for(blueprintDataAttributeName in blueprintData)
                  {
                     try
                     {
                        itemBlueprintVo[blueprintDataAttributeName] = blueprintData[blueprintDataAttributeName];
                     }
                     catch(error:Error)
                     {
                        sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseUserInventoryResourcesData()" + error);
                     }
                  }
                  if(itemBlueprintVo.active == 1)
                  {
                     blueprints.push(itemBlueprintVo);
                  }
               }
            }
            sendNotification(ResponseName.USER_BLUEPRINT_DATA,blueprints);
         }
      }
      
      private function parseResourceDifferenceData(param1:Object) : void
      {
         var resourceDiffName:String = null;
         var resourceIdName:String = null;
         var data:Object = param1;
         var resourceDiffVO:ResourceDifferenceData = new ResourceDifferenceData();
         for(resourceDiffName in data)
         {
            if(resourceDiffName != "resources")
            {
               try
               {
                  resourceDiffVO[resourceDiffName] = data[resourceDiffName];
               }
               catch(error:Error)
               {
                  sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseResourceDifferenceData()" + error);
               }
               continue;
            }
            resourceDiffVO.resources = new Vector.<int>(Resources.MAX_RESOURCE_ID);
            for(resourceIdName in data[resourceDiffName])
            {
               resourceDiffVO.resources[int(resourceIdName)] = data[resourceDiffName][resourceIdName];
            }
         }
         sendNotification(ResponseName.RESOURCE_DIFF_DATA,resourceDiffVO);
      }
      
      private function parseSwfCookies(param1:Object) : void
      {
         var rawCookie:Object = null;
         var cookieProxy:AppCookieProxy = null;
         var appCookie:AppCookieVO = null;
         var data:Object = param1;
         var appCookies:Vector.<AppCookieVO> = new Vector.<AppCookieVO>();
         for each(rawCookie in data.cookies)
         {
            appCookie = new AppCookieVO();
            try
            {
               appCookie.name = rawCookie["name"];
               appCookie.timestamp = rawCookie["timestamp"];
               appCookies.push(appCookie);
            }
            catch(e:Error)
            {
            }
         }
         cookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         cookieProxy.setCookies(appCookies);
      }
      
      private function parseUserCollectables(param1:Object) : void
      {
         var _loc3_:CollectableItemVO = null;
         var _loc4_:Object = null;
         var _loc2_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         for each(_loc4_ in param1)
         {
            if(_loc4_)
            {
               if(_loc4_["id"])
               {
                  _loc3_ = new CollectableItemVO();
                  _loc3_.isCollected = true;
                  _loc3_.itemId = _loc4_["id"];
                  _loc3_.amount = _loc4_["cnt"];
                  _loc2_.addCollectable(_loc3_);
               }
            }
         }
      }
      
      private function parseUserAssistancesData(param1:Object) : void
      {
         var name:String = null;
         var assistanceDataVO:AssistanceData = null;
         var assistanceData:Object = null;
         var assistanceDataAttributeName:String = null;
         var data:Object = param1;
         var assistances:Vector.<AssistanceData> = new Vector.<AssistanceData>();
         for(name in data)
         {
            assistanceDataVO = new AssistanceData();
            assistanceData = data[name];
            for(assistanceDataAttributeName in assistanceData)
            {
               assistanceDataVO[assistanceDataAttributeName] = assistanceData[assistanceDataAttributeName];
            }
            assistances.push(assistanceDataVO);
         }
         sendNotification(ResponseName.USER_ASSISTANTS,assistances);
      }
      
      private function parseServerData(param1:Object) : void
      {
         var _loc2_:GameProxy = facade.retrieveProxy(GameProxy.NAME) as GameProxy;
         var _loc3_:PaymentUrlProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         _loc2_.serverTime = param1.time;
         _loc3_.parseData(param1);
      }
      
      private function parseToolsToXPData(param1:Object) : void
      {
         var _loc2_:ToolExchangeVo = null;
         if(param1)
         {
            _loc2_ = new ToolExchangeVo();
            if(param1.tools)
            {
               _loc2_.tools = param1.tools;
            }
            if(param1.xp)
            {
               _loc2_.xp = param1.xp;
            }
         }
      }
      
      private function parsePlayfieldItemsData(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         for(_loc4_ in param1)
         {
            switch(_loc4_)
            {
               case ResponseName.CAGES:
                  this.parsePlayfieldItemCages(param1[_loc4_],param2);
                  break;
               case ResponseName.DECORATIONS:
                  this.parsePlayfieldItemDecorations(param1[_loc4_],param2);
                  break;
               case ResponseName.ROADS:
                  this.parsePlayfieldItemRoads(param1[_loc4_],param2);
                  break;
               case ResponseName.STORES:
                  this.parsePlayfieldItemStores(param1[_loc4_],param2);
                  break;
               case ResponseName.TRASHBINS:
                  this.parsePlayfieldItemTrashbins(param1[_loc4_],param2);
                  break;
               case ResponseName.MATERIALS:
                  this.parsePlayfieldItemMaterials(param1[_loc4_],param2);
                  break;
               case ResponseName.SPECIALS:
                  this.parsePlayfieldItemSpecials(param1[_loc4_],param2);
                  break;
            }
         }
      }
      
      private function parsePlayfieldIdsData(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc3_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         for(_loc4_ in param1)
         {
            _loc3_.setPlayFieldId(int(_loc4_),int(param1[_loc4_]));
         }
      }
      
      private function parsePlayfieldItemCages(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var cageVO:CageData = null;
         var cageData:Object = null;
         var cageAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         var itemConfigProxy:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var playfieldSettingsProxy:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var assistantProxy:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         var netProxy:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            if(int(fieldId) == playfieldSettingsProxy.getCurrentPlayFieldId() && netProxy.lastParsedResponse == assistantProxy.lastAssistCID)
            {
               assistantProxy.maxCages = this.getLength(fieldData);
            }
            for(itemId in fieldData)
            {
               cageVO = new CageData();
               cageData = fieldData[itemId];
               for(cageAttributeName in cageData)
               {
                  try
                  {
                     cageVO.uniqueId = int(itemId);
                     if(cageAttributeName == "drops")
                     {
                        this.parseCageDrops(cageVO,cageData[cageAttributeName]);
                     }
                     else
                     {
                        cageVO[cageAttributeName] = cageData[cageAttributeName];
                     }
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemCages()" + error + cageAttributeName);
                  }
               }
               if(cageVO.speciesId > 0)
               {
                  if(itemConfigProxy.getShopAnimalSpecie(cageVO.speciesId) == null)
                  {
                     continue;
                  }
                  cageVO.breedable = itemConfigProxy.getShopAnimalSpecie(cageVO.speciesId).breedable;
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_CAGE_PARSED,{
                     "cage":cageVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_CAGES,cageVO);
               }
            }
         }
      }
      
      private function getLength(param1:Object) : uint
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         for(_loc3_ in param1)
         {
            if(_loc3_ != "mx_internal_uid")
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      private function parseCageDrops(param1:CageData, param2:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:DropVO = null;
         var _loc6_:ItemPackVO = null;
         var _loc7_:ItemPackVO = null;
         var _loc8_:ItemPackVO = null;
         for(_loc3_ in param2)
         {
            _loc4_ = param2[_loc3_];
            if(!(_loc4_ != null && _loc4_ != ""))
            {
               continue;
            }
            _loc5_ = new DropVO();
            if(Boolean(_loc4_["pp"]) && _loc4_["pp"] != "")
            {
               _loc5_.petPaws = int(_loc4_["pp"]);
            }
            if(Boolean(_loc4_["pl"]) && _loc4_["pl"] != "")
            {
               _loc5_.pearls = int(_loc4_["pl"]);
            }
            if(Boolean(_loc4_["zd"]) && _loc4_["zd"] != "")
            {
               _loc5_.zooDollars = int(_loc4_["zd"]);
            }
            if(Boolean(_loc4_["col"]) && _loc4_["col"] != "")
            {
               _loc5_.collectablePacks = new Vector.<ItemPackVO>();
               _loc6_ = new ItemPackVO();
               _loc6_.category = Categories.COLLECTIBLE;
               _loc6_.itemId = _loc4_["col"]["id"];
               _loc6_.count = _loc4_["col"]["amount"];
               _loc5_.collectablePacks.push(_loc6_);
            }
            if(Boolean(_loc4_["eCol"]) && _loc4_["eCol"] != "")
            {
               _loc5_.eventCollectablePacks = new Vector.<ItemPackVO>();
               _loc7_ = new ItemPackVO();
               _loc7_.category = Categories.COLLECTIBLE;
               _loc7_.itemId = _loc4_["eCol"]["id"];
               _loc7_.count = _loc4_["eCol"]["amount"];
               _loc5_.eventCollectablePacks.push(_loc7_);
            }
            if(Boolean(_loc4_["eItem"]) && _loc4_["eItem"] != "")
            {
               _loc5_.eventItemPacks = new Vector.<ItemPackVO>();
               _loc8_ = new ItemPackVO();
               _loc8_.category = Categories.COLLECTIBLE;
               _loc8_.itemId = _loc4_["eItem"]["id"];
               _loc8_.count = _loc4_["eItem"]["amount"];
               _loc5_.eventItemPacks.push(_loc8_);
            }
            switch(_loc3_)
            {
               case "fe":
                  param1.feedDrop = _loc5_;
                  break;
               case "sf":
                  param1.superFeedDrop = _loc5_;
                  break;
               case "pf":
                  param1.powerFeedDrop = _loc5_;
                  break;
               case "wa":
                  param1.waterDrop = _loc5_;
                  break;
               case "cl":
                  param1.cleanDrop = _loc5_;
                  break;
               case "cu":
                  param1.cuddleDrop = _loc5_;
                  break;
               case "hl":
                  param1.healDrop = _loc5_;
                  break;
               case "sh":
                  param1.superHealDrop = _loc5_;
                  break;
               case "eb":
                  param1.breadDrop = _loc5_;
                  break;
               case "db":
                  param1.superBreadDrop = _loc5_;
                  break;
            }
         }
      }
      
      private function parsePlayfieldItemDecorations(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var decoVO:DecorData = null;
         var decoData:Object = null;
         var decoAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            for(itemId in fieldData)
            {
               decoVO = new DecorData();
               decoData = fieldData[itemId];
               for(decoAttributeName in decoData)
               {
                  try
                  {
                     decoVO.uniqueId = int(itemId);
                     decoVO[decoAttributeName] = decoData[decoAttributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemDecorations()" + error);
                  }
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_DECO_PARSED,{
                     "deco":decoVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_DECORATIONS,decoVO);
               }
            }
         }
      }
      
      private function parsePlayfieldItemMaterials(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var decoVO:DecorData = null;
         var decoData:Object = null;
         var decoAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            for(itemId in fieldData)
            {
               decoVO = new DecorData();
               decoData = fieldData[itemId];
               for(decoAttributeName in decoData)
               {
                  try
                  {
                     decoVO.uniqueId = int(itemId);
                     decoVO[decoAttributeName] = decoData[decoAttributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemDecorations()" + error);
                  }
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_MATERIAL_PARSED,{
                     "deco":decoVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_DECORATIONS,decoVO);
               }
            }
         }
      }
      
      private function parsePlayfieldItemRoads(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var roadVO:RoadData = null;
         var roadData:Object = null;
         var roadAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            for(itemId in fieldData)
            {
               roadVO = new RoadData();
               roadData = fieldData[itemId];
               for(roadAttributeName in roadData)
               {
                  try
                  {
                     roadVO.uniqueId = int(itemId);
                     roadVO[roadAttributeName] = roadData[roadAttributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemDecorations()" + error);
                  }
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_ROAD_PARSED,{
                     "road":roadVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_ROADS,roadVO);
               }
            }
         }
      }
      
      private function parsePlayfieldItemStores(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var storeVO:StoreData = null;
         var storeData:Object = null;
         var storeAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            for(itemId in fieldData)
            {
               storeVO = new StoreData();
               storeData = fieldData[itemId];
               for(storeAttributeName in storeData)
               {
                  try
                  {
                     storeVO.uniqueId = int(itemId);
                     storeVO[storeAttributeName] = storeData[storeAttributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemDecorations()" + error);
                  }
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_STORE_PARSED,{
                     "store":storeVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_STORES,storeVO);
               }
            }
         }
      }
      
      private function parsePlayfieldItemSpecials(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         for(_loc3_ in param1)
         {
            _loc4_ = param1[_loc3_];
            for(_loc5_ in _loc4_)
            {
               _loc6_ = int(param1[_loc3_][_loc5_]["sbId"]);
               switch(_loc6_)
               {
                  case MainConstants.SPECIAL_BREEDING_LAB:
                     this.parseBreedingLab(int(_loc3_),int(_loc5_),_loc6_,_loc4_[_loc5_],param2);
                     break;
                  case MainConstants.SPECIAL_NURSERY:
                     this.parseNursery(int(_loc3_),int(_loc5_),_loc6_,_loc4_[_loc5_],param2);
                     break;
               }
            }
         }
      }
      
      private function parseBreedingLab(param1:int, param2:int, param3:int, param4:Object, param5:Boolean) : void
      {
         var _loc6_:BreedingLabVO = new BreedingLabVO();
         ObjectHelper.copyData(_loc6_,param4);
         _loc6_.itemId = param3;
         if(!param5)
         {
            sendNotification(PLAYFIELD.PF_BREEDING_LAB_PARSED,{
               "breedingLab":_loc6_,
               "fieldId":param1
            });
         }
         else if(param1 == this.badlyHackedInVariable)
         {
            sendNotification(ResponseName.NEIGHBOUR_BREEDING_LAB,_loc6_);
         }
      }
      
      private function parseNursery(param1:int, param2:int, param3:int, param4:Object, param5:Boolean) : void
      {
         var _loc6_:NurseryVO = new NurseryVO();
         ObjectHelper.copyData(_loc6_,param4);
         _loc6_.itemId = param3;
         if(!param5)
         {
            sendNotification(PLAYFIELD.PF_NURSERY_PARSED,{
               "nursery":_loc6_,
               "fieldId":param1
            });
         }
         else if(param1 == this.badlyHackedInVariable)
         {
            sendNotification(ResponseName.NEIGHBOUR_NURSERY,_loc6_);
         }
      }
      
      private function parsePlayfieldItemTrashbins(param1:Object, param2:Boolean = false) : void
      {
         var fieldId:String = null;
         var fieldData:Object = null;
         var itemId:String = null;
         var trashbinVO:TrashBinData = null;
         var trashbinData:Object = null;
         var trashbinAttributeName:String = null;
         var data:Object = param1;
         var isNeighbour:Boolean = param2;
         for(fieldId in data)
         {
            fieldData = data[fieldId];
            for(itemId in fieldData)
            {
               trashbinVO = new TrashBinData();
               trashbinData = fieldData[itemId];
               for(trashbinAttributeName in trashbinData)
               {
                  try
                  {
                     trashbinVO[trashbinAttributeName] = trashbinData[trashbinAttributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parsePlayfieldItemDecorations()" + error);
                  }
               }
               if(!isNeighbour)
               {
                  sendNotification(PLAYFIELD.PF_TRASHBIN_PARSED,{
                     "trashbin":trashbinVO,
                     "fieldId":int(fieldId)
                  });
               }
               else if(int(fieldId) == this.badlyHackedInVariable)
               {
                  sendNotification(ResponseName.NEIGHBOUR_TRASHBINS,trashbinVO);
               }
            }
         }
      }
      
      private function parseNeighbourFieldSettings(param1:Object) : void
      {
         var _loc2_:PlayfieldSettingsVO = new PlayfieldSettingsVO();
         ObjectHelper.copyData(_loc2_,param1);
         sendNotification(Note.NEIGHBOUR_RENDER_FIELD,_loc2_);
      }
      
      private function parseResponsesStatusData(param1:Object) : void
      {
         var name:String = null;
         var responce:ResponceData = null;
         var responceData:Object = null;
         var attributeName:String = null;
         var data:Object = param1;
         var responces:Vector.<ResponceData> = new Vector.<ResponceData>();
         for(name in data)
         {
            responce = new ResponceData();
            responce.commandId = int(name);
            sendNotification(Note.COMMAND_ID_RESPONSE,responce.commandId);
            responceData = data[name];
            for(attributeName in responceData)
            {
               responce[attributeName] = responceData[attributeName];
            }
            responces.push(responce);
         }
         sendNotification(ResponseName.RESPONSES_STATUS,responces);
      }
      
      private function parsePlayfieldSettings(param1:Object) : void
      {
         var _loc2_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         _loc2_.parseFieldSettings(param1);
         _loc2_.recalculatePlayfieldsInfo();
      }
      
      private function parseEventData(param1:Object) : void
      {
         var _loc2_:EventDatas = new EventDatas(param1);
         sendNotification(ResponseName.EVENT_DATA,_loc2_);
      }
      
      private function parseUserEventData(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:UserEventVO = null;
         var _loc2_:UserEventProxy = facade.retrieveProxy(UserEventProxy.NAME) as UserEventProxy;
         for(_loc3_ in param1)
         {
            _loc4_ = new UserEventVO();
            if(param1[_loc3_].hasOwnProperty("evId"))
            {
               _loc4_.id = param1[_loc3_]["evId"];
            }
            else
            {
               _loc4_.id = int(_loc3_);
            }
            if(param1[_loc3_].hasOwnProperty("params"))
            {
               _loc4_.params = this.parseDinamicData(param1[_loc3_]["params"]);
            }
            _loc2_.storeUserEventData(_loc4_);
            sendNotification(ResponseName.USER_EVENT_DATA,_loc4_.id);
         }
      }
      
      private function parseQuestData(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            switch(_loc2_)
            {
               case ResponseName.QUEST_DAILY_DATA:
                  this.parseQuestsDaily(param1[_loc2_]);
                  break;
            }
         }
      }
      
      private function parseQuestsDaily(param1:Object) : void
      {
         var name:String = null;
         var dailyQuestVO:DailyQuestData = null;
         var questData:Object = null;
         var questAttributeName:String = null;
         var data:Object = param1;
         var dailyQuests:Vector.<DailyQuestData> = new Vector.<DailyQuestData>();
         var questsProxy:QuestsProxy = facade.retrieveProxy(QuestsProxy.NAME) as QuestsProxy;
         questsProxy.raw_server_data.push(data);
         for(name in data)
         {
            dailyQuestVO = new DailyQuestData();
            questData = data[name];
            for(questAttributeName in questData)
            {
               if(questAttributeName == "tasks")
               {
                  dailyQuestVO[questAttributeName] = this.parseDailyQuestTasksData(questData[questAttributeName]);
                  addr132:
                  continue;
               }
               if(questAttributeName == "reward")
               {
                  dailyQuestVO[questAttributeName] = this.parseDailyQuestRewardData(questData[questAttributeName]);
               }
               else
               {
                  dailyQuestVO[questAttributeName] = questData[questAttributeName];
               }
               §§goto(addr132);
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseQuestsDaily()" + this.§§slot[1]);
            }
            dailyQuests.push(dailyQuestVO);
         }
         questsProxy.handleDailyQuests(dailyQuests);
         sendNotification(ResponseName.QUEST_DAILY_DATA,dailyQuests);
      }
      
      private function parseDailyQuestTasksData(param1:Object) : Vector.<DailyQuestTaskData>
      {
         var taskData:Object = null;
         var dailyQuestTask:DailyQuestTaskData = null;
         var taskAttributeName:String = null;
         var data:Object = param1;
         var retVal:Vector.<DailyQuestTaskData> = new Vector.<DailyQuestTaskData>();
         var i:int = 0;
         while(i < data.length)
         {
            taskData = data[i];
            dailyQuestTask = new DailyQuestTaskData();
            for(taskAttributeName in taskData)
            {
               dailyQuestTask[taskAttributeName] = taskData[taskAttributeName];
            }
            retVal.push(dailyQuestTask);
            i++;
         }
         return retVal;
      }
      
      private function parseDailyQuestRewardData(param1:Object) : DailyQuestRewardData
      {
         var attributeName:String = null;
         var resourceData:Object = null;
         var resourceId:String = null;
         var data:Object = param1;
         var retVal:DailyQuestRewardData = new DailyQuestRewardData();
         for(attributeName in data)
         {
            try
            {
               if(attributeName == "resources")
               {
                  retVal.resources = new Vector.<int>();
                  resourceData = data[attributeName];
                  for(resourceId in resourceData)
                  {
                     if(resourceData[resourceId] > 0)
                     {
                        while(retVal.resources.length < int(resourceId))
                        {
                           retVal.resources.push(0);
                        }
                        retVal.resources[resourceId] = resourceData[resourceId];
                     }
                  }
               }
               else
               {
                  retVal[attributeName] = data[attributeName];
               }
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseDailyQuestRewardData()" + error);
            }
         }
         return retVal;
      }
      
      private function parseAllMailData(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            switch(_loc2_)
            {
               case ResponseName.MAIL_INBOX_DATA:
                  this.parseInbox(param1[_loc2_]);
                  break;
               case ResponseName.MAIL_OUTBOX_DATA:
                  this.parseOutbox(param1[_loc2_]);
                  break;
               case ResponseName.MAIL_UNREAD_DATA:
                  this.parseMailUnreadData(param1[_loc2_]);
                  break;
               case ResponseName.MAIL_UNREAD_STATUS_DATA:
                  this.parseMailUnreadStatusData(param1[_loc2_]);
                  break;
            }
         }
      }
      
      private function parseInbox(param1:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:UserMessagesProxy = null;
         var _loc7_:UserMessageVO = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for(_loc5_ in param1)
         {
            if(_loc5_ == "cnt")
            {
               _loc3_ = int(param1[_loc5_]);
            }
            else
            {
               _loc7_ = new UserMessageVO();
               ObjectHelper.copyData(_loc7_,param1[_loc5_]);
               _loc7_.inbox = true;
               if(_loc7_.status == 0)
               {
                  _loc4_++;
               }
               _loc2_.addItem(_loc7_);
            }
         }
         _loc6_ = facade.retrieveProxy(UserMessagesProxy.NAME) as UserMessagesProxy;
         _loc6_.setInboxUnreadCount(_loc4_);
         _loc6_.setInboxCount(_loc3_);
         _loc6_.setInbox(_loc2_);
      }
      
      private function parseOutbox(param1:Object) : void
      {
         var _loc4_:String = null;
         var _loc5_:UserMessagesProxy = null;
         var _loc6_:UserMessageVO = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:int = 0;
         for(_loc4_ in param1)
         {
            if(_loc4_ == "cnt")
            {
               _loc3_ = int(param1[_loc4_]);
            }
            else
            {
               _loc6_ = new UserMessageVO();
               ObjectHelper.copyData(_loc6_,param1[_loc4_]);
               _loc6_.inbox = false;
               _loc6_.status = 1;
               _loc2_.addItem(_loc6_);
            }
         }
         _loc5_ = facade.retrieveProxy(UserMessagesProxy.NAME) as UserMessagesProxy;
         _loc5_.setOutboxCount(_loc3_);
         _loc5_.setOutbox(_loc2_);
      }
      
      private function parseMailUnreadData(param1:Object) : void
      {
         var _loc2_:Boolean = param1 as Boolean;
         if(_loc2_)
         {
            sendNotification(GUINote.SHOW_COMMUNITY_HAS_MAIL);
         }
      }
      
      private function parseMailUnreadStatusData(param1:Object) : void
      {
         sendNotification(ResponseName.MAIL_UNREAD_STATUS_DATA);
      }
      
      private function parseRecyclingSlotData(param1:Object) : void
      {
         var recyclingItems:String = null;
         var recyclingProxy:RecyclingProxy = null;
         var recData:Object = null;
         var recVO:RecyclingSlotDataVo = null;
         var attribute:String = null;
         var data:Object = param1;
         var recyclingSlotDataVector:Vector.<RecyclingSlotDataVo> = new Vector.<RecyclingSlotDataVo>();
         for(recyclingItems in data)
         {
            recData = data[recyclingItems];
            recVO = new RecyclingSlotDataVo();
            for(attribute in recData)
            {
               recVO[attribute] = recData[attribute];
            }
            recyclingSlotDataVector.push(recVO);
         }
         recyclingProxy = facade.retrieveProxy(RecyclingProxy.NAME) as RecyclingProxy;
         recyclingProxy.storeRecyclingSlotData(recyclingSlotDataVector);
      }
      
      private function parseAchievementData(param1:Object) : void
      {
         var achievementItems:String = null;
         var achievementProxy:AchievementProxy = null;
         var achData:Object = null;
         var achVO:AchievementData = null;
         var attribute:String = null;
         var data:Object = param1;
         var achievementsVector:Vector.<AchievementData> = new Vector.<AchievementData>();
         for(achievementItems in data)
         {
            achData = data[achievementItems];
            achVO = new AchievementData();
            for(attribute in achData)
            {
               achVO[attribute] = achData[attribute];
            }
            achievementsVector.push(achVO);
         }
         achievementProxy = facade.retrieveProxy(AchievementProxy.NAME) as AchievementProxy;
         achievementProxy.storeAchievementData(achievementsVector);
      }
      
      private function parseAchievementComplete(param1:Object) : void
      {
         var achievementItems:String = null;
         var achData:Object = null;
         var achVO:AchievementData = null;
         var attribute:String = null;
         var data:Object = param1;
         var achievementsVector:Vector.<AchievementData> = new Vector.<AchievementData>();
         for(achievementItems in data)
         {
            achData = data[achievementItems];
            achVO = new AchievementData();
            for(attribute in achData)
            {
               achVO[attribute] = achData[attribute];
            }
            achievementsVector.push(achVO);
         }
         sendNotification(ResponseName.ACHIEVEMENTS_COMPLETE,achievementsVector);
      }
      
      private function parseAchievementPuzzleCompleteData(param1:Object) : void
      {
         var attribute:String = null;
         var data:Object = param1;
         var reward:AchievementRewardsData = new AchievementRewardsData();
         for(attribute in data[0])
         {
            try
            {
               reward[attribute] = data[0][attribute];
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseAchievementPuzzleCompleteData()" + error);
            }
         }
         reward.level = data[1];
         sendNotification(ResponseName.ACHIEVEMENTS_PUZZLE_COMPLETE_DATA,reward);
      }
      
      private function parseItemDropHash(param1:Object) : void
      {
         sendNotification(ResponseName.ITEM_DROP_HASH,param1);
      }
      
      private function parseItemDropTimer(param1:Object) : void
      {
         sendNotification(ResponseName.ITEM_DROP_TIMER,param1);
      }
      
      private function parseNewsItems(param1:Object) : void
      {
         var _loc2_:NewsProxy = facade.retrieveProxy(NewsProxy.NAME) as NewsProxy;
         _loc2_.parseData(param1);
         sendNotification(ResponseName.NEWS,param1);
      }
      
      private function parseFortuneWheelData(param1:Object) : void
      {
         var attrib:String = null;
         var rewardData:Object = null;
         var rewardId:String = null;
         var possibleReward:FortuneWheelRewardVO = null;
         var wonReward:FortuneWheelRewardVO = null;
         var data:Object = param1;
         var fortuneWheelProxy:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         var wheelVO:FortuneWheelVO = new FortuneWheelVO();
         fortuneWheelProxy.logPHP(data);
         for(attrib in data)
         {
            try
            {
               if(attrib == "r")
               {
                  rewardData = data[attrib];
                  for(rewardId in rewardData)
                  {
                     possibleReward = new FortuneWheelRewardVO();
                     possibleReward.type = ItemTypeHelper.typeToCategory(rewardData[rewardId]["type"]);
                     possibleReward.id = int(rewardData[rewardId]["id"]);
                     possibleReward.cnt = int(rewardData[rewardId]["cnt"]);
                     wheelVO.possibleRewards.push(possibleReward);
                  }
               }
               else if(attrib == "p")
               {
                  wonReward = new FortuneWheelRewardVO();
                  wonReward.type = ItemTypeHelper.typeToCategory(data[attrib]["type"]);
                  wonReward.id = data[attrib]["id"];
                  wonReward.cnt = data[attrib]["cnt"];
                  wheelVO.wonReward = wonReward;
               }
               else
               {
                  wheelVO[attrib] = data[attrib];
               }
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseFortuneWheelData()" + error);
            }
         }
         sendNotification(Note.UPDATE_REWARD_DATA,wheelVO);
      }
      
      private function parseSafariConfigData(param1:Object) : void
      {
         var attributeName:String = null;
         var safariProxy:SafariProxy = null;
         var jokerIdAttribName:String = null;
         var jokerDataObject:Object = null;
         var jokerConfigData:SafariJokerConfigData = null;
         var jokerAttributeName:String = null;
         var regeonLevelObject:Object = null;
         var levelAtribName:String = null;
         var startingFuelObject:Object = null;
         var fuelAtribName:String = null;
         var fuelData:StartingFuelData = null;
         var data:Object = param1;
         var safariConfigData:SafariConfigData = new SafariConfigData();
         for(attributeName in data)
         {
            if(attributeName == "jokers")
            {
               for(jokerIdAttribName in data[attributeName])
               {
                  jokerDataObject = data[attributeName][jokerIdAttribName];
                  jokerConfigData = new SafariJokerConfigData();
                  for(jokerAttributeName in jokerDataObject)
                  {
                     jokerConfigData[jokerAttributeName] = jokerDataObject[jokerAttributeName];
                  }
                  safariConfigData.jokerConfig.push(jokerConfigData);
               }
            }
            else if(attributeName == "regionLevels")
            {
               safariConfigData.regionLevels = new Vector.<int>();
               safariConfigData.regionLevels.push(-1);
               regeonLevelObject = data[attributeName];
               for(levelAtribName in regeonLevelObject)
               {
                  safariConfigData.regionLevels.push(int(regeonLevelObject[levelAtribName]));
               }
            }
            else
            {
               if(attributeName != "startingFuel")
               {
                  try
                  {
                     safariConfigData[attributeName] = data[attributeName];
                  }
                  catch(error:Error)
                  {
                     sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseSafariConfigData()" + error);
                  }
                  continue;
               }
               safariConfigData.startingFuel = new Vector.<StartingFuelData>();
               startingFuelObject = data[attributeName];
               for(fuelAtribName in startingFuelObject)
               {
                  fuelData = new StartingFuelData();
                  fuelData.playerLevel = int(fuelAtribName);
                  fuelData.fuel = int(startingFuelObject[fuelAtribName]);
                  safariConfigData.startingFuel.push(fuelData);
               }
            }
         }
         safariProxy = facade.retrieveProxy(SafariProxy.NAME) as SafariProxy;
         safariProxy.config = safariConfigData;
         sendNotification(ResponseName.SAFARI_CONFIG_DATA,safariConfigData);
      }
      
      private function parseSafariStateData(param1:Object) : void
      {
         var attributeName:String = null;
         var safariProxy:SafariProxy = null;
         var r:int = 0;
         var c:int = 0;
         var mapTileObject:Object = null;
         var pamTileData:SafariTileData = null;
         var tileAtribname:String = null;
         var jokerAttribName:String = null;
         var data:Object = param1;
         var safariData:SafariData = new SafariData();
         for(attributeName in data)
         {
            try
            {
               if(attributeName == "map")
               {
                  if(data[attributeName])
                  {
                     safariData.map = new Vector.<Vector.<SafariTileData>>();
                     r = 0;
                     while(r < data[attributeName].length)
                     {
                        safariData.map.push(new Vector.<SafariTileData>());
                        c = 0;
                        while(c < data[attributeName][r].length)
                        {
                           safariData.map[r].push(new SafariTileData());
                           mapTileObject = data[attributeName][r][c];
                           pamTileData = safariData.map[r][c];
                           for(tileAtribname in mapTileObject)
                           {
                              pamTileData[tileAtribname] = mapTileObject[tileAtribname];
                           }
                           c++;
                        }
                        r++;
                     }
                  }
               }
               else if(attributeName == "j")
               {
                  if(data[attributeName])
                  {
                     safariData.jokers = new Vector.<int>();
                     for(jokerAttribName in data[attributeName])
                     {
                        safariData.jokers.push(data[attributeName][jokerAttribName]);
                     }
                  }
               }
               else if(attributeName == "r")
               {
                  safariData.revardData = new SafariRewardData();
                  safariData.revardData.type = data[attributeName]["type"];
                  safariData.revardData.id = data[attributeName]["id"];
                  safariData.revardData.count = data[attributeName]["cnt"];
               }
               else
               {
                  safariData[attributeName] = data[attributeName];
               }
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseSafariStateData()" + error);
            }
         }
         safariProxy = facade.retrieveProxy(SafariProxy.NAME) as SafariProxy;
         safariProxy.updateSafariData(safariData);
         sendNotification(ResponseName.SAFARI_DATA,safariData);
      }
      
      private function parseNeybourData(param1:Object) : void
      {
         var _loc2_:String = null;
         this.badlyHackedInVariable = param1["nfSet"]["fId"];
         for(_loc2_ in param1)
         {
            if(_loc2_ != ResponseName.NEYBOUR_USER_DATA)
            {
               if(_loc2_ == ResponseName.NEYBOUR_GAMEFIELD_SETTINGS)
               {
                  this.parseNeighbourFieldSettings(param1[_loc2_]);
               }
               else if(_loc2_ == ResponseName.NEYBOUR_FIELD_OBJECTS)
               {
                  this.parsePlayfieldItemsData(param1[_loc2_],true);
               }
            }
         }
      }
      
      private function parseToolbarReward(param1:Object) : void
      {
         var attrib:String = null;
         var rewardData:Object = null;
         var toolBarReward:RewardData = null;
         var data:Object = param1;
         for(attrib in data)
         {
            try
            {
               if(attrib == "r")
               {
                  rewardData = data[attrib];
                  toolBarReward = new RewardData();
                  toolBarReward.type = rewardData["type"];
                  toolBarReward.itemId = int(rewardData["id"]);
                  toolBarReward.count = int(rewardData["cnt"]);
               }
            }
            catch(error:Error)
            {
               sendNotification(Note.WARNING_REPORT,"ResponseParserCommand : parseToolbarReward()" + error);
            }
         }
         if(toolBarReward)
         {
            sendNotification(ResponseName.TOOL_BAR_REWORD,toolBarReward);
         }
      }
      
      private function parseRankListData(param1:Object) : void
      {
         var rankType:int = 0;
         var rankListVo:RankingListVO = null;
         var listData:Object = null;
         var attrib:String = null;
         var ranknigProxy:RanknigProxy = null;
         var ranknigWindowProxy:RanknigWindowProxy = null;
         var rankData:Object = null;
         var rankVo:RankingVO = null;
         var rankAttrib:String = null;
         var data:Object = param1;
         if(data["rankType"] != "null")
         {
            rankType = int(data["rankType"]);
            rankListVo = new RankingListVO();
            rankListVo.userScore = int(data["rankOwn"]);
            listData = data["list"];
            for(attrib in listData)
            {
               rankData = listData[attrib];
               rankVo = new RankingVO();
               for(rankAttrib in rankData)
               {
                  rankVo[rankAttrib] = rankData[rankAttrib];
               }
               rankListVo.list.push(rankVo);
            }
            ranknigProxy = facade.retrieveProxy(RanknigProxy.NAME) as RanknigProxy;
            ranknigProxy.setRanknigData(rankType,rankListVo);
            ranknigWindowProxy = facade.retrieveProxy(RanknigWindowProxy.NAME) as RanknigWindowProxy;
            ranknigWindowProxy.changeTabId(rankType);
         }
      }
      
      private function parseDinamicData(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc2_:Object = new Object();
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] is String || param1[_loc3_] is Number)
            {
               _loc2_[_loc3_] = param1[_loc3_];
            }
            else
            {
               _loc2_[_loc3_] = this.parseDinamicData(param1[_loc3_]);
            }
         }
         return _loc2_;
      }
      
      private function parseLoanObject(param1:Object) : void
      {
         var _loc4_:String = null;
         var _loc5_:LoanedItemVO = null;
         var _loc2_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         var _loc3_:Vector.<LoanedItemVO> = new Vector.<LoanedItemVO>();
         for(_loc4_ in param1)
         {
            _loc5_ = new LoanedItemVO();
            ObjectHelper.copyData(_loc5_,param1[_loc4_]);
            _loc3_.push(_loc5_);
         }
         if(_loc3_.length > 0)
         {
            _loc2_.addLoanedItems(_loc3_);
            sendNotification(Note.BABY_CARAVAN_LOAN_SUCCESS);
         }
      }
      
      private function parseActiveFieldId(param1:Object) : void
      {
         var _loc2_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         _loc2_.setPlayfieldTypeById(int(param1));
      }
   }
}

