package com.bigpoint.zoomumba.model.windows.events.valentines
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class ValentinesWindowInitParams
   {
      public var rewardObject:ItemPackVO = new ItemPackVO();
      
      public function ValentinesWindowInitParams(param1:int, param2:int)
      {
         super();
         this.rewardObject.category = param1;
         this.rewardObject.itemId = param2;
      }
   }
}

