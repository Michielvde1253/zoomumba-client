package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.safari.SafariProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariConfigData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariTileData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.safari.SafariShowItemInitParams;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.safari.SafariRegions;
   import com.bigpoint.zoorama.core.feature.safari.data.SafariJokerShopData;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariOpenBuyGasNotice;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariTileNotice;
   import com.bigpoint.zoorama.core.feature.safari.windows.components.MapTile;
   import com.bigpoint.zoorama.core.feature.safari.windows.components.SafariPriceItem;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.btn.SimpleButtonController;
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import com.bigpoint.zoorama.view.windows.WindowManagerNew;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import custom.card.component.CardGroupHolder;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import spark.components.Group;
   
   public class SafariMinigameWindow extends WindowAbstract
   {
      private static const TILE_GAP:Number = 10;
      
      private static const TILE_SIZE:Number = 60;
      
      private var notifier:Notifier;
      
      private var safariConfig:SafariConfigData;
      
      private var fuelAmmountBitmap:Bitmap;
      
      private var mapView:Vector.<Vector.<MapTile>> = new Vector.<Vector.<MapTile>>();
      
      private var jeepToken:Sprite;
      
      private var safariData:SafariData;
      
      private var arrowRight:SimpleButton;
      
      private var arrowLeft:SimpleButton;
      
      private var jokerCardIndex:int = 0;
      
      private var jokerCardId:int = -1;
      
      private var exploreTileCords:Point;
      
      private var noJokerTextBitmap:Bitmap;
      
      private var endGameButton:SimpleButton;
      
      private var petPawsQuickInfo:Sprite;
      
      private var expQuickInfo:Sprite;
      
      private var expQuickInfoTextField:TextField;
      
      private var mapRowCount:int;
      
      private var mapColumnCount:int;
      
      private var infoButtonController:SimpleButtonController;
      
      private var safariBackHolder:Sprite;
      
      private var maskShape:Shape = new Shape();
      
      private var safariBackPic:Sprite;
      
      private var safariProxy:SafariProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      public var refreshJokers:Boolean = true;
      
      public var cardHolder:CardGroupHolder;
      
      public function SafariMinigameWindow(param1:Notifier, param2:SafariConfigData)
      {
         super();
         this.safariConfig = param2;
         this.notifier = new Notifier(param1);
         this.notifier.registerNoticeListener(SafariTileNotice.EXPLORE_TILE,this.handleExploreTile);
         this.notifier.registerNoticeListener(SafariTileNotice.USE_JOKER_ONTILE,this.handleUseJokerOnTile);
         this.persistent = true;
         this.safariProxy = TempGetterProxy.getFacade().retrieveProxy(SafariProxy.NAME) as SafariProxy;
      }
      
      override public function startWindow() : void
      {
         super.offsetX = 100;
         super.offsetY = 30;
         super.setWindowPosition();
         super.headerFileName = "header_safari";
         this.jokerCardIndex = 0;
         this.jokerCardId = -1;
         setHeader();
         this.setOuterContent();
         this.setInnerContent();
      }
      
      override public function preOpen() : void
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 130;
         _loc1_.y = 20;
         this.cardHolder = new CardGroupHolder();
         this.cardHolder.width = 130;
         this.cardHolder.currentState = "noForwardArrows";
         this.cardHolder.paginator.entriesPerPage = 1;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.cardHolder,CardHolderModes.SAFARI_INTERNAL_MODE);
         TempGetterProxy.getFacade().registerMediator(this.cardGroupHolderMediator);
         _loc1_.addElement(this.cardHolder);
         WindowManagerNew.groupRef.addElement(_loc1_);
         this.cardGroupHolderMediator.mode = CardHolderModes.SAFARI_INTERNAL_MODE;
      }
      
      override public function setOuterContent() : void
      {
         this.jeepToken = AssetLibrary.getSprite("safari_gui","JeepTokenSPR");
         this.jeepToken.mouseChildren = false;
         this.jeepToken.mouseEnabled = false;
         this.jeepToken.visible = false;
         this.outer.addChild(this.jeepToken);
         this.endGameButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"ButtonHugeBTN");
         this.endGameButton.x = 340;
         this.endGameButton.y = 470;
         super.outer.addChild(this.endGameButton);
         this.endGameButton.addEventListener(MouseEvent.CLICK,this.handleGameCloseClick);
         var _loc1_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText("zoo.safari.button.endSafari"),StyleModule.HEADER_BOLD_14);
         _loc1_.x = this.endGameButton.x - (_loc1_.width >> 1);
         _loc1_.y = this.endGameButton.y - (_loc1_.height >> 1);
         super.outer.addChild(_loc1_);
         this.petPawsQuickInfo = new Sprite();
         this.petPawsQuickInfo.mouseEnabled = false;
         this.petPawsQuickInfo.mouseChildren = false;
         super.outer.addChild(this.petPawsQuickInfo);
         this.petPawsQuickInfo.visible = false;
         this.expQuickInfo = new Sprite();
         this.expQuickInfo.mouseEnabled = false;
         this.expQuickInfo.mouseChildren = false;
         super.outer.addChild(this.expQuickInfo);
         this.expQuickInfo.visible = false;
         AssetLibrary.sendAssetToFunction("quickInfo",this.handleQuickInfoAsset);
         super.outer.mouseEnabled = false;
      }
      
      private function handleQuickInfoAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite("QuickIconSPR");
         (_loc2_["amount_txt"] as TextField).text = "+4";
         (_loc2_["resourceIcon_mc"] as MovieClip).gotoAndStop("currency_" + UserResources.PET_POWNS);
         this.petPawsQuickInfo.addChild(_loc2_);
         _loc2_.x = 20;
         _loc2_.y = 20;
         _loc2_ = param1.getEmbededSprite("QuickIconSPR");
         this.expQuickInfoTextField = _loc2_["amount_txt"] as TextField;
         this.expQuickInfoTextField.text = "123";
         (_loc2_["resourceIcon_mc"] as MovieClip).gotoAndStop("currency_" + UserResources.EXPERIENCE);
         this.expQuickInfo.addChild(_loc2_);
         _loc2_.x = 20;
         _loc2_.y = 20;
      }
      
      override public function setInnerContent() : void
      {
         this.safariBackHolder = new Sprite();
         super.inner.addChild(this.safariBackHolder);
         var _loc1_:SimpleButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"InfoBTN");
         _loc1_.x = 580;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.handleInfoClick);
         this.infoButtonController = new SimpleButtonController(_loc1_);
         this.infoButtonController.addTooltip(TextResourceModule.getText("zoo.tooltip.infobutton"),true);
         this.infoButtonController.addContrastEffect();
         var _loc2_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"HorizontalShortBarSPR");
         super.inner.addChild(_loc2_);
         _loc2_.x = 426;
         _loc2_.y = 93;
         var _loc3_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"HorizontalShortBarSPR");
         super.inner.addChild(_loc3_);
         _loc3_.x = 426;
         _loc3_.y = 225;
         var _loc4_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"VecticalLongBarSPR");
         super.inner.addChild(_loc4_);
         _loc4_.x = 422;
         _loc4_.y = 40;
         this.arrowRight = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"BigItemArrowBTN");
         this.arrowRight.x = 625;
         this.arrowRight.y = 333;
         super.inner.addChild(this.arrowRight);
         this.arrowRight.addEventListener(MouseEvent.CLICK,this.handleJokerRightClick);
         this.arrowLeft = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"BigItemArrowBTN");
         super.inner.addChild(this.arrowLeft);
         this.arrowLeft.x = 455;
         this.arrowLeft.y = 333;
         this.arrowLeft.scaleX = -1;
         this.arrowLeft.addEventListener(MouseEvent.CLICK,this.handleJokerLeftClick);
         this.arrowLeft.visible = false;
         this.arrowRight.visible = false;
         var _loc5_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"IconBigBackSPR");
         super.inner.addChild(_loc5_);
         _loc5_.x = 507;
         _loc5_.y = 172;
         var _loc6_:SimpleButton = AssetLibrary.getButton(AssetConfig.ASSET_COMMONS_SYMBOLS,"GasBigBTN");
         super.inner.addChild(_loc6_);
         _loc6_.x = 507;
         _loc6_.y = 172;
         _loc6_.addEventListener(MouseEvent.CLICK,this.handleGasClick);
         var _loc7_:SimpleButtonController = new SimpleButtonController(_loc6_);
         _loc7_.addTooltip(TextResourceModule.getText("zoo.safari.tooltip.buyGasInMinigame"),true);
         this.fuelAmmountBitmap = GUITemplates.createMaskedGradientTextfield("x -99",StyleModule.HEADER_BOLD_24);
         super.inner.addChild(this.fuelAmmountBitmap);
         this.fuelAmmountBitmap.x = 565;
         this.fuelAmmountBitmap.y = 150;
         this.noJokerTextBitmap = GUITemplates.createBitmapTextfield(TextResourceModule.getText("zoo.safari.miniGame.noJoker"),StyleModule.HEADER_BOLD_18,3480321);
         super.inner.addChild(this.noJokerTextBitmap);
         this.noJokerTextBitmap.x = 540 - (this.noJokerTextBitmap.width >> 1);
         this.noJokerTextBitmap.y = 320 - (this.noJokerTextBitmap.height >> 1);
      }
      
      private function handleGasClick(param1:MouseEvent) : void
      {
         this.showBuyFuelWindow(1);
      }
      
      private function handleJokerLeftClick(param1:MouseEvent) : void
      {
         --this.jokerCardIndex;
         this.updateJokers();
      }
      
      private function handleJokerRightClick(param1:MouseEvent) : void
      {
         ++this.jokerCardIndex;
         this.updateJokers();
      }
      
      public function updateState(param1:SafariData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.safariData = param1;
         GUITemplates.drowMaskedGradientTextfield(this.fuelAmmountBitmap,"x " + param1.fuelAmmount,StyleModule.HEADER_BOLD_24);
         if(param1.map)
         {
            this.mapRowCount = param1.map.length;
            if(this.mapRowCount > 0)
            {
               this.mapColumnCount = param1.map[0].length;
            }
            if(this.mapRowCount > 0 && this.mapColumnCount > 0)
            {
               this.createPlaceholders(this.mapRowCount,this.mapColumnCount);
               _loc2_ = 0;
               while(_loc2_ < this.mapRowCount)
               {
                  _loc3_ = 0;
                  while(_loc3_ < this.mapColumnCount)
                  {
                     this.mapView[_loc2_][_loc3_].updateState(param1.map[_loc2_][_loc3_]);
                     _loc3_++;
                  }
                  _loc2_++;
               }
               this.disableAllMapActions();
               if(param1.tokenPosition)
               {
                  if(param1.tokenPosition.x >= 0 && param1.tokenPosition.y >= 0)
                  {
                     if(this.jeepToken.visible)
                     {
                        TweenLite.to(this.jeepToken,0.5,{
                           "x":this.mapView[param1.tokenPosition.y][param1.tokenPosition.x].x,
                           "y":this.mapView[param1.tokenPosition.y][param1.tokenPosition.x].y,
                           "onComplete":this.checkMoveOutcome
                        });
                     }
                     else
                     {
                        this.jeepToken.visible = true;
                        this.jeepToken.x = this.mapView[param1.tokenPosition.y][param1.tokenPosition.x].x;
                        this.jeepToken.y = this.mapView[param1.tokenPosition.y][param1.tokenPosition.x].y;
                        this.enableAjustantTilesForMove();
                        this.checkMoveOutcome();
                     }
                  }
                  else
                  {
                     this.jeepToken.visible = false;
                     this.enableBottemRowForMove();
                  }
               }
            }
         }
         this.updateJokers();
      }
      
      private function checkMoveOutcome() : void
      {
         var _loc1_:int = 0;
         var _loc2_:SafariPriceItem = null;
         if(Boolean(this.safariData.tokenPosition) && Boolean(this.safariData.map))
         {
            if(this.safariData.tokenPosition.x >= 0 && this.safariData.tokenPosition.y >= 0)
            {
               if(this.safariData.map[this.safariData.tokenPosition.y][this.safariData.tokenPosition.x].contentType == SafariTileData.CONTENT_TYPE_ANIMAL)
               {
                  if(this.safariData.revardData)
                  {
                     SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_REWARD_MAJOR);
                     TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SAFARI_SHOW_ITEM_WINDOW,"",new SafariShowItemInitParams("",Categories.getCategoryIdFromName(this.safariData.revardData.type),this.safariData.revardData.id,null)));
                     WindowManagerNew.closeWindow(this);
                     this.disableAllMapActions();
                     this.clearGameData();
                     this.updateJokers();
                  }
               }
               else
               {
                  this.checkForDepletedFuel();
                  if(this.exploreTileCords)
                  {
                     _loc1_ = 0;
                     switch(this.safariData.map[this.exploreTileCords.y][this.exploreTileCords.x].terainType)
                     {
                        case SafariTileData.TERAIN_TYPE_EASY:
                           SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_NORMAL_TERAIN);
                           _loc1_ = this.safariConfig.easyTileXPReward;
                           break;
                        case SafariTileData.TERAIN_TYPE_HARD:
                           SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_HARD_TERAIN);
                           _loc1_ = this.safariConfig.hardTileXPReward;
                     }
                     switch(this.safariData.map[this.exploreTileCords.y][this.exploreTileCords.x].contentType)
                     {
                        case SafariTileData.CONTENT_TYPE_TREASURE:
                           SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_REWARD_MINOR);
                           if(this.safariData.revardData)
                           {
                              _loc2_ = new SafariPriceItem(this.safariData.revardData.type,this.safariData.revardData.id,this.safariData.revardData.count);
                              TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SAFARI_SHOW_ITEM_WINDOW,"",new SafariShowItemInitParams("",Categories.getCategoryIdFromName(this.safariData.revardData.type),this.safariData.revardData.id,_loc2_)));
                           }
                           _loc1_ = this.safariConfig.treasureTileXPReward;
                           break;
                        case SafariTileData.CONTENT_TYPE_TRAP:
                           SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SAFARI_TRAP);
                           this.showTrapWindow();
                           _loc1_ = this.safariConfig.treasureTileXPReward;
                           break;
                        case SafariTileData.CONTENT_TYPE_TRAIL_UP:
                        case SafariTileData.CONTENT_TYPE_TRAIL_RIGHT:
                        case SafariTileData.CONTENT_TYPE_TRAIL_DOWN:
                        case SafariTileData.CONTENT_TYPE_TRAIL_LEFT:
                           this.petPawsQuickInfo.visible = true;
                           this.petPawsQuickInfo.x = this.mapView[this.exploreTileCords.y][this.exploreTileCords.x].x;
                           this.petPawsQuickInfo.y = this.mapView[this.exploreTileCords.y][this.exploreTileCords.x].y - 50;
                           TweenLite.to(this.petPawsQuickInfo,1,{
                              "y":this.petPawsQuickInfo.y - 50,
                              "onComplete":this.removeQuickInfoAnim,
                              "onCompleteParams":[this.petPawsQuickInfo],
                              "ease":Strong.easeOut
                           });
                           _loc1_ = this.safariConfig.treasureTileXPReward;
                     }
                     this.expQuickInfoTextField.text = "+" + _loc1_;
                     this.expQuickInfo.visible = true;
                     this.expQuickInfo.x = this.mapView[this.exploreTileCords.y][this.exploreTileCords.x].x;
                     this.expQuickInfo.y = this.mapView[this.exploreTileCords.y][this.exploreTileCords.x].y;
                     TweenLite.to(this.expQuickInfo,1,{
                        "y":this.expQuickInfo.y - 50,
                        "onComplete":this.removeQuickInfoAnim,
                        "onCompleteParams":[this.expQuickInfo],
                        "ease":Strong.easeOut
                     });
                     this.exploreTileCords = null;
                  }
                  this.enableAjustantTilesForMove();
               }
            }
         }
      }
      
      private function clearGameData() : void
      {
         this.safariData.jokers = null;
         this.safariData.map = null;
         this.safariData.gameStarted = 0;
         this.safariData.revardData = null;
         this.safariData.tokenPosition = new Point(-1,-1);
      }
      
      public function checkForDepletedFuel() : void
      {
         if(this.safariData.fuelAmmount <= 0)
         {
            this.showBuyFuelWindow(1 - this.safariData.fuelAmmount,OldWindowTypes.MINIGAME_SAFARI_DEPLETED_GAS);
         }
      }
      
      private function enableAjustantTilesForMove() : void
      {
         if(this.safariData.tokenPosition.x + 1 < this.mapColumnCount)
         {
            if(this.safariData.map[this.safariData.tokenPosition.y][this.safariData.tokenPosition.x + 1].terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
            {
               this.mapView[this.safariData.tokenPosition.y][this.safariData.tokenPosition.x + 1].enableMoveAction();
            }
         }
         if(this.safariData.tokenPosition.x - 1 >= 0)
         {
            if(this.safariData.map[this.safariData.tokenPosition.y][this.safariData.tokenPosition.x - 1].terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
            {
               this.mapView[this.safariData.tokenPosition.y][this.safariData.tokenPosition.x - 1].enableMoveAction();
            }
         }
         if(this.safariData.tokenPosition.y + 1 < this.mapRowCount)
         {
            if(this.safariData.map[this.safariData.tokenPosition.y + 1][this.safariData.tokenPosition.x].terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
            {
               this.mapView[this.safariData.tokenPosition.y + 1][this.safariData.tokenPosition.x].enableMoveAction();
            }
         }
         if(this.safariData.tokenPosition.y - 1 >= 0)
         {
            if(this.safariData.map[this.safariData.tokenPosition.y - 1][this.safariData.tokenPosition.x].terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
            {
               this.mapView[this.safariData.tokenPosition.y - 1][this.safariData.tokenPosition.x].enableMoveAction();
            }
         }
      }
      
      private function enableBottemRowForMove() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.mapColumnCount)
         {
            if(this.safariData.map[this.mapRowCount - 1][_loc1_].terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
            {
               this.mapView[this.mapRowCount - 1][_loc1_].enableMoveAction();
            }
            _loc1_++;
         }
      }
      
      private function removeQuickInfoAnim(param1:Sprite) : void
      {
         param1.visible = false;
      }
      
      private function showTrapWindow() : void
      {
         TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SAFARI_SHOW_ITEM_WINDOW,"",new SafariShowItemInitParams("",Categories.ANIMAL,1,null,true)));
      }
      
      private function updateJokers() : void
      {
         var _loc1_:Vector.<Object> = this.safariProxy.getActiveJokersDataProvider();
         if(this.refreshJokers)
         {
            TempGetterProxy.getFacade().removeMediator(this.cardGroupHolderMediator.getMediatorName());
            this.cardGroupHolderMediator = new CardGroupHolderMediator(this.cardHolder,CardHolderModes.SAFARI_INTERNAL_MODE);
            TempGetterProxy.getFacade().registerMediator(this.cardGroupHolderMediator);
            this.cardGroupHolderMediator.mode = CardHolderModes.SAFARI_INTERNAL_MODE;
            this.cardGroupHolderMediator.dataProvider = this.safariProxy.getActiveJokersDataProvider();
            this.refreshJokers = false;
         }
      }
      
      public function disableAllMapActions() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.mapView.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.mapView[_loc1_].length)
            {
               this.mapView[_loc1_][_loc2_].disableMoveAction();
               this.mapView[_loc1_][_loc2_].disableJokerSelectAction();
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function createPlaceholders(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:MapTile = null;
         if(!(this.mapView.length == param1 && this.mapView[0].length == param2))
         {
            if(Boolean(this.safariBackPic) && this.safariBackHolder.contains(this.safariBackPic))
            {
               this.safariBackHolder.removeChild(this.safariBackPic);
            }
            if(this.safariBackHolder.contains(this.maskShape))
            {
               this.safariBackHolder.removeChild(this.maskShape);
            }
            this.maskShape.graphics.clear();
            this.maskShape.graphics.beginFill(255);
            this.maskShape.graphics.beginFill(255);
            while(this.mapView.length < param1)
            {
               this.mapView.push(new Vector.<MapTile>());
            }
            _loc3_ = 0;
            while(_loc3_ < param1)
            {
               while(this.mapView[_loc3_].length < param2)
               {
                  _loc5_ = new MapTile(this.notifier,_loc3_,this.mapView[_loc3_].length);
                  this.mapView[_loc3_].push(_loc5_);
                  this.inner.addChild(_loc5_);
               }
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  _loc5_ = this.mapView[_loc3_][_loc4_];
                  _loc5_.x = (TILE_SIZE + TILE_GAP) * _loc4_ + (240 - (TILE_SIZE + TILE_GAP) * param2 / 2);
                  _loc5_.y = (TILE_SIZE + TILE_GAP) * _loc3_ + (260 - (TILE_SIZE + TILE_GAP) * param1 / 2);
                  this.maskShape.graphics.drawRect(_loc5_.x,_loc5_.y,60,60);
                  _loc4_++;
               }
               while(this.mapView[_loc3_].length > param2)
               {
                  _loc5_ = this.mapView[_loc3_].pop();
                  _loc5_.dispose();
                  this.inner.removeChild(_loc5_);
               }
               _loc3_++;
            }
            while(this.mapView.length > param1)
            {
               while(this.mapView[this.mapView.length - 1].length)
               {
                  _loc5_ = this.mapView[this.mapView.length - 1].pop();
                  _loc5_.dispose();
                  this.inner.removeChild(_loc5_);
               }
               this.mapView.pop();
            }
            this.maskShape.graphics.endFill();
            AssetLibrary.sendAssetToFunction(SafariRegions.REGION_BACKGNOUDN_PICS[this.safariData.regeonId],this.handleRegeonBackPic);
         }
      }
      
      private function handleRegeonBackPic(param1:SWFAsset) : void
      {
         this.safariBackPic = param1.getEmbededSprite("RegeonBackSPR");
         this.safariBackHolder.addChild(this.safariBackPic);
         this.safariBackHolder.addChild(this.maskShape);
         this.safariBackPic.mask = this.maskShape;
         var _loc2_:int = this.mapView[0][0].x;
         var _loc3_:int = this.mapView[0][0].y;
         var _loc4_:int = this.mapView[this.mapView.length - 1][this.mapView[this.mapView.length - 1].length - 1].x + 60;
         var _loc5_:int = this.mapView[this.mapView.length - 1][this.mapView[this.mapView.length - 1].length - 1].y + 60;
         this.safariBackPic.x = _loc2_ - Math.floor(Math.random() * (this.safariBackPic.width - (_loc4_ - _loc2_)));
         this.safariBackPic.x = _loc3_ - Math.floor(Math.random() * (this.safariBackPic.height - (_loc5_ - _loc3_)));
      }
      
      private function handleExploreTile(param1:SafariTileNotice) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.safariData.map[param1.y][param1.x].terainType;
         if(this.safariData.map[param1.y][param1.x].isOpened)
         {
            _loc3_ = 1;
         }
         else
         {
            switch(_loc2_)
            {
               case SafariTileData.TERAIN_TYPE_EASY:
                  _loc3_ = 1;
                  break;
               case SafariTileData.TERAIN_TYPE_HARD:
                  _loc3_ = 3;
                  break;
               case SafariTileData.TERAIN_TYPE_IMPASSABLE:
               default:
                  _loc3_ = 1000;
            }
         }
         if(this.safariData.fuelAmmount >= _loc3_)
         {
            if(!this.safariData.map[param1.y][param1.x].isVisited)
            {
               this.exploreTileCords = new Point(param1.x,param1.y);
            }
            TempGetterProxy.sendNotification(NET.EXPLORE_SAFARI_TILE,[param1.x,param1.y]);
            this.disableAllMapActions();
         }
         else
         {
            this.showBuyFuelWindow(_loc3_ - this.safariData.fuelAmmount,OldWindowTypes.MINIGAME_SAFARI_MISSING_GAS);
         }
      }
      
      private function handleUseJokerOnTile(param1:SafariTileNotice) : void
      {
         this.disableAllMapActions();
         var _loc2_:SafariJokerShopData = new SafariJokerShopData();
         _loc2_.itemId = param1.jokerId;
         _loc2_.needsMoney = false;
         _loc2_.isBeeingUsed = true;
         _loc2_.jokerUsePosX = param1.x;
         _loc2_.jokerUsePosY = param1.y;
         var _loc3_:SafariShopData = new SafariShopData();
         _loc3_.itemId = param1.jokerId;
         _loc3_.useMode = true;
         _loc3_.jokerUsePosX = param1.x;
         _loc3_.jokerUsePosY = param1.y;
         TempGetterProxy.sendNotification(Note.USE_SAFARI_JOKER,_loc3_);
      }
      
      private function showBuyFuelWindow(param1:int, param2:int = -1) : void
      {
         var _loc3_:SafariOpenBuyGasNotice = null;
         switch(param2)
         {
            case OldWindowTypes.MINIGAME_SAFARI_MISSING_GAS:
               _loc3_ = new SafariOpenBuyGasNotice(SafariOpenBuyGasNotice.OPEN_BUY_GAS_WINDOW,param1,"zoo.safari.miniGame.buyMissingGas");
               break;
            case OldWindowTypes.MINIGAME_SAFARI_DEPLETED_GAS:
               _loc3_ = new SafariOpenBuyGasNotice(SafariOpenBuyGasNotice.OPEN_BUY_GAS_WINDOW,param1,"zoo.safari.miniGame.buyGasThenEmpty");
               break;
            default:
               _loc3_ = new SafariOpenBuyGasNotice(SafariOpenBuyGasNotice.OPEN_BUY_GAS_WINDOW,param1,"zoo.safari.miniGame.buyGas");
         }
         this.notifier.dispatchNotice(_loc3_);
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         var _loc2_:SafariMiniGameInfoWindow = new SafariMiniGameInfoWindow(this.notifier);
         WindowManager.getInstance().showWindow(_loc2_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function handleGameCloseClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      override public function close() : void
      {
         if(this.safariData.fuelAmmount > 0 || this.safariData.jokers && this.safariData.jokers.length > 0)
         {
            TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.safari.title"),TextResourceModule.getText("zoo.safari.miniGame.closeWarning")),new WindowParams("",null,"",null,Note.CLOSE_SAFARI_GAME_WINDOW,this)));
         }
         else
         {
            this.forceCloseSafari();
         }
      }
      
      public function forceCloseSafari() : void
      {
         if(this.cardGroupHolderMediator)
         {
            TempGetterProxy.getFacade().removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.SAFARI_INTERNAL_MODE.toString());
         }
         super.close();
         this.clearSafariGameData();
         TempGetterProxy.sendNotification(NET.SAFARI_END);
      }
      
      private function clearSafariGameData() : void
      {
         this.safariData.map = new Vector.<Vector.<SafariTileData>>();
         this.safariData.jokers = new Vector.<int>();
         this.safariData.tokenPosition = new Point(-1,-1);
      }
      
      public function activateJokerAction(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:SafariTileData = null;
         this.disableAllMapActions();
         if(param1 == 2)
         {
            _loc2_ = 0;
            while(_loc2_ < this.safariData.map.length)
            {
               _loc3_ = 0;
               while(_loc3_ < this.safariData.map[_loc2_].length)
               {
                  _loc4_ = this.safariData.map[_loc2_][_loc3_];
                  if(!_loc4_.isOpened && _loc4_.terainType != SafariTileData.TERAIN_TYPE_IMPASSABLE)
                  {
                     this.mapView[_loc2_][_loc3_].enableJokerSelectAction(param1);
                  }
                  _loc3_++;
               }
               _loc2_++;
            }
         }
      }
   }
}

