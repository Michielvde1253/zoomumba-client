package com.bigpoint.zoomumba.view.gui.main
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.gui.main.events.GenericEventTimerUIMediator;
   import com.bigpoint.zoomumba.view.gui.main.events.GenericEventUIMediator;
   import com.bigpoint.zoomumba.view.gui.mainmenu.MainMenuMediator;
   import com.bigpoint.zoomumba.view.gui.mainmenu.SettingsMenuMediator;
   import custom.mainInterface.genericUI.GenericEventTimerUI;
   import custom.mainInterface.genericUI.GenericEventUI;
   import custom.mainMenu.MainMenu;
   import mx.core.Application;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class MainPanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "MainPanelMediator";
      
      private var genericUIEnabled:Boolean = false;
      
      private var eventTimerUIEnabled:Boolean = false;
      
      private var eventProxy:GlobalEventProxy;
      
      public function MainPanelMediator(param1:Group)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         var _loc1_:MainMenu = new MainMenu();
         facade.registerMediator(new MainMenuMediator(_loc1_));
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.mainPanel.mouseEnabled = false;
         var _loc2_:Group = new Group();
         facade.registerMediator(new SidePanelMediator(_loc2_));
         this.mainPanel.addElement(_loc2_);
         var _loc3_:Group = new Group();
         facade.registerMediator(new SettingsMenuMediator(_loc3_));
         this.mainPanel.addElement(_loc3_);
         this.handleChangeAppMode();
         var _loc4_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         sendNotification(Note.APP_RESIZED,_loc4_.application);
      }
      
      private function enableGenericGui() : void
      {
         var _loc1_:GenericEventUI = new GenericEventUI();
         facade.registerMediator(new GenericEventUIMediator(_loc1_));
         this.mainPanel.addElement(_loc1_);
      }
      
      private function enableEventTimersGui() : void
      {
         var _loc1_:GenericEventTimerUI = new GenericEventTimerUI();
         facade.registerMediator(new GenericEventTimerUIMediator(_loc1_));
         this.mainPanel.addElement(_loc1_);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.APP_RESIZED,DataNote.USER_EVENT_DATA_STORED,Note.GLOBAL_EVENT_ESTER_START,Note.GLOBAL_EVENT_ESTER_END,Note.CHANGE_APP_MODE,Note.INIT_RESPONSE,Note.ON_REGISTER_BOARDGAME,Note.ON_REGISTER_COMMUNITY_PAYIN_EVENT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Application = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         switch(param1.getName())
         {
            case Note.APP_RESIZED:
               _loc2_ = param1.getBody() as Application;
               this.mainPanel.width = _loc2_.width;
               this.mainPanel.height = _loc2_.height;
               break;
            case DataNote.USER_EVENT_DATA_STORED:
               _loc3_ = param1.getBody() as int;
               if(_loc3_ == EventTypes.EASTER_EVENT)
               {
                  this.handleChangeAppMode();
               }
               break;
            case Note.CHANGE_APP_MODE:
               this.handleChangeAppMode();
               break;
            case Note.INIT_RESPONSE:
            case Note.ON_REGISTER_BOARDGAME:
            case Note.ON_REGISTER_COMMUNITY_PAYIN_EVENT:
               _loc4_ = this.eventProxy.genericGUIConfigHandler.runningCommunityEvent;
               _loc5_ = this.eventProxy.isEventActive(_loc4_);
               if(!this.genericUIEnabled && this.eventProxy && (this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent) || this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningCommunityEvent)))
               {
                  this.enableGenericGui();
                  this.genericUIEnabled = true;
                  if(this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent))
                  {
                     this.eventProxy.boardgameProxy.registierBoardIcons();
                  }
               }
               if(!this.eventTimerUIEnabled)
               {
                  this.enableEventTimersGui();
                  this.eventTimerUIEnabled = true;
               }
         }
      }
      
      private function handleChangeAppMode() : void
      {
      }
      
      public function get mainPanel() : Group
      {
         return this.getViewComponent() as Group;
      }
   }
}

