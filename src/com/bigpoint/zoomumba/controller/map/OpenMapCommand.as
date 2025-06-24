package com.bigpoint.zoomumba.controller.map
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.view.features.map.MapFullScreenMediator;
   import com.bigpoint.zoomumba.view.features.map.config.vo.LastVisitVo;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenMapCommand extends SimpleCommand
   {
      public function OpenMapCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
         var _loc3_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         var _loc4_:String = _loc3_.currentAppMode;
         var _loc5_:int = _loc2_.activePlayfieldType;
         var _loc6_:LastVisitVo = new LastVisitVo(_loc4_,_loc5_);
         sendNotification(Note.HIDE_SETTINGSMENU);
         sendNotification(Note.HIDE_GRID);
         sendNotification(Note.HIDE_COLLECTABLES_PANEL);
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
         sendNotification(Note.CHANGE_APP_MODE,AppMode.MAP_OVERVIEW);
         (facade.retrieveMediator(MapFullScreenMediator.NAME) as MapFullScreenMediator).show(_loc6_);
         sendNotification(Note.HIDE_LOADER_LAYER);
      }
   }
}

