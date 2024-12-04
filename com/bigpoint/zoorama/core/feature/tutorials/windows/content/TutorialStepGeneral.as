package com.bigpoint.zoorama.core.feature.tutorials.windows.content
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.functions.AddBitmapItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.net.URLRequest;
   
   public class TutorialStepGeneral extends AbstractTutorialStep
   {
      private var stepGraphic:Sprite;
      
      private var _task1:Sprite;
      
      private var _task2:Sprite;
      
      private var _task3:Sprite;
      
      public function TutorialStepGeneral(param1:Notifier)
      {
         super();
         super.initStep(param1);
      }
      
      override public function setContent() : void
      {
         this.loadStepAssetSWF();
      }
      
      override internal function loadStepAssetPNG(param1:String) : void
      {
         var _loc2_:String = Settings.httpProtocolString + Settings.API_HOST + MainConfig.LOCALIZATION_TUTORIAL_PATH.split("$local$").join(Settings.LANGUAGE);
         _loc2_ += param1 + MainConfig.LOCALIZATION_TUTORIAL_FILEXTENSION;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         graphicLoader = new Loader();
         graphicLoader.load(_loc3_);
         this.stepGraphic.addChildAt(graphicLoader,0);
         if(super.step == TutorialReferences.TUTORIALSTEP_11)
         {
            graphicLoader.x = 131.5;
            graphicLoader.y = -6;
         }
      }
      
      override internal function handleGraphicLoadComplete() : void
      {
      }
      
      override internal function loadStepAssetSWF() : void
      {
         this.stepGraphic = AddAssetItem.addSpriteToContainer(this,AssetConfig["TUTORIALS_STEP" + super.step],"tutorialElements",135,165,false);
         this.stepGraphic.mouseEnabled = false;
         this.stepGraphic.mouseChildren = false;
         this.hideTaskCompleteIcons();
         if(super.step == TutorialReferences.TUTORIALSTEP_11)
         {
            this.loadStepAssetPNG("tutorial_step11_right");
         }
         else if(super.step == TutorialReferences.TUTORIALSTEP_12)
         {
            AddBitmapItem.addGradientBitmapToContainer(this.stepGraphic,"100",StyleModule.HEADER_BOLD_16,150,47);
            AddBitmapItem.addGradientBitmapToContainer(this.stepGraphic,"440",StyleModule.HEADER_BOLD_16,40,47);
         }
      }
      
      override public function set step(param1:int) : void
      {
         super.step = param1;
      }
      
      override internal function hideTaskCompleteIcons() : void
      {
         try
         {
            this._task1 = this.stepGraphic.getChildByName("mcTick_1") as Sprite;
            this._task1.visible = false;
         }
         catch(e:Error)
         {
         }
         try
         {
            this._task2 = this.stepGraphic.getChildByName("mcTick_2") as Sprite;
            this._task2.visible = false;
         }
         catch(e:Error)
         {
         }
         try
         {
            this._task3 = this.stepGraphic.getChildByName("mcTick_3") as Sprite;
            this._task3.visible = false;
         }
         catch(e:Error)
         {
         }
      }
      
      override public function task1Complete() : void
      {
         this._task1.visible = true;
      }
      
      override public function task2Complete() : void
      {
         if(this._task2)
         {
            this._task2.visible = true;
         }
      }
      
      override public function task3Complete() : void
      {
         this._task3.visible = true;
      }
   }
}

