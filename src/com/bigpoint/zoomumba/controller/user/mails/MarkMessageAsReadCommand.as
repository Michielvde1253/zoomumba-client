package com.bigpoint.zoomumba.controller.user.mails
{
   import com.bigpoint.zoomumba.model.user.messageSystem.UserMessagesProxy;
   import com.bigpoint.zoomumba.view.windows.mail.tabs.MailIOBoxTabMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class MarkMessageAsReadCommand extends SimpleCommand
   {
      public function MarkMessageAsReadCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = int((param1.getBody() as Array)[0]);
         var _loc3_:int = int((param1.getBody() as Array)[1]);
         var _loc4_:UserMessagesProxy = facade.retrieveProxy(UserMessagesProxy.NAME) as UserMessagesProxy;
         switch(_loc3_)
         {
            case MailIOBoxTabMediator.TYPE_INBOX:
               _loc4_.markAsReadInbox(_loc2_);
               break;
            case MailIOBoxTabMediator.TYPE_OUTBOX:
               _loc4_.markAsReadOutbox(_loc2_);
         }
      }
   }
}

