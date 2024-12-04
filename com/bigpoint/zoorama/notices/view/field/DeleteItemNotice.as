package com.bigpoint.zoorama.notices.view.field
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class DeleteItemNotice extends Notice
   {
      public static const DELETE_ITEM:String = "fieldDeleteItemNotice";
      
      public var category:int;
      
      public var uniqueId:int;
      
      public function DeleteItemNotice(param1:String, param2:int, param3:int)
      {
         this.category = param2;
         this.uniqueId = param3;
         super(param1);
      }
   }
}

