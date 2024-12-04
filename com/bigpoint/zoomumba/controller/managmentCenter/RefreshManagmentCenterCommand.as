package com.bigpoint.zoomumba.controller.managmentCenter
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RefreshManagmentCenterCommand extends SimpleCommand
   {
      public function RefreshManagmentCenterCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.sendNotification(Note.SHOW_LOADER_LAYER);
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.MANAGMENT_CENTER_GET,new Array()).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH_INIT_DATA).sendNow();
      }
   }
}

