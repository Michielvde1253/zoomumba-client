package com.bigpoint.zoomumba.view.windows.mail.tabs
{
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windows.mail.MailWindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.events.IndexChangeEvent;
   import windows.custom.mail.MailWindow;
   import windows.custom.mail.tabs.MailNewTabContent;
   
   public class MailNewTabMediator extends Mediator
   {
      public static const NAME:String = "MailNewTabMediator";
      
      private var _window:MailWindow;
      
      private var replyTo:int = -1;
      
      public function MailNewTabMediator(param1:MailWindow, param2:MailNewTabContent)
      {
         this._window = param1;
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this.content.addEventListener("sendMessageClicked",this.handleSendMessageClicked);
         var _loc1_:MailWindowMediator = facade.retrieveMediator(MailWindowMediator.NAME) as MailWindowMediator;
         this.replyTo = _loc1_.replyTo;
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
         sendNotification(NET.FRIENDS_FRIENDSHIPS,[]);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.DISABLE_SHORTCUTS_KEYS);
         this.content.inputSubject.prompt = TextResourceModule.getText("zoo.mail.column.messageTitle");
         this.content.inputMessage.prompt = TextResourceModule.getText("zoo.mail.general.message");
         this.content.btnSend.label = TextResourceModule.getText("zoo.mail.general.send");
         this.content.btnSend.enabled = false;
         this.content.sendTo.addEventListener(IndexChangeEvent.CHANGE,this.handleSendToIndexChange,false,0,true);
      }
      
      private function handleSendToIndexChange(param1:IndexChangeEvent) : void
      {
         this.content.btnSend.enabled = this.content.sendTo.dataProvider.length > 0;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.MAIL_SENT,FRIENDS.SHOW_FRIENDS_LIST];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.MAIL_SENT:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.mail.info.sentOkTitle"),TextResourceModule.getText("zoo.mail.info.sentOkMessage"))));
               break;
            case FRIENDS.SHOW_FRIENDS_LIST:
               this.showWindow();
         }
      }
      
      private function showWindow() : void
      {
         var _loc1_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:int = -1;
         this.content.sendTo.prompt = TextResourceModule.getText("zoo.mail.column.messageReceiver");
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.friendList.length)
         {
            _loc2_.addItem(_loc1_.friendList[_loc4_]);
            if(this.replyTo > -1 && this.replyTo == _loc1_.friendList[_loc4_].uId)
            {
               _loc3_ = _loc4_;
            }
            _loc4_++;
         }
         this.content.sendTo.dataProvider = _loc2_;
         if(_loc2_.length > 0 && _loc3_ != -1)
         {
            this.content.sendTo.selectedIndex = _loc3_;
            this.content.btnSend.enabled = true;
         }
         this._window.preloaderVisibility = false;
      }
      
      private function handleSendMessageClicked(param1:Event) : void
      {
         if(this.content.inputSubject.text.length == 0)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.general.attention"),TextResourceModule.getText("zoo.mail.info.writeMailError.noSubject"))));
            return;
         }
         if(this.content.inputMessage.text.length == 0)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.general.attention"),TextResourceModule.getText("zoo.mail.info.writeMailError.noMessage"))));
            return;
         }
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.MAIL_SEND_BY_ID,[int(this.content.sendTo.selectedItem["uId"]),this.content.inputSubject.text,this.content.inputMessage.text]).addCallbackIfTrue(Note.MAIL_SENT).sendNow();
         this.content.inputSubject.text = "";
         this.content.inputMessage.text = "";
      }
      
      override public function onRemove() : void
      {
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.DISABLE_SHORTCUTS_KEYS);
         super.onRemove();
      }
      
      private function get content() : MailNewTabContent
      {
         return this._window.getContent() as MailNewTabContent;
      }
   }
}

