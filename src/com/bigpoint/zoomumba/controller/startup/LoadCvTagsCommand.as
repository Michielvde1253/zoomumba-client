package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoorama.Settings;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class LoadCvTagsCommand extends SimpleCommand
   {
      public function LoadCvTagsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(NET.GET_CV_LIST,[Settings.LANGUAGE]);
      }
   }
}

