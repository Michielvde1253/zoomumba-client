package com.bigpoint.zoomumba.view.windows.settings.tabMediators
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.settings.tabs.SettingsAccountTabContent;
   
   public class SettingsAccountTabMediator extends Mediator
   {
      public static const NAME:String = "SettingsAccountTabMediator";
      
      public function SettingsAccountTabMediator(param1:SettingsAccountTabContent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         AssetLibrary.sendAssetToFunction(AssetConfig.SETTINGS_ASSET_FILE,this.swfLoaded);
      }
      
      private function swfLoaded(param1:SWFAsset) : void
      {
         this.content.bubbleText.htmlText = TextResourceModule.getText("zoo.window.settings.info");
         this.content.titleText.text = TextResourceModule.getText("zoo.window.settings.account.title");
         this.content.infoText.text = TextResourceModule.getText("zoo.window.settings.account.info");
         this.content.button.label = TextResourceModule.getText("zoo.window.settings.button.account");
         this.content.bubbleBitmapImage.source = param1.getEmbededObject("Bubble");
         this.content.circleBitmapImage.source = param1.getEmbededObject("BgGuy");
         this.content.guyBitmapImage.source = param1.getEmbededObject("Guy");
         this.content.button.addEventListener(MouseEvent.CLICK,this.openExternalSettings);
         sendNotification(Note.SETTINGS_TAB_LOADED);
      }
      
      private function openExternalSettings(param1:MouseEvent) : void
      {
         sendNotification(Note.OPEN_EXTERNAL_SET_EMAIL);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRemove() : void
      {
         if(this.content.button.hasEventListener(MouseEvent.CLICK))
         {
            this.content.button.removeEventListener(MouseEvent.CLICK,this.openExternalSettings);
         }
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      private function get content() : SettingsAccountTabContent
      {
         return this.viewComponent as SettingsAccountTabContent;
      }
   }
}

