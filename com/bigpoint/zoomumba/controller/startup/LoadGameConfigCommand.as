package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.NET;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class LoadGameConfigCommand extends SimpleCommand
   {
      public function LoadGameConfigCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(NET.GET_CONFIG);
      }
   }
}

