package com.bigpoint.zoorama.notices.settings
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class KeyboardControllNotice extends Notice
   {
      public static const SPACE_KEY_ENABLE:String = "spaceKeyEnable";
      
      public static const SPACE_KEY_DISABLE:String = "spaceKeyDisable";
      
      public function KeyboardControllNotice(param1:String)
      {
         super(param1);
      }
   }
}

