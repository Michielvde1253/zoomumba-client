package com.bigpoint.zoomumba.view.windows.mail
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.messageSystem.vo.UserMessageVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import windows.custom.mail.readMail.MailReadContent;
   import windows.custom.mail.readMail.MailReadWindow;
   
   public class MailReadWindowMediator extends WindowMediator
   {
      public static const NAME:String = "MailReadWindowMediator";
      
      private var message:UserMessageVO;
      
      public function MailReadWindowMediator(param1:MailReadWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.message = param1 as UserMessageVO;
         var _loc2_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         if(_loc2_.userId == this.message.sId)
         {
            this.content.messageFrom.text = TextResourceModule.getText("zoo.mail.general.userSent").replace("%user%",this.message.rName);
         }
         else
         {
            this.content.messageFrom.text = TextResourceModule.getText("zoo.mail.general.userWrote").replace("%user%",this.message.sName);
         }
         this.content.message.text = this.message.head + ",\n\n" + this.message.body;
         this.content.replyButton.visible = this.message.inbox;
         this.content.addEventListener("replyButtonClicked",this.handleReplyClicked);
         this.content.header.text = TextResourceModule.getText("zoo.mail.general.message");
      }
      
      private function handleReplyClicked(param1:Event) : void
      {
         var _loc2_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         var _loc3_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         var _loc4_:int = this.message.sId;
         if(_loc3_.userId == this.message.sId)
         {
            _loc4_ = this.message.rId;
         }
         if(_loc2_.isMyFriend(_loc4_))
         {
            sendNotification(Note.MAIL_REPLY_MESSAGE,_loc4_);
         }
         else
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.login.100.title"),TextResourceModule.getText("zoo.mail.info.writeMailError.notFriend"))));
         }
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.MAIL_READ_WINDOW));
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("replyButtonClicked",this.handleReplyClicked);
      }
      
      private function get content() : MailReadContent
      {
         return this.window.getContent() as MailReadContent;
      }
      
      private function get window() : MailReadWindow
      {
         return this.viewComponent as MailReadWindow;
      }
   }
}

