package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StoreAllItemsCommand extends SimpleCommand
   {
      public function StoreAllItemsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc4_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc5_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         if(_loc3_.hasPlayFieldId(_loc2_) && _loc5_.allowOtherCommands)
         {
            sendNotification(Note.STORE_ALL_PLAYFIELD_ITEMS);
            sendNotification(Note.SHOW_LOADER_LAYER);
            sendNotification(Note.CHANGE_APP_MODE,AppMode.NORMAL);
            _loc4_.callServer(NET.SWITCH_PLAYFIELD,[_loc3_.getPlayFieldId(_loc2_),_loc2_]).addCallback(Note.HIDE_LOADER_LAYER).sendNow();
         }
      }
   }
}

