package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.safari.SafariProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariJokerConfigData;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.safari.data.SafariJokerShopData;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariOpenBuyGasNotice;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.btn.SimpleButtonController;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import custom.card.component.CardGroupHolder;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import spark.components.Group;
   
   public class SafariShopWindow extends WindowAbstract
   {
      public static var useAsiaHack:Boolean = false;
      
      private var notifier:Notifier;
      
      private var nextGameTimeStamp:int;
      
      private var bubble:Sprite;
      
      private var waitTimeBitmap:Bitmap;
      
      private var fuelAmmountBitmap:Bitmap;
      
      private var clockPic:Sprite;
      
      private var fuelButton:SimpleButton;
      
      private var startGameButton:SimpleButton;
      
      private var jokerCardsCheckMarks:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var safariConfig:SafariConfigData;
      
      private var jokerGroups:Vector.<int> = new Vector.<int>();
      
      private var jokerGroupIndex:int = 0;
      
      private var regeonId:int;
      
      private var ownedJokers:Vector.<int> = new Vector.<int>();
      
      private var isTimerRunning:Boolean;
      
      private var infoButtonController:SimpleButtonController;
      
      private var safariData:SafariData;
      
      private var baseFuelAmmount:int;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var safariProxy:SafariProxy;
      
      public function SafariShopWindow(param1:Notifier, param2:SafariConfigData, param3:int)
      {
         super();
         this.notifier = new Notifier(param1);
         this.safariConfig = param2;
         this.regeonId = param3;
         this.persistent = true;
         this.safariProxy = TempGetterProxy.getFacade().retrieveProxy(SafariProxy.NAME) as SafariProxy;
      }
      
      override public function preOpen() : void
      {
         var _loc1_:Group = null;
         var _loc2_:CardGroupHolder = null;
         _loc1_ = new Group();
         _loc1_.x = -278;
         _loc1_.y = 40;
         _loc2_ = new CardGroupHolder();
         _loc2_.width = 500;
         _loc2_.currentState = "noForwardArrows";
         _loc2_.paginator.entriesPerPage = 4;
         _loc2_.layoutDisplay.horizontalGap = 15;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(_loc2_,CardHolderModes.SAFARI_SHOP_MODE);
         TempGetterProxy.getFacade().registerMediator(this.cardGroupHolderMediator);
         _loc1_.addElement(_loc2_);
         WindowManagerNew.groupRef.addElement(_loc1_);
         this.cardGroupHolderMediator.mode = CardHolderModes.SAFARI_SHOP_MODE;
         this.cardGroupHolderMediator.dataProvider = this.safariProxy.getJokersDataProvider();
      }
      
      public function invalidateJokers() : void
      {
         this.cardGroupHolderMediator.dataProvider = this.safariProxy.getJokersDataProvider();
      }
      
      override public function startWindow() : void
      {
         super.offsetY = 30;
         super.setWindowPosition();
         super.headerFileName = "header_safari";
         this.parseSafariConfig();
         setHeader();
         this.setOuterContent();
         this.setInnerContent();
      }
      
      private function parseSafariConfig() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.safariConfig.jokerConfig.length)
         {
            _loc2_ = this.safariConfig.jokerConfig[_loc1_].groupId;
            _loc3_ = false;
            _loc4_ = 0;
            while(_loc4_ < this.jokerGroups.length)
            {
               if(this.jokerGroups[_loc4_] == _loc2_)
               {
                  _loc3_ = true;
               }
               _loc4_++;
            }
            if(!_loc3_)
            {
               this.jokerGroups.push(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function getJokerGropShopDatas() : Vector.<SafariJokerShopData>
      {
         var _loc3_:SafariJokerConfigData = null;
         var _loc4_:SafariJokerShopData = null;
         var _loc1_:Vector.<SafariJokerShopData> = new Vector.<SafariJokerShopData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.safariConfig.jokerConfig.length)
         {
            _loc3_ = this.safariConfig.jokerConfig[_loc2_];
            _loc4_ = new SafariJokerShopData();
            _loc4_.itemId = _loc3_.id;
            _loc4_.groupId = _loc3_.groupId;
            _loc4_.buyVirtual = _loc3_.virtualPrice;
            _loc4_.buyReal = _loc3_.realPrice;
            _loc1_.push(_loc4_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function setOuterContent() : void
      {
         this.bubble = AssetLibrary.getSprite("WindowGeneralHeaders","SafariHeaderBubbleSPR");
         super.outer.addChild(this.bubble);
         var _loc1_:MovieClip = this.bubble.getChildByName("soniaPic") as MovieClip;
         if(this.regeonId == 4 || this.regeonId == 5 || this.regeonId == 6)
         {
            SafariShopWindow.useAsiaHack = true;
            _loc1_.gotoAndStop("asia");
         }
         else
         {
            SafariShopWindow.useAsiaHack = false;
            _loc1_.gotoAndStop("africa");
         }
         var _loc2_:TextField = new TextField();
         StyleModule.setTextFieldStyle(_loc2_,StyleModule.HEADER_BOLD_11_LEFT);
         _loc2_.textColor = MainConfig.PRICE_TXT_COLOR_ENABLE_BROWN;
         _loc2_.multiline = true;
         _loc2_.htmlText = TextResourceModule.getText("zoo.safari.shopWindow.sonjaBubble");
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.x = 210;
         _loc2_.y = 109;
         _loc2_.width = 278;
         _loc2_.height = 105;
         super.outer.addChild(_loc2_);
         this.startGameButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"ButtonHugeBTN");
         this.startGameButton.x = 340;
         this.startGameButton.y = 470;
         super.outer.addChild(this.startGameButton);
         var _loc3_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText("zoo.safari.button.startSafari"),StyleModule.HEADER_BOLD_14);
         _loc3_.x = this.startGameButton.x - (_loc3_.width >> 1);
         _loc3_.y = this.startGameButton.y - (_loc3_.height >> 1);
         super.outer.addChild(_loc3_);
      }
      
      override public function setInnerContent() : void
      {
         var _loc1_:SimpleButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"InfoBTN");
         super.inner.addChild(_loc1_);
         _loc1_.x = 588;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.handleInfoClick);
         this.infoButtonController = new SimpleButtonController(_loc1_);
         this.infoButtonController.addTooltip(TextResourceModule.getText("zoo.tooltip.infobutton"),true);
         this.infoButtonController.addContrastEffect();
         var _loc2_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ICON_BACK);
         super.inner.addChild(_loc2_);
         _loc2_.x = 550;
         _loc2_.y = 122;
         this.fuelButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"GasBTN");
         super.inner.addChild(this.fuelButton);
         this.fuelButton.x = 550;
         this.fuelButton.y = 122;
         this.fuelButton.addEventListener(MouseEvent.CLICK,this.handleSkipTimerConfirmation);
         var _loc3_:SimpleButtonController = new SimpleButtonController(this.fuelButton);
         _loc3_.addTooltip(TextResourceModule.getText("zoo.safari.tooltip.skipTimerInShop"),true);
         this.clockPic = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"ClockSPR");
         super.inner.addChild(this.clockPic);
         this.clockPic.x = 615;
         this.clockPic.y = 166;
         this.fuelAmmountBitmap = GUITemplates.createMaskedGradientTextfield("x 99",StyleModule.HEADER_BOLD_22);
         super.inner.addChild(this.fuelAmmountBitmap);
         this.fuelAmmountBitmap.x = 585;
         this.fuelAmmountBitmap.y = 100;
         this.waitTimeBitmap = GUITemplates.createMaskedGradientTextfield("9999:60.60",StyleModule.HEADER_BOLD_11);
         super.inner.addChild(this.waitTimeBitmap);
         this.waitTimeBitmap.x = 525;
         this.waitTimeBitmap.y = 162;
         var _loc4_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"VecticalLongBarSPR");
         _loc4_.x = 65 + 140 + 140 + 3;
         _loc4_.y = 255;
         _loc4_.height = 170;
         super.inner.addChild(_loc4_);
      }
      
      private function showJokerGroup(param1:int) : void
      {
      }
      
      private function checkHasItem(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.ownedJokers.length)
         {
            if(this.ownedJokers[_loc3_] == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function checkHasItemFromGroup(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = this.getItemGroupId(param1);
         var _loc4_:int = 0;
         while(_loc4_ < this.ownedJokers.length)
         {
            _loc5_ = this.ownedJokers[_loc4_];
            _loc6_ = this.getItemGroupId(_loc5_);
            if(_loc6_ == _loc3_)
            {
               _loc2_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function getItemGroupId(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.safariConfig.jokerConfig.length)
         {
            if(param1 == this.safariConfig.jokerConfig[_loc3_].id)
            {
               _loc2_ = this.safariConfig.jokerConfig[_loc3_].groupId;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function updateState(param1:SafariData, param2:int) : void
      {
         this.baseFuelAmmount = param2;
         this.safariData = param1;
         this.drowShop();
         this.safariProxy.updateSafariData(param1);
      }
      
      public function drowShop() : void
      {
         this.isTimerRunning = this.safariData.nextGameTimeStamp >= TimeManager.currentTime;
         this.startGameButton.mouseEnabled = true;
         if(this.isTimerRunning)
         {
            GUITemplates.drowMaskedGradientTextfield(this.fuelAmmountBitmap,"x 0",StyleModule.HEADER_BOLD_22);
            this.waitTimeBitmap.visible = true;
            this.clockPic.visible = true;
            this.fuelButton.mouseEnabled = true;
            this.nextGameTimeStamp = this.safariData.nextGameTimeStamp;
            TimeManager.registerTickFunction(this.updateMinigameTimer);
            this.updateMinigameTimer();
            this.startGameButton.removeEventListener(MouseEvent.CLICK,this.handleStartSafari);
            this.startGameButton.addEventListener(MouseEvent.CLICK,this.handleSkipTimerConfirmation);
         }
         else
         {
            GUITemplates.drowMaskedGradientTextfield(this.fuelAmmountBitmap,"x " + this.baseFuelAmmount,StyleModule.HEADER_BOLD_22);
            this.waitTimeBitmap.visible = false;
            this.clockPic.visible = false;
            this.fuelButton.mouseEnabled = false;
            TimeManager.unregisterTickFunction(this.updateMinigameTimer);
            this.startGameButton.removeEventListener(MouseEvent.CLICK,this.handleSkipTimerConfirmation);
            this.startGameButton.addEventListener(MouseEvent.CLICK,this.handleStartSafari);
         }
         if(this.safariData.jokers)
         {
            this.ownedJokers = this.safariData.jokers;
         }
         else
         {
            this.ownedJokers = new Vector.<int>();
         }
         this.showJokerGroup(this.jokerGroupIndex);
      }
      
      private function handleStartSafari(param1:MouseEvent = null) : void
      {
         TempGetterProxy.sendNotification(NET.START_SAFARI,[this.regeonId]);
      }
      
      private function handleSkipTimerConfirmation(param1:MouseEvent = null) : void
      {
         this.notifier.dispatchNotice(new SafariOpenBuyGasNotice(SafariOpenBuyGasNotice.OPEN_SKIP_TIMER_WINDOW));
      }
      
      public function disableShopButtons() : void
      {
         this.fuelButton.mouseEnabled = false;
         this.startGameButton.mouseEnabled = false;
      }
      
      private function handleInfoClick(param1:MouseEvent) : void
      {
         var _loc2_:SafariShopInfoWindow = new SafariShopInfoWindow(this.notifier);
         WindowManager.getInstance().showWindow(_loc2_);
         this.close();
      }
      
      override public function close() : void
      {
         if(this.cardGroupHolderMediator)
         {
            TempGetterProxy.getFacade().removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.SAFARI_SHOP_MODE.toString());
         }
         super.close();
      }
      
      private function updateMinigameTimer() : void
      {
         var _loc1_:int = this.nextGameTimeStamp - TimeManager.currentTime + 3;
         if(_loc1_ > TimeManager.SECONDS_IN_DAY)
         {
            _loc1_ = TimeManager.SECONDS_IN_DAY;
         }
         if(_loc1_ >= 0)
         {
            GUITemplates.drowMaskedGradientTextfield(this.waitTimeBitmap,TimeFormat.secondsToTimeString(_loc1_),StyleModule.HEADER_BOLD_11);
         }
         else
         {
            this.drowShop();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         TimeManager.unregisterTickFunction(this.updateMinigameTimer);
         this.startGameButton.removeEventListener(MouseEvent.CLICK,this.handleSkipTimerConfirmation);
         this.startGameButton.removeEventListener(MouseEvent.CLICK,this.handleStartSafari);
      }
   }
}

