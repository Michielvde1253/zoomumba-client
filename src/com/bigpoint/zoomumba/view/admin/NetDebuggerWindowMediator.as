package com.bigpoint.zoomumba.view.admin
{
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.view.admin.components.NetDebugger;
   import com.bigpoint.zoomumba.view.gui.header.HeaderPanelMediator;
   import mx.managers.PopUpManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class NetDebuggerWindowMediator extends Mediator
   {
      public static const NAME:String = "NetDebuggerWindowMediator";
      
      private var visible:Boolean = false;
      
      private var netDebugger:NetDebugger;
      
      public function NetDebuggerWindowMediator()
      {
         super(NAME,null);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ADMIN.TOGGLE_NET_DEBUGGER,ADMIN.LOG_NET_COMMAND];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ADMIN.TOGGLE_NET_DEBUGGER:
               this.toggleDebugger();
               break;
            case ADMIN.LOG_NET_COMMAND:
               if(Boolean(this.netDebugger) && this.visible)
               {
                  this.netDebugger.netDebugger.text += String(param1.getBody()) + "\n";
                  this.netDebugger.netDebugger.scrollToRange(int.MAX_VALUE);
               }
         }
      }
      
      private function toggleDebugger() : void
      {
         var _loc1_:HeaderPanelMediator = null;
         if(this.visible)
         {
            PopUpManager.removePopUp(this.netDebugger);
            this.visible = false;
         }
         else
         {
            _loc1_ = facade.retrieveMediator(HeaderPanelMediator.NAME) as HeaderPanelMediator;
            this.netDebugger = PopUpManager.createPopUp(_loc1_.getViewComponent() as Group,NetDebugger,false) as NetDebugger;
            this.visible = true;
         }
      }
   }
}

