package com.bigpoint.zoomumba.view.windows.quests
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windows.quests.QuestWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.questsWindow.CollectablesTabContent;
   import windows.custom.questsWindow.DailyQuestsTabContent;
   import windows.custom.questsWindow.PuzzleTabContent;
   import windows.custom.questsWindow.QuestsContentTabs;
   import windows.custom.questsWindow.QuestsWindowTabs;
   import windows.events.WindowCustomEvent;
   
   public class QuestsWindowMediator extends WindowMediator
   {
      public static const NAME:String = "QuestsWindowMediator";
      
      private var lastTabMediator:String;
      
      private var questInitParams:QuestWindowInitParams;
      
      public function QuestsWindowMediator(param1:QuestsWindowTabs)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.QUESTS_WINDOW_TAB_LOADED];
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.QUESTS_WINDOW_TAB_LOADED:
               this.window.preloaderVisibility = false;
         }
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.changeTab(param1.contentClass);
      }
      
      private function changeTab(param1:Class) : void
      {
         this.window.preloaderVisibility = true;
         if(this.lastTabMediator)
         {
            facade.removeMediator(this.lastTabMediator);
         }
         switch(param1)
         {
            case DailyQuestsTabContent:
               facade.registerMediator(new DailyQuestsTabMediator(this.window.getContent() as DailyQuestsTabContent));
               this.lastTabMediator = DailyQuestsTabMediator.NAME;
               break;
            case PuzzleTabContent:
               facade.registerMediator(new PuzzleTabMediator(this.window.getContent() as PuzzleTabContent));
               this.lastTabMediator = PuzzleTabMediator.NAME;
               if(this.questInitParams && this.questInitParams.defultTabNr == 1 && this.questInitParams.subPageId > 0)
               {
                  sendNotification(Note.OPEN_ACHIEVMENT_PAGE_BY_STAGEID,this.questInitParams.subPageId);
               }
               break;
            case CollectablesTabContent:
               facade.registerMediator(new CollectablesTabMediator(this.window.getContent() as CollectablesTabContent));
               if(this.questInitParams && this.questInitParams.defultTabNr == 2 && this.questInitParams.subPageId > 0)
               {
                  sendNotification(Note.OPEN_COLLECTABLE_PAGE_BY_SETID,this.questInitParams.subPageId);
                  this.questInitParams.subPageId = 0;
               }
               this.lastTabMediator = CollectablesTabMediator.NAME;
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.questInitParams = param1 as QuestWindowInitParams;
         if(this.questInitParams)
         {
            this.window.getTabsGroup().selectedIndex = this.questInitParams.defultTabNr;
         }
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         (this.window.getContent() as QuestsContentTabs).questsTab.label = TextResourceModule.getText("zoo.quests.tabs.daily");
         (this.window.getContent() as QuestsContentTabs).puzzleTab.label = TextResourceModule.getText("zoo.quests.tabs.achievements");
         (this.window.getContent() as QuestsContentTabs).collectablesTab.label = TextResourceModule.getText("zoo.quests.tabs.collectables");
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_quest");
      }
      
      private function get window() : QuestsWindowTabs
      {
         return this.viewComponent as QuestsWindowTabs;
      }
      
      override public function dispose() : void
      {
         if(this.lastTabMediator)
         {
            facade.removeMediator(this.lastTabMediator);
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         }
      }
   }
}

