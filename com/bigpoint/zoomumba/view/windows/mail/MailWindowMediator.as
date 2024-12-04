package com.bigpoint.zoomumba.view.windows.mail
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.mail.tabs.MailIOBoxTabMediator;
   import com.bigpoint.zoomumba.view.windows.mail.tabs.MailNewTabMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.mail.MailContent;
   import windows.custom.mail.MailWindow;
   import windows.custom.mail.tabs.MailIOBoxTabContent;
   import windows.custom.mail.tabs.MailNewTabContent;
   import windows.events.WindowCustomEvent;
   
   public class MailWindowMediator extends WindowMediator
   {
      public static const NAME:String = "MailWindowMediator";
      
      private var _lastTabMediator:String = null;
      
      private var _replyTo:int = -1;
      
      private var netHelperProxy:NetHelperProxy;
      
      public function MailWindowMediator(param1:MailWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.MAIL_REPLY_MESSAGE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.MAIL_REPLY_MESSAGE:
               this.switchTabToNewMessage(param1.getBody() as int);
         }
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.content.inbox.label = TextResourceModule.getText("zoo.mail.tabs.inbox");
         this.content.outbox.label = TextResourceModule.getText("zoo.mail.tabs.outbox");
         this.content.create.label = TextResourceModule.getText("zoo.mail.tabs.newMail");
         if(Boolean(param1) && String(param1["tab"]) == "sendMessage")
         {
            this.window.getTabsGroup().selectedIndex = 2;
            this._replyTo = param1["to"];
         }
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_messaging");
      }
      
      private function switchTabToNewMessage(param1:int) : void
      {
         this._replyTo = param1;
         this.window.getTabsGroup().selectedIndex = 2;
      }
      
      public function get replyTo() : int
      {
         var _loc1_:int = this._replyTo;
         this._replyTo = -1;
         return _loc1_;
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = true;
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
         }
         switch(param1.contentClass)
         {
            case MailIOBoxTabContent:
               facade.registerMediator(new MailIOBoxTabMediator(this.window,this.window.getTabsGroup().selectedIndex,this.window.getContent() as MailIOBoxTabContent));
               this._lastTabMediator = MailIOBoxTabMediator.NAME;
               break;
            case MailNewTabContent:
               facade.registerMediator(new MailNewTabMediator(this.window,this.window.getContent() as MailNewTabContent));
               this._lastTabMediator = MailNewTabMediator.NAME;
         }
      }
      
      override public function dispose() : void
      {
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         }
      }
      
      private function get window() : MailWindow
      {
         return this.viewComponent as MailWindow;
      }
      
      private function get content() : MailContent
      {
         return this.window.getContent() as MailContent;
      }
   }
}

