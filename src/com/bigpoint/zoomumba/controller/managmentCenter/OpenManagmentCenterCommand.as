package com.bigpoint.zoomumba.controller.managmentCenter
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenManagmentCenterCommand extends SimpleCommand
   {
      public function OpenManagmentCenterCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         sendNotification(Note.REMOVE_ALL_PLAYFIELD_ITEMS);
         sendNotification(Note.SHOW_LOADER_LAYER);
         sendNotification(Note.HIDE_SETTINGSMENU);
         _loc2_.callServer(NET.MANAGMENT_CENTER_GET,new Array()).addCallback(Note.HIDE_LOADER_LAYER).addCallbackIfTrue(Note.MANAGMENTCENTER_INIT_DATA).sendNow();
      }
   }
}

