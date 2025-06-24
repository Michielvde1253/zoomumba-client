package com.bigpoint.zoomumba.model.events.community.vo
{
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   
   public class CommunityEventVO
   {
      public var progress:int = 0;
      
      public var step:int = 0;
      
      public var rewards:Vector.<Vector.<CurrencyVO>>;
      
      public var hasRewards:Array = [];
      
      public var eventId:int;
      
      public function CommunityEventVO()
      {
         super();
      }
   }
}

