package com.bigpoint.zoomumba.model.windows.info
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   
   public class SingleitemPackInfoInitParams
   {
      public var itemPack:ItemPackVO;
      
      public function SingleitemPackInfoInitParams(param1:ItemPackVO)
      {
         super();
         this.itemPack = param1;
      }
   }
}

