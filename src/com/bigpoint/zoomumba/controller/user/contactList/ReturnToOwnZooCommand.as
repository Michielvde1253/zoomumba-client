package com.bigpoint.zoomumba.controller.user.contactList
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.view.gui.main.MainPanelMediator;
   import com.bigpoint.zoomumba.view.windows.friends.FriendZooMenuMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ReturnToOwnZooCommand extends SimpleCommand
   {
      public function ReturnToOwnZooCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         sendNotification(Note.REMOVE_ALL_PLAYFIELD_ITEMS);
         sendNotification(Note.SHOW_LOADER_LAYER);
         sendNotification(Note.CHANGE_APP_MODE,AppMode.NORMAL);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.ENABLE_ALL_KEYS);
         _loc2_.callServer(NET.GET_USER,[]).addCallback(Note.HIDE_LOADER_LAYER).sendNow();
         var _loc3_:FriendZooMenuMediator = facade.retrieveMediator(FriendZooMenuMediator.NAME) as FriendZooMenuMediator;
         var _loc4_:MainPanelMediator = facade.retrieveMediator(MainPanelMediator.NAME) as MainPanelMediator;
         _loc4_.mainPanel.removeElement(_loc3_.content);
         facade.removeMediator(FriendZooMenuMediator.NAME);
      }
   }
}

