package com.bigpoint.zoomumba.controller.ballonEvent
{
   import com.bigpoint.zoomumba.constants.Note;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RegBallonEventCommand extends SimpleCommand
   {
      public function RegBallonEventCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(Note.INIT_BALLON_MEDIATOR,null);
      }
   }
}

