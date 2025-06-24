package com.bigpoint.zoomumba.model.net.responceDataVo.quests
{
   public class DailyQuestData
   {
      public var questId:int = -1;
      
      public var isActive:int = -1;
      
      public var isDone:int = -1;
      
      public var tasks:Vector.<DailyQuestTaskData> = null;
      
      public var reward:DailyQuestRewardData = null;
      
      public var isDeleted:int = 0;
      
      public function DailyQuestData()
      {
         super();
      }
      
      public function set active(param1:int) : void
      {
         this.isActive = param1;
      }
      
      public function set done(param1:int) : void
      {
         this.isDone = param1;
      }
      
      public function set qdId(param1:int) : void
      {
         this.questId = param1;
      }
      
      public function set del(param1:int) : void
      {
         this.isDeleted = param1;
      }
      
      public function set uId(param1:int) : void
      {
      }
      
      public function set endTime(param1:int) : void
      {
      }
      
      public function toString() : String
      {
         return "DailyQuestData{" + "questId:" + this.questId + ", isActive:" + this.isActive + ", isDone:" + this.isDone + ", tasks:[" + this.tasks + "], reward:" + this.reward + ", isDeleted:" + this.isDeleted + "}";
      }
      
      public function copyFrom(param1:DailyQuestData) : void
      {
         if(param1.isActive != -1)
         {
            this.isActive = param1.isActive;
         }
         if(param1.isDone != -1)
         {
            this.isDone = param1.isDone;
         }
         if(param1.tasks != null)
         {
            this.tasks = param1.tasks;
         }
         if(param1.reward != null)
         {
            this.reward = param1.reward;
         }
         if(param1.isDeleted != -1)
         {
            this.isDeleted = param1.isDeleted;
         }
      }
   }
}

