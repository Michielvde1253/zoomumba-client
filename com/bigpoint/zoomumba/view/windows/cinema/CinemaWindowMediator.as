package com.bigpoint.zoomumba.view.windows.cinema
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.cinema.CinemaProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.features.cinema.RewardOption;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.cinema.CinemaContent;
   import windows.custom.cinema.CinemaWindow;
   
   public class CinemaWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CinemaWindowMediator";
      
      public function CinemaWindowMediator(param1:CinemaWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return super.listNotificationInterests().concat([Note.CINEMA_TICKET_CHANGED]);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = null;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case Note.CINEMA_TICKET_CHANGED:
               _loc2_ = String(param1.getBody().tickets);
               this.content.ticketLabel.text = _loc2_;
               this.content.ticket.toolTip = TextResourceModule.getTextReplaced("zoo.tooltip.cinema.tickets",Vector.<TextReplace>([new TextReplace("%count%",_loc2_)]));
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         var _loc3_:CinemaProxy = facade.retrieveProxy(CinemaProxy.NAME) as CinemaProxy;
         this.window.preloaderVisibility = true;
         this.window.header.filePath = _loc2_.getHeaderPath("header_cinema");
         this.content.ticketLabel.text = _loc3_.tickets.toString();
         this.content.ticket.toolTip = TextResourceModule.getTextReplaced("zoo.tooltip.cinema.tickets",Vector.<TextReplace>([new TextReplace("%count%",this.content.ticketLabel.text)]));
         this.content.intro.htmlText = TextResourceModule.getText("zoo.cinema.layer.intro");
         this.content.rewardLabel.text = TextResourceModule.getText("zoo.cinema.layer.selectReward");
         this.content.playButton.label = TextResourceModule.getText("zoo.cinema.layer.play");
         this.content.addEventListener("playVideo",this._playVideo);
         this.window.addEventListener("rewardOptClicked",this.handleRewardSelected);
         this.content.rewardLabel.visible = false;
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_CINEMA_PROJECTOR);
         AssetLibrary.sendAssetToFunction("Cinema",this.handleAssetLoad);
      }
      
      private function handleRewardSelected(param1:Event) : void
      {
         this.content.selectReward(param1.target as RewardOption);
      }
      
      private function _playVideo(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc2_:PaymentUrlProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         var _loc3_:CinemaProxy = facade.retrieveProxy(CinemaProxy.NAME) as CinemaProxy;
         var _loc4_:CurrencyVO = _loc3_.rewards[this.content.selectedValue];
         if(_loc3_.tickets <= 0)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.general.attention"),TextResourceModule.getText("zoo.window.infoLayers.cinema.limit"))));
         }
         else
         {
            _loc4_.type = 19;
            _loc4_.id = 1;
            _loc5_ = "faLoadFrame(\'" + _loc2_.paymentUrlVO.ajaxCinema + "&type=" + _loc4_.type + "&id=" + _loc4_.id + "\')";
            sendNotification(Note.EXIT_FULLSCREEN_MODE);
            ExternalInterface.call(_loc5_);
            --_loc3_.tickets;
         }
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         var _loc2_:String = null;
         var _loc3_:RewardOption = null;
         var _loc4_:WrapedSprite = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:CurrencyVO = null;
         this.window.preloaderVisibility = false;
         this.content.leftPenguim.displayClass = param1.getEmbededBitmapData("PenguinsLeft");
         this.content.rightPenguim.displayClass = param1.getEmbededBitmapData("PenguinsRight");
         this.content.background.displayClass = param1.getEmbededBitmapData("Background");
         var _loc9_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         var _loc10_:CinemaProxy = facade.retrieveProxy(CinemaProxy.NAME) as CinemaProxy;
         var _loc11_:int = int(_loc10_.rewards.length);
      }
      
      private function get content() : CinemaContent
      {
         return this.window.getContent(0) as CinemaContent;
      }
      
      private function get window() : CinemaWindow
      {
         return this.viewComponent as CinemaWindow;
      }
   }
}

