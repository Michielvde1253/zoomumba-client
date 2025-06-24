package com.bigpoint.zoomumba.view.windows.events.christmas
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventRewardVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetAutoFiller;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.christmas.reward.ChristmasRewardContent;
   import windows.custom.events.christmas.reward.ChristmasRewardWindow;
   import windows.events.WindowCustomEvent;
   
   public class ChristmasRewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ChristmasRewardWindowMediator";
      
      private const TYPE_TREE:int = 0;
      
      private const TYPE_AVATAR:int = 1;
      
      private const TYPE_OWL:int = 2;
      
      private const TYPE_CAGE:int = 3;
      
      private const REWARDS_TYPES:Array = [this.TYPE_TREE,this.TYPE_AVATAR,this.TYPE_TREE,this.TYPE_AVATAR,this.TYPE_TREE,this.TYPE_AVATAR,this.TYPE_TREE,this.TYPE_CAGE,this.TYPE_OWL];
      
      private var xmasProxy:XmasProxy;
      
      private var eventRewardsProxy:EventRewardsProxy;
      
      private var _loadedAssets:int = 0;
      
      private var _rewardId:int = -1;
      
      private var _owlsLoaded:int = 0;
      
      public function ChristmasRewardWindowMediator(param1:ChristmasRewardWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.eventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         this.xmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this._rewardId = param1 as int;
         this._loadedAssets = 0;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("EffectGlowMed",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SantaBig",this.handleAssets);
         this.content.header.text = TextResourceModule.getText("zoo.window.general.congrats");
         this.content.text1.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats");
         if(this._rewardId == 555)
         {
            this.content.header.text = TextResourceModule.getText("zoo.window.general.congrats");
            this.content.text1.text = TextResourceModule.getText("zoo.event.christmas.layer.christmasTree");
            this.content.text2.text = "";
            this.content.text3.text = "";
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.DECOR,this.xmasProxy.parkingLotTreeId),this.handleAssets);
            return;
         }
         var _loc2_:Vector.<EventRewardVO> = this.eventRewardsProxy.getRewardsForEvent(EventTypes.XMAS_EVENT);
         var _loc3_:EventRewardVO = _loc2_[this._rewardId];
         switch(this.REWARDS_TYPES[this._rewardId])
         {
            case this.TYPE_TREE:
               this.content.text2.text = TextResourceModule.getText("zoo.event.christmas.rewards.tree");
               this.content.text3.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats.tree");
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.DECOR,_loc3_.itemId),this.handleAssets);
               break;
            case this.TYPE_AVATAR:
               this.content.text2.text = TextResourceModule.getText("zoo.event.christmas.rewards.avatar");
               this.content.text3.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats.avatar");
               if(this._rewardId == 1 || this._rewardId == 5)
               {
                  AssetLibrary.sendAssetToFunction(AssetAutoFiller.getAvatarId(AvatarProxy.HAT,_loc3_.itemId),this.handleAssets);
               }
               else
               {
                  AssetLibrary.sendAssetToFunction(AssetAutoFiller.getAvatarId(AvatarProxy.CLOTHES,_loc3_.itemId),this.handleAssets);
               }
               break;
            case this.TYPE_OWL:
               this.content.text2.text = TextResourceModule.getText("zoo.event.christmas.rewards.snowOwls");
               this.content.text3.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats.inventory");
               this._owlsLoaded = 0;
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc3_.itemIds[0]),this.handleAssets);
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc3_.itemIds[1]),this.handleAssets);
               break;
            case this.TYPE_CAGE:
               this.content.text2.text = TextResourceModule.getText(TextIdHelper.getCardName(_loc3_.categoryId,_loc3_.itemId));
               this.content.text3.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats.inventory");
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc3_.categoryId,_loc3_.itemId),this.handleAssets);
         }
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "EffectGlowMed":
            case "EffectGlowMed.swf":
               this.content.glow.displayClass = param1.getEmbededBitmapData(param1.id);
               ++this._loadedAssets;
               break;
            case "SantaBig":
            case "SantaBig.swf":
               this.content.santa.displayClass = param1.getEmbededBitmapData(param1.id);
               ++this._loadedAssets;
               break;
            default:
               if(this._owlsLoaded == 1)
               {
                  this.content.hgroup.gap = 20;
                  this.content.item2.displayClass = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
               }
               else
               {
                  this.content.hgroup.gap = 0;
                  this.content.item.displayClass = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
               }
               if(this.REWARDS_TYPES[this._rewardId] == this.TYPE_OWL)
               {
                  ++this._owlsLoaded;
               }
               ++this._loadedAssets;
         }
         if(this.REWARDS_TYPES[this._rewardId] != this.TYPE_OWL && this._loadedAssets >= 3 || this.REWARDS_TYPES[this._rewardId] == this.TYPE_OWL && this._loadedAssets >= 4)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      override protected function handleWindowCloseClick(param1:WindowCustomEvent = null) : void
      {
         this.close();
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         this.close();
      }
      
      private function close() : void
      {
         if(this._rewardId == 8 && this._rewardId != 555)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_ENDED_WINDOW,"",true));
         }
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(windowType,windowUniqueId));
      }
      
      private function get content() : ChristmasRewardContent
      {
         return this.window.getContent() as ChristmasRewardContent;
      }
      
      private function get window() : ChristmasRewardWindow
      {
         return this.viewComponent as ChristmasRewardWindow;
      }
   }
}

