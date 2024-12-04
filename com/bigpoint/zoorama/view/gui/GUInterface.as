package com.bigpoint.zoorama.view.gui
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.windowSystem.CloseAllWindowsCommand;
   import com.bigpoint.zoomumba.controller.windowSystem.CloseWindowCommand;
   import com.bigpoint.zoomumba.controller.windowSystem.OpenWindowCommand;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.tempView.MediatorDispachingEvents;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.gui.windows.WindowPanelMediator;
   import com.bigpoint.zoomumba.view.itemAnimations.ItemAnimationMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipManager;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class GUInterface extends MediatorDispachingEvents
   {
      public static const NAME:String = "GUInterface";
      
      public static const WINDOW_NOT_OPENED:int = 0;
      
      public static const WINDOW_SHOP:int = 1;
      
      public static const WINDOW_TOOL:int = 2;
      
      public static const WINDOW_BUY_CREDITS:int = 3;
      
      public static const WINDOW_QUEST:int = 4;
      
      public static const WINDOW_ACHIEVEMNETS:int = 5;
      
      public static const WINDOW_SETTINGS:int = 6;
      
      public static const WINDOW_MINI_TUTORIAL:int = 7;
      
      public static const WINDOW_INVENTORY:int = 8;
      
      public static const UID_BUTTON_ADJUSTMENT_X:int = 15;
      
      private var appProxy:AppProxy;
      
      private var windowManager:WindowManager;
      
      private var tooltipManager:TooltipManager;
      
      private var mouseManager:MouseModule;
      
      public var skin:Sprite;
      
      public var skinWidth:Number;
      
      public var skinHeight:Number;
      
      private var gameContainer:UIComponent;
      
      private var notifier:Notifier;
      
      private var panelLayer:Coreponent;
      
      private var userIDText:String;
      
      private var gameBorder:Sprite;
      
      private var tempUserId:int;
      
      private var windowLayer:Coreponent;
      
      private var userProxy:UserProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var adamLayer:Group;
      
      public function GUInterface(param1:Notifier, param2:UIComponent)
      {
         super(NAME,this);
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.notifier = new Notifier(param1);
         this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.DEFAULT_OBJECT_SPR);
         this.gameBorder = this.skin.getChildByName("GameBorder") as Sprite;
         this.skin.removeChild(this.gameBorder);
         var _loc3_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         _loc3_.borderContainer.addChild(this.gameBorder);
         this.skin.visible = false;
         this.gameContainer = param2;
         this.gameContainer.addChild(this.skin);
         this.skin.mouseEnabled = false;
         if(Settings.SCALE_TEST)
         {
            this.skin.scaleX = 0.76;
            this.skin.scaleY = 0.76;
         }
         this.skinWidth = this.skin.width;
         this.skinHeight = this.skin.height;
         var _loc4_:Group = new Group();
         _loc4_.explicitWidth = _loc4_.explicitHeight = 1;
         _loc4_.verticalCenter = _loc4_.horizontalCenter = 0;
         var _loc5_:WindowSystemMediator = new WindowSystemMediator(_loc4_);
         facade.registerMediator(_loc5_);
         facade.registerCommand(WinNote.OPEN_WINDOW,OpenWindowCommand);
         facade.registerCommand(WinNote.CLOSE_WINDOW,CloseWindowCommand);
         facade.registerCommand(WinNote.CLOSE_ALL_WINDOWS,CloseAllWindowsCommand);
         var _loc6_:Group = new Group();
         var _loc7_:Group = new Group();
         var _loc8_:SpriteVisualElement = new SpriteVisualElement();
         var _loc9_:Sprite = new Sprite();
         _loc4_.addElement(_loc6_);
         _loc6_.addElement(_loc8_);
         _loc6_.addElement(_loc7_);
         _loc8_.addChild(_loc9_);
         WindowManagerNew.groupRef = _loc7_;
         WindowManagerNew.spriteVERef = _loc8_;
         WindowManagerNew.init(_loc9_);
         this.buildWindowLayer();
         this.buildMainLayerPanels();
         this.initializeMouseModule();
         this.initializeTooltipManager();
         this.initializeKeyboard();
         sendNotification(Note.APP_RESIZED,_loc3_.application);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.USER_ID,DataNote.USER_NAME,DataNote.VIRTUAL_MONEY_UPDATED,DataNote.REAL_MONEY_UPDATED,DataNote.EXPERIENCE_UPDATED,DataNote.USER_LEVEL,Note.DISABLE_OLD_GUI_INTERFACE,Note.APP_RESIZED,Note.EXPANSION_CHANGED,Note.UPDATE_SHOP_RESOURCES_COUNT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.USER_ID:
               this.tempUserId = this.userProxy.userId;
               break;
            case Note.DISABLE_OLD_GUI_INTERFACE:
               this.skin.visible = false;
               break;
            case Note.APP_RESIZED:
               this.handleAppResize(param1.getBody() as Zoomumba);
         }
      }
      
      public function get gameHolder() : UIComponent
      {
         return this.gameContainer;
      }
      
      private function handleAppResize(param1:Zoomumba) : void
      {
         var _loc2_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         if(_loc2_.STAGE_WIDTH > MainConfig.STAGE_DEFALT_WIDTH)
         {
            this.windowLayer.normalX = Math.floor(_loc2_.STAGE_WIDTH / 2 - MainConfig.STAGE_DEFALT_WIDTH / 2);
         }
         else
         {
            this.windowLayer.normalX = 0;
         }
         if(_loc2_.STAGE_HEIGHT > MainConfig.STAGE_DEFALT_HEIGHT)
         {
            this.windowLayer.normalY = Math.floor(_loc2_.STAGE_HEIGHT / 2 - MainConfig.STAGE_DEFALT_HEIGHT / 2);
         }
         else
         {
            this.windowLayer.normalY = 0;
         }
         WindowManagerNew.handleNewAppSize(_loc2_.STAGE_WIDTH,_loc2_.STAGE_HEIGHT);
         if(_loc2_.STAGE_WIDTH != MainConfig.STAGE_DEFALT_WIDTH || _loc2_.STAGE_HEIGHT != MainConfig.STAGE_DEFALT_HEIGHT)
         {
            this.hideGameBorder();
         }
         else
         {
            this.showGameBorder();
         }
      }
      
      override public function onRegister() : void
      {
         facade.registerMediator(this.tooltipManager);
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      public function enable() : void
      {
         this.skin.visible = true;
      }
      
      private function buildMainLayerPanels() : void
      {
         this.panelLayer = new Coreponent();
         this.panelLayer.width = this.skinWidth;
         this.panelLayer.height = this.skinHeight;
         this.skin.addChild(this.panelLayer);
         this.panelLayer.visible = false;
      }
      
      private function buildWindowLayer() : void
      {
         this.windowLayer = new Coreponent();
         this.windowLayer.width = this.skinWidth;
         this.windowLayer.height = this.skinHeight;
         var _loc1_:Coreponent = new Coreponent();
         _loc1_.skin = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.WINDOW_MODAL_LAYER);
         this.windowManager = WindowManager.getInstance();
         this.windowManager.initialize(this.windowLayer,_loc1_);
         var _loc2_:WindowPanelMediator = facade.retrieveMediator(WindowPanelMediator.NAME) as WindowPanelMediator;
         _loc2_.addOldWindowSystemLayer(this.windowLayer);
         var _loc3_:Sprite = new Sprite();
         facade.registerMediator(new ItemAnimationMediator(_loc3_));
         _loc2_.addOldWindowSystemLayer(_loc3_);
      }
      
      private function hideGameBorder() : void
      {
         this.gameBorder.visible = false;
      }
      
      private function showGameBorder() : void
      {
         this.gameBorder.visible = true;
      }
      
      private function initializeTooltipManager() : void
      {
         var _loc1_:Coreponent = new Coreponent();
         _loc1_.width = this.skinWidth;
         _loc1_.height = this.skinHeight;
         this.skin.addChild(_loc1_);
         this.tooltipManager = TooltipManager.getInstance();
         this.tooltipManager.layer = _loc1_;
      }
      
      private function initializeMouseModule() : void
      {
         var _loc1_:Sprite = new Sprite();
         this.skin.addChild(_loc1_);
         this.mouseManager = MouseModule.getInstance();
         this.mouseManager.initialize(_loc1_,AssetLibrary.getMovieClip(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_MOUSEPOINTER));
      }
      
      private function initializeKeyboard() : void
      {
         this.gameContainer.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
      }
      
      private function handleKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.F12)
         {
            if(this.gameContainer.stage.displayState == StageDisplayState.NORMAL)
            {
               this.gameContainer.stage.displayState = StageDisplayState.FULL_SCREEN;
            }
            else
            {
               this.gameContainer.stage.displayState = StageDisplayState.NORMAL;
            }
         }
      }
      
      public function setGUIPanelLayerVisibility(param1:Boolean) : void
      {
         if(this.panelLayer)
         {
            this.panelLayer.visible = param1;
         }
      }
   }
}

