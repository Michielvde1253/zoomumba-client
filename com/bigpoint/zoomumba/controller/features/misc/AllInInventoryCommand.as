package com.bigpoint.zoomumba.controller.features.misc
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AllInInventoryCommand extends SimpleCommand
   {
      public function AllInInventoryCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         sendNotification(Note.SHOW_LOADER_LAYER);
         _loc3_.callServer(NET.MOVE_ITEMS_TO_INVENTORY,new Array()).addCallbackIfTrue(Note.ALL_ITEMS_MOVED_TO_INVENTORY,_loc2_.activePlayfieldType).sendNow();
      }
   }
}

