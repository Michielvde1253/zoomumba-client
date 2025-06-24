package com.bigpoint.zoorama.core.feature.tutorials.windows.content
{
   import com.bigpoint.utils.notificator.Notifier;
   import flash.display.Loader;
   import flash.display.Sprite;
   
   public class AbstractTutorialStep extends Sprite implements ITutorial
   {
      public var notifier:Notifier;
      
      private var stepId:int;
      
      public var graphicLoader:Loader;
      
      public function AbstractTutorialStep()
      {
         super();
      }
      
      public function initStep(param1:Notifier) : void
      {
         this.notifier = new Notifier(param1);
      }
      
      public function setContent() : void
      {
      }
      
      internal function loadStepAssetPNG(param1:String) : void
      {
      }
      
      internal function handleGraphicLoadComplete() : void
      {
      }
      
      internal function loadStepAssetSWF() : void
      {
      }
      
      internal function hideTaskCompleteIcons() : void
      {
      }
      
      public function task1Complete() : void
      {
      }
      
      public function task2Complete() : void
      {
      }
      
      public function task3Complete() : void
      {
      }
      
      public function set step(param1:int) : void
      {
         this.stepId = param1;
      }
      
      public function get step() : int
      {
         return this.stepId;
      }
   }
}

