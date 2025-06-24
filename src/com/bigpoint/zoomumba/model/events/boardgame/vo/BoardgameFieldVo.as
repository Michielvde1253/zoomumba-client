package com.bigpoint.zoomumba.model.events.boardgame.vo
{
   public class BoardgameFieldVo
   {
      public var putAmount:uint = 0;
      
      public var putDropId:uint = 0;
      
      public var progress:uint = 0;
      
      public var setAmount:uint = 0;
      
      public var putDropType:String = "";
      
      public var stepStr:String;
      
      public var state:String = "";
      
      public var rewards:Vector.<BoardgameRewardVo>;
      
      public var instantBuyReal:int = 0;
      
      public function BoardgameFieldVo()
      {
         super();
      }
      
      public function get step() : int
      {
         if(this.stepStr == null)
         {
            return -1;
         }
         return parseInt(this.stepStr.substring(this.stepStr.indexOf("_") + 1,this.stepStr.length));
      }
      
      public function get route() : int
      {
         if(this.stepStr == null)
         {
            return -1;
         }
         return parseInt(this.stepStr.substring(0,this.stepStr.indexOf("_")));
      }
   }
}

