package com.bigpoint.zoomumba.model.events.boardgame.vo
{
   public class BoardgameVo
   {
      public var eventId:int;
      
      public var collect:Vector.<BoardgameCollVo>;
      
      public var rounds:Vector.<BoardgameRoundVo>;
      
      public var boardgameObj:BoardgameObjectVo;
      
      public function BoardgameVo()
      {
         super();
      }
   }
}

