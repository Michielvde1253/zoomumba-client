package com.bigpoint.zoomumba.view.windows.settings
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.settings.AIDProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.settings.tabMediators.SettingsAccountTabMediator;
   import com.bigpoint.zoomumba.view.windows.settings.tabMediators.SettingsBuildingsTabMediator;
   import com.bigpoint.zoomumba.view.windows.settings.tabMediators.SettingsConfigTabMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionContent;
   import windows.custom.settings.SettingsContent;
   import windows.custom.settings.SettingsWindow;
   import windows.custom.settings.tabs.SettingsAccountTabContent;
   import windows.custom.settings.tabs.SettingsConfigTabContent;
   import windows.events.WindowCustomEvent;
   
   public class SettingsWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SettingsWindowMediator";
      
      private var _lastTabMediator:String = null;
      
      public function SettingsWindowMediator(param1:SettingsWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SETTINGS_TAB_LOADED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.SETTINGS_TAB_LOADED:
               this.window.preloaderVisibility = false;
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.window.getTabsGroup().selectedIndex = 1;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_settings");
         var _loc3_:AIDProxy = facade.retrieveProxy(AIDProxy.NAME) as AIDProxy;
         if(!_loc3_.userDataChange_enabled)
         {
            (this.window.getContent() as SettingsContent).accountTab.mouseEnabled = false;
            (this.window.getContent() as SettingsContent).accountTab.visible = false;
         }
         (this.window.getContent() as SettingsContent).accountTab.label = TextResourceModule.getText("zoo.window.settings.tab.account");
         (this.window.getContent() as SettingsContent).configTab.label = TextResourceModule.getText("zoo.window.settings.tab.config");
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = true;
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
         }
         switch(param1.contentClass)
         {
            case SettingsAccountTabContent:
               this.window.okButtonVisibility = false;
               facade.registerMediator(new SettingsAccountTabMediator(this.window.getContent() as SettingsAccountTabContent));
               this._lastTabMediator = SettingsAccountTabMediator.NAME;
               break;
            case SettingsConfigTabContent:
               this.window.okButtonVisibility = true;
               facade.registerMediator(new SettingsConfigTabMediator(this.window.getContent() as SettingsConfigTabContent));
               this._lastTabMediator = SettingsConfigTabMediator.NAME;
               break;
            case MainBuildingSelectionContent:
               this.window.okButtonVisibility = true;
               facade.registerMediator(new SettingsBuildingsTabMediator(this.window.getContent() as MainBuildingSelectionContent));
               this._lastTabMediator = SettingsBuildingsTabMediator.NAME;
         }
      }
      
      private function get window() : SettingsWindow
      {
         return this.viewComponent as SettingsWindow;
      }
      
      override public function dispose() : void
      {
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         }
      }
   }
}

