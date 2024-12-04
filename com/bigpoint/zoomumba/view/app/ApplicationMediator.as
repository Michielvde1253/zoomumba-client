package com.bigpoint.zoomumba.view.app
{
   import com.bigpoint.utils.cookieModule.CookieModule;
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.gui.effects.PlayFieldEffectMediator;
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectViewVo;
   import com.bigpoint.zoomumba.view.gui.event.BallonEventMediator;
   import com.bigpoint.zoomumba.view.gui.header.HeaderPanelMediator;
   import com.bigpoint.zoomumba.view.gui.main.MainPanelMediator;
   import com.bigpoint.zoomumba.view.gui.powerupPanel.PowerupPanelMediator;
   import com.bigpoint.zoomumba.view.gui.windows.WindowPanelMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.view.field.PlayField;
   import custom.mainInterface.powerupPanel.PowerupPanel;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import mx.core.Application;
   import mx.core.UIComponent;
   import mx.events.ResizeEvent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class ApplicationMediator extends Mediator
   {
      public static const NAME:String = "ApplicationMediator";
      
      public var STAGE_WIDTH:int = -1;
      
      public var STAGE_HEIGHT:int = -1;
      
      private var _gameContainer:UIComponent;
      
      private var headerPanel:Group;
      
      private var windowPanel:Group;
      
      private var mainPanel:Group;
      
      private var powerupPanel:PowerupPanel;
      
      private var _borderContainer:UIComponent;
      
      private var _frontEffectHolder:UIComponent;
      
      private var _settingsButtonsContainer:Group;
      
      public function ApplicationMediator(param1:Application)
      {
         super(NAME,param1);
         this.application.addChild(this._gameContainer = new UIComponent());
         this._frontEffectHolder = new UIComponent();
         this._frontEffectHolder.mouseChildren = this._frontEffectHolder.mouseEnabled = false;
         this.application.addChild(this._frontEffectHolder);
         this.mainPanel = new Group();
         this.powerupPanel = new PowerupPanel();
         this.mainPanel.addElement(this.powerupPanel);
         this.powerupPanel.horizontalCenter = 0;
         this.powerupPanel.top = 0;
         facade.registerMediator(new PowerupPanelMediator(this.powerupPanel));
         this.application.addChild(this.mainPanel);
         this.application.addChild(this._borderContainer = new UIComponent());
         this._borderContainer.mouseChildren = this._borderContainer.mouseEnabled = false;
         this._settingsButtonsContainer = new Group();
         this.application.addChild(this._settingsButtonsContainer);
         this.settingsButtonsContainer.width = this.application.width;
         this.settingsButtonsContainer.height = this.application.height;
         this.application.addChild(this.headerPanel = new Group());
         this.application.addChild(this.windowPanel = new Group());
         this.application.addEventListener(ResizeEvent.RESIZE,this.resizeViewPort);
         this.application.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.handleFullscreenToggle);
         sendNotification(Note.APP_RESIZED,this.application);
      }
      
      public function get application() : Application
      {
         return viewComponent as Application;
      }
      
      public function get gameContainer() : UIComponent
      {
         return this._gameContainer;
      }
      
      public function get borderContainer() : UIComponent
      {
         return this._borderContainer;
      }
      
      public function get settingsButtonsContainer() : Group
      {
         return this._settingsButtonsContainer;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.USER_ID,Note.APP_CONFIG_LOADED,Note.SHOW_TEST_GUI,Note.TOGGLE_FULLSCREEN_MODE,Note.EXIT_FULLSCREEN_MODE,Note.APP_RESIZED,Note.INIT_BALLON_MEDIATOR,Note.INIT_PLAYFIELD_EFFECT_SYSTEM];
      }
      
      override public function onRegister() : void
      {
         if(this.application)
         {
            this.resizeViewPort(null);
         }
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:UserProxy = null;
         var _loc3_:MainPanelMediator = null;
         var _loc4_:WindowPanelMediator = null;
         var _loc5_:HeaderPanelMediator = null;
         var _loc6_:UIComponent = null;
         var _loc7_:BallonEventMediator = null;
         var _loc8_:Sprite = null;
         var _loc9_:Sprite = null;
         var _loc10_:PlayFieldEffectViewVo = null;
         var _loc11_:PlayFieldEffectMediator = null;
         switch(param1.getName())
         {
            case DataNote.USER_ID:
               _loc2_ = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
               CookieModule.setDefaultSharedObjectName("ZooMumba_user_" + _loc2_.userId);
               break;
            case Note.APP_CONFIG_LOADED:
               this.setStageDimsFromFlashVars();
               this.clearEventCookie();
               break;
            case Note.EXIT_FULLSCREEN_MODE:
               if(this.application.stage.displayState != StageDisplayState.NORMAL)
               {
                  this.application.stage.displayState = StageDisplayState.NORMAL;
                  sendNotification(Note.FULLSCREEN_MODE_CHANGE);
               }
               break;
            case Note.SHOW_TEST_GUI:
               _loc3_ = new MainPanelMediator(this.mainPanel);
               facade.registerMediator(_loc3_);
               _loc4_ = new WindowPanelMediator(this.windowPanel);
               facade.registerMediator(_loc4_);
               _loc5_ = new HeaderPanelMediator(this.headerPanel);
               facade.registerMediator(_loc5_);
               sendNotification(Note.APP_RESIZED,this.application);
               break;
            case Note.TOGGLE_FULLSCREEN_MODE:
               if(this.application.stage.displayState == StageDisplayState.NORMAL)
               {
                  this.application.stage.displayState = StageDisplayState.FULL_SCREEN;
               }
               else
               {
                  this.application.stage.displayState = StageDisplayState.NORMAL;
               }
               sendNotification(Note.FULLSCREEN_MODE_CHANGE);
               break;
            case Note.APP_RESIZED:
               this.settingsButtonsContainer.width = this.application.width;
               this.settingsButtonsContainer.height = this.application.height;
               break;
            case Note.INIT_BALLON_MEDIATOR:
               _loc6_ = new UIComponent();
               this.application.addChild(_loc6_);
               _loc7_ = new BallonEventMediator(_loc6_);
               facade.registerMediator(_loc7_);
               break;
            case Note.INIT_PLAYFIELD_EFFECT_SYSTEM:
               _loc8_ = new Sprite();
               (facade.getMediator(PlayField) as PlayField).effectHolder.addChild(_loc8_);
               _loc9_ = new Sprite();
               this._frontEffectHolder.addChild(_loc9_);
               _loc10_ = new PlayFieldEffectViewVo(_loc8_,_loc9_);
               _loc11_ = new PlayFieldEffectMediator(_loc10_);
               facade.registerMediator(_loc11_);
         }
      }
      
      private function clearEventCookie() : void
      {
         (facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy).clearEventCookieWindow();
      }
      
      private function get app() : Zoomumba
      {
         return this.viewComponent as Zoomumba;
      }
      
      private function handleFullscreenToggle(param1:FullScreenEvent) : void
      {
         sendNotification(Note.FULLSCREEN_MODE_CHANGE);
      }
      
      public function resizeViewPort(param1:ResizeEvent = null) : void
      {
         this.STAGE_WIDTH = this.application.width;
         this.STAGE_HEIGHT = this.application.height;
         sendNotification(Note.APP_RESIZED,this.application);
      }
      
      private function setStageDimsFromFlashVars() : void
      {
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(int(_loc1_.width))
         {
            this.STAGE_WIDTH = int(_loc1_.width);
            this.STAGE_HEIGHT = int(_loc1_.height);
         }
         else
         {
            this.STAGE_WIDTH = 986;
            this.STAGE_HEIGHT = 565;
         }
         if(Settings.DEBUG_MODE)
         {
            this.resizeViewPort(null);
         }
      }
   }
}

