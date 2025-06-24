package com.bigpoint.zoomumba.controller.features.safari
{
   import com.bigpoint.zoorama.core.feature.safari.windows.SafariMinigameWindow;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CloseSafariGameWindowCommand extends SimpleCommand
   {
      public function CloseSafariGameWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         SafariMinigameWindow(param1.getBody()).forceCloseSafari();
      }
   }
}

