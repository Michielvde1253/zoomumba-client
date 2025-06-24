package com.bigpoint.zoomumba.view.windows.quests
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.ErrorTypes;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestRewardData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestTaskData;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.quests.QuestsProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.model.windows.quests.QuestRewordWindowInitParams;
   import com.bigpoint.zoomumba.view.windows.quests.components.TaskItemComponentWrapper;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.BitmapData;
   import mx.utils.ObjectUtil;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.questsWindow.DailyQuestsTabContent;
   import windows.custom.questsWindow.components.QuestItemButton;
   import windows.custom.questsWindow.components.RewardItemComponent;
   import windows.custom.questsWindow.components.TaskItemsComponent;
   import windows.events.QuestWindowEvents;
   
   public class DailyQuestsTabMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "DailyQuestsTabMediator";
      
      private static const QUEST_BUTTON_GAP:int = 71;
      
      private static const TIME_24_H:Number = 86399;
      
      private var questProxy:QuestsProxy;
      
      private var userProxy:UserProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var CURRENT_TIME_LIMITER:int = 86399;
      
      private var errorReportObject:Object;
      
      public function DailyQuestsTabMediator(param1:DailyQuestsTabContent)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.DAILY_QUESTS_UPDATED,Note.DAILY_QUESTS_RENEW,Note.STOP_ACTIVE_QUEST];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.DAILY_QUESTS_UPDATED:
               this.updateView();
               break;
            case Note.DAILY_QUESTS_RENEW:
               this.renewQuests();
               break;
            case Note.STOP_ACTIVE_QUEST:
               this.cancelActiveQuest(param1.getBody() as int);
         }
      }
      
      private function updateView() : void
      {
         this.clearMainContainers();
         try
         {
            this.drawQuestButtons();
         }
         catch(error:Error)
         {
            errorReportObject = new Object();
            errorReportObject.failureType = ErrorTypes.DAILY_QUESTS_DRAW_BUTTONS;
            errorReportObject.userId = userProxy.userId;
            errorReportObject.nextRefresh = questProxy.userNextDailyQuestTimestamp;
            errorReportObject.flashMessage = error.message;
            errorReportObject.raw_data = questProxy.raw_server_data;
            errorReportObject.phpQuestData = questProxy.persistent_flash_data;
            reportError();
            return;
         }
         try
         {
            this.selectAQuest();
         }
         catch(error:Error)
         {
            errorReportObject = new Object();
            errorReportObject.failureType = ErrorTypes.DAILY_QUESTS_SELECT_QUEST;
            errorReportObject.userId = userProxy.userId;
            errorReportObject.nextRefresh = questProxy.userNextDailyQuestTimestamp;
            errorReportObject.flashMessage = error.message;
            errorReportObject.raw_data = questProxy.raw_server_data;
            errorReportObject.phpQuestData = questProxy.persistent_flash_data;
            reportError();
            return;
         }
         try
         {
            this.toggleMainButtonState(this.questProxy.currentQuestId);
         }
         catch(error:Error)
         {
            errorReportObject = new Object();
            errorReportObject.failureType = ErrorTypes.DAILY_QUESTS_TOGGLE_BUTTON_STATE;
            errorReportObject.userId = userProxy.userId;
            errorReportObject.nextRefresh = questProxy.userNextDailyQuestTimestamp;
            errorReportObject.flashMessage = error.message;
            errorReportObject.raw_data = questProxy.raw_server_data;
            errorReportObject.phpQuestData = questProxy.persistent_flash_data;
            reportError();
            return;
         }
         this.registerTimeTrack();
         sendNotification(Note.QUESTS_WINDOW_TAB_LOADED);
      }
      
      private function reportError() : void
      {
         this.disableWindow();
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.badData.dailyQuests.title"),TextResourceModule.getText("zoo.error.badData.dailyQuests.text"))));
         if(this.questProxy.sendError)
         {
            sendNotification(NET.LOG_FLASH_ERROR,[ObjectUtil.toString(this.errorReportObject)]);
         }
      }
      
      private function clearMainContainers() : void
      {
         this.dailyQuestsTab.taskItemsContainer.removeAllElements();
         this.dailyQuestsTab.rewardsItemsContainer.removeAllElements();
      }
      
      private function disableWindow() : void
      {
         this.stopTick();
         this.clearMainContainers();
         this.dailyQuestsTab.renewQuests.visible = false;
         this.dailyQuestsTab.dailyQuestButtonContainer.removeAllElements();
         this.dailyQuestsTab.dailyQuestButton.visible = false;
         this.dailyQuestsTab.newQuestsTimeoutCounter.visible = false;
         this.dailyQuestsTab.selectionFrame.visible = false;
      }
      
      private function selectAQuest() : void
      {
         if(this.questProxy.questCount > 0)
         {
            if(this.questProxy.activeQuestExists)
            {
               this.showQuestDetails(this.questProxy.activeQuestId);
            }
            else
            {
               this.showQuestDetails(this.questProxy.firstQuestId);
            }
         }
      }
      
      private function drawQuestButtons() : void
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         var _loc3_:QuestItemButton = null;
         if(this.questProxy.questCount > 5)
         {
            this.refreshQuests();
         }
         else
         {
            this.dailyQuestsTab.dailyQuestButtonContainer.removeAllElements();
            _loc1_ = 0;
            while(_loc1_ < this.data.length)
            {
               if(!this.data[_loc1_].isDeleted)
               {
                  _loc2_ = "QUEST";
                  if(this.data[_loc1_].isActive)
                  {
                     _loc2_ = "ACTIVE";
                  }
                  if(this.data[_loc1_].isDone)
                  {
                     _loc2_ = "DONE";
                  }
                  _loc3_ = new QuestItemButton();
                  _loc3_.bitmapContent = AssetLibrary.getBitmapData(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_TASK_ICON);
                  _loc3_.stars.source = AssetLibrary.getSprite(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_SPARKLES_SPR);
                  _loc3_.stars.visible = false;
                  if(this.data[_loc1_].isActive)
                  {
                     _loc3_.stars.visible = true;
                  }
                  if(this.questProxy.activeQuestExists && !this.data[_loc1_].isActive)
                  {
                     _loc3_.sepia = true;
                  }
                  _loc3_.width = 65;
                  _loc3_.questId = this.data[_loc1_].questId;
                  this.dailyQuestsTab.dailyQuestButtonContainer.addElement(_loc3_);
               }
               _loc1_++;
            }
            if(this.questProxy.questCount > 0)
            {
               this.dailyQuestsTab.selectionFrame.visible = true;
            }
            else
            {
               this.dailyQuestsTab.selectionFrame.visible = false;
            }
         }
      }
      
      override public function onRegister() : void
      {
         this.questProxy = facade.retrieveProxy(QuestsProxy.NAME) as QuestsProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.refreshQuests();
         this.dailyQuestsTab.background.source = AssetLibrary.getSprite(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_CONTENT_BACKGROUND);
         this.dailyQuestsTab.selectionFrame.source = AssetLibrary.getSprite(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_SELECTION_FRAME);
         var _loc1_:BitmapData = AssetLibrary.getBitmapData(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_REFRESH_TASK_ICON);
         this.dailyQuestsTab.renewQuests.isBitmapIcon = true;
         this.dailyQuestsTab.renewQuests.displayImg.paddingDisplayX = -4;
         this.dailyQuestsTab.renewQuests.displayImg.paddingDisplayY = -4;
         this.dailyQuestsTab.renewQuests.iconClass = AssetLibrary.getBitmapData(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_REFRESH_TASK_ICON);
         this.dailyQuestsTab.renewQuests.displayImg.currentState = "normal";
         this.dailyQuestsTab.newQuestsTimeoutTitle.text = TextResourceModule.getText("zoo.quests.daily.nextquest.timestamp");
         this.dailyQuestsTab.newQuestsTimeoutCounter.text = TextResourceModule.getText("zoo.quests.daily.nextquest.timestamp");
         this.dailyQuestsTab.mainQuestsInfo.text = TextResourceModule.getText("zoo.quests.daily.info");
         this.dailyQuestsTab.homeworkText.text = TextResourceModule.getText("zoo.quests.daily.taskTitle");
         this.dailyQuestsTab.rewardText.text = TextResourceModule.getText("zoo.quests.daily.rewardTitle");
         this.dailyQuestsTab.newQuestsTimeoutCounter.visible = false;
         this.addListeners();
      }
      
      override public function onRemove() : void
      {
         this.stopTick();
      }
      
      private function stopTick() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
      
      private function registerTimeTrack() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
         TimeManager.registerTickFunction(this.updateTimer);
      }
      
      private function updateTimer() : void
      {
         var _loc1_:Number = this.questProxy.userNextDailyQuestTimestamp - TimeManager.currentTime;
         if(_loc1_ > TIME_24_H)
         {
            _loc1_ = TIME_24_H;
         }
         if(_loc1_ > 0)
         {
            this.dailyQuestsTab.newQuestsTimeoutCounter.visible = true;
            this.dailyQuestsTab.newQuestsTimeoutCounter.text = StringHelper.convertTimestampToFormatedHoursMinutesSecondsString(_loc1_);
         }
         else
         {
            this.dailyQuestsTab.newQuestsTimeoutCounter.visible = false;
            this.stopTick();
            this.refreshQuests();
         }
      }
      
      private function refreshQuests() : void
      {
         this.questProxy.removeOldData();
         sendNotification(NET.GET_QUESTS);
      }
      
      private function renewQuests() : void
      {
         if(this.currencyProxy.realMoney >= 10)
         {
            this.questProxy.removeOldData();
            sendNotification(NET.BUY_NEW_QUESTS);
         }
         else
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
      }
      
      private function addListeners() : void
      {
         this.dailyQuestsTab.addEventListener(QuestWindowEvents.QUESTS_INFO_BUTTON_CLICK,this.handleQuestsInfoButtonClick);
         this.dailyQuestsTab.addEventListener(QuestWindowEvents.RENEW_QUESTS_BUTTON_CLICK,this.handleRenewQuests);
         this.dailyQuestsTab.addEventListener(QuestWindowEvents.QUEST_MAIN_BUTTON_CLICKED,this.handleMainButtonClick);
         this.dailyQuestsTab.dailyQuestButtonContainer.addEventListener(QuestWindowEvents.QUEST_ITEM_BUTTON_CLICKED,this.handleQuestButtonClick);
      }
      
      private function handleQuestButtonClick(param1:QuestWindowEvents) : void
      {
         var event:QuestWindowEvents = param1;
         try
         {
            this.showQuestDetails(event.questId);
            this.moveSelectionFrame(event.questId);
            this.toggleMainButtonState(event.questId);
         }
         catch(error:Error)
         {
            errorReportObject = new Object();
            errorReportObject.failureType = ErrorTypes.DAILY_QUESTS_SELECT_ONE_QUEST;
            errorReportObject.userId = userProxy.userId;
            errorReportObject.nextRefresh = questProxy.userNextDailyQuestTimestamp;
            errorReportObject.flashMessage = error.message;
            errorReportObject.raw_data = questProxy.raw_server_data;
            errorReportObject.phpQuestData = questProxy.persistent_flash_data;
            reportError();
            return;
         }
      }
      
      private function moveSelectionFrame(param1:int) : void
      {
         this.dailyQuestsTab.selectionFrame.x = QUEST_BUTTON_GAP * this.questProxy.getQuestButtonIndex(param1);
      }
      
      private function toggleMainButtonState(param1:int) : void
      {
         var _loc3_:String = null;
         if(this.questProxy.questCount > 0)
         {
            this.dailyQuestsTab.dailyQuestButton.visible = true;
         }
         else
         {
            this.dailyQuestsTab.dailyQuestButton.visible = false;
         }
         var _loc2_:DailyQuestData = this.questProxy.getQuestById(param1);
         if(_loc2_)
         {
            _loc3_ = TextResourceModule.getText("zoo.quests.daily.startQuestBtn");
            if(_loc2_.isActive)
            {
               _loc3_ = TextResourceModule.getText("zoo.quests.daily.abortQuestBtn");
            }
            if(_loc2_.isDone)
            {
               _loc3_ = TextResourceModule.getText("zoo.quests.daily.finishQuestBtn");
            }
            this.dailyQuestsTab.dailyQuestButton.label = _loc3_;
         }
      }
      
      private function showQuestDetails(param1:int) : void
      {
         var _loc2_:DailyQuestData = this.questProxy.getQuestById(param1);
         this.moveSelectionFrame(param1);
         this.questProxy.currentQuestId = param1;
         this.drawTasks(Vector.<DailyQuestTaskData>(_loc2_["tasks"]));
         this.drawRewards(DailyQuestRewardData(_loc2_["reward"]));
      }
      
      private function drawTasks(param1:Vector.<DailyQuestTaskData>) : void
      {
         var _loc3_:TaskItemsComponent = null;
         var _loc4_:String = null;
         var _loc5_:TaskItemComponentWrapper = null;
         this.dailyQuestsTab.taskItemsContainer.removeAllElements();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new TaskItemsComponent();
            this.dailyQuestsTab.taskItemsContainer.addElement(_loc3_);
            _loc3_.owicon.visible = param1[_loc2_].oceanworld == 1;
            _loc4_ = "";
            if(param1[_loc2_].actionName == "feed")
            {
               _loc4_ = "feed_" + ConfigurationModule.getInstance().getSpecieData(param1[_loc2_].targetItemId).foodId.toString();
               if(param1[_loc2_].targetAll)
               {
                  _loc4_ = "feed_all";
               }
            }
            else if(param1[_loc2_].actionName == "clean" || param1[_loc2_].actionName == "cuddle")
            {
               _loc4_ = param1[_loc2_].actionName + "_" + param1[_loc2_].oceanworld;
            }
            else
            {
               _loc4_ = param1[_loc2_].actionName;
            }
            if(param1[_loc2_].questType == "species")
            {
               if(param1[_loc2_].targetAll)
               {
                  _loc3_.targetContainer.addChild(AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ALL_ANIMALS_ICON));
                  _loc3_.targetContainer.scaleX = 1;
                  _loc3_.targetContainer.scaleY = 1;
               }
               else
               {
                  _loc3_.animalId = param1[_loc2_].targetItemId;
                  _loc5_ = new TaskItemComponentWrapper(AssetIds.getPreviewAssetId(Categories.ANIMAL,ConfigurationModule.getInstance().getMaleAnimalData(param1[_loc2_].targetItemId).animalId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,param1[_loc2_].targetItemId);
                  _loc3_.targetContainer.addChild(_loc5_);
               }
            }
            _loc3_.action = _loc4_;
            _loc3_.actionCount = param1[_loc2_].targetCount;
            _loc3_.taskDone.source = AssetLibrary.getSprite(AssetConfig.QUESTS_ASSET_FILE,AssetConfig.DAILY_QUEST_TASK_COMPLETE);
            _loc2_++;
         }
      }
      
      private function handleMainButtonClick(param1:QuestWindowEvents) : void
      {
         var _loc2_:int = this.questProxy.currentQuestId;
         if(!this.questProxy.getQuestById(_loc2_).isActive && !this.questProxy.getQuestById(_loc2_).isDone && !this.questProxy.getQuestById(_loc2_).isDeleted)
         {
            if(!this.questProxy.activeQuestExists)
            {
               sendNotification(NET.START_QUEST,[_loc2_]);
            }
            else if(this.questProxy.activeQuestId != _loc2_)
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.quests.daily.window.activequest.title"),TextResourceModule.getText("zoo.quests.daily.window.activequest.info"))));
            }
         }
         if(this.questProxy.getQuestById(_loc2_).isActive && !this.questProxy.getQuestById(_loc2_).isDone && !this.questProxy.getQuestById(_loc2_).isDeleted)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.quests.daily.window.abortquest.title"),TextResourceModule.getText("zoo.quests.daily.window.abortquest.info")),new WindowParams("",null,"",null,Note.STOP_ACTIVE_QUEST,_loc2_)));
         }
         if(Boolean(this.questProxy.getQuestById(_loc2_).isActive) && Boolean(this.questProxy.getQuestById(_loc2_).isDone) && !this.questProxy.getQuestById(_loc2_).isDeleted)
         {
            this.finishQuest(_loc2_);
         }
      }
      
      private function finishQuest(param1:int) : void
      {
         sendNotification(NET.FINISH_QUEST,[param1]);
         var _loc2_:DailyQuestRewardData = this.questProxy.getRewardForQuest(param1);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUEST_REWORD,"",new QuestRewordWindowInitParams(_loc2_)));
      }
      
      private function cancelActiveQuest(param1:int) : void
      {
         sendNotification(NET.CANCEL_QUEST,[param1]);
      }
      
      private function drawRewards(param1:DailyQuestRewardData) : void
      {
         var _loc3_:RewardItemComponent = null;
         var _loc4_:RewardItemComponent = null;
         var _loc5_:RewardItemComponent = null;
         var _loc6_:RewardItemComponent = null;
         this.dailyQuestsTab.rewardsItemsContainer.removeAllElements();
         if(param1.realMoney > 0)
         {
            _loc3_ = new RewardItemComponent();
            this.dailyQuestsTab.rewardsItemsContainer.addElement(_loc3_);
            _loc3_.amount = String(param1.realMoney);
            _loc3_.thumb.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.REAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         }
         if(param1.virtualMoney > 0)
         {
            _loc4_ = new RewardItemComponent();
            this.dailyQuestsTab.rewardsItemsContainer.addElement(_loc4_);
            _loc4_.amount = String(param1.virtualMoney);
            _loc4_.thumb.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.VIRTUAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         }
         if(param1.experience > 0)
         {
            _loc5_ = new RewardItemComponent();
            this.dailyQuestsTab.rewardsItemsContainer.addElement(_loc5_);
            _loc5_.amount = String(param1.experience);
            _loc5_.thumb.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.EXPERIENCE),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.resources.length)
         {
            if(param1.resources[_loc2_] > 0)
            {
               _loc6_ = new RewardItemComponent();
               this.dailyQuestsTab.rewardsItemsContainer.addElement(_loc6_);
               _loc6_.amount = String(param1.resources[_loc2_]);
               _loc6_.thumb.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,_loc2_),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
            }
            _loc2_++;
         }
      }
      
      private function handleQuestsInfoButtonClick(param1:QuestWindowEvents) : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUEST_EXAMPLE_INFO));
      }
      
      private function handleRenewQuests(param1:QuestWindowEvents) : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.quests.daily.refreshTitle"),TextResourceModule.getText("zoo.quests.daily.refreshQuestion"),10),new WindowParams("",null,"",null,Note.DAILY_QUESTS_RENEW,null)));
      }
      
      private function get dailyQuestsTab() : DailyQuestsTabContent
      {
         return this.viewComponent as DailyQuestsTabContent;
      }
      
      private function get data() : Vector.<DailyQuestData>
      {
         return this.questProxy.dailyQuests;
      }
   }
}

