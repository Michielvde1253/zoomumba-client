package com.bigpoint.zoomumba.view.windows.events.community
{
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.events.community.CommunityEventProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.inventory.vo.InventoryTabs;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.halloween2012.components.Halloween2012LockableItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.community.GenericCommunityEventContent;
   import windows.custom.events.community.GenericCommunityEventWindow;
   
   public class GenericCommunityEventWindowMediator extends WindowMediator
   {
      public static const NAME:String = "GenericCommunityEventWindowMediator";
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var networkProxy:NetProxy;
      
      private var communityEventProxy:CommunityEventProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var _assets:SWFAsset;
      
      private var _progress:CommunityEventProgress;
      
      private var _eventId:int;
      
      private var _eventName:String;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      public function GenericCommunityEventWindowMediator(param1:GenericCommunityEventWindow)
      {
         super(GenericCommunityEventWindowMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.networkProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.communityEventProxy = facade.getProxy(CommunityEventProxy) as CommunityEventProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return super.listNotificationInterests().concat([Note.COMMUNITY_EVENT_UPDATED,Note.COMMUNMITY_PAYIN_REDEEM,Note.COMMUNMITY_PAYIN_REDEEM_FAILED,CARDS.CHANGE_INVENTORY_AMOUNT,Note.BOARDGAME_GET_EVENT]);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case CARDS.CHANGE_INVENTORY_AMOUNT:
               this.updateUI();
               break;
            case Note.COMMUNITY_EVENT_UPDATED:
               this.updateUI();
               this.window.preloaderVisibility = false;
               break;
            case Note.BOARDGAME_GET_EVENT:
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:GlobalEventProxy = facade.getProxy(GlobalEventProxy) as GlobalEventProxy;
         this._eventId = int(param1);
         this._eventName = _loc2_.getGlobalEvent(this._eventId).eventName;
         this.window.preloaderVisibility = true;
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         AssetLibrary.sendAssetToFunction("CommunityEventWindow" + this._eventId,this.onAssetsLoaded);
      }
      
      private function updateUI() : void
      {
         if(this.communityEventProxy.proxyData.step == 4)
         {
            this._progress.progress = 1;
            this.content.textBubble.text = TextResourceModule.getText("zoo.window.infoLayers." + this._eventName + ".multiplayer.success");
         }
         else
         {
            this._progress.progress = (this.communityEventProxy.proxyData.progress + this.communityEventProxy.proxyData.step * 100) / this.communityEventProxy.proxyData.rewards.length * 0.01;
            this.content.textBubble.text = TextResourceModule.getText("zoo.window.infoLayers." + this._eventName + ".multiplayer.intro");
         }
         this.initCardGroupHolder();
         this.displayEventContent();
      }
      
      override public function onRemove() : void
      {
         if(this.cardGroupHolderMediator)
         {
            super.facade.removeMediator(this.cardGroupHolderMediator.getMediatorName());
         }
      }
      
      private function onAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:String = null;
         switch(param1.id)
         {
            case "CommunityEventWindow" + this._eventId:
            case "CommunityEventWindow" + this._eventId + ".swf":
               this._assets = param1;
               this.content.backgroundImage.source = this._assets.getEmbededBitmapData("Background");
               this.content.foregroundImage.source = this._assets.getEmbededBitmapData("Foreground");
               this._progress = new CommunityEventProgress();
               this._progress.view = this._assets.getEmbededMovieClip("Progress");
               this.content.progress.addChild(this._progress);
               this.networkProxy.callServer(NET.COMMUNITY_PAYIN_GET_EVENT,[this._eventId]).sendNow();
               _loc2_ = TextResourceModule.getText("zoo.window.infoLayers." + this._eventName + "Board.title");
               initDynamicTitle(_loc2_);
         }
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.COMMUNITY_EVENT_HELP_WINDOW,"",this._eventId));
      }
      
      private function displayEventContent() : void
      {
         var _loc1_:Halloween2012LockableItem = null;
         var _loc2_:CurrencyVO = null;
         var _loc4_:AnimalSpeciesVO = null;
         this.drawCards();
         this.content.fieldStep.removeAllElements();
         var _loc3_:int = 0;
         while(_loc3_ < this.communityEventProxy.proxyData.rewards.length)
         {
            _loc2_ = this.communityEventProxy.proxyData.rewards[_loc3_][0];
            _loc1_ = new Halloween2012LockableItem();
            _loc1_.itemSate = this.communityEventProxy.rewardStatus(_loc3_);
            _loc1_.y = this._progress.view.height - (_loc3_ + 1) * int(this._progress.view.height / this.communityEventProxy.proxyData.rewards.length);
            _loc1_.step = _loc3_;
            _loc1_.addEventListener(MouseEvent.CLICK,this.onRewardClick,false,0,true);
            if(_loc2_.type == Categories.SPECIES)
            {
               _loc1_.displayImage = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc2_.id),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
            }
            else
            {
               _loc1_.displayImage = new WrapedSprite(AssetIds.getPreviewAssetId(_loc2_.type,_loc2_.id),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
            }
            if(_loc2_.type == Categories.SPECIES)
            {
               _loc4_ = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(_loc2_.id);
               if(_loc4_)
               {
                  _loc1_.toolTip = _loc2_.amount * 2 + "x " + TextResourceModule.getText(TextIdHelper.getCardName(_loc2_.type,_loc4_.speciesId));
               }
            }
            else if(_loc2_.type == Categories.ANIMAL)
            {
               _loc1_.toolTip = _loc2_.amount + "x " + TextResourceModule.getText(TextIdHelper.getCardName(_loc2_.type,_loc2_.id));
            }
            else
            {
               _loc1_.toolTip = _loc2_.amount + "x " + TextResourceModule.getText(TextIdHelper.getCardName(_loc2_.type,_loc2_.id));
            }
            this.content.fieldStep.addElement(_loc1_);
            _loc3_++;
         }
         if(this.communityEventProxy.proxyData.step == 4)
         {
            this.content.cardGroupHolder.visible = false;
         }
      }
      
      protected function onRewardClick(param1:MouseEvent) : void
      {
         var _loc2_:uint = 0;
         if(param1.currentTarget is Halloween2012LockableItem)
         {
            _loc2_ = (param1.currentTarget as Halloween2012LockableItem).step;
            if(this.communityEventProxy.canRedeem(_loc2_) && (param1.currentTarget as Halloween2012LockableItem).itemSate == Halloween2012LockableItem.STATE_UNLOCKED)
            {
               this.networkProxy.callServer(NET.COMMUNITY_PAYIN_REDEEM,[_loc2_]).addCallbackIfTrue(Note.COMMUNMITY_PAYIN_REDEEM).addCallbackIfFalse(Note.COMMUNMITY_PAYIN_REDEEM_FAILED).sendNow();
            }
         }
      }
      
      private function initCardGroupHolder() : void
      {
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.COMMUNITY_EVENT.toString());
         }
         this.content.cardGroupHolder.paginator.entriesPerPage = 2;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.COMMUNITY_EVENT);
         this.cardGroupHolderMediator.currentPage = 0;
         facade.registerMediator(this.cardGroupHolderMediator);
      }
      
      private function drawCards() : void
      {
         var _loc3_:AnimalShopData = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Unable to find cardGroupHolderMediator");
         }
         var _loc1_:Vector.<Object> = this.inventoryProxy.getTabContentByTab(InventoryTabs.ANIMALS);
         var _loc2_:Array = [];
         for each(_loc4_ in _loc1_)
         {
            _loc3_ = _loc4_[0] as AnimalShopData;
            if(_loc3_)
            {
               _loc2_[_loc3_.animalId] = [_loc4_.length].concat(_loc4_);
            }
         }
         _loc1_ = new Vector.<Object>();
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            if(_loc2_[_loc5_])
            {
               _loc1_.push(_loc2_[_loc5_]);
            }
            _loc5_++;
         }
         this.cardGroupHolderMediator.mode = CardHolderModes.COMMUNITY_EVENT;
         this.cardGroupHolderMediator.dataProvider = _loc1_;
         this.cardGroupHolderMediator.currentPage = 0;
      }
      
      private function sortByAmount(param1:Array, param2:Array) : int
      {
         if(param1[0] > param2[0])
         {
            return -1;
         }
         if(param1[0] < param2[0])
         {
            return 1;
         }
         return 0;
      }
      
      private function get content() : GenericCommunityEventContent
      {
         return this.window.getContent() as GenericCommunityEventContent;
      }
      
      private function get window() : GenericCommunityEventWindow
      {
         return viewComponent as GenericCommunityEventWindow;
      }
   }
}

