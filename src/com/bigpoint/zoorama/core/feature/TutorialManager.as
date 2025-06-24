package com.bigpoint.zoorama.core.feature
{
   import com.bigpoint.utils.cookieModule.CookieModule;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialCompletionStatus;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialServerClone;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.core.feature.tutorials.states.TutorialState;
   import com.bigpoint.zoorama.core.feature.tutorials.windows.WindowTutorial;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.notices.gui.window.ConfirmationWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.objects.createTextFieldItem;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.bigpoint.zoorama.view.windows.WindowReferences;
   import com.greensock.TweenMax;
   import com.greensock.easing.Circ;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class TutorialManager extends Mediator
   {
      public static const NAME:String = "TutorialManager";
      
      private var notifier:Notifier;
      
      private var playFieldManager:PlayFieldManager;
      
      private var tutorialWindow:WindowTutorial;
      
      private var buttonCollapse:MovieClip;
      
      private var progressMeter:MovieClip;
      
      private var taskCompleteIcon:Sprite;
      
      private var currentStep:int = TutorialReferences.TUTORIALSTEP_1;
      
      private var currentStepHint:Boolean = false;
      
      private var currentStepNoTasks:int = 2;
      
      private var currentStepNoTasksComplete:int = 0;
      
      private var stepToSkip:int = -1;
      
      private var awardText:TextField;
      
      private var itemManager:TutorialInjectionManager;
      
      private var serverCloneManager:TutorialServerClone;
      
      private var isWindowActive:Boolean = false;
      
      private var _gameStage:DisplayObjectContainer;
      
      private var runningPenguin:MovieClip;
      
      public function TutorialManager(param1:Notifier, param2:PlayFieldManager)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.playFieldManager = param2;
         this.createItemManager();
         this.createServerClone();
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
      
      private function setUserStepData() : void
      {
         if(Settings.TUTORIAL_STEP < TutorialReferences.TUTORIAL_MAXSTEPS && Settings.TUTORIAL_STEP != -1)
         {
            this.currentStep = TutorialReferences["TUTORIALSTEP_" + Settings.TUTORIAL_STEP];
            this.currentStepHint = TutorialReferences["TUTORIALSTEP_" + Settings.TUTORIAL_STEP + "_HINT"];
            this.currentStepNoTasks = TutorialReferences["TUTORIALSTEP_" + Settings.TUTORIAL_STEP + "_TASKS"];
            this.startloopThroughStepJumps();
         }
      }
      
      private function createServerClone() : void
      {
         this.serverCloneManager = TutorialServerClone.getInstance();
         this.serverCloneManager.playFieldManager = this.playFieldManager;
      }
      
      private function createItemManager() : void
      {
         this.itemManager = TutorialInjectionManager.getInstance();
      }
      
      public function createCollapsableWindowButton(param1:DisplayObjectContainer) : void
      {
         this.buttonCollapse = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_TUTORIAL_COLLAPSE_WINDOW) as MovieClip;
         this._gameStage = param1;
         if(Settings.SCALE_TEST)
         {
            this.buttonCollapse.scaleX = 0.7;
            this.buttonCollapse.scaleY = 0.7;
            this.buttonCollapse.x = MainConfig.STAGE_WIDTH - 100;
            this.buttonCollapse.y = 100;
         }
         else
         {
            this.buttonCollapse.x = MainConfig.STAGE_WIDTH - 100;
            this.buttonCollapse.y = 140;
         }
         param1.addChild(this.buttonCollapse);
         this.buttonCollapse.addEventListener(MouseEvent.CLICK,this.activateWindow);
         this.buttonCollapse.addEventListener(MouseEvent.ROLL_OUT,this.handleMinimiseButtonRollOut);
         this.buttonCollapse.addEventListener(MouseEvent.ROLL_OVER,this.handleMinimiseButtonRollOver);
         this.buttonCollapse.buttonMode = true;
         this.buttonCollapse.useHandCursor = true;
         this.buttonCollapse.visible = false;
         this.progressMeter = this.buttonCollapse.getChildByName("mcTutorialStepRemain") as MovieClip;
         this.createTaskCompleteIcon(param1);
      }
      
      public function deactivateWindow(param1:MouseEvent = null) : void
      {
         var makeInvisible:Function = null;
         var xVal:Number = NaN;
         var e:MouseEvent = param1;
         makeInvisible = function():void
         {
            tutorialWindow.visible = false;
         };
         this.isWindowActive = false;
         this.tutorialWindow.makePanelVisible(false);
         TweenMax.to(this.tutorialWindow,0.3,{
            "alpha":0,
            "ease":Circ.easeInOut,
            "onComplete":makeInvisible
         });
         this.buttonCollapse.visible = true;
         this.buttonCollapse.alpha = 0;
         if(Settings.SCALE_TEST)
         {
            this.buttonCollapse.x = MainConfig.STAGE_WIDTH - 100;
            xVal = MainConfig.STAGE_WIDTH - 50;
         }
         else
         {
            this.buttonCollapse.x = MainConfig.STAGE_WIDTH - 100;
            xVal = MainConfig.STAGE_WIDTH - 50;
         }
         TweenMax.to(this.buttonCollapse,0.5,{
            "alpha":1,
            "x":xVal,
            "ease":Circ.easeInOut
         });
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_WINDOW_OPENS);
      }
      
      public function activateWindow(param1:MouseEvent = null) : void
      {
         var makePanelActive:Function = null;
         var e:MouseEvent = param1;
         makePanelActive = function():void
         {
            buttonCollapse.visible = false;
            tutorialWindow.makePanelVisible(true);
         };
         this.isWindowActive = true;
         TutorialInjectionManager.getInstance().guiInterfaceManager.closeAllWindowns();
         this.tutorialWindow.visible = true;
         this.tutorialWindow.alpha = 0;
         this.tutorialWindow.addRemoveOKButtonListener(true);
         TweenMax.to(this.tutorialWindow,0.5,{
            "alpha":1,
            "ease":Circ.easeInOut
         });
         TweenMax.to(this.buttonCollapse,0.5,{
            "alpha":0,
            "x":MainConfig.STAGE_WIDTH - 100,
            "ease":Circ.easeInOut,
            "onComplete":makePanelActive
         });
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_WINDOW_OPENS);
      }
      
      public function openTutorialWindow() : void
      {
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.DISABLE_ALL_KEYS);
         this.showTutorialWindow();
         if(!this.runningPenguin)
         {
            this.addRunningPenguin();
         }
      }
      
      private function showTutorialWindow() : void
      {
         this.setUserStepData();
         this.tutorialWindow = WindowManagerNew.openWindow(WindowReferences.WINDOW_TUTORIAL_CLASS,AssetConfig.ASSET_WINDOW_SMALLMEDIUM,[this.notifier],true,1) as WindowTutorial;
         this.dispatchDataToWindow();
      }
      
      public function closeTutorialWindow() : void
      {
         this.tutorialWindow.handleCloseWindow();
      }
      
      private function dispatchDataToWindow() : void
      {
         var _loc1_:TutorialState = new TutorialState();
         _loc1_.currentStep = this.currentStep;
         _loc1_.hasHint = this.currentStepHint;
         this.tutorialWindow.setWindowState(_loc1_);
      }
      
      public function startloopThroughStepJumps() : void
      {
         var _loc1_:int = 0;
         if(Settings.TUTORIAL_STEP > 0 && Settings.TUTORIAL_STEP < 13)
         {
            TutorialInjectionManager.getInstance().enableOverlay();
            TutorialInjectionManager.getInstance().enableItems([]);
            TutorialInjectionManager.getInstance().grayMenuButtons();
            TutorialInjectionManager.getInstance().setNextStep(1);
            this.serverCloneManager.initStage();
            _loc1_ = 1;
            while(_loc1_ < Settings.TUTORIAL_STEP)
            {
               if(_loc1_ == 1)
               {
                  this.progressMeter.gotoAndStop(10);
               }
               else if(_loc1_ == 2)
               {
                  this.progressMeter.gotoAndStop(19);
               }
               else if(_loc1_ == 3)
               {
                  this.progressMeter.gotoAndStop(28);
               }
               else if(_loc1_ == 4)
               {
                  this.progressMeter.gotoAndStop(37);
               }
               else if(_loc1_ == 5)
               {
                  this.progressMeter.gotoAndStop(44);
               }
               else if(_loc1_ == 6)
               {
                  this.progressMeter.gotoAndStop(56);
               }
               else if(_loc1_ == 7)
               {
                  this.progressMeter.gotoAndStop(68);
               }
               else if(_loc1_ == 8)
               {
                  this.progressMeter.gotoAndStop(76);
               }
               else if(_loc1_ == 9)
               {
                  this.progressMeter.gotoAndStop(83);
               }
               else if(_loc1_ == 10)
               {
                  this.progressMeter.gotoAndStop(93);
               }
               this.jumpToNextStep(_loc1_);
               _loc1_++;
            }
         }
      }
      
      public function jumpToNextStep(param1:int) : void
      {
         TutorialInjectionManager.getInstance().handleSkipSteps(param1);
      }
      
      public function handleTutorialStarted() : void
      {
         if(this.currentStep == 1)
         {
            this.currentStep = 2;
         }
         TutorialInjectionManager.getInstance().setNextStep(this.currentStep);
         TutorialInjectionManager.getInstance().enableOverlay();
         TutorialInjectionManager.getInstance().enableItems([]);
         TutorialInjectionManager.getInstance().grayMenuButtons();
         this.serverCloneManager.initStage();
         this.dispatchDataToWindow();
         TutorialCompletionStatus.update(0,0,1,0);
      }
      
      public function handleTutorialSkipped() : void
      {
         CookieModule.setValue("nextNewsShow",TimeManager.currentTime + TimeManager.SECONDS_IN_HOUR * 8);
         TutorialCompletionStatus.update(0,0,0,1);
         this.tutorialWindow.handleCloseWindow();
         Settings.TUTORIAL_ACTIVE = false;
         Settings.DISABLE_ALL_KEYS = false;
         sendNotification(Note.CHANGE_APP_MODE,AppMode.NORMAL);
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         _loc1_.setTutorialStep(13);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.ENABLE_ALL_KEYS);
      }
      
      public function handleTutorialCompletion() : void
      {
         CookieModule.setValue("nextNewsShow",TimeManager.currentTime + TimeManager.SECONDS_IN_HOUR * 8);
         sendNotification(Note.CHANGE_APP_MODE,AppMode.NORMAL);
         this.clearUnusedElements();
         TutorialInjectionManager.getInstance().disableTutorialMode();
         TutorialInjectionManager.getInstance().restoreShopCardStates();
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         _loc1_.setTutorialStep(13);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.ENABLE_ALL_KEYS);
      }
      
      public function handleSkipTutorialStep(param1:int) : void
      {
         this.stepToSkip = param1;
         var _loc2_:WindowButtonParams = new WindowButtonParams(null,null,this.handleSkipStepConfirmation);
         this.notifier.dispatchNotice(new TutorialNotices(TutorialNotices.MINIMISE_WINDOW,this.currentStep));
         this.notifier.dispatchNoticeToRoot(new ConfirmationWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.QUESTION,"zoo.tutorial.general.forgive.title","zoo.tutorial.general.forgive.text",_loc2_));
      }
      
      public function handleSkipStepConfirmation() : void
      {
         this.progressMeter.play();
         TutorialCompletionStatus.update(this.stepToSkip,0,0,1);
         TutorialInjectionManager.getInstance().handleSkipSteps(this.stepToSkip);
         this.dispatchDataToWindow();
      }
      
      public function handleMoveTopNextStep() : void
      {
         TutorialInjectionManager.getInstance().setNextStep(this.currentStep);
         this.dispatchDataToWindow();
      }
      
      public function handleStepCompletion(param1:int) : void
      {
         this.resetTaskCompleteParam();
         this.progressMeter.play();
         this.tutorialWindow.enableDisableNextButton(true);
         this.tutorialWindow.enableDisableOKButton(false);
         if(!this.isWindowActive)
         {
            this.activateWindow();
         }
         this.tutorialWindow.displaySuccessText();
      }
      
      private function resetTaskCompleteParam() : void
      {
         this.currentStepNoTasksComplete = 0;
      }
      
      public function handleTaskCompletion(param1:int) : void
      {
         this.currentStepNoTasksComplete += 1;
         this.showTaskCompleteIcon(param1);
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_ACTIONMENU_MAKEBABY);
         this.tutorialWindow.updateTask(param1);
      }
      
      public function openSingleTutorialStep(param1:int) : void
      {
         this.currentStep = param1;
         this.currentStepHint = TutorialReferences["TUTORIALSTEP_" + String(param1) + "_HINT"];
         this.currentStepNoTasks = TutorialReferences["TUTORIALSTEP_" + String(param1) + "_TASKS"];
         this.openTutorialWindow();
         TutorialInjectionManager.getInstance().showIndividualStepItems(param1);
      }
      
      public function closeSingleTutorialStep() : void
      {
         TutorialInjectionManager.getInstance().clearIndividualTutorialItems();
         this.closeTutorialWindow();
      }
      
      public function set activeStepId(param1:int) : void
      {
         this.currentStep = TutorialReferences["TUTORIALSTEP_" + String(param1 + 1)];
         this.currentStepHint = TutorialReferences["TUTORIALSTEP_" + String(param1 + 1) + "_HINT"];
         this.currentStepNoTasks = TutorialReferences["TUTORIALSTEP_" + String(param1 + 1) + "_TASKS"];
      }
      
      public function get activeStepId() : int
      {
         return this.currentStep;
      }
      
      public function handleMinimiseButtonRollOver(param1:MouseEvent) : void
      {
         this.buttonCollapse.gotoAndStop(2);
         TooltipNewManager.setToolTip(this.buttonCollapse as DisplayObject,TextResourceModule.getText("zoo.tutorial.title." + this.currentStep),true);
      }
      
      public function handleMinimiseButtonRollOut(param1:MouseEvent) : void
      {
         this.buttonCollapse.gotoAndStop(2);
         TooltipNewManager.removeToolTip();
      }
      
      private function createTaskCompleteIcon(param1:DisplayObjectContainer) : void
      {
         this.taskCompleteIcon = AssetLibrary.getSprite("tutorialElements",AssetConfig.TUTORIAL_TASKCOMPLETE);
         this.taskCompleteIcon.visible = false;
         param1.addChild(this.taskCompleteIcon);
      }
      
      private function showTaskCompleteIcon(param1:int) : void
      {
         var hideIcon:Function = null;
         var task:int = param1;
         hideIcon = function():void
         {
            TweenMax.to(taskCompleteIcon,1,{
               "alpha":0,
               "delay":0.5,
               "ease":Circ.easeInOut
            });
         };
         this.handlePanelSizing(task);
         this.taskCompleteIcon.x = 200;
         this.taskCompleteIcon.y = 400;
         this.taskCompleteIcon.alpha = 0;
         this.taskCompleteIcon.visible = true;
         TweenMax.to(this.taskCompleteIcon,1,{
            "alpha":1,
            "y":150,
            "ease":Circ.easeInOut,
            "onComplete":hideIcon
         });
      }
      
      private function handlePanelSizing(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc7_:TextReplace = null;
         var _loc8_:TextReplace = null;
         if(this.currentStepNoTasksComplete == 1 && param1 == 2)
         {
            _loc2_ = 1;
         }
         else if(this.currentStepNoTasksComplete == 2 && param1 == 2)
         {
            _loc2_ = 2;
         }
         else if(this.currentStepNoTasksComplete == 1 && param1 == 1)
         {
            _loc2_ = 1;
         }
         else if(this.currentStepNoTasksComplete == 2 && param1 == 1)
         {
            _loc2_ = 2;
         }
         var _loc3_:Sprite = this.taskCompleteIcon.getChildByName("mcAwardPanel") as Sprite;
         var _loc4_:Sprite = _loc3_.getChildByName("mcAwardPanelMain") as Sprite;
         var _loc5_:Sprite = _loc3_.getChildByName("mcAwardPanelEdge") as Sprite;
         if(!this.awardText)
         {
            this.awardText = createTextFieldItem.createNewTextField(20,2,260,25,false,false,"txtAward",TextFieldType.DYNAMIC,StyleModule.HEADER_BOLD_11_LEFT,16777215,_loc3_,true,"left","advanced");
         }
         var _loc6_:Vector.<TextReplace> = new Vector.<TextReplace>();
         _loc7_ = new TextReplace("%currentTask%",String(_loc2_));
         _loc8_ = new TextReplace("%totalTasks%",String(this.currentStepNoTasks));
         _loc6_.push(_loc7_);
         _loc6_.push(_loc8_);
         this.awardText.text = TextResourceModule.getTextReplaced(TextResourceModule.getText("zoo.tutorial.general.award"),_loc6_);
         _loc4_.width = this.awardText.width + 30;
         _loc5_.x = _loc4_.width + _loc4_.x - 5;
      }
      
      private function clearUnusedElements() : void
      {
         if(this._gameStage)
         {
            if(this.taskCompleteIcon)
            {
               this._gameStage.removeChild(this.taskCompleteIcon);
            }
            if(this.buttonCollapse)
            {
               this._gameStage.removeChild(this.buttonCollapse);
            }
         }
      }
      
      public function handleHighlightCorrectSex(param1:TutorialNotices) : void
      {
         TutorialInjectionManager.getInstance().handleHighlightCorrectSex(param1.Id);
      }
      
      private function addRunningPenguin() : void
      {
         this.runningPenguin = AssetLibrary.getMovieClip("tutorialElements",AssetConfig.TUTORIALS_PENGUIN_RUNNING) as MovieClip;
         if(Settings.SCALE_TEST)
         {
            this.runningPenguin.scaleX = -0.2;
            this.runningPenguin.scaleY = 0.2;
            this.runningPenguin.x = -150;
            this.runningPenguin.y = 385;
         }
         else
         {
            this.runningPenguin.scaleX = -0.3;
            this.runningPenguin.scaleY = 0.3;
            this.runningPenguin.x = -150;
            this.runningPenguin.y = 500;
         }
         if(Boolean(this.runningPenguin) && Boolean(this._gameStage))
         {
            this._gameStage.addChild(this.runningPenguin);
         }
         this.animatePenguin();
      }
      
      private function animatePenguin() : void
      {
         var clearPenguin:Function = null;
         clearPenguin = function():void
         {
            if(Boolean(runningPenguin) && Boolean(_gameStage))
            {
               runningPenguin.visible = false;
               _gameStage.removeChild(runningPenguin);
            }
         };
         TweenMax.to(this.runningPenguin,5,{
            "x":1200,
            "delay":5,
            "ease":Circ.easeOut,
            "onComplete":clearPenguin
         });
      }
   }
}

