package com.bigpoint.zoomumba.model.windows.quests
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.DailyQuestRewardData;
   
   public class QuestRewordWindowInitParams
   {
      public var rewordData:DailyQuestRewardData;
      
      public function QuestRewordWindowInitParams(param1:DailyQuestRewardData)
      {
         super();
         this.rewordData = param1;
      }
   }
}

