package com.bigpoint.zoomumba.model.net.responceDataVo.quests
{
   public class DailyQuestRewardData
   {
      public var virtualMoney:int = -1;
      
      public var realMoney:int = -1;
      
      public var experience:int = -1;
      
      public var resources:Vector.<int> = null;
      
      public function DailyQuestRewardData()
      {
         super();
      }
      
      public function set currencyVirtual(param1:int) : void
      {
         this.virtualMoney = param1;
      }
      
      public function set currencyReal(param1:int) : void
      {
         this.realMoney = param1;
      }
      
      public function set xp(param1:int) : void
      {
         this.experience = param1;
      }
      
      public function toString() : String
      {
         return "[DailyQuestRewardData{" + "moneyVirtual=" + this.virtualMoney + " moneyReal=" + this.realMoney + " experience=" + this.experience + " resources=[" + this.resources + "]}";
      }
   }
}

