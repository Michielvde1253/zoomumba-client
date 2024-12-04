package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.Note;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class InitCommunicationCommand extends SimpleCommand
   {
      public function InitCommunicationCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(Note.COMMUNICATION_MANAGER_INITED);
      }
   }
}

