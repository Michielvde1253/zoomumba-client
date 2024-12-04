package com.bigpoint.zoomumba.controller.debug
{
   import com.bigpoint.zoorama.Settings;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ErrorReportCommand extends SimpleCommand
   {
      public function ErrorReportCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         if(Settings.isLocal)
         {
         }
      }
   }
}

