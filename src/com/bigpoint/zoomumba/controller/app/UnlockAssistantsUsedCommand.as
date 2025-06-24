package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UnlockAssistantsUsedCommand extends SimpleCommand
   {
      public function UnlockAssistantsUsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         _loc2_.allowOtherCommands = true;
      }
   }
}

