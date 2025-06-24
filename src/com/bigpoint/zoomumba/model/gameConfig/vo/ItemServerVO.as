package com.bigpoint.zoomumba.model.gameConfig.vo
{
   public class ItemServerVO
   {
      public var type:String = null;
      
      public var id:int = -1;
      
      public var cnt:int = -1;
      
      public function ItemServerVO(param1:String = null, param2:int = -1, param3:int = -1)
      {
         super();
         this.type = param1;
         this.id = param2;
         this.cnt = param3;
      }
   }
}

