package com.bigpoint.zoomumba.view.windows.mail.tabs
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.messageSystem.UserMessagesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import general.paginator.PaginatorEvent;
   import mx.collections.ArrayCollection;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.mail.MailWindow;
   import windows.custom.mail.readMail.MailReadContent;
   import windows.custom.mail.tabs.MailIOBoxTabContent;
   
   public class MailIOBoxTabMediator extends Mediator
   {
      public static const NAME:String = "MailIOBoxTabMediator";
      
      public static const TYPE_INBOX:int = 0;
      
      public static const TYPE_OUTBOX:int = 1;
      
      private var _window:MailWindow;
      
      private var _type:int = -1;
      
      private var mailProxy:UserMessagesProxy;
      
      private var netProxy:NetProxy;
      
      public function MailIOBoxTabMediator(param1:MailWindow, param2:int, param3:MailIOBoxTabContent)
      {
         this._window = param1;
         this._type = param2;
         super(NAME,param3);
      }
      
      private function get typeForPHP() : String
      {
         var _loc1_:String = "";
         switch(this._type)
         {
            case TYPE_INBOX:
               _loc1_ = "ib";
               break;
            case TYPE_OUTBOX:
               _loc1_ = "ob";
         }
         return _loc1_;
      }
      
      private function get mailBoxArray() : ArrayCollection
      {
         switch(this._type)
         {
            case TYPE_INBOX:
               return this.mailProxy.getInbox();
            case TYPE_OUTBOX:
               return this.mailProxy.getOutbox();
            default:
               return null;
         }
      }
      
      private function get mailBoxCount() : int
      {
         switch(this._type)
         {
            case TYPE_INBOX:
               return this.mailProxy.inboxCount;
            case TYPE_OUTBOX:
               return this.mailProxy.outboxCount;
            default:
               return 0;
         }
      }
      
      private function get mailBoxUnreadCount() : int
      {
         switch(this._type)
         {
            case TYPE_INBOX:
               return this.mailProxy.inboxUnreadCount;
            case TYPE_OUTBOX:
               return this.mailProxy.outboxUnreadCount;
            default:
               return 0;
         }
      }
      
      private function setMailBoxUnreadCount(param1:int) : int
      {
         switch(this._type)
         {
            case TYPE_INBOX:
               this.mailProxy.setInboxUnreadCount(param1);
               break;
            case TYPE_OUTBOX:
               this.mailProxy.setOutboxUnreadCount(param1);
         }
         return param1;
      }
      
      private function get msgObject() : Object
      {
         switch(this._type)
         {
            case TYPE_INBOX:
               return this.mailProxy.getInbox()[this.content.mailsList.selectedIndex];
            case TYPE_OUTBOX:
               return this.mailProxy.getOutbox()[this.content.mailsList.selectedIndex];
            default:
               return null;
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.MAIL_UPDATE_INBOX,Note.MAIL_UPDATE_OUTBOX,GUINote.SHOW_COMMUNITY_NORMAL_STATE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.MAIL_UPDATE_INBOX:
            case Note.MAIL_UPDATE_OUTBOX:
               this.content.mailsList.dataProvider = null;
               if(this.mailBoxArray)
               {
                  if(this.mailBoxArray.length == 0)
                  {
                     if(this.content.paginator.currentPage > 0)
                     {
                        --this.content.paginator.currentPage;
                        return;
                     }
                  }
               }
               this.content.mailsList.dataProvider = this.mailBoxArray;
               this.content.paginator.maxEntries = this.mailBoxCount;
               this.content.pagesText.text = TextResourceModule.getTextReplaced("zoo.mail.general.pagination",Vector.<TextReplace>([new TextReplace("%x%",(this.content.paginator.currentPage + 1).toString()),new TextReplace("%y%",(this.content.paginator.maxPages + 1).toString())]));
               this._window.preloaderVisibility = false;
         }
      }
      
      override public function onRegister() : void
      {
         this.mailProxy = facade.retrieveProxy(UserMessagesProxy.NAME) as UserMessagesProxy;
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this._window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("MailIcons",this.handleAssetsNeeded);
      }
      
      private function handleAssetsNeeded(param1:SWFAsset) : void
      {
         MailIOBoxTabContent.addBitmapData = param1.getEmbededBitmapData("AddFriend");
         MailIOBoxTabContent.repBitmapData = param1.getEmbededBitmapData("Message");
         MailIOBoxTabContent.delBitmapData = param1.getEmbededBitmapData("Trash");
         MailReadContent.repBitmapData = param1.getEmbededBitmapData("Reply");
         this.config();
      }
      
      private function requestServerData(param1:int, param2:int) : void
      {
         this.content.mailsList.dataProvider = null;
         this._window.preloaderVisibility = true;
         switch(this._type)
         {
            case TYPE_INBOX:
               sendNotification(NET.MAIL_GET_INBOX,[param1,param2]);
               break;
            case TYPE_OUTBOX:
               sendNotification(NET.MAIL_GET_OUTBOX,[param1,param2]);
         }
      }
      
      private function config() : void
      {
         this.content.btnFirst.label = "<<";
         this.content.btnBack.label = "<";
         this.content.btnNext.label = ">";
         this.content.btnLast.label = ">>";
         this.content.actionText.text = TextResourceModule.getText("zoo.mail.column.action");
         this.content.col2Text.text = this._type == TYPE_INBOX ? TextResourceModule.getText("zoo.mail.column.messageSender") : TextResourceModule.getText("zoo.mail.column.messageReceiver");
         this.content.subjectText.text = TextResourceModule.getText("zoo.mail.column.messageTitle");
         this.content.dateText.text = TextResourceModule.getText("zoo.mail.column.messageDate");
         MailIOBoxTabContent.addToolTip = TextResourceModule.getText("zoo.toolTip.mail.addContact");
         MailIOBoxTabContent.repToolTip = this._type == TYPE_INBOX ? TextResourceModule.getText("zoo.toolTip.mail.reply") : TextResourceModule.getText("zoo.toolTip.mail.sendMail");
         MailIOBoxTabContent.delToolTip = TextResourceModule.getText("zoo.toolTip.mail.deleteMessage");
         MailReadContent.repToolTip = MailIOBoxTabContent.repToolTip;
         this._window.addEventListener("addClicked",this.handleAddClicked);
         this._window.addEventListener("remClicked",this.handleRemoveClicked);
         this._window.addEventListener("ansClicked",this.handleAnswerClicked);
         this._window.addEventListener("readClicked",this.handleReadClicked);
         this.content.paginator.entriesPerPage = 7;
         this.content.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChanged);
         this.content.paginator.currentPage = 0;
      }
      
      private function handleAddClicked(param1:Event) : void
      {
         sendNotification(NET.FRIENDS_INVITE_FRIEND,[this.msgObject.sId]);
      }
      
      private function handleRemoveClicked(param1:Event) : void
      {
         this._window.preloaderVisibility = true;
         switch(this._type)
         {
            case TYPE_INBOX:
               this.netProxy.callServer(NET.MAIL_DELETE_ITEM,[this.msgObject.id,this.typeForPHP]).addCallback(NET.MAIL_GET_INBOX,[this.content.paginator.currentIndexPageIni,this.content.paginator.currentIndexPageEnd]).sendNow();
               break;
            case TYPE_OUTBOX:
               this.netProxy.callServer(NET.MAIL_DELETE_ITEM,[this.msgObject.id,this.typeForPHP]).addCallback(NET.MAIL_GET_OUTBOX,[this.content.paginator.currentIndexPageIni,this.content.paginator.currentIndexPageEnd]).sendNow();
         }
      }
      
      private function handleAnswerClicked(param1:Event) : void
      {
         var _loc2_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         if(_loc2_.isMyFriend(this.msgObject.sId))
         {
            sendNotification(Note.MAIL_REPLY_MESSAGE,this.msgObject.sId);
         }
         else
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.login.100.title"),TextResourceModule.getText("zoo.mail.info.writeMailError.notFriend"))));
         }
      }
      
      private function handleReadClicked(param1:Event) : void
      {
         var _loc2_:int = this.mailBoxUnreadCount;
         _loc2_--;
         this.setMailBoxUnreadCount(_loc2_);
         sendNotification(NET.MAIL_IS_READ,[this.msgObject.id]);
         sendNotification(Note.MARK_MESAGE_AS_READ,[this.msgObject.id,this._type]);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIL_READ_WINDOW,"",this.msgObject));
         if(_loc2_ === 0 && this.msgObject.status == 1)
         {
            sendNotification(GUINote.SHOW_COMMUNITY_NORMAL_STATE);
         }
      }
      
      private function handlePageChanged(param1:PaginatorEvent) : void
      {
         this.requestServerData(param1.pageFirstIndex,param1.pageLastIndex);
      }
      
      override public function onRemove() : void
      {
         this.content.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChanged);
         this._window.removeEventListener("addClicked",this.handleAddClicked);
         this._window.removeEventListener("remClicked",this.handleRemoveClicked);
         this._window.removeEventListener("ansClicked",this.handleAnswerClicked);
         this._window.removeEventListener("readClicked",this.handleReadClicked);
      }
      
      private function get content() : MailIOBoxTabContent
      {
         return viewComponent as MailIOBoxTabContent;
      }
   }
}

