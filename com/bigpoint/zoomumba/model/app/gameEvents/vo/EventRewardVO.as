package com.bigpoint.zoomumba.model.app.gameEvents.vo
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class EventRewardVO
   {
      public var categoryId:int;
      
      public var rewardId:int;
      
      public var itemId:int;
      
      public var itemIds:Array = new Array();
      
      public var amount:int;
      
      public var limit:int;
      
      public var currency:ItemPackVO = new ItemPackVO();
      
      public var counterId:int;
      
      public var unlockMin:int;
      
      public var unlockMax:int;
      
      public function EventRewardVO()
      {
         super();
      }
   }
}

