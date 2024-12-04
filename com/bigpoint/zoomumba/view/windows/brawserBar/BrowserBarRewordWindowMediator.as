package com.bigpoint.zoomumba.view.windows.brawserBar
{
   import com.bigpoint.zoomumba.model.windows.browserBar.BrowserToolbarInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.toolbar.BrowserBarRewordContent;
   import windows.custom.toolbar.BrowserBarRewordWindow;
   
   public class BrowserBarRewordWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BrowserBarWindowMediator";
      
      private var windowContent:BrowserBarRewordContent;
      
      public function BrowserBarRewordWindowMediator(param1:BrowserBarRewordWindow)
      {
         super(NAME,param1);
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
      
      override public function init(param1:Object) : void
      {
         var _loc2_:BrowserToolbarInitParams = param1 as BrowserToolbarInitParams;
         this.windowContent = (viewComponent as BrowserBarRewordWindow).getContent(0) as BrowserBarRewordContent;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.window.infoLayers.toolbar.title");
         this.windowContent.rewardTextStart.text = TextResourceModule.getText("zoo.window.infoLayers.toolbar.info1");
         this.windowContent.rewardAmmount.text = "+" + _loc2_.rewardPack.count;
         this.windowContent.rewardTextEnd.text = TextResourceModule.getText("zoo.window.infoLayers.toolbar.info2");
      }
      
      override public function dispose() : void
      {
      }
   }
}

