package com.bigpoint.zoorama.notices.core
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class TypingKeyNotice extends Notice
   {
      public static const ENABLE:String = "enableTypingKeys";
      
      public static const DISABLE:String = "disabelTypingKeys";
      
      public function TypingKeyNotice(param1:String)
      {
         super(param1);
      }
   }
}

