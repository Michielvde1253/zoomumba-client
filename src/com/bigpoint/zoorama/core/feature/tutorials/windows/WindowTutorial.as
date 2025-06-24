package com.bigpoint.zoorama.core.feature.tutorials.windows
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.functions.AddBitmapItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialCompletionStatus;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.core.feature.tutorials.states.TutorialState;
   import com.bigpoint.zoorama.core.feature.tutorials.windows.content.AbstractTutorialStep;
   import com.bigpoint.zoorama.core.feature.tutorials.windows.content.TutorialTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.components.scrollpane.ScollPaneComponent;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.windows.WindowExpandable;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class WindowTutorial extends WindowExpandable
   {
      private var notifier:Notifier;
      
      private var windowState:TutorialState;
      
      private var outerContent:Sprite;
      
      private var bubble:Sprite;
      
      private var mainText:TextField;
      
      private var mainTitle:Bitmap;
      
      private var mainScrollPane:ScollPaneComponent;
      
      private var currentStep:int = -1;
      
      private var currentStepHintActive:Boolean = false;
      
      private var closeButtonActive:Boolean = true;
      
      private var skipTutorial:Sprite;
      
      private var buttonTick:Sprite;
      
      private var buttonNextStep:MovieClip;
      
      private var buttonStartTasks:SimpleButton;
      
      private var buttonNextActive:Boolean = false;
      
      private var currentTutorial:AbstractTutorialStep;
      
      private var currentStepComplete:Boolean = false;
      
      private var task1Complete:Boolean = false;
      
      private var task2Complete:Boolean = false;
      
      private var loaderIcon:Sprite;
      
      public function WindowTutorial(param1:Notifier)
      {
         super();
         this.notifier = new Notifier(param1);
         this._isPrimary = true;
         this.persistent = true;
      }
      
      override public function startWindow() : void
      {
         super.offsetX = 150;
         super.offsetY = -20;
         super.setWindowPosition();
      }
      
      private function setContent() : void
      {
         super.headerFileName = "header_tutorial_long";
         setHeader();
         this.setOuterContent();
         this.setInnerContent();
         setBelowContent();
         super.setModalVisibility("on");
         btClose.addEventListener(MouseEvent.ROLL_OUT,this.handleCloseRollOut);
         btClose.addEventListener(MouseEvent.ROLL_OVER,this.handleCloseRollOver);
      }
      
      override public function setOuterContent() : void
      {
         if(!this.outerContent)
         {
            this.outerContent = AddAssetItem.addSpriteToContainer(super.outer,AssetConfig.HEADER_TUTORIAL_WINDOW,AssetConfig.WINDOW_HEADERS,32,40,false);
            this.bubble = this.outerContent.getChildByName("mcBubble") as Sprite;
            this.mainTitle = AddBitmapItem.addGradientBitmapToContainer(this.bubble,TextResourceModule.getText("zoo.tutorial.title." + this.currentStep),StyleModule.HEADER_14,90,20);
            this.mainScrollPane = new ScollPaneComponent();
            this.mainScrollPane.setCoordinates(90,44);
            this.mainScrollPane.setPaneDimensions(250,60);
            this.mainText = createTextFieldItem.createNewTextField(0,0,250,10,true,true,"mainTextField",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_12_LEFT,3480321,this.mainScrollPane.target,false,"left","advanced");
            this.mainText.text = TextResourceModule.getText("zoo.tutorial.main." + this.currentStep);
            this.mainScrollPane.init();
            this.mainScrollPane.update();
            this.bubble.addChild(this.mainScrollPane);
         }
         setExpandableButton(AssetConfig.COMMONS_BUTTONINFO_PANEL,AssetConfig.COMMONS_BUTTONINFO_PANELUP,AssetConfig.ASSET_COMMONS_SYMBOLS);
         if(!this.skipTutorial)
         {
            this.skipTutorial = AddAssetItem.addSpriteToContainer(super.outer,AssetConfig.COMMONS_BUTTON_FASTFORWARD,AssetConfig.ASSET_COMMONS_SYMBOLS,390,272,false);
            this.skipTutorial.useHandCursor = true;
            this.skipTutorial.buttonMode = true;
            this.skipTutorial.mouseChildren = false;
            new SpriteButtonController(this.skipTutorial,true,this.handleSkipTutorialStep,null,TextResourceModule.getText("zoo.tooltip.tutorial.skipStep"));
         }
         if(!this.buttonStartTasks)
         {
            this.buttonStartTasks = AssetLibrary.getButton("tutorialElements",AssetConfig.COMMONS_OK_BTN) as SimpleButton;
            this.buttonStartTasks.x = 420;
            this.buttonStartTasks.y = 220;
            super.outer.addChild(this.buttonStartTasks);
            this.addRemoveOKButtonListener(true);
            this.buttonStartTasks.visible = false;
            this.enableDisableOKButton(false);
         }
         if(!this.buttonNextStep)
         {
            this.buttonNextStep = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ITEM_BIG_ARROW_ANIMATED_BTN) as MovieClip;
            this.buttonNextStep.x = 410;
            this.buttonNextStep.y = 220;
            this.buttonNextStep.buttonMode = true;
            this.buttonNextStep.useHandCursor = true;
            this.buttonNextStep.stop();
            super.outer.addChild(this.buttonNextStep);
            this.buttonNextStep.addEventListener(MouseEvent.CLICK,this.handleNextButtonClicked);
            this.buttonNextStep.addEventListener(MouseEvent.ROLL_OUT,this.handleNextButtonRoll);
            this.buttonNextStep.addEventListener(MouseEvent.ROLL_OVER,this.handleNextButtonRoll);
         }
         if(!this.buttonTick)
         {
            this.buttonTick = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_CONFIRMATION_BUTTON);
            this.buttonTick.x = 230;
            this.buttonTick.y = 270;
            super.outer.addChild(this.buttonTick);
            this.buttonTick.visible = false;
         }
         if(!this.loaderIcon)
         {
            this.loaderIcon = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_PRELOADER);
            this.loaderIcon.x = 250;
            this.loaderIcon.y = 150;
            this.loaderIcon.visible = false;
            super.outer.addChild(this.loaderIcon);
         }
      }
      
      override public function setInnerContent() : void
      {
      }
      
      override public function addCloseButton() : void
      {
         var _loc1_:Sprite = container.getChildByName("buttonClose") as Sprite;
         btClose = AssetLibrary.getSprite("components",AssetConfig.ASSET_WINDOW_MINIMISE);
         btClose.x = _loc1_.x;
         btClose.y = _loc1_.y;
         btClose.buttonMode = true;
         btClose.useHandCursor = true;
         container.removeChild(_loc1_);
         container.addChild(btClose);
         btClose.addEventListener(MouseEvent.MOUSE_DOWN,this.handleCloseClick);
      }
      
      protected function setStepContent() : void
      {
         if(this.currentTutorial)
         {
            super.outer.removeChild(this.currentTutorial);
            this.currentTutorial = null;
         }
         if(this.currentStep == TutorialReferences.TUTORIALSTEP_0)
         {
            this.currentTutorial = new TutorialTypes.TUTORIAL_START(this.notifier);
            this.currentTutorial.step = this.currentStep;
            this.enableDisableOKButton(false);
            this.enableDisableSkipButton(false);
            this.enableDisableNextButton(false);
            this.enableDisableCloseButton(false);
            openExpandButton.visible = false;
            closeExpandButton.visible = false;
         }
         else if(this.currentStep != TutorialReferences.TUTORIALSTEP_0 && this.currentStep != TutorialReferences.TUTORIALSTEP_11 && this.currentStep < TutorialReferences.TUTORIAL_MAXSTEPS)
         {
            this.currentTutorial = new TutorialTypes.TUTORIAL_GENERAL(this.notifier);
            this.currentTutorial.step = this.currentStep;
            this.enableDisableNextButton(false);
            this.enableDisableSkipButton(true);
            this.enableDisableOKButton(true);
            this.enableDisableCloseButton(true);
         }
         else if(this.currentStep == TutorialReferences.TUTORIALSTEP_11)
         {
            this.currentTutorial = new TutorialTypes.TUTORIAL_GENERAL(this.notifier);
            this.currentTutorial.step = this.currentStep;
            this.enableDisableCloseButton(true);
         }
         else if(this.currentStep == TutorialReferences.TUTORIALSTEP_12)
         {
            this.currentTutorial = new TutorialTypes.TUTORIAL_GENERAL(this.notifier);
            this.currentTutorial.step = this.currentStep;
            this.enableDisableCloseButton(false);
         }
         else if(this.currentStep > TutorialReferences.TUTORIAL_MAXSTEPS)
         {
            if(this.currentStep == 13)
            {
               TempGetterProxy.exitFullscreenMode();
            }
            this.currentTutorial = new TutorialTypes.TUTORIAL_GENERAL(this.notifier);
            this.currentTutorial.step = this.currentStep;
            this.enableDisableSkipButton(false);
            this.enableDisableCloseButton(false);
            this.enableDisableNextButton(true);
         }
         if(this.currentStep == TutorialReferences.TUTORIAL_MAXSTEPS)
         {
            this.enableConfirmationButton();
         }
         this.currentTutorial.setContent();
         super.outer.addChild(this.currentTutorial);
         if(this.currentStep == TutorialReferences.TUTORIALSTEP_11)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.STEP_COMPLETED,11));
            this.enableDisableNextButton(true);
         }
      }
      
      public function updateStepData() : void
      {
         if(this.mainTitle)
         {
            this.bubble.removeChild(this.mainTitle);
            this.mainTitle = AddBitmapItem.addGradientBitmapToContainer(this.bubble,TextResourceModule.getText("zoo.tutorial.title." + this.currentStep),StyleModule.HEADER_BOLD_12,90,25);
         }
         else
         {
            this.mainTitle = AddBitmapItem.addGradientBitmapToContainer(this.bubble,TextResourceModule.getText("zoo.tutorial.title." + this.currentStep),StyleModule.HEADER_BOLD_12,90,25);
         }
         if(this.mainText)
         {
            this.task1Complete = false;
            this.task2Complete = false;
            this.mainText.text = TextResourceModule.getText("zoo.tutorial.main." + this.currentStep);
            this.mainScrollPane.update();
         }
         hardClosePanel();
         if(this.currentStepHintActive)
         {
            expandablePanel.updateData(TextResourceModule.getText("zoo.tutorial.hint." + this.currentStep),AssetConfig["TUTORIALS_HINT" + this.currentStep]);
         }
         openExpandButton.visible = this.currentStepHintActive;
         this.setStepContent();
      }
      
      public function displaySuccessText() : void
      {
         if(this.mainTitle)
         {
            this.bubble.removeChild(this.mainTitle);
            this.mainTitle = AddBitmapItem.addGradientBitmapToContainer(this.bubble,TextResourceModule.getText("zoo.tutorial.success.title"),StyleModule.HEADER_BOLD_12,90,25);
         }
         if(this.mainText)
         {
            this.mainText.text = TextResourceModule.getText("zoo.tutorial.success.step." + this.currentStep);
            this.mainScrollPane.update();
         }
      }
      
      public function setWindowState(param1:TutorialState) : void
      {
         this.windowState = param1;
         this.currentStep = param1.currentStep;
         this.currentStepHintActive = param1.hasHint;
         if(!this.buttonNextStep)
         {
            this.setContent();
         }
         this.updateStepData();
      }
      
      public function updateTask(param1:int) : void
      {
         var _loc2_:int = int(TutorialReferences["TUTORIALSTEP_" + this.currentStep + "_TASKS"]);
         switch(param1)
         {
            case 1:
               this.currentTutorial.task1Complete();
               this.task1Complete = true;
               break;
            case 2:
               this.currentTutorial.task2Complete();
               this.task2Complete = true;
         }
         if(this.task1Complete && _loc2_ == 1)
         {
            this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.STEP_COMPLETED,this.currentStep));
            this.enableDisableCloseButton(false);
            this.enableDisableSkipButton(false);
            TutorialCompletionStatus.update(this.currentStep,1,1,0);
         }
         else if(this.task1Complete && this.task2Complete)
         {
            this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.STEP_COMPLETED,this.currentStep));
            this.enableDisableCloseButton(false);
            this.enableDisableSkipButton(false);
            TutorialCompletionStatus.update(this.currentStep,2,1,0);
         }
         else if(!this.task1Complete && this.task2Complete)
         {
            TutorialCompletionStatus.update(this.currentStep,2,0,0);
            this.enableDisableSkipButton(true);
         }
         else if(this.task1Complete && !this.task2Complete)
         {
            this.enableDisableSkipButton(true);
            TutorialCompletionStatus.update(this.currentStep,1,0,0);
         }
      }
      
      public function enableDisableSkipButton(param1:Boolean) : void
      {
         this.skipTutorial.visible = param1;
      }
      
      public function addRemoveOKButtonListener(param1:Boolean) : void
      {
         if(param1)
         {
            this.buttonStartTasks.addEventListener(MouseEvent.CLICK,this.handleCloseClick);
         }
         else
         {
            this.buttonStartTasks.removeEventListener(MouseEvent.CLICK,this.handleCloseClick);
         }
      }
      
      public function enableDisableOKButton(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.currentStep != 0)
            {
               this.buttonStartTasks.visible = true;
               this.addRemoveOKButtonListener(true);
            }
         }
         else
         {
            this.buttonStartTasks.visible = false;
         }
      }
      
      public function enableDisableNextButton(param1:Boolean) : void
      {
         if(param1)
         {
            this.buttonNextStep.visible = true;
            this.buttonNextStep.gotoAndStop(2);
         }
         else
         {
            this.buttonNextStep.visible = false;
         }
         this.buttonNextActive = param1;
      }
      
      private function enableConfirmationButton() : void
      {
         this.buttonTick.visible = true;
         new SpriteButtonController(this.buttonTick,true,this.handleConfirmationButtonClick,null,null,true);
      }
      
      public function enableDisableCloseButton(param1:Boolean) : void
      {
         switch(param1)
         {
            case true:
               TweenMax.to(btClose,0,{"colorMatrixFilter":{"saturation":1}});
               break;
            case false:
               TweenMax.to(btClose,0,{"colorMatrixFilter":{"saturation":0}});
         }
         this.closeButtonActive = param1;
      }
      
      private function handleSkipTutorialStep(param1:MouseEvent) : void
      {
         this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.STEP_SKIPPED,this.currentStep));
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_BUTTON_CLICK_1);
      }
      
      private function handleConfirmationButtonClick(param1:MouseEvent) : void
      {
         TutorialCompletionStatus.update(12,0,1,0);
         this.showHideLoaderIcon(true);
         this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.TUTORIAL_COMPLETED,this.currentStep));
         this.buttonTick.visible = false;
      }
      
      private function handleNextButtonClicked(param1:MouseEvent) : void
      {
         if(this.currentStep > TutorialReferences.TUTORIAL_MAXSTEPS)
         {
            this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.COMPLETE_SINGLE_STEP,this.currentStep));
         }
         else
         {
            if(this.buttonNextActive)
            {
               this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.NEXT_STEP,this.currentStep));
            }
            if(this.currentStep == TutorialReferences.TUTORIALSTEP_11)
            {
               this.enableDisableNextButton(true);
               TutorialCompletionStatus.update(11,1,1,0);
            }
            else
            {
               this.enableDisableNextButton(false);
            }
         }
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_BUTTON_CLICK_2);
      }
      
      private function handleNextButtonRoll(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case "rollOver":
               TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.tutorial.nextStep"),true);
               break;
            case "rollOut":
               TooltipNewManager.removeToolTip();
         }
      }
      
      override protected function handleCloseClick(param1:MouseEvent) : void
      {
         if(this.closeButtonActive)
         {
            if(!this.currentStepComplete)
            {
               this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.MINIMISE_WINDOW,this.currentStep));
            }
            else
            {
               this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.NEXT_STEP,this.currentStep));
            }
         }
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_BUTTON_CLICK_3);
         this.addRemoveOKButtonListener(false);
      }
      
      private function handleCloseRollOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleCloseRollOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(btClose as Sprite,TextResourceModule.getText("zoo.tooltip.tutorial.minimiseWindow"),true);
      }
      
      public function showHideLoaderIcon(param1:Boolean) : void
      {
         this.loaderIcon.visible = param1;
      }
      
      public function handleCloseWindow() : void
      {
         this.showHideLoaderIcon(false);
         WindowManagerNew.closeWindow(this);
      }
   }
}

