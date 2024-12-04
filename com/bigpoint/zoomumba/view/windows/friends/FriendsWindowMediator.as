package com.bigpoint.zoomumba.view.windows.friends
{
   import buttons.tabs.TabButton;
   import com.bigpoint.zoomumba.constants.FRIENDS;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.controller.app.ToggleKeysCommand;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.user.contactList.FriendsProxy;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsTabs;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.card.component.CardGroupHolder;
   import custom.tabs.TabIcon;
   import flash.events.Event;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.core.TabsHGroup;
   import windows.custom.friends.FriendsContentCardGroup;
   import windows.custom.friends.FriendsWindow;
   import windows.custom.friends.RefreshFriendList;
   import windows.custom.friends.SelectFriendInvitationContent;
   import windows.events.WindowCustomEvent;
   
   public class FriendsWindowMediator extends WindowMediator
   {
      public static const NAME:String = "FriendsWindowMediator";
      
      private var friendsProxy:FriendsProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var inviteFriendMediator:SelectFriendInvitationMediator;
      
      private var netHelperProxy:NetHelperProxy;
      
      public function FriendsWindowMediator(param1:FriendsWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.friendsProxy = facade.retrieveProxy(FriendsProxy.NAME) as FriendsProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [FRIENDS.SHOW_FRIENDS_LIST,FRIENDS.SHOW_RECEIVED_INVITATIONS,FRIENDS.SHOW_SENT_INVITATIONS,Note.INIT_PRELOADER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case FRIENDS.SHOW_FRIENDS_LIST:
               this.updateFriendslist(Vector.<Object>(param1.getBody()));
               break;
            case FRIENDS.SHOW_RECEIVED_INVITATIONS:
               this.updateReceivedInvitations(Vector.<Object>(param1.getBody()));
               break;
            case FRIENDS.SHOW_SENT_INVITATIONS:
               if(param1.getBody() == null)
               {
                  return;
               }
               this.updateSentInvitations(Vector.<Object>(param1.getBody()));
               break;
            case Note.INIT_PRELOADER:
               this.window.preloaderVisibility = true;
         }
      }
      
      private function updateFriendslist(param1:Vector.<Object>) : void
      {
         if(this.window.getTabsGroup().selectedIndex == FriendsTabs.FRIENDS_LIST)
         {
            this.hideEmptyTab();
            this.tabMediator.dataProvider = param1;
            if(param1.length == 0)
            {
               this.showEmptyTab(TextResourceModule.getText("zoo.slayer.friends.empty"));
            }
         }
         this.window.preloaderVisibility = false;
      }
      
      private function updateReceivedInvitations(param1:Vector.<Object>) : void
      {
         if(this.window.getTabsGroup().selectedIndex == FriendsTabs.INVITATIONS_RECEIVED)
         {
            this.hideEmptyTab();
            this.tabMediator.dataProvider = param1;
            if(param1.length == 0)
            {
               this.showEmptyTab(TextResourceModule.getText("zoo.slayer.receivedInvites.empty"));
            }
         }
         this.window.preloaderVisibility = false;
      }
      
      private function updateSentInvitations(param1:Vector.<Object>) : void
      {
         if(this.window.getTabsGroup().selectedIndex == FriendsTabs.INVITATIONS_SENT)
         {
            this.hideEmptyTab();
            this.tabMediator.dataProvider = param1;
            if(param1.length == 0)
            {
               this.showEmptyTab(TextResourceModule.getText("zoo.slayer.sentInvites.empty"));
            }
         }
         this.window.preloaderVisibility = false;
      }
      
      private function showEmptyTab(param1:String) : void
      {
         AssetLibrary.sendAssetToFunction("BubbleMed",this.handleBubbleAsset);
         AssetLibrary.sendAssetToFunction("SoniaQuestion",this.handleSoniaAsset);
         AssetLibrary.sendAssetToFunction("NoFriends",this.handleNoFriendsAsset);
         (this.window.getContent() as FriendsContentCardGroup).speechBubbleText.visible = true;
         (this.window.getContent() as FriendsContentCardGroup).speechBubble.visible = true;
         (this.window.getContent() as FriendsContentCardGroup).circleImg.visible = true;
         (this.window.getContent() as FriendsContentCardGroup).soniaPic.visible = true;
         (this.window.getContent() as FriendsContentCardGroup).noFriends.visible = true;
         (this.window.getContent() as FriendsContentCardGroup).speechBubbleText.htmlText = param1;
      }
      
      private function hideEmptyTab() : void
      {
         (this.window.getContent() as FriendsContentCardGroup).speechBubbleText.visible = false;
         (this.window.getContent() as FriendsContentCardGroup).speechBubble.visible = false;
         (this.window.getContent() as FriendsContentCardGroup).circleImg.visible = false;
         (this.window.getContent() as FriendsContentCardGroup).soniaPic.visible = false;
         (this.window.getContent() as FriendsContentCardGroup).noFriends.visible = false;
      }
      
      private function handleNoFriendsAsset(param1:SWFAsset) : void
      {
         (this.window.getContent() as FriendsContentCardGroup).noFriends.source = param1.getEmbededBitmapData("NoFriendsImg");
      }
      
      private function handleBubbleAsset(param1:SWFAsset) : void
      {
         (this.window.getContent() as FriendsContentCardGroup).speechBubble.source = param1.getEmbededBitmapData("BubbleMed");
      }
      
      private function handleSoniaAsset(param1:SWFAsset) : void
      {
         (this.window.getContent() as FriendsContentCardGroup).soniaPic.source = param1.getEmbededBitmapData("SoniaQuestion");
      }
      
      override public function init(param1:Object) : void
      {
         super.init(param1);
         this.window.preloaderVisibility = true;
         this.addTabsIcons();
         this.window.getTabsGroup().selectedIndex = this.friendsProxy.currentTab;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,this.handleForceRemove);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.DISABLE_SHORTCUTS_KEYS);
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_friends");
      }
      
      private function handleRefreshList(param1:Event) : void
      {
         switch(this.window.getTabsGroup().selectedIndex)
         {
            case 0:
               this.window.preloaderVisibility = true;
               this.friendsProxy.getFriendsList(true);
               this.friendsProxy.resetInvitationList = true;
               break;
            case 1:
               this.window.preloaderVisibility = true;
               this.friendsProxy.getInvitationsReceived(true);
         }
      }
      
      private function handlePageChange(param1:PaginatorEvent) : void
      {
         this.friendsProxy.currentPage = param1.page;
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = true;
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.FRIENDS_WINDOW_MODE.toString());
         }
         if(this.inviteFriendMediator)
         {
            facade.removeMediator(SelectFriendInvitationMediator.NAME);
         }
         this.friendsProxy.currentTab = this.window.getTabsGroup().selectedIndex;
         if(param1.contentClass == SelectFriendInvitationContent)
         {
            this.loadAddFriendHolder();
         }
         else
         {
            this.loadCardGroupHolder();
         }
         var _loc2_:RefreshFriendList = RefreshFriendList(this.window.getContent(555));
         if(_loc2_)
         {
            _loc2_.refreshListButton.visible = false;
            switch(this.window.getTabsGroup().selectedIndex)
            {
               case 0:
               case 1:
                  _loc2_.refreshListButton.visible = true;
            }
         }
      }
      
      private function loadAddFriendHolder() : void
      {
         this.inviteFriendMediator = new SelectFriendInvitationMediator(this.window.getContent() as SelectFriendInvitationContent);
         facade.registerMediator(this.inviteFriendMediator);
         this.window.preloaderVisibility = false;
      }
      
      private function loadCardGroupHolder() : void
      {
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.tabContent,CardHolderModes.FRIENDS_WINDOW_MODE);
         this.cardGroupHolderMediator.currentPage = this.friendsProxy.currentPage;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.drawCards();
      }
      
      private function handleForceRemove(param1:WindowCustomEvent) : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.cardGroupHolderMediator.forceRemoveItems();
         }
      }
      
      private function addTabsIcons() : void
      {
         var _loc2_:TabButton = null;
         var _loc3_:TabIcon = null;
         var _loc1_:TabsHGroup = this.window.getTabsGroup() as TabsHGroup;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numElements)
         {
            _loc3_ = new TabIcon();
            _loc2_ = _loc1_.getElementAt(_loc4_) as TabButton;
            _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.FRIENDS_WINDOW,"Icon" + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc3_.bitmap.x = 4;
                  _loc3_.bitmap.y = -4;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.slayer.friends.title");
                  break;
               case 1:
                  _loc3_.bitmap.x = -4;
                  _loc3_.bitmap.y = -7;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.slayer.receivedInvites.title");
                  break;
               case 2:
                  _loc3_.bitmap.x = -5;
                  _loc3_.bitmap.y = -1;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.slayer.sentInvites.title");
                  break;
               case 3:
                  _loc3_.bitmap.x = 1;
                  _loc3_.bitmap.y = -4;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.slayer.add.title");
                  break;
               case 4:
                  _loc3_.bitmap.x = -1;
                  _loc3_.bitmap.y = -3;
                  break;
            }
            _loc2_.contentGroup.addElement(_loc3_);
            _loc4_++;
         }
         this.window.customContent(555,RefreshFriendList);
         this.window.getContent(555).addEventListener("refreshFriendList",this.handleRefreshList);
         RefreshFriendList(this.window.getContent(555)).refreshListButton.toolTip = TextResourceModule.getText("zoo.tooltip.slayer.refresh");
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.tabMediator.mode = CardHolderModes.FRIENDS_WINDOW_MODE;
         this.tabMediator.currentPage = this.friendsProxy.currentPage;
         switch(this.window.getTabsGroup().selectedIndex)
         {
            case FriendsTabs.FRIENDS_LIST:
               this.friendsProxy.getFriendsList();
               break;
            case FriendsTabs.INVITATIONS_RECEIVED:
               this.friendsProxy.getInvitationsReceived();
               break;
            case FriendsTabs.INVITATIONS_SENT:
               this.friendsProxy.getInvitationsSent();
         }
         this.tabContent.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChange);
      }
      
      override public function dispose() : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.friendsProxy.currentPage = this.cardGroupHolderMediator.currentPage;
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.FRIENDS_WINDOW_MODE.toString());
         }
         if(this.inviteFriendMediator)
         {
            facade.removeMediator(SelectFriendInvitationMediator.NAME);
         }
         this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,this.handleForceRemove);
         sendNotification(Note.TOGGLE_SHORTCUT_KEYS,ToggleKeysCommand.ENABLE_SHORTCUTS_KEYS);
      }
      
      private function get tabMediator() : CardGroupHolderMediator
      {
         return this.cardGroupHolderMediator;
      }
      
      private function get window() : FriendsWindow
      {
         return this.viewComponent as FriendsWindow;
      }
      
      private function get tabContent() : CardGroupHolder
      {
         return (this.window.getContent() as FriendsContentCardGroup).cardGroupHolder;
      }
   }
}

