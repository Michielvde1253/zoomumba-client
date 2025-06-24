package com.bigpoint.zoomumba.model.features.dailyLogin.vo
{
   public class DailyLoginVo
   {
      public var countLogin:int;
      
      public var lastBooking:int;
      
      public var currentReward:DailyLoginRewardVo;
      
      public var rewards:Vector.<DailyLoginRewardVo>;
      
      public function DailyLoginVo()
      {
         super();
      }
   }
}

