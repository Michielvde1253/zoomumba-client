package com.bigpoint.zoorama.core.feature.tutorials.managers
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   
   public class TutorialCompletionStatus
   {
      public function TutorialCompletionStatus()
      {
         super();
      }
      
      public static function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         TempGetterProxy.sendNotification(NET.TUTORIAL_STORE_STATS,[param1,param2,param3,param4]);
      }
   }
}

