package com.bigpoint.zoorama.core.feature.tutorials.windows.content
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.btn.TutorialButtonController;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class TutorialStepStart extends AbstractTutorialStep
   {
      private var buttonStart:Sprite;
      
      private var buttonSkip:Sprite;
      
      public function TutorialStepStart(param1:Notifier)
      {
         super();
         super.initStep(param1);
      }
      
      override public function setContent() : void
      {
         super.setContent();
         this.addStartButtons();
      }
      
      private function addStartButtons() : void
      {
         this.buttonSkip = AddAssetItem.addSpriteToContainer(this,AssetConfig.COMMONS_BUTTON_FEMALE,"commons",195,200,true);
         this.buttonStart = AddAssetItem.addSpriteToContainer(this,AssetConfig.COMMONS_BUTTON_MALE,"commons",335,200,true);
         new TutorialButtonController(this.buttonSkip,true,this.handleSkipButtonClick,TextResourceModule.getText("zoo.window.general.skip"),null);
         new TutorialButtonController(this.buttonStart,true,this.handleStartButtonClick,TextResourceModule.getText("zoo.window.general.start"),null);
         AddAssetItem.addSpriteToContainer(this,AssetConfig.TUTORIALS_ASSET_STONE,"tutorialElements",195,200,true);
         AddAssetItem.addSpriteToContainer(this,AssetConfig.TUTORIALS_ASSET_PENGUIN,"tutorialElements",335,200,true);
      }
      
      public function handleSkipButtonClick(param1:MouseEvent) : void
      {
         super.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.TUTORIAL_SKIPPED,super.step));
      }
      
      public function handleStartButtonClick(param1:MouseEvent) : void
      {
         super.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.TUTORIAL_STARTED,super.step));
      }
      
      override public function set step(param1:int) : void
      {
         super.step = param1;
      }
   }
}

