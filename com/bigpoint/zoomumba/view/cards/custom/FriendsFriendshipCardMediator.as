package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.cards.events.CardBottomEvent;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import flash.events.Event;
   
   public class FriendsFriendshipCardMediator extends FriendsCardBasicMediator
   {
      public static const NAME:String = "FriendsFriendshipCardMediator_";
      
      public function FriendsFriendshipCardMediator(param1:FriendsCardData)
      {
         super(param1);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.bottomGroup.currentState = "friendship";
         card.bottomGroup.btMessage.displayImg.spriteClassDisplay = new WrapedSprite("FriendsIcons","TicketButton");
         card.bottomGroup.btMessage.displayImg._standardImage.scaleX = 0.5;
         card.bottomGroup.btMessage.displayImg._standardImage.scaleY = 0.5;
         card.bottomGroup.btMessage.displayImg.automaticCentralize = false;
         card.bottomGroup.btMessage.displayImg.currentState = "normal";
         card.bottomGroup.btMessage.toolTip = TextResourceModule.getText("zoo.slayer.friends.message");
         card.bottomGroup.btVisit.displayImg.spriteClassDisplay = new WrapedSprite("FriendsIcons","VisitButton");
         card.bottomGroup.btVisit.displayImg._standardImage.scaleX = 0.5;
         card.bottomGroup.btVisit.displayImg._standardImage.scaleY = 0.5;
         card.bottomGroup.btVisit.displayImg.automaticCentralize = false;
         card.bottomGroup.btVisit.displayImg.currentState = "normal";
         card.bottomGroup.btVisit.toolTip = TextResourceModule.getText("zoo.slayer.friends.visit");
         card.bottomGroup.addEventListener(CardBottomEvent.LEFT_BUTTON_CLICKED,this.handleLeftButtonClick);
         card.bottomGroup.addEventListener(CardBottomEvent.RIGHT_BUTTON_CLICKED,this.handleRightButtonClick);
      }
      
      private function handleLeftButtonClick(param1:Event) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.FRIENDS_WINDOW,""));
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIL_WINDOW,"",{
            "tab":"sendMessage",
            "to":FriendsCardData(data).id
         }));
      }
      
      private function handleRightButtonClick(param1:Event) : void
      {
         sendNotification(FRIENDS.VISIT_FRIEND_ZOO,data);
      }
      
      override public function onRemove() : void
      {
         card.bottomGroup.removeEventListener(CardBottomEvent.LEFT_BUTTON_CLICKED,this.handleLeftButtonClick);
         card.bottomGroup.removeEventListener(CardBottomEvent.RIGHT_BUTTON_CLICKED,this.handleRightButtonClick);
         super.onRemove();
      }
   }
}

