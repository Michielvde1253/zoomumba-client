package com.bigpoint.zoomumba.view.windows.friends
{
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import windows.custom.friends.FriendInfoContent;
   import windows.custom.friends.FriendInfoWindow;
   
   public class FriendInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "FriendInfoWindowMediator";
      
      private var _friend:FriendsCardData;
      
      private var SpriteClass:Class = FriendInfoWindowMediator_SpriteClass;
      
      public function FriendInfoWindowMediator(param1:FriendInfoWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         AssetLibrary.sendAssetToFunction("WoodLath",this.handleWoodLath);
         this._friend = param1 as FriendsCardData;
         var _loc2_:AvatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         this.content.avatarPic.addChild(_loc2_.getAvatarSprite(this._friend.userAvatar,AvatarGeneratorProxy.SCALE_AVATAR_INFO_WINDOW));
         this.content.header.text = this._friend.name;
         this.content.level.value = this._friend.lvl;
         this.content.userId.text = TextResourceModule.getText("zoo.user.id") + " " + this._friend.uId.toString();
         this.content.messageButton.displayImg.spriteClassDisplay = new WrapedSprite("FriendsIcons","TicketButton");
         this.content.messageButton.displayImg.automaticCentralize = false;
         this.content.messageButton.displayImg.currentState = "normal";
         this.content.messageButton.toolTip = TextResourceModule.getText("zoo.slayer.friends.message");
         this.content.visitZooButton.displayImg.spriteClassDisplay = new WrapedSprite("FriendsIcons","VisitButton");
         this.content.visitZooButton.displayImg.automaticCentralize = false;
         this.content.visitZooButton.displayImg.currentState = "normal";
         this.content.visitZooButton.toolTip = TextResourceModule.getText("zoo.slayer.friends.visit");
         this.content.deleteButton.displayImg.spriteClassDisplay = new this.SpriteClass();
         this.content.deleteButton.displayImg.automaticCentralize = false;
         this.content.deleteButton.displayImg.currentState = "normal";
         this.content.deleteButton.displayImg.scaleX = 0.68;
         this.content.deleteButton.displayImg.scaleY = 0.68;
         this.content.deleteButton.toolTip = TextResourceModule.getText("zoo.slayer.friends.delete");
         this.content.deleteButton.visible = ItemInternalTypes.FRIEND == this._friend.internalType;
         if(this._friend.internalType == ItemInternalTypes.FRIEND_SENT)
         {
            this.content.messageButton.visible = false;
            this.content.visitZooButton.visible = false;
         }
         this.content.addEventListener("deleteFriend",this.handleDeleteFriend);
         this.content.addEventListener("visitFriend",this.handleVisitFriend);
         this.content.addEventListener("messageFriend",this.handleMessageFriend);
      }
      
      private function handleMessageFriend(param1:Event) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.FRIENDS_WINDOW,""));
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIL_WINDOW,"",{
            "tab":"sendMessage",
            "to":this._friend.uId
         }));
      }
      
      private function handleVisitFriend(param1:Event) : void
      {
         sendNotification(FRIENDS.VISIT_FRIEND_ZOO,this._friend);
      }
      
      private function handleDeleteFriend(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.DELETE_FRIEND_WINDOW,"",this._friend));
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.FRIEND_INFO_WINDOW));
      }
      
      private function handleWoodLath(param1:SWFAsset) : void
      {
         this.content.line = param1.getEmbededBitmapData("WoodLath");
      }
      
      override public function dispose() : void
      {
         this.content.removeEventListener("deleteFriend",this.handleDeleteFriend);
         this.content.removeEventListener("visitFriend",this.handleVisitFriend);
         this.content.removeEventListener("messageFriend",this.handleMessageFriend);
         this._friend = null;
      }
      
      private function get window() : FriendInfoWindow
      {
         return this.viewComponent as FriendInfoWindow;
      }
      
      private function get content() : FriendInfoContent
      {
         return this.window.getContent() as FriendInfoContent;
      }
   }
}

