package com.bigpoint.zoorama.notices.view.field
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class VisitorNotice extends Notice
   {
      public static const WALK_ONE_CELL_END:String = "walkOneCellActionDone";
      
      public var visitorUniqueId:int = -1;
      
      public function VisitorNotice(param1:String, param2:int)
      {
         this.visitorUniqueId = param2;
         super(param1);
      }
   }
}

