package com.bigpoint.zoomumba.controller.app
{
   import flash.external.ExternalInterface;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenXmasCalendarCommannd extends SimpleCommand
   {
      public function OpenXmasCalendarCommannd()
      {
         super();
         if(ExternalInterface.available)
         {
            ExternalInterface.call("showAdventLayer()");
         }
      }
   }
}

