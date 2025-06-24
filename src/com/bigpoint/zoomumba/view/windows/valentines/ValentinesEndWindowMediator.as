package com.bigpoint.zoomumba.view.windows.valentines
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.valentines.ValentiensEndWindow;
   import windows.custom.valentines.ValentinesEndContent;
   
   public class ValentinesEndWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ValentinesEndWindowMediator";
      
      private var eventProxy:GlobalEventProxy;
      
      public function ValentinesEndWindowMediator(param1:ValentiensEndWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.eventProxy = facade.getProxy(GlobalEventProxy);
         this.content.infoText.text = TextResourceModule.getText("zoo.eventValentine.layer.end");
         TimeManager.registerTickFunction(this.updateTimer);
         this.content.header.title.text = TextResourceModule.getText("zoo.window.general.attention");
      }
      
      private function updateTimer() : void
      {
         this.content.infoText.text = TextResourceModule.getText("zoo.eventValentine.layer.end") + " " + TimeFormat.secondsToTimeString(this.eventProxy.getGlobalEvent(EventTypes.VALENTINES_EVENT).endDate - TimeManager.currentTime);
      }
      
      private function get window() : ValentiensEndWindow
      {
         return this.viewComponent as ValentiensEndWindow;
      }
      
      private function get content() : ValentinesEndContent
      {
         return this.window.getContent() as ValentinesEndContent;
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
   }
}

