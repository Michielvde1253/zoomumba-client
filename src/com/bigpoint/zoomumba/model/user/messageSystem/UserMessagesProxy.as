package com.bigpoint.zoomumba.model.user.messageSystem
{
   import com.bigpoint.zoomumba.constants.Note;
   import mx.collections.ArrayCollection;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class UserMessagesProxy extends Proxy
   {
      public static const NAME:String = "UserMessagesProxy";
      
      private var _inbox:ArrayCollection;
      
      private var _inboxCount:int;
      
      private var _inboxUnreadCount:int;
      
      private var _outbox:ArrayCollection;
      
      private var _outboxCount:int;
      
      private var _outboxUnreadCount:int;
      
      public function UserMessagesProxy()
      {
         super(NAME,null);
      }
      
      public function get outboxUnreadCount() : int
      {
         return this._outboxUnreadCount;
      }
      
      public function get inboxUnreadCount() : int
      {
         return this._inboxUnreadCount;
      }
      
      public function get outboxCount() : int
      {
         return this._outboxCount;
      }
      
      public function get inboxCount() : int
      {
         return this._inboxCount;
      }
      
      public function setInbox(param1:ArrayCollection) : void
      {
         this._inbox = param1;
         sendNotification(Note.MAIL_UPDATE_INBOX);
      }
      
      public function setInboxCount(param1:int) : void
      {
         this._inboxCount = param1;
      }
      
      public function setInboxUnreadCount(param1:int) : void
      {
         this._inboxUnreadCount = param1;
      }
      
      public function getInbox() : ArrayCollection
      {
         return this._inbox;
      }
      
      public function setOutbox(param1:ArrayCollection) : void
      {
         this._outbox = param1;
         sendNotification(Note.MAIL_UPDATE_OUTBOX);
      }
      
      public function setOutboxCount(param1:int) : void
      {
         this._outboxCount = param1;
      }
      
      public function setOutboxUnreadCount(param1:int) : void
      {
         this._outboxUnreadCount = param1;
      }
      
      public function getOutbox() : ArrayCollection
      {
         return this._outbox;
      }
      
      public function markAsReadInbox(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._inbox.length)
         {
            if(this._inbox[_loc2_]["id"] == param1)
            {
               this._inbox[_loc2_]["status"] = 1;
               break;
            }
            _loc2_++;
         }
         sendNotification(Note.MAIL_UPDATE_INBOX);
      }
      
      public function markAsReadOutbox(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._outbox.length)
         {
            if(this._outbox[_loc2_]["id"] == param1)
            {
               this._outbox[_loc2_]["status"] = 1;
               break;
            }
            _loc2_++;
         }
         sendNotification(Note.MAIL_UPDATE_OUTBOX);
      }
   }
}

