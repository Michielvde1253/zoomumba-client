package com.bigpoint.zoomumba.view.gui.mainmenu
{
   import buttons.tweeningButtons.basicExtension.TweeningButton20;
   import buttons.tweeningButtons.basicExtension.TweeningButton50;
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.gui.main.ButtonDecorations;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import custom.mainMenu.SettingsMenu;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   import spark.components.HGroup;
   
   public class SettingsMenuMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "SettingsMenuMediator";
      
      private const PANEL_BOTTOM_GAP:int = 30;
      
      private const PANEL_H_CENTER:int = 300;
      
      private const PANEL_WIDTH:int = 100;
      
      private const PANEL_HEIGHT:int = 0;
      
      private const SETTINGS_PANEL_GAP:int = 0;
      
      private const SETTINGS_PANEL_BOTTOM:int = 0;
      
      private const SETTINGS_PANEL_RIGHT:int = 0;
      
      private var zoomPanel:HGroup;
      
      private var minimizePanel:HGroup;
      
      private var settingsPanel:SettingsMenu;
      
      private var zoomInButton:TweeningButton20;
      
      private var zoomOutButton:TweeningButton20;
      
      private var settingsButton:TweeningButton20;
      
      private var fullscreenButton:TweeningButton20;
      
      private var soundButton:TweeningButton20;
      
      private var screenshotButton:TweeningButton50;
      
      private var soundButtonStateEnabled:Boolean = true;
      
      private var mainPanel:Group;
      
      private var minimizeTop:TweeningButton20;
      
      private var minimizeBottom:TweeningButton20;
      
      private var minimized:Boolean = false;
      
      public function SettingsMenuMediator(param1:Group)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.mainPanel = _loc1_.settingsButtonsContainer;
         this.zoomPanel = new HGroup();
         this.minimizePanel = new HGroup();
         this.settingsPanel = new SettingsMenu();
         this.settingsPanel.toolTip = TextResourceModule.getText("zoo.tooltip.hud.options");
         this.settingsPanel.bottom = this.SETTINGS_PANEL_BOTTOM;
         this.settingsPanel.container.gap = this.SETTINGS_PANEL_GAP;
         this.settingsPanel.right = this.SETTINGS_PANEL_RIGHT;
         this.settingsMenu.width = this.PANEL_WIDTH;
         this.settingsMenu.height = this.PANEL_HEIGHT;
         this.settingsMenu.bottom = this.PANEL_BOTTOM_GAP;
         this.settingsMenu.horizontalCenter = this.PANEL_H_CENTER;
         this.settingsMenu.addElement(this.zoomPanel);
         this.settingsMenu.addElement(this.minimizePanel);
         this.mainPanel.addElement(this.settingsPanel);
         this.createZoomButtons();
         this.createSettingsButtons();
         this.createScreenshootButton();
      }
      
      private function toggleSettingsMenuMinimizeState() : void
      {
         TweenLite.killTweensOf(this.mainPanel);
         TweenLite.killTweensOf(this.zoomPanel);
         if(!this.minimized)
         {
            TweenLite.to(this.mainPanel,1,{"bottom":-120});
            TweenLite.to(this.zoomPanel,1,{"bottom":-120});
            this.minimized = true;
            sendNotification(GUINote.MINIMIZED_MAIN_MENU_UI);
            this.settingsPanel.currentState = "closed";
         }
         else
         {
            TweenLite.to(this.mainPanel,1,{"bottom":0});
            TweenLite.to(this.zoomPanel,1,{"bottom":-40});
            sendNotification(GUINote.MAXIMIZED_MAIN_MENU_UI);
            this.minimized = false;
            this.settingsPanel.currentState = "closed";
         }
      }
      
      private function createScreenshootButton() : void
      {
         this.screenshotButton = new TweeningButton50();
         this.mainPanel.addElement(this.screenshotButton);
         this.screenshotButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_CAMERA_UP);
         this.screenshotButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_CAMERA_OVER);
         this.screenshotButton.bottom = -23;
         this.screenshotButton.left = 50;
         var _loc1_:MovieClip = AssetLibrary.getMovieClip(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.LOADER_MC);
         this.screenshotButton.extraContainer.addChild(_loc1_);
         this.screenshotButton.extraContainer.visible = false;
         _loc1_.scaleX = 0.9;
         _loc1_.scaleY = 0.9;
         _loc1_.y = 7;
         this.screenshotButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleScreenshotClick);
         this.screenshotButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleScreenshotOver);
         this.screenshotButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.screenshotButton,"MAIN_MENU_BUTTON_SCREENSHOT");
      }
      
      private function createZoomButtons() : void
      {
         this.zoomInButton = new TweeningButton20();
         this.zoomPanel.addElement(this.zoomInButton);
         this.zoomInButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMIN_UP);
         this.zoomInButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMIN_OVER);
         this.zoomInButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleZoomInButtonClick);
         this.zoomInButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleZoomInMouseOver);
         this.zoomInButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.zoomInButton,"MAIN_MENU_BUTTON_ZOOM_IN");
         this.zoomOutButton = new TweeningButton20();
         this.zoomPanel.addElement(this.zoomOutButton);
         this.zoomOutButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMOUT_UP);
         this.zoomOutButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMOUT_OVER);
         this.zoomOutButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleZoomOutButtonClick);
         this.zoomOutButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleZoomOutMouseOver);
         this.zoomOutButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.zoomOutButton,"MAIN_MENU_BUTTON_ZOOM_OUT");
      }
      
      private function createSettingsButtons() : void
      {
         this.soundButton = new TweeningButton20();
         this.settingsPanel.container.addElement(this.soundButton);
         this.soundButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_SOUND_UP);
         this.soundButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_SOUND_OVER);
         this.soundButton.defineDecoration([ButtonDecorations.MISC_MENU_SOUND_DISABLED,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_SOUND_DISABLED_DECO)]);
         this.soundButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleSoundButtonClick);
         this.soundButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleSoundMouseOver);
         this.soundButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.soundButton,"MAIN_MENU_BUTTON_VOLUME");
         this.fullscreenButton = new TweeningButton20();
         this.settingsPanel.container.addElement(this.fullscreenButton);
         this.fullscreenButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_FULLSCREEN_UP);
         this.fullscreenButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_FULLSCREEN_OVER);
         this.fullscreenButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleFullScreenButtonClick);
         this.fullscreenButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleFullScreenMouseOver);
         this.fullscreenButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.fullscreenButton,"MAIN_MENU_BUTTON_FULLSCREEN");
         this.settingsButton = new TweeningButton20();
         this.settingsPanel.container.addElement(this.settingsButton);
         this.settingsButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_SETTINGS_UP);
         this.settingsButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_SETTINGS_OVER);
         this.settingsButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleSettingsButtonClick);
         this.settingsButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleSettingsMouseOver);
         this.settingsButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.settingsButton,"MAIN_MENU_BUTTON_SETTINGS");
      }
      
      protected function handleMinimizeTopMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.hidetop"),false);
      }
      
      protected function handleMinimizeTopButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MINIMIZE_TOGGLE_HEADER_UI);
      }
      
      private function handleZoomInButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MENU_ZOOM_IN_BUTTON_CLICKED);
      }
      
      private function handleZoomOutButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MENU_ZOOM_OUT_BUTTON_CLICKED);
      }
      
      private function handleSoundButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.MENU_TOGGLE_SOUND_BUTTON_CLICKED);
         sendNotification(Note.TOGGLE_SOUND_BUTTON_STATE);
      }
      
      private function handleSettingsButtonClick(param1:MouseEvent) : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SETTINGS_WINDOW));
      }
      
      private function handleFullScreenButtonClick(param1:MouseEvent) : void
      {
         sendNotification(Note.TOGGLE_FULLSCREEN_MODE);
      }
      
      private function handleScreenshotClick(param1:MouseEvent) : void
      {
         this.screenshotButton.extraContainer.visible = true;
         this.screenshotButton.hideButtonGraphics();
         sendNotification(Note.MAKE_SCREEN_SHOT);
      }
      
      private function screenShotComplete() : void
      {
         this.screenshotButton.extraContainer.visible = false;
         this.screenshotButton.showButtonGraphics();
      }
      
      private function handleZoomInMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.zoomin"),false);
      }
      
      private function handleZoomOutMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.zoomout"),false);
      }
      
      private function handleFullScreenMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.fullscreen"),false);
      }
      
      private function handleSettingsMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.settings"),false);
      }
      
      private function handleSoundMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.volume"),false);
      }
      
      private function handleScreenshotOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainbutton.makesnapshot"),false);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.TOGGLE_SOUND_BUTTON_STATE,Note.CHANGE_APP_MODE,Note.SOUND_BUTTON_STATE_ON,Note.SOUND_BUTTON_STATE_OFF,Note.APP_RESIZED,Note.SCREEN_SHOT_ENCODED,Note.HIDE_SETTINGSMENU,Note.SHOW_SETTINGSMENU,GUINote.MINIMIZE_TOGGLE_MAIN_MENU_UI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.TOGGLE_SOUND_BUTTON_STATE:
               if(!this.soundButtonStateEnabled)
               {
                  this.soundButton.showDecoration(ButtonDecorations.MISC_MENU_SOUND_DISABLED);
                  this.soundButtonStateEnabled = false;
               }
               else
               {
                  this.soundButton.removeAllDecorations();
                  this.soundButtonStateEnabled = true;
               }
               break;
            case Note.CHANGE_APP_MODE:
               this.appModeChanged(param1.getBody() as String);
               break;
            case Note.SOUND_BUTTON_STATE_ON:
               this.soundButton.removeAllDecorations();
               this.soundButtonStateEnabled = true;
               break;
            case Note.SOUND_BUTTON_STATE_OFF:
               this.soundButton.showDecoration(ButtonDecorations.MISC_MENU_SOUND_DISABLED);
               this.soundButtonStateEnabled = false;
               break;
            case Note.APP_RESIZED:
               this.handleMenuChangeOnAppResize(param1.getBody() as Zoomumba);
               break;
            case Note.SCREEN_SHOT_ENCODED:
               this.screenShotComplete();
               break;
            case GUINote.MINIMIZE_TOGGLE_MAIN_MENU_UI:
               this.toggleSettingsMenuMinimizeState();
               break;
            case Note.HIDE_SETTINGSMENU:
               this.showMenu(false);
               break;
            case Note.SHOW_SETTINGSMENU:
               this.showMenu(true);
         }
      }
      
      private function showMenu(param1:Boolean) : void
      {
         this.mainPanel.visible = param1;
      }
      
      private function handleMenuChangeOnAppResize(param1:Zoomumba) : void
      {
         if(!this.minimized)
         {
            this.zoomPanel.bottom = -40;
         }
         this.minimizePanel.bottom = -40;
         this.minimizePanel.x = 100;
      }
      
      private function appModeChanged(param1:String) : void
      {
         switch(param1)
         {
            case AppMode.NORMAL:
               this.showSettingsMenu();
               break;
            case AppMode.VISIT_NEIGHBOUR:
               this.showSettingsMenu();
               break;
            case AppMode.SAFARI:
               this.hideSettingsMenu();
               break;
            case AppMode.MANAGMENT_CENTER:
               this.hideSettingsMenu();
               break;
            case AppMode.MAP_OVERVIEW:
               this.hideSettingsMenu();
         }
      }
      
      private function hideSettingsMenu() : void
      {
         this.settingsPanel.visible = false;
         this.zoomPanel.visible = false;
      }
      
      private function showSettingsMenu() : void
      {
         this.settingsPanel.visible = true;
         this.zoomPanel.visible = true;
      }
      
      private function get settingsMenu() : Group
      {
         return this.getViewComponent() as Group;
      }
   }
}

