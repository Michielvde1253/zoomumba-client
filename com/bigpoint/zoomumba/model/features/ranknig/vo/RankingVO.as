package com.bigpoint.zoomumba.model.features.ranknig.vo
{
   public class RankingVO
   {
      public var rankNumber:int;
      
      public var userId:int;
      
      public var userName:String;
      
      public var score:int;
      
      public function RankingVO()
      {
         super();
      }
      
      public function set uId(param1:int) : void
      {
         this.userId = param1;
      }
      
      public function set uName(param1:String) : void
      {
         this.userName = param1;
      }
      
      public function set rType(param1:int) : void
      {
      }
      
      public function set rank(param1:int) : void
      {
         this.rankNumber = param1;
      }
   }
}

