package com.bigpoint.zoomumba.model.net.responceDataVo.quests
{
   public class AchievementData
   {
      public var itemId:int = -1;
      
      public var count:String = "none";
      
      public var level:int = -1;
      
      public var sCnt:int = 0;
      
      public var stages:Array;
      
      public var id:int;
      
      public function AchievementData()
      {
         super();
      }
      
      public function set aId(param1:int) : void
      {
         this.itemId = param1;
      }
      
      public function set cnt(param1:String) : void
      {
         this.count = param1;
      }
      
      public function set stage(param1:int) : void
      {
         this.level = param1;
      }
      
      public function set alias(param1:String) : void
      {
      }
      
      public function set action(param1:String) : void
      {
      }
      
      public function set type(param1:String) : void
      {
      }
      
      public function set tId(param1:int) : void
      {
      }
      
      public function set res(param1:String) : void
      {
      }
      
      public function toString() : String
      {
         return "AchievementData{" + "aId=" + this.itemId + " cnt=" + this.count + " stage=" + this.level + "}";
      }
   }
}

