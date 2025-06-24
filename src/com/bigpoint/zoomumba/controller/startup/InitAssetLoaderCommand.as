package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class InitAssetLoaderCommand extends SimpleCommand
   {
      public function InitAssetLoaderCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         sendNotification(Note.ASSET_LIBRARY_INITED);
      }
   }
}

