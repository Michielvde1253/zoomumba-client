package com.bigpoint.zoomumba.model.net.responceDataVo.general
{
   public class ResourceData
   {
      public var resourceId:int = -1;
      
      public var count:int = -1;
      
      public var maxCount:int = -1;
      
      public function ResourceData()
      {
         super();
      }
      
      public function set id(param1:int) : void
      {
         this.resourceId = param1;
      }
      
      public function set cnt(param1:int) : void
      {
         this.count = param1;
      }
      
      public function set mCnt(param1:int) : void
      {
         this.maxCount = param1;
      }
      
      public function set uId(param1:int) : void
      {
      }
   }
}

