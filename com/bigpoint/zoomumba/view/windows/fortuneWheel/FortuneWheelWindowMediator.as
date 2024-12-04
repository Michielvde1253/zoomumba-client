package com.bigpoint.zoomumba.view.windows.fortuneWheel
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.fortuneWheel.components.WheelRewardItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.greensock.TweenLite;
   import custom.features.zooWheel.events.ZooWheelBuyTryEvent;
   import custom.features.zooWheel.events.ZooWheelRewardEvent;
   import custom.features.zooWheel.events.ZooWheelStartEvent;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.media.SoundChannel;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import mx.utils.ObjectUtil;
   import org.puremvc.as3.interfaces.INotification;
   import spark.core.SpriteVisualElement;
   import windows.custom.zooWheel.ZooWheelContent;
   import windows.custom.zooWheel.ZooWheelWindow;
   
   public class FortuneWheelWindowMediator extends WindowMediator
   {
      public static const NAME:String = "FortuneWheelWindowMediator";
      
      public static const BLUEPRINTSLOT:int = 6;
      
      private static const WHEEL_SPINN_TIME:int = 5;
      
      private var wheelProxy:FortuneWheelProxy;
      
      private var userProxy:UserProxy;
      
      private var _craftingProxy:CraftingProxy;
      
      private var isSpinning:Boolean = false;
      
      private var currentData:Vector.<FortuneWheelRewardVO>;
      
      private var currentSoundChannel:SoundChannel;
      
      private var doReport:Boolean = false;
      
      private var _loader:Loader = new Loader();
      
      private var _context:LoaderContext = new LoaderContext(true);
      
      public function FortuneWheelWindowMediator(param1:ZooWheelWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.START_SPIN,Note.UPDATE_REWARD_DATA_SET,Note.UPDATE_FOR_NEXT_SPIN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.START_SPIN:
               this.spinWheelInfinite();
               break;
            case Note.UPDATE_REWARD_DATA_SET:
               this.rewardArrived();
               this.updateTickets();
               this.togglePlayButtonState();
               this.checkAutoSpin();
               break;
            case Note.UPDATE_FOR_NEXT_SPIN:
               this.stateUpdate();
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.wheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_ZOOWHEEL_OPEN);
         AssetLibrary.sendAssetToFunction(AssetConfig.ZOO_WHEEL_ASSET_FILE,this.handleAsetsLoaded);
         super.init(param1);
      }
      
      private function handleAsetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.wheelWindow.header.filePath = _loc2_.getHeaderPath("header_wheel");
         this.wheel.background.source = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_BACKGROUND);
         this.wheel.blueprintEdge.source = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_BG_BLUEPRINT);
         this.wheel.triesPanel.background.source = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_BACKGROUND_TRIES);
         this.wheel.triesPanel.sourceTryBird = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_BUTTON_TRY);
         this.wheel.triesPanel.addEventListener(ZooWheelBuyTryEvent.CLICKED,this.handleBuySpin);
         this.wheel.playButton.movieClipPenguim = param1.getEmbededMovieClip(AssetConfig.ZOO_WHEEL_PENGUIN_ANIM_MC);
         this.wheel.playButton.bitmapDataStart = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_BUTTON_START);
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.startLoaded);
         this._loader.load(new URLRequest(_loc2_.getCustomPath("window_wheel","button_start")),this._context);
         this.wheel.playButton.addEventListener(ZooWheelStartEvent.START,this.handleStartStateClick);
         this.wheel.playButton.addEventListener(ZooWheelStartEvent.BUY,this.handleBuyStateClick);
         this.wheel.playButton.addEventListener(ZooWheelStartEvent.FORWARD,this.handleForwardStateClick);
         this.wheel.birdPointer.sourceNail = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_POINTER_NAIL);
         this.wheel.birdPointer.sourceIdle = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_POINTER_BIRD_IDLE);
         this.wheel.birdPointer.sourceSpinStart = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_POINTER_BIRD_SPIN_START);
         this.wheel.birdPointer.sourceSpinFull = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_POINTER_BIRD_SPIN_FULL);
         this.wheel.birdPointer.sourcePointing = param1.getEmbededBitmapData(AssetConfig.ZOO_WHEEL_POINTER_BIRD);
         this.wheel.birdPointer.addEventListener(ZooWheelRewardEvent.STOPPED_AT_REWARD,this.handleStoppedAtReward);
         this.stateUpdate();
         this.wheelWindow.preloaderVisibility = false;
      }
      
      private function startLoaded(param1:Event) : void
      {
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.startLoaded);
         this.wheel.playButton.bitmapDataStart = (this._loader.content as Bitmap).bitmapData;
      }
      
      override public function onRegister() : void
      {
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
      }
      
      private function stateUpdate() : void
      {
         this.updateTickets();
         this.togglePlayButtonState();
         this.updatePossibleRewards();
      }
      
      private function checkAutoSpin() : void
      {
         if(this.wheelProxy.autoSpin)
         {
            this.wheelProxy.autoSpin = false;
            sendNotification(Note.START_SPIN);
            this.buyInProgress = false;
         }
      }
      
      private function updateTickets() : void
      {
         this.wheel.triesPanel.numberOfTries = this.numberOfTries;
      }
      
      private function rewardArrived() : void
      {
         var _loc1_:int = 0;
         this.wheelProxy.spin_log_data.push(TimeManager.currentTime);
         this.buyInProgress = false;
         if(this.isSpinning)
         {
            this.wheel.playButton.setEnabled(true);
            this.wheel.playButton.currentState = "forward";
            _loc1_ = this.rewardIndex;
            if(_loc1_ >= 0)
            {
               TweenLite.delayedCall(WHEEL_SPINN_TIME,this.wheel.birdPointer.stopAt,[_loc1_]);
            }
            else
            {
               this.reportABug("rewardArrived");
            }
         }
      }
      
      private function reportABug(param1:String) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.rawPhpData = this.wheelProxy.raw_log_data;
         _loc2_.rawflashData = this.wheelProxy.flash_log_data;
         _loc2_.flashWonReward = this.wonreward;
         _loc2_.buyAt = this.wheelProxy.buy_log_data;
         _loc2_.spinAt = this.wheelProxy.spin_log_data;
         _loc2_.closeAt = this.wheelProxy.close_log_data;
         _loc2_.requestAt = this.wheelProxy.request_log_data;
         _loc2_.uid = this.userProxy.userId;
         _loc2_.msg = "[log 2] WHEEL CRASH CAME FROM HERE: " + param1;
         if(this.wheelProxy.logError)
         {
            sendNotification(NET.LOG_FLASH_ERROR,[ObjectUtil.toString(_loc2_)]);
         }
      }
      
      private function spinWheelInfinite() : void
      {
         this.currentSoundChannel = SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_ZOOWHEEL_SPINNING);
         this.isSpinning = true;
         this.wheel.playButton.setEnabled(false);
         this.wheel.birdPointer.spin();
      }
      
      private function get rewardIndex() : int
      {
         var _loc1_:int = 0;
         if(this.wonreward)
         {
            _loc1_ = 0;
            while(_loc1_ < this.currentData.length)
            {
               if(this.currentData[_loc1_].category == this.wonreward.category && this.currentData[_loc1_].id == this.wonreward.id && this.currentData[_loc1_].count == this.wonreward.count)
               {
                  return _loc1_;
               }
               _loc1_++;
            }
            return -1;
         }
         return -1;
      }
      
      private function storeCurrentData() : void
      {
         this.currentData = this.wheelProxy.getPossibleRewards();
      }
      
      private function updatePossibleRewards() : void
      {
         var _loc1_:FortuneWheelRewardVO = null;
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc5_:WheelRewardItem = null;
         this.removeAllPossibleRewards();
         this.storeCurrentData();
         _loc3_ = this.currentData[BLUEPRINTSLOT].isBlueprint;
         var _loc4_:int = 0;
         while(_loc4_ < 8)
         {
            _loc1_ = this.currentData[_loc4_];
            if(!(_loc4_ != BLUEPRINTSLOT && this.currentData[_loc4_].isBlueprint))
            {
               _loc2_ = AssetIds.getPreviewAssetId(_loc1_.category,_loc1_.id);
               _loc5_ = new WheelRewardItem(_loc2_,AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,_loc1_);
               (this.wheel["price_" + _loc4_] as SpriteVisualElement).addChild(_loc5_);
            }
            _loc4_++;
         }
         this.wheel.blueprint.visible = _loc3_;
      }
      
      private function removeAllPossibleRewards() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            while((this.wheel["price_" + _loc1_] as SpriteVisualElement).numChildren)
            {
               (this.wheel["price_" + _loc1_] as SpriteVisualElement).removeChildAt(0);
            }
            _loc1_++;
         }
         this.wheel.birdPointer.reset();
      }
      
      private function togglePlayButtonState() : void
      {
         if(this.isSpinning)
         {
            this.wheel.playButton.currentState = "forward";
         }
         else if(this.numberOfTries < 1)
         {
            this.wheel.playButton.currentState = "deEmphasized";
         }
         else
         {
            this.wheel.playButton.currentState = "start";
         }
      }
      
      private function handleBuySpin(param1:ZooWheelBuyTryEvent) : void
      {
         if(!this.isSpinning && !this.buyInProgress)
         {
            this.buyInProgress = true;
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_BUY_SPIN,"",null,new WindowParams("",null,Note.CANCEL_BUY_NEW_SPIN,null,Note.BUY_SPIN,false,Note.CANCEL_BUY_NEW_SPIN,null)));
         }
      }
      
      private function handleStartStateClick(param1:ZooWheelStartEvent) : void
      {
         if(!this.isSpinning && !this.buyInProgress && !this.lastCommandInProgress)
         {
            SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_ZOOWHEEL_START_CLICK);
            sendNotification(Note.SPIN_WHEEL);
         }
      }
      
      private function handleBuyStateClick(param1:ZooWheelStartEvent) : void
      {
         if(!this.isSpinning && !this.buyInProgress && !this.lastCommandInProgress)
         {
            this.buyInProgress = true;
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_BUY_SPIN,"",null,new WindowParams("",null,Note.CANCEL_BUY_NEW_SPIN,null,Note.BUY_SPIN,true,Note.CANCEL_BUY_NEW_SPIN,null)));
         }
      }
      
      private function handleForwardStateClick(param1:ZooWheelStartEvent) : void
      {
         var _loc2_:int = 0;
         if(this.isSpinning && !this.buyInProgress && !this.lastCommandInProgress)
         {
            this.wheel.playButton.currentState = "start";
            _loc2_ = this.rewardIndex;
            if(_loc2_ < 0)
            {
               this.reportABug("handleForwardStateClick " + _loc2_);
            }
            this.wheel.birdPointer.stopAt(_loc2_);
            TweenLite.killDelayedCallsTo(this.wheel.birdPointer.stopAt);
            if(this.currentSoundChannel)
            {
               SoundManager.getInstance().stopChannel(this.currentSoundChannel);
            }
         }
      }
      
      private function handleStoppedAtReward(param1:ZooWheelRewardEvent = null) : void
      {
         if(!this.wonreward)
         {
            this.reportABug("handleStoppedAtReward");
         }
         if(this.wonreward)
         {
            sendNotification(Note.HANDLE_ZOO_WHEEL_WIN_REWARD,this.wonreward);
         }
         this.isSpinning = false;
      }
      
      private function get lastCommandInProgress() : Boolean
      {
         return this.wheelProxy.lastCommandInProgress;
      }
      
      private function get numberOfTries() : int
      {
         return this.wheelProxy.numberOfTries;
      }
      
      private function get possibleRewards() : Vector.<FortuneWheelRewardVO>
      {
         return this.wheelProxy.getPossibleRewards();
      }
      
      private function get wonreward() : FortuneWheelRewardVO
      {
         return this.wheelProxy.getWonReward();
      }
      
      private function get wheelWindow() : ZooWheelWindow
      {
         return this.viewComponent as ZooWheelWindow;
      }
      
      private function get buyInProgress() : Boolean
      {
         return this.wheelProxy.buyInProgress;
      }
      
      private function set buyInProgress(param1:Boolean) : void
      {
         this.wheelProxy.buyInProgress = param1;
      }
      
      private function get wheel() : ZooWheelContent
      {
         return this.wheelWindow.getContent(0) as ZooWheelContent;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      override public function dispose() : void
      {
         this.wheelProxy.close_log_data.push(TimeManager.currentTime);
         if(this.isSpinning && Boolean(this.wonreward))
         {
            this.handleStoppedAtReward();
         }
         TweenLite.killDelayedCallsTo(this.wheel.birdPointer.stopAt);
         this.wheel.dispose();
      }
   }
}

