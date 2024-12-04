package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoorama.Settings;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AppCloseCommand extends SimpleCommand
   {
      public function AppCloseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
         var _loc2_:String = "/index.php?action=externalLogout&aid=" + Settings.AID + "&aip=" + Settings.AIP;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         navigateToURL(_loc3_,"_self");
      }
   }
}

