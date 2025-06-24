package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StopSpinWheelCommand extends SimpleCommand
   {
      public function StopSpinWheelCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
      }
   }
}

