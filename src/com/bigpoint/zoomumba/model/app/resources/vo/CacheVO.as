package com.bigpoint.zoomumba.model.app.resources.vo
{
   import flash.utils.ByteArray;
   
   public class CacheVO extends CvTagVO
   {
      public var data:ByteArray;
      
      public function CacheVO(param1:String, param2:String, param3:ByteArray)
      {
         super(param1,param2);
         this.data = param3;
      }
   }
}

