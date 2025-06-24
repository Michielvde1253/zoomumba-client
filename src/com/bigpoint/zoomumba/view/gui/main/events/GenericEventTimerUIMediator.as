package com.bigpoint.zoomumba.view.gui.main.events
{
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import custom.mainInterface.genericUI.GenericEventTimerUI;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class GenericEventTimerUIMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "GenericEventTimerUIMediator";
      
      private var appProxy:AppProxy;
      
      private var eventProxy:GlobalEventProxy;
      
      private var swfAsset:SWFAsset;
      
      public function GenericEventTimerUIMediator(param1:GenericEventTimerUI)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.genericEventTimerUI.eventsList.dataProvider = this.eventProxy.getActiveEventsWithViewableTimers();
         this.genericEventTimerUI.top = this.eventProxy.genericGUIConfigHandler.top - 20;
         this.genericEventTimerUI.left = this.eventProxy.genericGUIConfigHandler.left;
      }
      
      public function get genericEventTimerUI() : GenericEventTimerUI
      {
         return this.getViewComponent() as GenericEventTimerUI;
      }
   }
}

