package com.bigpoint.zoomumba.view.windows.friends
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.friends.DeleteFriendContent;
   import windows.custom.friends.DeleteFriendWindow;
   import windows.events.WindowCustomEvent;
   
   public class DeleteFriendWindowMediator extends WindowMediator
   {
      public static const NAME:String = "DeleteFriendWindowMediator";
      
      private var _friend:FriendsCardData;
      
      private var _friendsProxy:FriendsProxy;
      
      public function DeleteFriendWindowMediator(param1:DeleteFriendWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this._friendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         this._friend = param1 as FriendsCardData;
         var _loc2_:AvatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         this.content.avatarPic.addChild(_loc2_.getAvatarSprite(this._friend.userAvatar,AvatarGeneratorProxy.SCALE_AVATAR_INFO_WINDOW));
         this.content.header.text = this._friend.name;
         this.content.userId.text = TextResourceModule.getText("zoo.user.id") + " " + this._friend.uId.toString();
         this.content.question.text = TextResourceModule.getText("zoo.slayer.friends.delete");
         this.content.level.value = this._friend.lvl;
      }
      
      override public function dispose() : void
      {
         this._friend = null;
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         sendNotification(NET.FRIENDS_CANCEL_FRIENDSHIP,[this._friend.id]);
         sendNotification(Note.INIT_PRELOADER);
         this._friendsProxy.getFriendsList(true);
         super.handleWindowConfirm(param1);
      }
      
      private function get window() : DeleteFriendWindow
      {
         return this.viewComponent as DeleteFriendWindow;
      }
      
      private function get content() : DeleteFriendContent
      {
         return this.window.getContent() as DeleteFriendContent;
      }
   }
}

