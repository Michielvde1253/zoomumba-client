package com.bigpoint.zoomumba.model.user.contactList
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.ResponseName;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsTabs;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class FriendsProxy extends Proxy
   {
      public static const NAME:String = "FriendsProxy";
      
      private var _currentPage:int = 0;
      
      private var _currentTab:int = 0;
      
      private var _friendsList:Vector.<FriendsCardData>;
      
      private var _invitationsReceived:Vector.<FriendsCardData>;
      
      private var _reload:Boolean = false;
      
      private var _lastOpenedTab:int = 0;
      
      private var _invitationsSent:Vector.<FriendsCardData>;
      
      public var resetInvitationList:Boolean = false;
      
      public function FriendsProxy()
      {
         super(NAME,null);
      }
      
      public function getFriendsList(param1:Boolean = false) : void
      {
         if(param1 || !this._friendsList)
         {
            sendNotification(NET.FRIENDS_FRIENDSHIPS);
         }
         else
         {
            sendNotification(FRIENDS.SHOW_FRIENDS_LIST,this._friendsList);
         }
      }
      
      public function getInvitationsReceived(param1:Boolean = false) : void
      {
         if(param1 || !this._invitationsReceived)
         {
            sendNotification(NET.FRIENDS_INVITATIONS_RECEIVED);
         }
         else
         {
            sendNotification(FRIENDS.SHOW_RECEIVED_INVITATIONS,this._invitationsReceived);
         }
      }
      
      public function getInvitationsSent(param1:Boolean = false) : void
      {
         if(param1 || !this._invitationsSent || this.resetInvitationList)
         {
            sendNotification(NET.FRIENDS_INVITATIONS_SENT);
            this.resetInvitationList = false;
         }
         else
         {
            sendNotification(FRIENDS.SHOW_SENT_INVITATIONS,this._invitationsSent);
         }
      }
      
      public function isMyFriend(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this._friendsList.length)
         {
            if(this._friendsList[_loc3_].uId == param1)
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setFriendsData(param1:String, param2:Object) : void
      {
         switch(param1)
         {
            case ResponseName.FRIENDS_LIST:
               this._friendsList = this._parseFriendList(param2,ItemInternalTypes.FRIEND);
               this.getFriendsList();
               break;
            case ResponseName.FRIENDS_RECEIVED_INVITATIONS:
               this._invitationsReceived = this._parseFriendList(param2,ItemInternalTypes.FRIEND_RECEIVED);
               this.getInvitationsReceived();
               break;
            case ResponseName.FRIENDS_SENT_INVITATIONS:
               this._invitationsSent = this._parseFriendList(param2,ItemInternalTypes.FRIEND_SENT);
               this.getInvitationsSent();
         }
      }
      
      private function _parseFriendList(param1:Object, param2:int) : Vector.<FriendsCardData>
      {
         var _loc4_:String = null;
         var _loc5_:FriendsCardData = null;
         var _loc3_:Vector.<FriendsCardData> = new Vector.<FriendsCardData>();
         for(_loc4_ in param1)
         {
            _loc5_ = new FriendsCardData();
            ObjectHelper.copyData(_loc5_,param1[_loc4_]);
            _loc5_.internalType = param2;
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      public function get friendList() : Vector.<FriendsCardData>
      {
         if(this._friendsList)
         {
            return this._friendsList;
         }
         return new Vector.<FriendsCardData>();
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set currentPage(param1:int) : void
      {
         this._currentPage = param1;
      }
      
      public function get currentTab() : int
      {
         if(this._currentTab != FriendsTabs.FRIENDS_LIST)
         {
            return this._currentTab;
         }
         return FriendsTabs.FRIENDS_LIST;
      }
      
      public function set currentTab(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         if(this.currentTab != param1)
         {
            this.currentPage = 0;
         }
         this._currentTab = param1;
      }
   }
}

