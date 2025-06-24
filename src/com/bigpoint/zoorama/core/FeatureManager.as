package com.bigpoint.zoorama.core
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.core.feature.TutorialManager;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import flash.display.DisplayObjectContainer;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class FeatureManager extends Mediator
   {
      public static const NAME:String = "FeatureManager";
      
      private var notifier:Notifier;
      
      private var tutorialManager:TutorialManager;
      
      public function FeatureManager(param1:Notifier, param2:PlayFieldManager)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.tutorialManager = new TutorialManager(this.notifier,param2);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         facade.registerMediator(this.tutorialManager);
      }
      
      public function openTutorialWindow() : void
      {
         this.tutorialManager.openTutorialWindow();
      }
      
      public function tutorialHasBeenCompleted() : void
      {
         this.tutorialManager.handleTutorialCompletion();
      }
      
      public function tutorialHasBeenSkipped() : void
      {
         this.tutorialManager.handleTutorialSkipped();
      }
      
      public function setTutorialWindowButton(param1:DisplayObjectContainer) : void
      {
         this.tutorialManager.createCollapsableWindowButton(param1);
      }
      
      public function updateTutorialData(param1:int) : void
      {
         this.tutorialManager.activeStepId = param1;
         this.tutorialManager.handleTutorialStarted();
      }
      
      public function updateStepCompletionStatus(param1:int) : void
      {
         this.tutorialManager.activeStepId = param1;
         this.tutorialManager.handleStepCompletion(param1);
      }
      
      public function updateStepSkippedStatus(param1:int) : void
      {
         this.tutorialManager.activeStepId = param1;
         this.tutorialManager.handleSkipTutorialStep(param1);
      }
      
      public function updateMoveToNextStep(param1:int) : void
      {
         this.tutorialManager.activeStepId = param1;
         this.tutorialManager.handleMoveTopNextStep();
      }
      
      public function updateTaskCompletion(param1:int) : void
      {
         this.tutorialManager.handleTaskCompletion(param1);
      }
      
      public function openTutorialForSingleStep(param1:int) : void
      {
         this.tutorialManager.openSingleTutorialStep(param1);
      }
      
      public function closeTutorialAfterSingleStep() : void
      {
         this.tutorialManager.closeSingleTutorialStep();
      }
      
      public function minimiseTutorialWindow() : void
      {
         this.tutorialManager.deactivateWindow();
      }
      
      public function maximiseTutorialWindow() : void
      {
         this.tutorialManager.activateWindow();
      }
      
      public function handleHighlightCorrectSex(param1:TutorialNotices) : void
      {
         this.tutorialManager.handleHighlightCorrectSex(param1);
      }
      
      public function closeTutorialWindow() : void
      {
         this.tutorialManager.closeTutorialWindow();
      }
   }
}

