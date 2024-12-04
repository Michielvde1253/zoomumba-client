package com.bigpoint.zoomumba.controller.user.assistants
{
   import com.bigpoint.zoomumba.constants.NET;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RejectAssistantRenewalCommand extends SimpleCommand
   {
      public function RejectAssistantRenewalCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         sendNotification(NET.CLEAR_ASSISTANT_TIMER,[_loc2_]);
      }
   }
}

