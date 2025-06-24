package com.bigpoint.zoomumba.model.events.boardgame.vo
{
   public class BoardgameRewardVo
   {
      public var amount:Number;
      
      public var id:int;
      
      public var categorie:int;
      
      public var stepStr:String;
      
      public var type:String;
      
      public var displayId:int;
      
      public var progress:Number;
      
      public var state:String;
      
      public var putDropType:String;
      
      public var putDropId:uint;
      
      public var putAmount:uint;
      
      public function BoardgameRewardVo()
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

