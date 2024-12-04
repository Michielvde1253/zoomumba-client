package com.bigpoint.zoomumba.model.events.ballonEvent.vo
{
   public class BallonEventVo
   {
      public var ballonsPerMinute:int;
      
      public var eventId:int;
      
      public var dartCount:int;
      
      public var ballonId:int;
      
      public var dartId:int;
      
      public var dropPack:Vector.<BoardgameDropPackVo>;
      
      public function BallonEventVo()
      {
         super();
      }
   }
}

