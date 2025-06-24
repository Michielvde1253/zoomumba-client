package com.bigpoint.zoorama.core.feature.tutorials.notices
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class TutorialNotices extends Notice
   {
      public static const TUTORIAL_STARTED:String = "StartStep";
      
      public static const TUTORIAL_SKIPPED:String = "TutorialSkipped";
      
      public static const TUTORIAL_COMPLETED:String = "TutorialCompleted";
      
      public static const STEP_COMPLETED:String = "StepCompleted";
      
      public static const STEP_SKIPPED:String = "StepSkipped";
      
      public static const NEXT_STEP:String = "GotoNextStep";
      
      public static const TASK_COMPLETE:String = "CurrentTaskComplete";
      
      public static const MINIMISE_WINDOW:String = "MinimiseTutorialWindow";
      
      public static const MAXIMISE_WINDOW:String = "MaximiseTutorialWindow";
      
      public static const HIGHLIGHT_CORRECT_SEX:String = "HIGHLIGHT_CORRECT_SEX";
      
      public static const SHOP_ITEM_SELECTED:String = "SHOP_ITEM_SELECTED";
      
      public static const SHOP_WINDOW_CLOSED:String = "SHOP_WINDOW_CLOSED";
      
      public static const CLOSE_TUTORIAL_WINDOW:String = "CLOSE_TUTORIAL_WINDOW";
      
      public static const OPEN_WINDOW_SINGLE_STEP:String = "OPEN_WINDOW_SINGLE_STEP";
      
      public static const COMPLETE_SINGLE_STEP:String = "COMPLETE_SINGLE_STEP";
      
      public var Id:int = -1;
      
      public function TutorialNotices(param1:String, param2:int)
      {
         this.Id = param2;
         super(param1);
      }
      
      public function toString() : String
      {
         return "WindowNotice{" + "type:" + type + ", windowTypeId:" + this.Id + "}";
      }
   }
}

