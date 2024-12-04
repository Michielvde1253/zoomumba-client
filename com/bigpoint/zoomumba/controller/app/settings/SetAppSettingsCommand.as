package com.bigpoint.zoomumba.controller.app.settings
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SetAppSettingsCommand extends SimpleCommand
   {
      public function SetAppSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         var _loc3_:AppSettingsVO = param1.getBody() as AppSettingsVO;
         _loc2_.storeData(_loc3_);
         sendNotification(Note.APP_SETTINGS_STORED);
         sendNotification(Note.UPDATE_APP_SETTINGS,_loc3_);
      }
   }
}

