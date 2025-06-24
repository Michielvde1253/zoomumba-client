package com.bigpoint.zoomumba.controller.playfield.assistantActions
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UseAssistantCommand extends SimpleCommand
   {
      public function UseAssistantCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc4_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc5_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc6_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         var _loc7_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         sendNotification(Note.LOCK_ASSISTANTS_USED);
         _loc3_.callServer(NET.USE_ASSISTANT,[_loc2_]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
         var _loc8_:int = _loc3_.currentRequestId;
         _loc7_.waitForCommandId = _loc8_;
         _loc7_.setActiveAssistant(_loc8_,_loc2_);
         sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc8_);
      }
   }
}

