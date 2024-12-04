package com.bigpoint.zoomumba.model.user.quests
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.gameConfig.FeatureConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestRewardData;
   import com.bigpoint.zoorama.view.gui.mainmenu.QuestButtonTypes;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class QuestsProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "QuestsProxy";
      
      private var notifier:Notifier;
      
      private var _dailyQuests:Vector.<DailyQuestData> = new Vector.<DailyQuestData>();
      
      private var _currentQuestId:int = -1;
      
      private var _currentTimer:int = -1;
      
      public var userNextDailyQuestTimestamp:Number;
      
      public var raw_server_data:Vector.<Object> = new Vector.<Object>();
      
      public var persistent_flash_data:Array = new Array();
      
      public function QuestsProxy()
      {
         super(NAME);
      }
      
      public function handleDailyQuests(param1:Vector.<DailyQuestData>) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:DailyQuestData = null;
         var _loc6_:int = 0;
         var _loc7_:DailyQuestData = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = false;
            _loc5_ = param1[_loc2_];
            _loc6_ = 0;
            while(_loc6_ < this._dailyQuests.length)
            {
               _loc7_ = this._dailyQuests[_loc6_];
               if(_loc5_.questId == _loc7_.questId)
               {
                  _loc4_ = true;
                  if(_loc5_.isDeleted)
                  {
                     this._dailyQuests.splice(_loc6_,1);
                  }
                  else
                  {
                     _loc7_.copyFrom(_loc5_);
                  }
               }
               _loc6_++;
            }
            if(!_loc4_)
            {
               this._dailyQuests.push(param1[_loc2_]);
            }
            _loc2_++;
         }
         this.checkQuestStatus();
         var _loc3_:Vector.<DailyQuestData> = this._dailyQuests.concat();
         this.persistent_flash_data.push(_loc3_);
         sendNotification(Note.DAILY_QUESTS_UPDATED);
      }
      
      private function checkQuestStatus() : void
      {
         var _loc1_:int = QuestButtonTypes.NORMAL;
         sendNotification(GUINote.SHOW_QUEST_NORMAL_STATE);
         var _loc2_:int = 0;
         while(_loc2_ < this._dailyQuests.length)
         {
            if(Boolean(this._dailyQuests[_loc2_].isDone) && _loc1_ != QuestButtonTypes.FAILED)
            {
               _loc1_ = QuestButtonTypes.FINISHED;
               sendNotification(GUINote.SHOW_QUEST_COMPLETE_DECO);
            }
            else if(Boolean(this._dailyQuests[_loc2_].isActive) && _loc1_ != QuestButtonTypes.FINISHED)
            {
               _loc1_ = QuestButtonTypes.ACTIVE;
               sendNotification(GUINote.SHOW_QUEST_IN_PROGRESS_DECO);
            }
            _loc2_++;
         }
      }
      
      public function get sendError() : Boolean
      {
         var _loc1_:FeatureConfigProxy = facade.retrieveProxy(FeatureConfigProxy.NAME) as FeatureConfigProxy;
         return _loc1_.questLogging;
      }
      
      public function removeOldData() : void
      {
         while(this._dailyQuests.length)
         {
            this._dailyQuests.pop();
         }
      }
      
      public function get dailyQuests() : Vector.<DailyQuestData>
      {
         return this._dailyQuests;
      }
      
      public function getQuestById(param1:int) : DailyQuestData
      {
         var _loc2_:DailyQuestData = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._dailyQuests.length)
         {
            if(this._dailyQuests[_loc3_].questId == param1)
            {
               _loc2_ = this._dailyQuests[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get questCount() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._dailyQuests.length)
         {
            if(!this._dailyQuests[_loc2_].isDeleted)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get activeQuestExists() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this._dailyQuests.length)
         {
            if(!this._dailyQuests[_loc2_].isDeleted && Boolean(this._dailyQuests[_loc2_].isActive))
            {
               _loc1_ = true;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get firstQuestId() : int
      {
         var _loc1_:int = -1;
         var _loc2_:int = 0;
         while(_loc2_ < this._dailyQuests.length)
         {
            if(!this._dailyQuests[_loc2_].isDeleted)
            {
               _loc1_ = this._dailyQuests[_loc2_].questId;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get activeQuestId() : int
      {
         var _loc1_:int = -1;
         var _loc2_:int = 0;
         while(_loc2_ < this._dailyQuests.length)
         {
            if(!this._dailyQuests[_loc2_].isDeleted && Boolean(this._dailyQuests[_loc2_].isActive))
            {
               _loc1_ = this._dailyQuests[_loc2_].questId;
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getQuestButtonIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._dailyQuests.length)
         {
            if(!this._dailyQuests[_loc3_].isDeleted)
            {
               if(this._dailyQuests[_loc3_].questId == param1)
               {
                  break;
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getRewardForQuest(param1:int) : DailyQuestRewardData
      {
         var _loc2_:DailyQuestRewardData = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._dailyQuests.length)
         {
            if(this._dailyQuests[_loc3_].questId == param1)
            {
               _loc2_ = this._dailyQuests[_loc3_].reward;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get currentQuestId() : int
      {
         return this._currentQuestId;
      }
      
      public function set currentQuestId(param1:int) : void
      {
         this._currentQuestId = param1;
      }
      
      public function get currentTimer() : int
      {
         return this._currentTimer;
      }
      
      public function set currentTimer(param1:int) : void
      {
         this._currentTimer = param1;
      }
   }
}

