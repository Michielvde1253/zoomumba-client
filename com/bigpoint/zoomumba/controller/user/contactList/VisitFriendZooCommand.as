package com.bigpoint.zoomumba.controller.user.contactList
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.view.gui.main.MainPanelMediator;
   import com.bigpoint.zoomumba.view.windows.friends.FriendZooMenuMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   import windows.custom.friends.FriendZooMenu;
   
   public class VisitFriendZooCommand extends SimpleCommand
   {
      public function VisitFriendZooCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:FriendsCardData = param1.getBody() as FriendsCardData;
         var _loc3_:FriendZooMenu = new FriendZooMenu();
         var _loc4_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc5_:MainPanelMediator = facade.retrieveMediator(MainPanelMediator.NAME) as MainPanelMediator;
         _loc5_.mainPanel.addElement(_loc3_);
         facade.registerMediator(new FriendZooMenuMediator(_loc3_,_loc2_));
         sendNotification(Note.REMOVE_ALL_PLAYFIELD_ITEMS);
         sendNotification(Note.SHOW_LOADER_LAYER);
         sendNotification(Note.CHANGE_APP_MODE,AppMode.VISIT_NEIGHBOUR);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.DISABLE_SHORTCUTS_KEYS);
         _loc4_.callServer(NET.GET_NEIGHBOUR,[_loc2_.id]).addCallback(Note.HIDE_LOADER_LAYER).sendNow();
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
      }
   }
}

