package com.bigpoint.zoomumba.model.events.boardgame.vo
{
   public class BoardgameObjectVo
   {
      public var rewards:Vector.<BoardgameRewardVo>;
      
      public var round:uint = 0;
      
      public var stepStr:String;
      
      public var progress:uint;
      
      public var uid:uint;
      
      public var progressAmount:uint = 0;
      
      public var instantBuyReal:int = 0;
      
      public var lastRewardStepStr:String = "";
      
      public function BoardgameObjectVo()
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

