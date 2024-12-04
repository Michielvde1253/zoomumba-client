package com.bigpoint.zoomumba.controller.app.settings
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ServerStoreAppSettingsCommand extends SimpleCommand
   {
      public function ServerStoreAppSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         var _loc3_:Object = {};
         _loc3_.q = _loc2_.quality;
         _loc3_.t = _loc2_.hasTooltips;
         _loc3_.se = _loc2_.hasSoundEffects;
         _loc3_.sb = _loc2_.hasBackgroundSounds;
         _loc3_.v = _loc2_.hasVisitors;
         _loc3_.w = _loc2_.hasVisitorWishes;
         _loc3_.a = _loc2_.animationLevel;
         sendNotification(NET.SET_USER,[_loc3_]);
      }
   }
}

