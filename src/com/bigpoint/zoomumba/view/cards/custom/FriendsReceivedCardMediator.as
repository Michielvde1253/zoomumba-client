package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.cards.events.CardBottomEvent;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.card.core.AbstractCard;
   import flash.events.Event;
   
   public class FriendsReceivedCardMediator extends FriendsCardBasicMediator
   {
      public static const NAME:String = "FriendsReceivedCardMediator_";
      
      public function FriendsReceivedCardMediator(param1:FriendsCardData)
      {
         super(param1);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.bottomGroup.currentState = "invitation_received";
         card.bottomGroup.addEventListener(CardBottomEvent.LEFT_BUTTON_CLICKED,this._handleAcceptFriendship);
         card.bottomGroup.addEventListener(CardBottomEvent.RIGHT_BUTTON_CLICKED,this._handleDeclineFriendship);
         card.bottomGroup.btAccept.toolTip = TextResourceModule.getText("zoo.slayer.receivedInvites.accept");
         card.bottomGroup.btDecline.toolTip = TextResourceModule.getText("zoo.slayer.receivedInvites.deny");
      }
      
      private function _handleAcceptFriendship(param1:Event) : void
      {
         sendNotification(NET.FRIENDS_ACCEPT_FRIEND,[cardData.id]);
         sendNotification(Note.INIT_PRELOADER);
         _friendsProxy.getInvitationsReceived(true);
         _friendsProxy.getFriendsList(true);
      }
      
      private function _handleDeclineFriendship(param1:Event) : void
      {
         sendNotification(NET.FRIENDS_DECLINE_FRIEND,[cardData.id]);
         sendNotification(Note.INIT_PRELOADER);
         _friendsProxy.getInvitationsReceived(true);
      }
      
      override public function onRemove() : void
      {
         card.bottomGroup.removeEventListener(CardBottomEvent.LEFT_BUTTON_CLICKED,this._handleAcceptFriendship);
         card.bottomGroup.removeEventListener(CardBottomEvent.RIGHT_BUTTON_CLICKED,this._handleDeclineFriendship);
         super.onRemove();
      }
   }
}

