package com.bigpoint.zoomumba.view.gui.mainmenu
{
   import buttons.tweeningButtons.basicExtension.TweeningButton20;
   import buttons.tweeningButtons.basicExtension.TweeningButton50;
   import buttons.tweeningButtons.stateableExtension.TweeningStateableButton50;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.features.gifts.GiftsProxy;
   import com.bigpoint.zoomumba.model.gui.main.ButtonDecorations;
   import com.bigpoint.zoomumba.model.gui.main.ButtonStates;
   import com.bigpoint.zoomumba.model.gui.main.ClusterButtonID;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.gui.main.MainPanelMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.mainmenu.MouseToolNotice;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import custom.mainInterface.ButtonCluster;
   import custom.mainInterface.events.ButtonClusterEvent;
   import custom.mainMenu.MainMenu;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.facade.Facade;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class MainMenuMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "MainMenuMediator";
      
      public static const BUTTONS_GAP:int = 3;
      
      public static const BOTTOM_GAP:int = -20;
      
      public static const ZOOM_BUTTONS_BOTTOM_GAP:int = 10;
      
      private static const SELECT_TOOL_CLUSTER_POSITION:Array = [new Point(-65,30),new Point(-65,-10),new Point(-65,-50),new Point(-25,-50),new Point(15,-50),new Point(35,-80)];
      
      private var loaderSprite:Class = MainMenuMediator_loaderSprite;
      
      private var mainPanel:Group;
      
      private var toolButton:TweeningStateableButton50;
      
      private var shopButton:TweeningButton50;
      
      private var inventoryButton:TweeningButton50;
      
      private var assistantsButton:TweeningButton50;
      
      private var bankButton:TweeningButton50;
      
      private var questsButton:TweeningButton50;
      
      private var communityButton:TweeningStateableButton50;
      
      private var selectToolCluster:ButtonCluster;
      
      private var selectToolButton:TweeningButton20;
      
      private var moveToolButton:TweeningButton20;
      
      private var rotateToolButton:TweeningButton20;
      
      private var sellToolButton:TweeningButton20;
      
      private var storeToolButton:TweeningButton20;
      
      private var allInStoreToolButton:TweeningButton20;
      
      private var zoomInButton:TweeningButton20;
      
      private var zoomOutButton:TweeningButton20;
      
      private var minimized:Boolean = false;
      
      public function MainMenuMediator(param1:MainMenu)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         var _loc1_:MainPanelMediator = Facade.getInstance().retrieveMediator(MainPanelMediator.NAME) as MainPanelMediator;
         this.mainPanel = _loc1_.getViewComponent() as Group;
         this.mainPanel.addElement(this.mainMenu);
         this.mainMenu.bottom = BOTTOM_GAP;
         this.mainMenu.horizontalCenter = 0;
         this.mainMenu.gap = BUTTONS_GAP;
         this.createMainMenu();
         this.createMiscButtons();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GUINote.SHOW_SHOP_EVENT_STARS,GUINote.HIDE_SHOP_EVENT_STARS,GUINote.SHOW_QUEST_NORMAL_STATE,GUINote.SHOW_QUEST_IN_PROGRESS_DECO,GUINote.SHOW_QUEST_COMPLETE_DECO,GUINote.SHOW_COMMUNITY_HAS_MAIL,GUINote.SHOW_COMMUNITY_NORMAL_STATE,Note.APP_RESIZED,Note.CHANGE_APP_MODE,GUINote.ACTIVATE_SELECT_SUBTOOL,GUINote.ACTIVATE_ROTATE_SUBTOOL,GUINote.ACTIVATE_MOVE_SUBTOOL,GUINote.ACTIVATE_SELL_SUBTOOL,GUINote.ACTIVATE_STORE_SUBTOOL,Note.INVENTORY_HAS_GIFTS_MENU,Note.INVENTORY_NORMAL_MENU,ResponseName.USER_GIFTS_DATA,Note.LOCK_ASSISTANTS_USED,Note.UNLOCK_ASSISTANTS_USED,GUINote.MINIMIZE_TOGGLE_MAIN_MENU_UI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ResponseName.USER_GIFTS_DATA:
               this.handleGiftsInInventoryIcon();
               break;
            case GUINote.SHOW_SHOP_EVENT_STARS:
               this.shopButton.showDecoration(ButtonDecorations.MAIN_MENU_EVENT_STARS);
               break;
            case GUINote.HIDE_SHOP_EVENT_STARS:
               this.shopButton.removeDecoration(ButtonDecorations.MAIN_MENU_EVENT_STARS);
               break;
            case GUINote.SHOW_QUEST_NORMAL_STATE:
               this.questsButton.removeAllDecorations();
               break;
            case GUINote.SHOW_QUEST_IN_PROGRESS_DECO:
               this.questsButton.showDecoration(ButtonDecorations.MAIN_MENU_QUEST_ACTIVE);
               break;
            case GUINote.SHOW_QUEST_COMPLETE_DECO:
               this.questsButton.showDecoration(ButtonDecorations.MAIN_MENU_QUEST_COMPLETE);
               break;
            case GUINote.SHOW_COMMUNITY_HAS_MAIL:
               this.communityButton.CURRENT_STATE = ButtonStates.MAIN_MENU_COMMUNITY_MAIL;
               break;
            case GUINote.SHOW_COMMUNITY_NORMAL_STATE:
               this.communityButton.CURRENT_STATE = ButtonStates.MAIN_MENU_COMMUNITY_NORMAL;
               break;
            case Note.APP_RESIZED:
               break;
            case Note.CHANGE_APP_MODE:
               this.appModeChanged(param1.getBody() as String);
               break;
            case GUINote.ACTIVATE_SELECT_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_ARROW;
               break;
            case GUINote.ACTIVATE_ROTATE_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_ROTATE;
               break;
            case GUINote.ACTIVATE_MOVE_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_MOVE;
               break;
            case GUINote.ACTIVATE_SELL_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_SELL;
               break;
            case GUINote.ACTIVATE_STORE_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_STORE;
               break;
            case GUINote.ACTIONALLIN_STORE_SUBTOOL:
               this.toolButton.CURRENT_STATE = ButtonStates.MAIN_MENU_TOOLS_ARROW;
               break;
            case Note.INVENTORY_HAS_GIFTS_MENU:
               this.inventoryButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_GIFTS_UP);
               this.inventoryButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_GIFTS_OVER);
               break;
            case Note.INVENTORY_NORMAL_MENU:
               this.inventoryButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_UP);
               this.inventoryButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_OVER);
               break;
            case Note.LOCK_ASSISTANTS_USED:
               this.lockAssistButton();
               break;
            case Note.UNLOCK_ASSISTANTS_USED:
               this.unlockAssistButton();
               break;
            case GUINote.MINIMIZE_TOGGLE_MAIN_MENU_UI:
               this.toggleMainMenuMinimizeState();
         }
      }
      
      private function sendAllInStore() : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.inventory.allin.title"),TextResourceModule.getText("zoo.inventory.allin.confirmation")),new WindowParams("",null,"",null,Note.SEND_ALL_TO_INVENTORY)));
      }
      
      private function toggleMainMenuMinimizeState() : void
      {
         TweenLite.killTweensOf(this.mainMenu);
         if(!this.minimized)
         {
            TweenLite.to(this.mainMenu,1,{"bottom":-120});
            this.minimized = true;
         }
         else
         {
            TweenLite.to(this.mainMenu,1,{"bottom":BOTTOM_GAP});
            this.minimized = false;
         }
      }
      
      private function handleGiftsInInventoryIcon() : void
      {
         var _loc1_:GiftsProxy = facade.retrieveProxy(GiftsProxy.NAME) as GiftsProxy;
         if(_loc1_.dataCount > 0)
         {
            sendNotification(Note.INVENTORY_HAS_GIFTS_MENU);
         }
         else
         {
            sendNotification(Note.INVENTORY_NORMAL_MENU);
         }
      }
      
      private function appModeChanged(param1:String) : void
      {
         switch(param1)
         {
            case AppMode.NORMAL:
               this.showMainMenu();
               break;
            case AppMode.VISIT_NEIGHBOUR:
               this.hideMainMenu();
               break;
            case AppMode.SAFARI:
               this.hideMainMenu();
               break;
            case AppMode.MANAGMENT_CENTER:
               this.hideMainMenu();
               break;
            case AppMode.MAP_OVERVIEW:
               this.hideMainMenu();
         }
      }
      
      private function hideMainMenu() : void
      {
         this.mainMenu.visible = false;
      }
      
      private function showMainMenu() : void
      {
         this.mainMenu.visible = true;
      }
      
      private function createMainMenu() : void
      {
         this.createToolButton();
         this.createShopButton();
         this.createInventoryButton();
         this.createAssistantsButton();
         this.createBankButton();
         this.createQuestButton();
         this.createCommunityButton();
         this.createSelectToolCluster();
      }
      
      private function createToolButton() : void
      {
         this.toolButton = new TweeningStateableButton50();
         this.mainMenu.addElement(this.toolButton);
         this.toolButton.defineState([ButtonStates.MAIN_MENU_TOOLS_ARROW,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ARROW_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ARROW_OVER)]);
         this.toolButton.defineState([ButtonStates.MAIN_MENU_TOOLS_MOVE,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_MOVE_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_MOVE_OVER)]);
         this.toolButton.defineState([ButtonStates.MAIN_MENU_TOOLS_ROTATE,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ROTATE_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ROTATE_OVER)]);
         this.toolButton.defineState([ButtonStates.MAIN_MENU_TOOLS_SELL,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_SELL_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_SELL_OVER)]);
         this.toolButton.defineState([ButtonStates.MAIN_MENU_TOOLS_STORE,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_STORE_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_STORE_OVER)]);
         this.toolButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleToolClick);
         this.toolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleToolMouseOver);
         this.toolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.toolButton,"MAIN_MENU_BUTTON_SELECT");
      }
      
      private function createShopButton() : void
      {
         this.shopButton = new TweeningButton50();
         this.mainMenu.addElement(this.shopButton);
         this.shopButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_SHOP_UP);
         this.shopButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_SHOP_OVER);
         this.shopButton.defineDecoration([ButtonDecorations.MAIN_MENU_EVENT_STARS,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.EVENT_STARS_DECO)]);
         this.shopButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleShopButtonClick);
         this.shopButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleShopMouseOver);
         this.shopButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.shopButton,"MAIN_MENU_BUTTON_SHOP");
      }
      
      private function createInventoryButton() : void
      {
         this.inventoryButton = new TweeningButton50();
         this.mainMenu.addElement(this.inventoryButton);
         this.inventoryButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_UP);
         this.inventoryButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_INVENTORY_OVER);
         this.inventoryButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleInventoryButtonClick);
         this.inventoryButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleInventoryMouseOver);
         this.inventoryButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.inventoryButton,"MAIN_MENU_BUTTON_INVENTORY");
      }
      
      private function createAssistantsButton() : void
      {
         this.assistantsButton = new TweeningButton50();
         this.mainMenu.addElement(this.assistantsButton);
         var _loc1_:Sprite = new this.loaderSprite();
         _loc1_.scaleX = _loc1_.scaleY = 0.7;
         _loc1_.x = -20;
         _loc1_.y = -15;
         this.assistantsButton.defineDecoration([ButtonDecorations.ASSISTANTS_LOADER,_loc1_]);
         this.assistantsButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ASSIST_UP);
         this.assistantsButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_ASSIST_OVER);
         this.assistantsButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleAssistantsButtonClick);
         this.assistantsButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleAssistantsMouseOver);
         this.assistantsButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.assistantsButton,"MAIN_MENU_BUTTON_ASSISTANTS");
      }
      
      private function lockAssistButton() : void
      {
         this.assistantsButton.showDecoration(ButtonDecorations.ASSISTANTS_LOADER);
         this.assistantsButton.hitArea.mouseEnabled = false;
         this.assistantsButton.hitArea.mouseChildren = false;
         this.assistantsButton.buttonAlpha = 0.5;
      }
      
      private function unlockAssistButton() : void
      {
         this.assistantsButton.removeAllDecorations();
         this.assistantsButton.hitArea.mouseEnabled = true;
         this.assistantsButton.hitArea.mouseChildren = true;
         this.assistantsButton.buttonAlpha = 1;
      }
      
      private function createBankButton() : void
      {
         this.bankButton = new TweeningButton50();
         this.mainMenu.addElement(this.bankButton);
         this.bankButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_BANK_UP);
         this.bankButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_BANK_OVER);
         this.bankButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleBankButtonClick);
         this.bankButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleBankMouseOver);
         this.bankButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.bankButton,"MAIN_MENU_BUTTON_BANK");
      }
      
      private function createQuestButton() : void
      {
         this.questsButton = new TweeningButton50();
         this.mainMenu.addElement(this.questsButton);
         this.questsButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_QUESTS_UP);
         this.questsButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_QUESTS_OVER);
         this.questsButton.defineDecoration([ButtonDecorations.MAIN_MENU_QUEST_ACTIVE,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_QUESTS_ACTIVE_DECO)]);
         this.questsButton.defineDecoration([ButtonDecorations.MAIN_MENU_QUEST_COMPLETE,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_QUESTS_COMPLETE_DECO)]);
         this.questsButton.defineDecoration([ButtonDecorations.MAIN_MENU_QUEST_FAILED,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_QUESTS_FAILED_DECO)]);
         this.questsButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleQuestsButtonClick);
         this.questsButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleQuestsMouseOver);
         this.questsButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.questsButton,"MAIN_MENU_BUTTON_QUESTS");
      }
      
      private function createCommunityButton() : void
      {
         this.communityButton = new TweeningStateableButton50();
         this.mainMenu.addElement(this.communityButton);
         this.communityButton.defineState([ButtonStates.MAIN_MENU_COMMUNITY_NORMAL,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_COMMUNITY_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_COMMUNITY_DOWN)]);
         this.communityButton.defineState([ButtonStates.MAIN_MENU_COMMUNITY_MAIL,AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_COMMUNITY_MAIL_UP),AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MAIN_MENU_COMMUNITY_MAIL_UP)]);
         this.communityButton.hitArea.addEventListener(MouseEvent.CLICK,this.handleCommunityButtonClick);
         this.communityButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleCommunityMouseOver);
         this.communityButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         TutorialInjectionManager.getInstance().addItem(this.communityButton,"MAIN_MENU_BUTTON_COMMUNITY");
      }
      
      private function handleInventoryMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.inventory"),false);
      }
      
      private function handleToolMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.multitool"),false);
      }
      
      private function handleShopMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.shop"),false);
      }
      
      private function handleAssistantsMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.assistance"),false);
      }
      
      private function handleBankMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.bank"),false);
      }
      
      private function handleQuestsMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.quests"),false);
      }
      
      private function handleCommunityMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.mainmenubutton.social"),false);
      }
      
      private function handleSelectToolMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.arrow"),false);
      }
      
      private function handleMoveMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.move"),false);
      }
      
      private function handleRotateMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.rotate"),false);
      }
      
      private function handleSellMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.sell"),false);
      }
      
      private function handleStoreMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.store"),false);
      }
      
      private function handleAllStoreMouseOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.multitool.allstore"),false);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleToolClick(param1:MouseEvent) : void
      {
         this.selectToolCluster.toggleVisibility();
      }
      
      private function handleShopButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         sendNotification(Note.APP_RESIZED,_loc2_.application);
         sendNotification(SHOP.OPEN_SHOP_ON_TAB);
      }
      
      private function handleInventoryButtonClick(param1:MouseEvent) : void
      {
         facade.sendNotification(Note.CHANGE_CURSOR,MouseToolNotice.DEFAULT);
         facade.sendNotification(GUINote.ACTIVATE_SELECT_SUBTOOL);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INVENTORY));
      }
      
      private function handleAssistantsButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.ASSISTANTS_MENU_BUTTON_CLICKED);
      }
      
      private function handleBankButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
      }
      
      private function handleQuestsButtonClick(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS));
      }
      
      private function handleCommunityButtonClick(param1:MouseEvent) : void
      {
         sendNotification(GUINote.COMMUNITY_MENU_BUTTON_CLICKED);
      }
      
      private function createMiscButtons() : void
      {
         this.zoomInButton = new TweeningButton20();
         this.zoomInButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMIN_UP);
         this.zoomInButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMIN_OVER);
         this.zoomOutButton = new TweeningButton20();
         this.zoomOutButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMOUT_UP);
         this.zoomOutButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.MISC_MENU_ZOOMOUT_OVER);
      }
      
      private function createSelectToolCluster() : void
      {
         this.selectToolCluster = new ButtonCluster();
         this.toolButton.addElement(this.selectToolCluster);
         this.selectToolButton = new TweeningButton20();
         this.selectToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_SELECT_UP);
         this.selectToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_SELECT_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.SELECT_TOOL,this.selectToolButton,SELECT_TOOL_CLUSTER_POSITION[0]);
         this.selectToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleSelectToolMouseOver);
         this.selectToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.moveToolButton = new TweeningButton20();
         this.moveToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_MOVE_UP);
         this.moveToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_MOVE_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.MOVE_TOOL,this.moveToolButton,SELECT_TOOL_CLUSTER_POSITION[1]);
         this.moveToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleMoveMouseOver);
         this.moveToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.rotateToolButton = new TweeningButton20();
         this.rotateToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_ROTATE_UP);
         this.rotateToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_ROTATE_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.ROTATE_TOOL,this.rotateToolButton,SELECT_TOOL_CLUSTER_POSITION[2]);
         this.rotateToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleRotateMouseOver);
         this.rotateToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.sellToolButton = new TweeningButton20();
         this.sellToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_SELL_UP);
         this.sellToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_SELL_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.SELL_TOOL,this.sellToolButton,SELECT_TOOL_CLUSTER_POSITION[3]);
         this.sellToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleSellMouseOver);
         this.sellToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.storeToolButton = new TweeningButton20();
         this.storeToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_STORE_UP);
         this.storeToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_STORE_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.STORE_TOOL,this.storeToolButton,SELECT_TOOL_CLUSTER_POSITION[4]);
         this.storeToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleStoreMouseOver);
         this.storeToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.allInStoreToolButton = new TweeningButton20();
         this.allInStoreToolButton.scaleX = 0.8;
         this.allInStoreToolButton.scaleY = 0.8;
         this.allInStoreToolButton.upSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_ALL_STORE_UP);
         this.allInStoreToolButton.overSkin = AssetLibrary.getSprite(AssetConfig.MAIN_MENU_BUTTONS,AssetConfig.TOOL_ALL_STORE_OVER);
         this.selectToolCluster.addButton(ClusterButtonID.STOREALL_TOOL,this.allInStoreToolButton,SELECT_TOOL_CLUSTER_POSITION[5]);
         this.allInStoreToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OVER,this.handleAllStoreMouseOver);
         this.allInStoreToolButton.hitArea.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this.selectToolCluster.addEventListener(ButtonClusterEvent.CLUSTER_BUTTON_CLICK,this.handleClusterClick);
         this.selectToolCluster.hide();
      }
      
      private function handleClusterClick(param1:ButtonClusterEvent) : void
      {
         sendNotification(SHOP.CANCEL_SHOP_ITEM_DRAG);
         switch(param1.buttonID)
         {
            case ClusterButtonID.SELECT_TOOL:
               sendNotification(GUINote.ACTIVATE_SELECT_SUBTOOL);
               break;
            case ClusterButtonID.ROTATE_TOOL:
               sendNotification(GUINote.ACTIVATE_ROTATE_SUBTOOL);
               break;
            case ClusterButtonID.MOVE_TOOL:
               sendNotification(GUINote.ACTIVATE_MOVE_SUBTOOL);
               break;
            case ClusterButtonID.SELL_TOOL:
               sendNotification(GUINote.ACTIVATE_SELL_SUBTOOL);
               break;
            case ClusterButtonID.STORE_TOOL:
               sendNotification(GUINote.ACTIVATE_STORE_SUBTOOL);
               break;
            case ClusterButtonID.STOREALL_TOOL:
               sendNotification(GUINote.ACTIONALLIN_STORE_SUBTOOL);
               this.sendAllInStore();
         }
         this.selectToolCluster.hide();
      }
      
      public function get mainMenu() : MainMenu
      {
         return this.getViewComponent() as MainMenu;
      }
   }
}

