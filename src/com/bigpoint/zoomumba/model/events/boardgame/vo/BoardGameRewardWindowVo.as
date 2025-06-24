package com.bigpoint.zoomumba.model.events.boardgame.vo
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class BoardGameRewardWindowVo
   {
      public var rewardObject:ItemPackVO = new ItemPackVO();
      
      public function BoardGameRewardWindowVo(param1:int, param2:int)
      {
         super();
         this.rewardObject.category = param1;
         this.rewardObject.itemId = param2;
      }
   }
}

