package com.bigpoint.zoomumba.model.net.responceDataVo.quests
{
   public class DailyQuestTaskData
   {
      public var questType:String = null;
      
      public var targetAll:int = -1;
      
      public var targetItemId:int = -1;
      
      public var targetCount:int = -1;
      
      public var actionName:String = null;
      
      public var oceanworld:int = 0;
      
      public function DailyQuestTaskData()
      {
         super();
      }
      
      public function set itemType(param1:String) : void
      {
         this.questType = param1;
      }
      
      public function set affectAll(param1:int) : void
      {
         this.targetAll = param1;
      }
      
      public function set itemId(param1:int) : void
      {
         this.targetItemId = param1;
      }
      
      public function set actionCount(param1:int) : void
      {
         this.targetCount = param1;
      }
      
      public function toString() : String
      {
         return "DailyQuestTaskData{" + "questType=" + this.questType + ", targetAll=" + this.targetAll + ", targetItemId=" + this.targetItemId + ", targetCount=" + this.targetCount + ", actionName=" + this.actionName + "]";
      }
   }
}

