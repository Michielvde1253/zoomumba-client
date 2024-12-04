package com.bigpoint.zoomumba.controller.managmentCenter
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OnRefreshInitManagmentCenterCommand extends SimpleCommand
   {
      public function OnRefreshInitManagmentCenterCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ManagmentCenterProxy = facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
         _loc2_.initNetData(param1.getBody());
         sendNotification(Note.HIDE_LOADER_LAYER);
         sendNotification(Note.MANAGMENTCENTER_UPDATE);
      }
   }
}

