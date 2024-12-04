package com.bigpoint.zoomumba.model.windows.browserBar
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class BrowserToolbarInitParams
   {
      public var rewardPack:ItemPackVO;
      
      public function BrowserToolbarInitParams(param1:ItemPackVO)
      {
         super();
         this.rewardPack = param1;
      }
   }
}

