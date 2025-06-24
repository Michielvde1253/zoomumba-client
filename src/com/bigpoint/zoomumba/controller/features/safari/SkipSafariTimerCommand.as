package com.bigpoint.zoomumba.controller.features.safari
{
   import com.bigpoint.zoorama.core.feature.safari.SafariManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SkipSafariTimerCommand extends SimpleCommand
   {
      public function SkipSafariTimerCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         SafariManager(param1.getBody()).handleskipTimer();
      }
   }
}

