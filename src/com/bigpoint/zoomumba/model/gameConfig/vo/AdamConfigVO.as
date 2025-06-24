package com.bigpoint.zoomumba.model.gameConfig.vo
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class AdamConfigVO
   {
      public var packId:int = -1;
      
      public var items:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
      
      public function AdamConfigVO()
      {
         super();
      }
   }
}

