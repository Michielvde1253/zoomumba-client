package com.bigpoint.zoorama.notices.view.field
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class RoadItemNotice extends Notice
   {
      public static const CLICK:String = "roadItemClick";
      
      public var categoryId:int = 14;
      
      public var typeId:int;
      
      public var uniqueId:int;
      
      public function RoadItemNotice(param1:String, param2:int, param3:int)
      {
         super(param1);
         this.typeId = param2;
         this.uniqueId = param3;
      }
   }
}

