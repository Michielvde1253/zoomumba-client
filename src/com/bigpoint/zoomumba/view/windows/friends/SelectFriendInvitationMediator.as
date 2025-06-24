package com.bigpoint.zoomumba.view.windows.friends
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.friends.SelectFriendInvitationContent;
   
   public class SelectFriendInvitationMediator extends Mediator
   {
      public static const NAME:String = "SelectFriendInvitationMediator";
      
      public function SelectFriendInvitationMediator(param1:SelectFriendInvitationContent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         AssetLibrary.sendAssetToFunction("FriendsInvite",this.handleAssets);
         AssetLibrary.sendAssetToFunction("BubbleMed",this.handleBubbleAsset);
         this.content.addEventListener("addZoomumbaFriend",this.handleAddZoomumbaFriend);
         this.content.addEventListener("addMailFriend",this.handleAddMailFriend);
         if(Settings.AID == "2778")
         {
            this.content.facebook.visible = false;
         }
         else
         {
            this.content.facebook.visible = true;
         }
         this.content.add3.enabled = false;
      }
      
      private function handleAddMailFriend(param1:Event) : void
      {
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
         ExternalInterface.call("showInviteLayer()");
      }
      
      private function handleAddFacebookFriend(param1:Event) : void
      {
      }
      
      private function handleAddZoomumbaFriend(param1:Event) : void
      {
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INVITE_FRIEND_WINDOW));
      }
      
      private function handleBubbleAsset(param1:SWFAsset) : void
      {
         this.content.speechBubble.source = param1.getEmbededBitmapData("BubbleMed");
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         this.content.separatorGraphic = param1.getEmbededBitmapData("Separator");
         this.content.addFriendImage1.bitmapDataDisplay = param1.getEmbededBitmapData("ZoomumbaIcon");
         this.content.addFriendImage3.bitmapDataDisplay = param1.getEmbededBitmapData("FacebookIcon");
         this.content.soniaPic.source = param1.getEmbededBitmapData("SoniaPic");
         this.content.info1.text = TextResourceModule.getText("zoo.slayer.add.byName");
         this.content.info3.text = TextResourceModule.getText("zoo.slayer.add.byFB");
         this.content.add1.label = TextResourceModule.getText("zoo.slayer.add.button");
         this.content.add3.label = TextResourceModule.getText("zoo.slayer.add.button");
         this.content.speechBubbleText.htmlText = TextResourceModule.getText("zoo.slayer.add.text");
      }
      
      override public function onRemove() : void
      {
         this.content.removeEventListener("addZoomumbaFriend",this.handleAddZoomumbaFriend);
         this.content.removeEventListener("addMailFriend",this.handleAddMailFriend);
      }
      
      private function get content() : SelectFriendInvitationContent
      {
         return this.viewComponent as SelectFriendInvitationContent;
      }
   }
}

