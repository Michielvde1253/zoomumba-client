package com.bigpoint.zoorama.core.feature.tutorials.notices
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class TutorialLevelNotice extends Notice
   {
      public static const CHECK_LEVEL_FOR_TUTORIAL:String = "CheckLevelForTutorial";
      
      public function TutorialLevelNotice(param1:String)
      {
         super(param1);
      }
      
      public function toString() : String
      {
         return "TutorialLevelNotice{" + "type:" + type + "}";
      }
   }
}

