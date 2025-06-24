package com.bigpoint.zoorama.notices.user
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class AssistanceNotice extends Notice
   {
      public static const REFUSE_RENEW_ASSIST_CANTRACT:String = "refuseRenewAssistCantract";
      
      public var assistanceId:int;
      
      public function AssistanceNotice(param1:String, param2:int = -1)
      {
         this.assistanceId = param2;
         super(param1);
      }
   }
}

