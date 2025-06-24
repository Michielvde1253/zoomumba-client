package com.bigpoint.zoomumba.model.windows.info
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class ItemToInventoryInfoInitParams
   {
      public var rewardPack:ItemPackVO;
      
      public function ItemToInventoryInfoInitParams(param1:ItemPackVO)
      {
         super();
         this.rewardPack = param1;
      }
   }
}

