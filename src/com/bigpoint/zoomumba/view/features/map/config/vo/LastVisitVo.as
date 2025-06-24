package com.bigpoint.zoomumba.view.features.map.config.vo
{
   public class LastVisitVo
   {
      public var lastAppMode:String;
      
      public var lastPlayfieldId:int;
      
      public function LastVisitVo(param1:String, param2:int)
      {
         super();
         this.lastAppMode = param1;
         this.lastPlayfieldId = param2;
      }
   }
}

