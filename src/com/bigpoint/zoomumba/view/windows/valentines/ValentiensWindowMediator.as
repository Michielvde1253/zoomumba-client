package com.bigpoint.zoomumba.view.windows.valentines
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.avatar.AvatarGeneratorProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import com.bigpoint.zoomumba.model.features.valenties.vo.ValentineStepVO;
   import com.bigpoint.zoomumba.model.features.valenties.vo.ValentinesStepEvent;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.features.valenties.ValentineStepItem;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.generic.GenericCircularCounter;
   import flash.events.Event;
   import mx.controls.Image;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.valentines.ValentinesContent;
   import windows.custom.valentines.ValentinesWindow;
   
   public class ValentiensWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ValentiensWindowMediator";
      
      private var currentIndex:int = 0;
      
      private var valentiesProxy:ValentinesProxy;
      
      private var valentineAsset:SWFAsset;
      
      private var stepsShows:Vector.<Image>;
      
      private var _currentLoadStep:int = 0;
      
      private var avatarDisplay:ValentineStepItem;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var stepConfig:Array = [344,432,1,312,403,1,276,375,1,235,353,1,212,387,1,184,413,1,155,438,1,194,331,1,161,303,1,141,267,1,140,219,1,155,177,1,189,149,1,210,188,1,237,227,1,236,141,1,282,148,1,317,172,1,345,202,1,345,243,1,345,280,1,373,171,1,408,147,1,462,139,1,499,148,1,471,181,1,437,208,1,530,118,1,569,84,1,533,176,1,549,218,1,547,268,1,527,304,1,493,332,1,453,355,1,412,377,1,377,404,1];
      
      private var DP_LENGTH:int = 37;
      
      public function ValentiensWindowMediator(param1:ValentinesWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.VALENTINE_CONFIG_PARSED,Note.VALENTINE_REFRESH_BOARD,Note.VALENTINE_ADVICE_REQUEST];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.VALENTINE_CONFIG_PARSED:
               this.drawItems();
               break;
            case Note.VALENTINE_REFRESH_BOARD:
               this.refreshBoard();
               break;
            case Note.VALENTINE_ADVICE_REQUEST:
               if(param1.getBody())
               {
                  this.handleRefreshClick(null);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.valentiesProxy = facade.retrieveProxy(ValentinesProxy.NAME) as ValentinesProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.preloaderVisibility = true;
         this._currentLoadStep = 0;
         this.content.steps.addEventListener(ValentinesStepEvent.VALENTINES_FIELD_CLICK,this.handleFieldClick);
         this.content.steps.addEventListener(ValentinesStepEvent.VALENTINES_REWARD_CLICK,this.handleRewardClick);
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         this.content.addEventListener("refreshGame",this.handleRefreshClick);
         this.content.refresh.toolTip = TextResourceModule.getText("zoo.eventValentine.tooltip.restart");
         this.content.refresh.visible = this.valentiesProxy.showRefresh;
         this.drawCollectablesCounter();
         this.updateCollectablesCounter();
         AssetLibrary.sendAssetToFunction("Valentines",this.handleAssetsLoaded);
         AssetLibrary.sendAssetToFunction("PatternBreedingWood",this.handleAssetsLoaded);
         this.window.header.filePath = _loc2_.getHeaderPath("header_valentine");
      }
      
      private function handleRefreshClick(param1:Event) : void
      {
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GENERIC_COMIC_WINDOW));
      }
      
      private function updateCollectablesCounter() : void
      {
         this.content.coll1.counter.value = this.collectablesProxy.getCollectableAmmount(305);
         this.content.coll2.counter.value = this.collectablesProxy.getCollectableAmmount(306);
         this.content.coll3.counter.value = this.collectablesProxy.getCollectableAmmount(307);
      }
      
      private function drawCollectablesCounter() : void
      {
         var _loc2_:GenericCircularCounter = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.content.counters.numElements)
         {
            _loc2_ = this.content.counters.getElementAt(_loc1_) as GenericCircularCounter;
            _loc2_.button.displayImg.automaticCentralize = false;
            _loc2_.button.imgBackground.verticalCenter = 0;
            _loc2_.button.imgBackground.horizontalCenter = 0;
            _loc2_.button.bitmapDisplayPosX = 0;
            _loc2_.button.bitmapDisplayPosY = 0;
            _loc2_.counter.right = -25;
            _loc2_.counter.bottom = -25;
            _loc1_++;
         }
         this.content.coll1.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,305),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll1.button.displayImg.maskRectBottom = 45;
         this.content.coll2.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,306),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll2.button.displayImg.maskRectBottom = 45;
         this.content.coll3.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,307),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         this.content.coll3.button.displayImg.maskRectBottom = 45;
      }
      
      private function handleFieldClick(param1:ValentinesStepEvent) : void
      {
         this.cleanup_without_rewards();
         this.valentiesProxy.makeAMove(param1.fieldId,param1.cr);
      }
      
      private function handleRewardClick(param1:ValentinesStepEvent) : void
      {
         this.valentiesProxy.redeemReward(param1.fieldId);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "Valentines":
            case "Valentines.swf":
               this.content.background.source = param1.getEmbededBitmapData("Boardgame");
               this.valentineAsset = param1;
               break;
            case "PatternBreedingWood":
            case "PatternBreedingWood.swf":
               this.window.backgroundPattern = param1.getEmbededObject("PatternBreedingWood").constructor;
         }
         if(++this._currentLoadStep == 2)
         {
            this.drawItems();
         }
      }
      
      private function refreshBoard() : void
      {
         this.cleanup();
         this.drawNeighbours();
         this.drawRewards();
         this.initAvatar();
         this.updateCollectablesCounter();
      }
      
      private function drawItems() : void
      {
         this.window.preloaderVisibility = false;
         this.drawNeighbours();
         this.drawRewards();
         this.initAvatar();
      }
      
      private function drawRewards() : void
      {
         var _loc2_:ValentineStepItem = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.config.length)
         {
            if(this.config[_loc1_].type == "reward" && this.valentiesProxy.rewards[this.config[_loc1_].rewardId] == 0)
            {
               _loc2_ = new ValentineStepItem();
               _loc2_.rewardCategory = this.config[_loc1_].category[this.valentiesProxy.loop];
               _loc2_.rewardId = this.config[_loc1_].itemId[this.valentiesProxy.loop];
               _loc2_.type = ValentineStepItem.REWARD_IMAGE;
               this.content.rewardsLayer.addElement(_loc2_);
               _loc2_.x = this.stepConfig[_loc1_ * 3];
               _loc2_.y = this.stepConfig[_loc1_ * 3 + 1];
            }
            _loc1_++;
         }
      }
      
      private function initAvatar() : void
      {
         var _loc1_:AvatarGeneratorProxy = facade.retrieveProxy(AvatarGeneratorProxy.NAME) as AvatarGeneratorProxy;
         this.avatarDisplay = new ValentineStepItem();
         this.avatarDisplay.type = ValentineStepItem.AVATAR;
         this.avatarDisplay.setAvatarSource(this.valentineAsset.getEmbededSprite("Avatar"),_loc1_.getMyAvatarSprite(0.227));
         this.content.steps.addElement(this.avatarDisplay);
         this.avatarDisplay.x = this.stepConfig[this.currentPosition * 3];
         this.avatarDisplay.y = this.stepConfig[this.currentPosition * 3 + 1];
      }
      
      private function drawNeighbours() : void
      {
         var _loc2_:ValentineStepItem = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.config[this.currentPosition].neighbours.length)
         {
            _loc2_ = new ValentineStepItem();
            _loc2_.tileId = this.config[this.currentPosition].neighbours[_loc1_];
            this.content.steps.addElement(_loc2_);
            _loc2_.rewardCategory = this.config[_loc2_.tileId].category[this.valentiesProxy.loop];
            _loc2_.rewardId = this.config[_loc2_.tileId].itemId[this.valentiesProxy.loop];
            _loc2_.cr = this.config[_loc2_.tileId].cr;
            _loc2_.tileSource = this.valentineAsset.getEmbededSprite("Tile" + this.config[this.currentPosition].neighbours[_loc1_]);
            _loc2_.x = this.stepConfig[this.config[this.currentPosition].neighbours[_loc1_] * 3];
            _loc2_.y = this.stepConfig[this.config[this.currentPosition].neighbours[_loc1_] * 3 + 1];
            if(this.config[this.config[this.currentPosition].neighbours[_loc1_]].type == "reward")
            {
               _loc3_ = this.config[this.config[this.currentPosition].neighbours[_loc1_]].rewardId;
               if(this.valentiesProxy.rewards[this.config[this.config[this.currentPosition].neighbours[_loc1_]].rewardId] == 0)
               {
                  _loc2_.canMoveHere = true;
               }
               else
               {
                  _loc2_.canMoveHere = false;
               }
            }
            else if(this.collectablesProxy.getCollectableAmmount(this.config[this.config[this.currentPosition].neighbours[_loc1_]].itemId[0]) < this.config[this.config[this.currentPosition].neighbours[_loc1_]].amount[0])
            {
               _loc2_.canMoveHere = false;
            }
            else
            {
               _loc2_.canMoveHere = true;
            }
            _loc2_.type = this.typeConvert(this.config[this.config[this.currentPosition].neighbours[_loc1_]].type);
            _loc1_++;
         }
      }
      
      private function cleanup() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.content.steps.numElements)
         {
            ValentineStepItem(this.content.steps.getElementAt(_loc1_)).dispose();
            _loc1_++;
         }
         this.content.steps.removeAllElements();
         this.content.rewardsLayer.removeAllElements();
         this.content.refresh.visible = this.valentiesProxy.showRefresh;
      }
      
      private function cleanup_without_rewards() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.content.steps.numElements)
         {
            ValentineStepItem(this.content.steps.getElementAt(_loc1_)).dispose();
            _loc1_++;
         }
         this.content.steps.removeAllElements();
         this.initAvatar();
      }
      
      private function typeConvert(param1:String) : int
      {
         switch(param1)
         {
            case "start":
               return 0;
            case "collectionItem":
               return 1;
            case "reward":
               return 2;
            default:
               return 0;
         }
      }
      
      private function get window() : ValentinesWindow
      {
         return this.viewComponent as ValentinesWindow;
      }
      
      private function get content() : ValentinesContent
      {
         return this.window.getContent() as ValentinesContent;
      }
      
      private function get currentPosition() : int
      {
         return this.valentiesProxy.currentPosition;
      }
      
      override public function dispose() : void
      {
      }
      
      private function get config() : Vector.<ValentineStepVO>
      {
         return this.valentiesProxy.config;
      }
   }
}

