package com.bigpoint.zoomumba.view.windows.friends
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.events.ItemClickEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.friends.InviteFriendContent;
   import windows.custom.friends.InviteFriendWindow;
   import windows.events.WindowCustomEvent;
   
   public class InviteFriendWindowMediator extends WindowMediator
   {
      public static const NAME:String = "InviteFriendWindowMediator";
      
      private var dataProvider:ArrayCollection;
      
      public function InviteFriendWindowMediator(param1:InviteFriendWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.content.header.text = TextResourceModule.getText("zoo.slayer.add.title");
         this.content.description.htmlText = TextResourceModule.getText("zoo.slayer.add.byName.message");
         this.content.descriptionMultipleFound.text = TextResourceModule.getText("zoo.slayer.add.duplicated.message");
         this.content.addEventListener("searchIdByName",this.handleSearchIdByName);
         this.content.userList.addEventListener("addUserById",this.handleAddUserById);
         this.content.username.prompt = TextResourceModule.getText("zoo.user.name");
         this.content.usernameGradient.text = TextResourceModule.getText("zoo.user.name");
         this.content.levelGradient.text = TextResourceModule.getText("zoo.mail.column.level");
         this.content.userIdGradient.text = TextResourceModule.getText("zoo.user.id");
      }
      
      private function handleAddUserById(param1:Event) : void
      {
         var _loc2_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         _loc2_.resetInvitationList = true;
         this.content.multipleChoiceState.visible = false;
         this.content.searchUsername.visible = true;
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc3_.callServer(NET.FRIENDS_INVITE_FRIEND,[FriendsCardData(this.dataProvider[this.content.userList.selectedIndex]).uId]).addCallbackIfTrue(Note.FRIEND_ADDED_SUCCESS,FriendsCardData(this.dataProvider[this.content.userList.selectedIndex]).uName).addCallbackIfFalse(Note.FRIEND_ADDED_FAILED).sendNow();
      }
      
      private function handleSearchIdByName(param1:Event) : void
      {
         if(this.content.username.text.length > 0)
         {
            this.content.okButton.visible = false;
            this.content.username.enabled = false;
            this.content.preloaderImage.visible = true;
            sendNotification(NET.SEARCH_USER_BY_NAME,[this.content.username.text]);
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SEARCH_USER_BY_NAME_RESPONSE,Note.FRIEND_ADDED_SUCCESS,Note.FRIEND_ADDED_FAILED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.SEARCH_USER_BY_NAME_RESPONSE:
               this.handleResponse(param1.getBody() as Vector.<FriendsCardData>);
               break;
            case Note.FRIEND_ADDED_SUCCESS:
               this.friendAddedSuccess(param1.getBody() as String);
               break;
            case Note.FRIEND_ADDED_FAILED:
               this.friendAddedFailed(param1.getBody() as String);
         }
      }
      
      private function friendAddedFailed(param1:String) : void
      {
         this.content.okButton.visible = true;
         this.content.username.enabled = true;
         this.content.preloaderImage.visible = false;
      }
      
      private function friendAddedSuccess(param1:String) : void
      {
         var _loc2_:FriendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         _loc2_.resetInvitationList = true;
         var _loc3_:String = TextResourceModule.getText("zoo.slayer.add.requested");
         this.content.success.text = _loc3_.replace("%useName%",param1);
         this.content.searchUsername.visible = false;
         this.content.succesState.visible = true;
         this.window.okButtonVisibility = true;
      }
      
      private function handleResponse(param1:Vector.<FriendsCardData>) : void
      {
         var _loc2_:UserProxy = null;
         var _loc3_:NetProxy = null;
         var _loc4_:int = 0;
         if(param1.length <= 0)
         {
            this.content.okButton.visible = true;
            this.content.username.enabled = true;
            this.content.preloaderImage.visible = false;
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.login.100.title"),TextResourceModule.getText("zoo.error.user.unknown"))));
            return;
         }
         if(param1.length == 1)
         {
            _loc2_ = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
            _loc3_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            if(_loc2_.userId == param1[0].uId)
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.login.100.title"),TextResourceModule.getText("zoo.slayer.add.self"))));
               this.content.okButton.visible = true;
               this.content.username.enabled = true;
               this.content.preloaderImage.visible = false;
               return;
            }
            _loc3_.callServer(NET.FRIENDS_INVITE_FRIEND,[param1[0].uId]).addCallbackIfTrue(Note.FRIEND_ADDED_SUCCESS,param1[0].uName).addCallbackIfFalse(Note.FRIEND_ADDED_FAILED).sendNow();
         }
         else
         {
            this.dataProvider = new ArrayCollection();
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               this.dataProvider.addItem(param1[_loc4_]);
               _loc4_++;
            }
            this.content.searchUsername.visible = false;
            this.content.multipleChoiceState.visible = true;
            this.content.userList.dataProvider = this.dataProvider;
         }
      }
      
      override public function dispose() : void
      {
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         super.handleWindowConfirm(param1);
      }
      
      private function get window() : InviteFriendWindow
      {
         return this.viewComponent as InviteFriendWindow;
      }
      
      private function get content() : InviteFriendContent
      {
         return this.window.getContent() as InviteFriendContent;
      }
      
      private function _onUserTypeChanged(param1:ItemClickEvent) : void
      {
      }
   }
}

