package com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel
{
   public class RewardData
   {
      public var type:String;
      
      public var itemId:int;
      
      public var count:int;
      
      public function RewardData()
      {
         super();
      }
      
      public function toString() : String
      {
         return "[RewardData type=" + this.type + " itemId=" + this.itemId + " count=" + this.count + "]";
      }
   }
}

