package com.bigpoint.zoomumba.controller.managmentCenter
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OnInitManagmentCenterCommand extends SimpleCommand
   {
      public function OnInitManagmentCenterCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ManagmentCenterProxy = facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
         _loc2_.initNetData(param1.getBody());
         sendNotification(Note.CHANGE_APP_MODE,AppMode.MANAGMENT_CENTER);
         sendNotification(Note.MANAGMENTCENTER_SHOW);
         sendNotification(Note.HIDE_LOADER_LAYER);
      }
   }
}

