package com.bigpoint.zoomumba.model.net.responceDataVo.quests
{
   public class AchievementRewardsData
   {
      public var virtualMoney:int = -1;
      
      public var realMoney:int = -1;
      
      public var experience:int = -1;
      
      public var stage:int = -1;
      
      public var storeId:int = -1;
      
      public var resources:Vector.<int> = new Vector.<int>();
      
      public function AchievementRewardsData()
      {
         super();
      }
      
      public function set cR(param1:int) : void
      {
         this.realMoney = param1;
      }
      
      public function set cV(param1:int) : void
      {
         this.virtualMoney = param1;
      }
      
      public function set xp(param1:int) : void
      {
         this.experience = param1;
      }
      
      public function set stId(param1:int) : void
      {
         this.storeId = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.stage = param1;
      }
      
      public function toString() : String
      {
         return "AchievementData{" + "cR=" + this.realMoney + " cV=" + this.virtualMoney + " xp=" + this.experience + "}";
      }
   }
}

