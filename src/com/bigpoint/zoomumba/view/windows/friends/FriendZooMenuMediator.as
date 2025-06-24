package com.bigpoint.zoomumba.view.windows.friends
{
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.friends.FriendZooMenu;
   
   public class FriendZooMenuMediator extends Mediator
   {
      public static const NAME:String = "FriendZooMenuMediator";
      
      private var _friendInfo:FriendsCardData;
      
      public function FriendZooMenuMediator(param1:FriendZooMenu, param2:FriendsCardData)
      {
         super(NAME,param1);
         this._friendInfo = param2;
      }
      
      override public function onRegister() : void
      {
         var _loc1_:AvatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         this.content.avatarPic.addChild(_loc1_.getAvatarSprite(this._friendInfo.userAvatar,AvatarGeneratorProxy.SCALE_AVATAR_VISIT_FRIEND));
         this.content.btBackToZoo.displayImg.spriteClassDisplay = new WrapedSprite("FriendsIcons","BackToZoo");
         this.content.addEventListener(FRIENDS.RETURN_TO_OWN_ZOO,this.handleReturnToOwnZoo);
         this.content.username.value = this._friendInfo.uName;
      }
      
      private function handleReturnToOwnZoo(param1:Event) : void
      {
         sendNotification(FRIENDS.RETURN_TO_OWN_ZOO);
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener(FRIENDS.RETURN_TO_OWN_ZOO,this.handleReturnToOwnZoo);
      }
      
      public function get content() : FriendZooMenu
      {
         return viewComponent as FriendZooMenu;
      }
   }
}

