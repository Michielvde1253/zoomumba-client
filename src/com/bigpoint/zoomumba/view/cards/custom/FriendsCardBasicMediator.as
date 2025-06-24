package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardToggleChangeEvent;
   import org.puremvc.as3.interfaces.INotification;
   
   public class FriendsCardBasicMediator extends BaseCardMediator
   {
      public static const NAME:String = "FriendsCardBasicMediator_";
      
      public var cardData:FriendsCardData;
      
      protected var _friendsProxy:FriendsProxy;
      
      public function FriendsCardBasicMediator(param1:FriendsCardData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRegister() : void
      {
         this._friendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         if(card.hasEventListener(CardToggleChangeEvent.CHANGED))
         {
            card.removeEventListener(CardToggleChangeEvent.CHANGED,this.changeAsset);
         }
         super.onRemove();
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
         card.topGroup.currentState = "friends";
         card.topGroup.userLevel.value = this.cardData.lvl;
      }
      
      override protected function loadImageAsset() : void
      {
         var _loc1_:AvatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         var _loc2_:AvatarProxy = facade.retrieveProxy(AvatarProxy.NAME) as AvatarProxy;
         card.addContent(_loc1_.getAvatarSprite(this.cardData.userAvatar,AvatarGeneratorProxy.SCALE_AVATAR_CARD));
      }
      
      override protected function setCardInfo() : void
      {
      }
      
      override protected function setCardName() : void
      {
         this.cardData.localisedTitle = this.cardData.name;
         super.setCardName();
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      private function changeAsset(param1:CardToggleChangeEvent) : void
      {
      }
   }
}

