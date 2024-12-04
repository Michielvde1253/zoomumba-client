package com.bigpoint.zoomumba.view.windows.events.boardgameEvent
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GAMEBOARD;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameCollVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameFieldVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameRewardVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameRoundVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameBubble;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameCollectItemComponent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameRewardItemComponent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameStepItemComponent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.effect.IconTweenEvent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.event.BoardgameItemEvent;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.boardgame.BoardgameContent;
   import windows.custom.events.boardgame.BoardgameWindow;
   
   public class BoardgameEventMediator extends WindowMediator
   {
      public static const NAME:String = "BoardGameEventMediator";
      
      public static const ANIM_STR:String = "_anim_";
      
      private var boardgameProxy:BoardgameProxy;
      
      private var collectionPoolProxy:CollectionPoolSetProxy;
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var rewardsProxy:EventRewardsProxy;
      
      private var networkProxy:NetProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _assets:SWFAsset;
      
      private var _asset:Sprite;
      
      private var _blocker:Sprite;
      
      private var _eventId:int;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _timerRefresher:TweenLite;
      
      private var _iconTweenEvent:IconTweenEvent;
      
      private var _animTweener:TweenLite;
      
      private var _rewardItemComponents:Vector.<BoardgameRewardItemComponent>;
      
      private var _stepItemComponents:Vector.<BoardgameStepItemComponent>;
      
      private var _collectItemComponents:Vector.<BoardgameCollectItemComponent>;
      
      private var _clickAreaComponents:Dictionary;
      
      private var _animMovieClips:Dictionary;
      
      private var _textBubble:BoardgameBubble;
      
      public function BoardgameEventMediator(param1:BoardgameWindow)
      {
         super(BoardgameEventMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.boardgameProxy = facade.retrieveProxy(BoardgameProxy.NAME) as BoardgameProxy;
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.rewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         this.networkProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.collectionPoolProxy = facade.retrieveProxy(CollectionPoolSetProxy.NAME) as CollectionPoolSetProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.BOARDGAME_GET_EVENT,Note.BOARDGAME_PUT_DROPICON,Note.BOARDGAME_BUY_REAL,Note.BOARDGAME_REWARD_WINDOW_CLOSED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.boardgameProxy.updateFieldAndRewardStates(this._eventId);
               this.startRedrawThings(this._eventId);
               break;
            case Note.BOARDGAME_GET_EVENT:
               this.onGetEvent(param1.getBody());
               break;
            case Note.BOARDGAME_REWARD_WINDOW_CLOSED:
               this.animate(this.boardgameProxy.currentRewardStepStr);
               break;
            case Note.BOARDGAME_PUT_DROPICON:
               this.onPutDropicon(param1.getBody());
               break;
            case Note.BOARDGAME_BUY_REAL:
               this.putCall(this._eventId,String(param1.getBody().stepId),true,parseInt(param1.getBody().money));
         }
      }
      
      private function animate(param1:String) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         if(Boolean(param1) && param1 != "")
         {
            if(this._animMovieClips[param1] != null)
            {
               this.killAnimTweener();
               _loc2_ = this._animMovieClips[param1] as MovieClip;
               _loc2_.gotoAndStop(1);
               _loc3_ = _loc2_.totalFrames / 24;
               this._animTweener = TweenLite.to(this._animMovieClips[param1],_loc3_,{
                  "frame":_loc2_.totalFrames,
                  "onComplete":this.tweenAnimationComleate
               });
            }
         }
      }
      
      private function tweenAnimationComleate() : void
      {
         var speed:Number;
         var target:MovieClip = this._animTweener.target as MovieClip;
         try
         {
            target.gotoAndStop("loop");
         }
         catch(err:ArgumentError)
         {
            return;
         }
         speed = target.totalFrames / 24;
         this._animTweener = TweenLite.to(target,speed,{
            "frame":target.totalFrames,
            "onComplete":this.tweenAnimationComleate
         });
      }
      
      private function killAnimTweener() : void
      {
         if(this._animTweener)
         {
            this._animTweener.kill();
            this._animTweener = null;
         }
      }
      
      override public function init(param1:Object) : void
      {
         this._eventId = int(param1);
         this.window.preloaderVisibility = true;
         this.content.addEventListener("infoComicClick",this.handleInfoClick);
         this.networkProxy.callServer(NET.BOARDGAME_GET,[this._eventId]).addCallbackIfTrue(Note.BOARDGAME_GET_EVENT).sendNow();
      }
      
      private function onPutDropicon(param1:Object) : void
      {
         var _loc2_:int = this.boardgameProxy.parseBoardgameObject(param1);
         this.startRedrawThings(this._eventId);
         this.window.preloaderVisibility = false;
      }
      
      public function onGetEvent(param1:Object) : void
      {
         var _loc2_:int = this.boardgameProxy.parseBoardgameObject(param1);
         if(this._asset == null)
         {
            AssetLibrary.sendAssetToFunction(GAMEBOARD.BOARDGAME_ASSET + String(_loc2_),this.handleAssetsLoaded);
         }
         else
         {
            this.startRedrawThings(_loc2_);
            this.window.preloaderVisibility = false;
         }
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Sprite = null;
         var _loc2_:String = this.globalEventProxy.getGlobalEvent(this._eventId).eventName;
         var _loc3_:Boolean = TextResourceModule.hasText("zoo.window.infoLayers." + _loc2_ + "Board.title");
         if(_loc3_)
         {
            _loc5_ = TextResourceModule.getText("zoo.window.infoLayers." + _loc2_ + "Board.title");
            initDynamicTitle(_loc5_,null,2,10);
         }
         if(param1.id.search(GAMEBOARD.BOARDGAME_ASSET) != -1)
         {
            _loc4_ = parseInt(param1.id.replace(GAMEBOARD.BOARDGAME_ASSET,"").replace(".swf",""));
            this._assets = param1;
            this._asset = param1.getEmbededSprite("asset");
            if(this.content == null)
            {
               return;
            }
            this.content.boardGameContent.addChild(this._asset);
            _loc6_ = this._asset.getChildByName("infoText_mc") as Sprite;
            this._textBubble = new BoardgameBubble(_loc6_);
            this.content.text.addChild(this._textBubble);
            this._asset.removeChild(_loc6_);
            if(this._asset.getChildByName("topView_mc"))
            {
               (this._asset.getChildByName("topView_mc") as Sprite).mouseChildren = false;
               (this._asset.getChildByName("topView_mc") as Sprite).mouseEnabled = false;
            }
            this._iconTweenEvent = new IconTweenEvent(this._asset,this.collectionPoolProxy);
            this.initAnimComponents();
            this.initBlocker();
            this.initCollItemComponents(_loc4_,true);
            this.initStepItemComponents(_loc4_,false);
            this.initRewardItemComponents(_loc4_,true);
            this.initForegroundComponents();
            this.initClickArea(_loc4_);
            this.setStartupData(_loc4_);
            this.content.info.mouseChildren = true;
            this.content.info.mouseEnabled = true;
            this.window.preloaderVisibility = false;
         }
      }
      
      private function initAnimComponents() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:String = null;
         this._animMovieClips = new Dictionary();
         var _loc3_:int = 0;
         while(_loc3_ < this._asset.numChildren)
         {
            _loc1_ = this._asset.getChildAt(_loc3_);
            _loc2_ = this.hasAnimAnme(_loc1_);
            if(_loc2_)
            {
               this._animMovieClips[_loc2_] = _loc1_;
            }
            _loc3_++;
         }
      }
      
      private function hasAnimAnme(param1:DisplayObject) : String
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1.name.lastIndexOf(ANIM_STR) > -1 && param1 is MovieClip)
         {
            _loc5_ = "";
            _loc6_ = 0;
            _loc2_ = int(param1.name.indexOf(ANIM_STR));
            _loc3_ = param1.name.substr(_loc2_,param1.name.length - _loc2_);
            _loc3_ = _loc3_.replace(ANIM_STR,"");
            _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               _loc4_ = _loc3_.substr(_loc7_,1);
               if(_loc4_ == "_")
               {
                  _loc6_++;
               }
               if(_loc6_ > 1)
               {
                  (param1 as MovieClip).gotoAndStop(1);
                  return _loc5_;
               }
               _loc5_ += _loc4_;
               _loc7_++;
            }
         }
         return _loc5_;
      }
      
      private function initForegroundComponents() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc3_:MovieClip = null;
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._asset.numChildren)
         {
            _loc1_ = this._asset.getChildAt(_loc2_);
            if(_loc1_.name.indexOf("foreground") > -1 && _loc1_ is MovieClip)
            {
               _loc3_ = this._asset.getChildAt(_loc2_) as MovieClip;
               _loc4_ = this.hasAnimAnme(_loc3_);
               this._asset.removeChild(_loc3_);
               if(_loc4_)
               {
                  _loc5_ = this.content.animations.addChild(_loc3_) as MovieClip;
               }
               else
               {
                  _loc5_ = this.content.boardGameContentForeground.addChild(_loc3_) as MovieClip;
               }
               _loc5_.stop();
               _loc5_.enabled = false;
               _loc5_.mouseChildren = false;
               _loc5_.mouseChildren = false;
               _loc2_--;
               if(_loc4_)
               {
                  if(this._animMovieClips[_loc4_] != null)
                  {
                     this._animMovieClips[_loc4_] = _loc5_;
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function initBlocker() : void
      {
         this._blocker = new Sprite();
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(0,0);
         _loc1_.graphics.lineTo(0,0);
         _loc1_.graphics.lineTo(0,500);
         _loc1_.graphics.lineTo(700,500);
         _loc1_.graphics.lineTo(700,0);
         _loc1_.graphics.endFill();
         this._blocker.addChild(_loc1_);
         this._blocker.mouseEnabled = true;
         this.content.boardGameContentBlocker.addChild(this._blocker);
      }
      
      private function block(param1:Boolean) : void
      {
         if(this._blocker)
         {
            this._blocker.visible = param1;
         }
      }
      
      private function setStartupData(param1:int) : void
      {
         this.startRedrawThings(param1);
         var _loc2_:String = TextResourceModule.getText("zoo.window.infoLayers.boardgame.info.default");
         this._textBubble.showBubble(_loc2_,5);
      }
      
      private function initStepItemComponents(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:BoardgameStepItemComponent = null;
         var _loc6_:BoardgameFieldVo = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:String = null;
         var _loc9_:MovieClip = null;
         var _loc10_:int = 0;
         var _loc11_:RegExp = null;
         var _loc12_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:BoardgameRoundVo = this.boardgameProxy.getCurrentFieldRound(param1);
         var _loc13_:Array = new Array();
         if(this._stepItemComponents == null && _loc3_ != null)
         {
            this._stepItemComponents = new Vector.<BoardgameStepItemComponent>();
            _loc14_ = 0;
            while(_loc14_ < this._asset.numChildren)
            {
               _loc7_ = this._asset.getChildAt(_loc14_);
               if(_loc7_.name.indexOf("field") > -1 && _loc7_ is MovieClip)
               {
                  if(param2 || _loc7_.name.indexOf("_foreground") > -1)
                  {
                     this._asset.removeChild(_loc7_);
                     this.content.rewards.addChild(_loc7_);
                     _loc14_--;
                     _loc8_ = _loc7_.name.replace("_foreground","");
                     _loc8_ = _loc8_.replace("field_","");
                  }
                  else
                  {
                     _loc8_ = _loc7_.name.replace("field_","");
                     _loc10_ = int(_loc8_.indexOf("sort_"));
                     if(_loc10_ > -1)
                     {
                        _loc12_ = parseInt(_loc8_.substr(_loc10_ + 5,2));
                        _loc13_[_loc12_] = _loc7_;
                        _loc11_ = /sort_(\d+)_/;
                        _loc8_ = _loc8_.replace(_loc11_,"");
                     }
                     this._asset.removeChild(_loc7_);
                     this.content.fields.addChild(_loc7_);
                     _loc14_--;
                  }
                  (_loc7_ as MovieClip).stop();
                  _loc5_ = new BoardgameStepItemComponent(_loc8_,_loc7_ as MovieClip);
                  this._stepItemComponents.push(_loc5_);
               }
               _loc14_++;
            }
            this.sortFieldItems(_loc13_,this.content.fields);
         }
      }
      
      private function sortFieldItems(param1:Array, param2:UIComponent) : void
      {
         var _loc3_:String = null;
         for(_loc3_ in param1)
         {
            param2.setChildIndex(param1[_loc3_],parseInt(_loc3_) - 1);
         }
      }
      
      private function onStepMouseOver(param1:BoardgameItemEvent) : void
      {
         this.onStepMouseOverAction(param1.stepId);
      }
      
      private function onStepMouseOverAction(param1:String) : void
      {
         var _loc2_:BoardgameStepItemComponent = this.getStepItemComponentById(param1);
         _loc2_.instantAmount = this.boardgameProxy.getBoardgameVoById(this._eventId).boardgameObj.instantBuyReal;
         _loc2_.showState();
         var _loc3_:BoardgameFieldVo = this.boardgameProxy.getFieldVoByFieldIdAndEventId(param1,this._eventId);
         var _loc4_:String = TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(_loc3_.putDropType),_loc3_.putDropId));
         var _loc5_:BoardgameRewardItemComponent = this.getRewardItemComponentById(_loc3_.stepStr);
         this.showInfoTextOver(_loc2_.neededAmount,_loc4_);
         if(_loc5_)
         {
            _loc5_.showToolTip(_loc2_.asset);
            this.markRewardItemWithGlowFilter(_loc3_);
         }
      }
      
      private function initClickArea(param1:int) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:BoardgameFieldVo = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:String = null;
         var _loc7_:BoardgameStepItemComponent = null;
         var _loc8_:int = 0;
         var _loc2_:BoardgameRoundVo = this.boardgameProxy.getCurrentFieldRound(param1);
         this._clickAreaComponents = new Dictionary();
         if(_loc2_ != null)
         {
            _loc8_ = 0;
            while(_loc8_ < this._asset.numChildren)
            {
               _loc5_ = this._asset.getChildAt(_loc8_);
               if(_loc5_.name.indexOf("clickArea") > -1 && _loc5_ is MovieClip)
               {
                  this._asset.removeChild(_loc5_);
                  this.content.clickArea.addChild(_loc5_);
                  _loc8_--;
                  _loc5_.addEventListener(MouseEvent.CLICK,this.onClickClickArea,false,0,true);
                  _loc5_.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverClickArea,false,0,true);
                  _loc5_.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutClickArea,false,0,true);
                  _loc6_ = _loc5_.name.replace("clickArea_","");
                  this._clickAreaComponents[_loc6_] = _loc5_;
               }
               _loc8_++;
            }
         }
      }
      
      private function onMouseOverClickArea(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.target as MovieClip;
         var _loc3_:String = _loc2_.name.replace("clickArea_","");
         this.onStepMouseOverAction(_loc3_);
         this.onMouseRewardItemOverAction(_loc3_);
      }
      
      private function onMouseOutClickArea(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.target as MovieClip;
         var _loc3_:String = _loc2_.name.replace("clickArea_","");
         this.onStepMouseOutAction(_loc3_);
         this.onMouseRewardItemOutAction(_loc3_);
      }
      
      private function onClickClickArea(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.target as MovieClip;
         var _loc3_:String = _loc2_.name.replace("clickArea_","");
         var _loc4_:BoardgameStepItemComponent = this.getStepItemComponentById(_loc3_);
         this.stepCall(_loc4_);
      }
      
      private function markRewardItemWithGlowFilter(param1:BoardgameFieldVo) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:BoardgameRewardItemComponent = this.getRewardItemComponentById(param1.stepStr);
         switch(param1.state)
         {
            case GAMEBOARD.FIELD_STATE_DESPOSIT_ITEMS:
               _loc3_ = GAMEBOARD.DESPOSIT_ITEMS_FILTER_COLOR;
               break;
            case GAMEBOARD.FIELD_STATE_INSTANTBUY:
               _loc3_ = GAMEBOARD.INSTANTBUY_FILTER_COLOR;
               break;
            case GAMEBOARD.FIELD_STATE_NOTENOUGH:
               _loc3_ = GAMEBOARD.NOTENOUGH_FILTER_COLOR;
               break;
            default:
               return;
         }
         var _loc4_:Number = 0.8;
         var _loc5_:Number = 13;
         var _loc6_:Number = 13;
         var _loc7_:Number = 4;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Number = BitmapFilterQuality.MEDIUM;
         var _loc11_:GlowFilter = new GlowFilter(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc10_,_loc8_,_loc9_);
         if(_loc2_.clickground_mc != null)
         {
            _loc2_.clickground_mc.filters = [_loc11_];
         }
      }
      
      private function onStepMouseOut(param1:BoardgameItemEvent) : void
      {
         this.onStepMouseOutAction(param1.stepId);
      }
      
      private function onStepMouseOutAction(param1:String) : void
      {
         this.showInfoTextOut();
         var _loc2_:BoardgameRewardItemComponent = this.getRewardItemComponentById(param1);
         if(_loc2_)
         {
            _loc2_.hideToolTip();
            if(_loc2_.clickground_mc != null)
            {
               _loc2_.clickground_mc.filters = null;
            }
         }
      }
      
      private function showInfoTextOver(param1:int, param2:String) : void
      {
         var _loc3_:String = TextResourceModule.getText("zoo.window.infoLayers.boardgame.info.over");
         _loc3_ = _loc3_.replace("%count%",param1);
         _loc3_ = _loc3_.replace("%collectitem%",param2);
         this._textBubble.showBubble(_loc3_);
      }
      
      private function showInfoTextOut() : void
      {
         this._textBubble.hideBubble();
      }
      
      private function initCollItemComponents(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:BoardgameCollectItemComponent = null;
         var _loc5_:BoardgameCollVo = null;
         var _loc6_:MovieClip = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:String = null;
         var _loc3_:Vector.<BoardgameCollVo> = this.boardgameProxy.proxyDataById(param1).collect;
         this._collectItemComponents = new Vector.<BoardgameCollectItemComponent>();
         var _loc9_:int = 0;
         while(_loc9_ < this._asset.numChildren)
         {
            _loc7_ = this._asset.getChildAt(_loc9_);
            if(_loc7_.name.indexOf("collum") > -1 && _loc7_ is MovieClip)
            {
               _loc6_ = this._asset.getChildAt(_loc9_) as MovieClip;
               if(param2)
               {
                  this._asset.removeChild(_loc6_);
                  this.content.collections.addChild(_loc6_);
                  _loc9_--;
               }
               _loc8_ = _loc6_.name.replace("collum","").replace("_mc","");
               _loc4_ = new BoardgameCollectItemComponent(_loc6_,parseInt(_loc8_));
               _loc4_.addEventListener(BoardgameCollectItemComponent.ON_CLICK_COLL_EVENT,this.onCollItemClick,false,0,true);
               this._collectItemComponents.push(_loc4_);
            }
            _loc9_++;
         }
         for each(_loc5_ in _loc3_)
         {
            for each(_loc4_ in this._collectItemComponents)
            {
               if(_loc4_.collVo == null)
               {
                  _loc4_.collVo = _loc5_;
                  break;
               }
            }
         }
      }
      
      private function initRewardItemComponents(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:BoardgameRewardItemComponent = null;
         var _loc6_:BoardgameFieldVo = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:BoardgameRoundVo = this.boardgameProxy.getCurrentFieldRound(param1);
         if(this._rewardItemComponents == null && _loc3_ != null)
         {
            this._rewardItemComponents = new Vector.<BoardgameRewardItemComponent>();
            _loc9_ = this._asset.numChildren;
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               if(this._asset.numChildren > _loc10_)
               {
                  _loc7_ = this._asset.getChildAt(_loc10_);
                  if(_loc7_.name.indexOf("reward") > -1 && _loc7_ is MovieClip)
                  {
                     if(param2 || _loc7_.name.indexOf("_foreground") > -1)
                     {
                        this._asset.removeChild(_loc7_ as MovieClip);
                        this.content.rewards.addChild(_loc7_ as MovieClip);
                        _loc10_--;
                        _loc8_ = _loc7_.name.replace("_foreground","");
                        _loc8_ = _loc8_.replace("reward_","");
                     }
                     else
                     {
                        _loc8_ = _loc7_.name.replace("reward_","");
                     }
                     _loc5_ = new BoardgameRewardItemComponent(_loc8_,_loc7_ as MovieClip);
                     _loc5_.addEventListener(BoardgameRewardItemComponent.ON_CLICK_REWARD_EVENT,this.onRewardClick,false,0,true);
                     _loc5_.addEventListener(BoardgameItemEvent.ITEM_OUT,this.onMouseRewardItemOut,false,0,true);
                     _loc5_.addEventListener(BoardgameItemEvent.ITEM_OVER,this.onMouseRewardItemOver,false,0,true);
                     this._rewardItemComponents.push(_loc5_);
                  }
               }
               _loc10_++;
            }
         }
      }
      
      private function onMouseRewardItemOver(param1:BoardgameItemEvent) : void
      {
         this.onMouseRewardItemOverAction(param1.stepId);
      }
      
      private function onMouseRewardItemOverAction(param1:String) : void
      {
         var _loc2_:BoardgameStepItemComponent = this.getStepItemComponentById(param1);
         var _loc3_:BoardgameFieldVo = this.boardgameProxy.getFieldVoByFieldIdAndEventId(param1,this._eventId);
         var _loc4_:String = TextResourceModule.getText(TextIdHelper.getCardName(ItemTypeHelper.typeToCategory(_loc3_.putDropType),_loc3_.putDropId));
         _loc2_.showState();
         this.showInfoTextOver(_loc2_.neededAmount,_loc4_);
      }
      
      private function onMouseRewardItemOut(param1:BoardgameItemEvent) : void
      {
         this.onMouseRewardItemOutAction(param1.stepId);
      }
      
      private function onMouseRewardItemOutAction(param1:String) : void
      {
         var _loc2_:BoardgameStepItemComponent = this.getStepItemComponentById(param1);
         _loc2_.showViewState();
         this.showInfoTextOut();
      }
      
      public function startRedrawThings(param1:int) : void
      {
         if(this._timerRefresher)
         {
            this._timerRefresher.pause();
            this._timerRefresher.kill();
            this._timerRefresher = null;
         }
         this._timerRefresher = TweenLite.delayedCall(0.001,this.redrawThings,[param1]);
      }
      
      private function setRewards(param1:BoardgameVo) : void
      {
         var _loc2_:BoardgameCollectItemComponent = null;
         var _loc3_:BoardgameCollVo = null;
         for each(_loc3_ in param1.collect)
         {
            _loc2_ = this.getCollectItem(_loc3_.itemId,_loc3_.itemType);
            if(_loc2_)
            {
               _loc2_.collVo = _loc3_;
               _loc2_.amount = this.collectablesProxy.getCollectableAmmount(_loc3_.itemId);
               _loc2_.isActive = false;
            }
         }
      }
      
      public function getCollectItem(param1:int, param2:String) : BoardgameCollectItemComponent
      {
         var _loc3_:BoardgameCollectItemComponent = null;
         for each(_loc3_ in this._collectItemComponents)
         {
            if(_loc3_.collVo)
            {
               if(_loc3_.collVo.itemId == param1 && _loc3_.collVo.itemType == param2)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function redrawThings(param1:int) : void
      {
         var _loc2_:BoardgameFieldVo = null;
         var _loc5_:BoardgameStepItemComponent = null;
         var _loc6_:BoardgameRewardItemComponent = null;
         var _loc7_:BoardgameRewardVo = null;
         var _loc8_:BoardgameCollVo = null;
         var _loc11_:AnimalSpeciesVO = null;
         var _loc12_:BoardgameCollectItemComponent = null;
         if(this._asset == null)
         {
            return;
         }
         var _loc3_:BoardgameVo = this.boardgameProxy.proxyDataById(param1);
         var _loc4_:BoardgameRoundVo = this.boardgameProxy.getCurrentFieldRound(param1);
         this.setRewards(_loc3_);
         var _loc9_:int = 0;
         var _loc10_:* = false;
         for each(_loc2_ in _loc4_.fields)
         {
            _loc5_ = this.getStepItemComponentById(_loc2_.stepStr);
            if(_loc5_)
            {
               _loc5_.fieldItemVo = _loc2_;
               if(_loc2_.putAmount > 0)
               {
                  if(_loc3_.boardgameObj.stepStr == _loc5_.fieldItemVo.stepStr)
                  {
                     _loc5_.progressAmount = _loc3_.boardgameObj.progressAmount;
                  }
                  else
                  {
                     _loc5_.progressAmount = -1;
                  }
               }
               else
               {
                  _loc5_.progressAmount = -1;
               }
               if(_loc2_.rewards)
               {
                  for each(_loc7_ in _loc2_.rewards)
                  {
                     _loc6_ = this.getRewardItemComponentById(_loc7_.stepStr);
                     if(_loc6_)
                     {
                        _loc6_.rewardItemVo = _loc7_;
                        _loc6_.currentRound = _loc3_.boardgameObj.round;
                        _loc6_.animalConfig = null;
                        if(ItemTypeHelper.typeToCategory(_loc7_.type) == Categories.ANIMAL)
                        {
                           _loc11_ = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(_loc7_.id);
                           if(_loc11_)
                           {
                              _loc6_.animalConfig = _loc11_;
                           }
                        }
                        if(_loc7_.state == GAMEBOARD.FIELD_STATE_FINISHED)
                        {
                        }
                        if(_loc9_ < _loc7_.step)
                        {
                           _loc9_ = _loc7_.step;
                           _loc10_ = _loc7_.state == GAMEBOARD.FIELD_STATE_FINISHED;
                        }
                        if(_loc7_.step == 2)
                        {
                           if(_loc7_.state == GAMEBOARD.FIELD_STATE_FINISHED)
                           {
                              this.playKaminSound();
                           }
                           else
                           {
                              this.stopKaminSound();
                           }
                        }
                        if(this._clickAreaComponents[_loc7_.stepStr] != null)
                        {
                           (this._clickAreaComponents[_loc7_.stepStr] as MovieClip).gotoAndStop(_loc7_.state);
                        }
                     }
                  }
               }
            }
            for each(_loc8_ in this.boardgameProxy.proxyDataById(param1).collect)
            {
               if(_loc2_.state == GAMEBOARD.FIELD_STATE_DESPOSIT_ITEMS || _loc2_.state == GAMEBOARD.FIELD_STATE_INSTANTBUY || _loc2_.state == GAMEBOARD.FIELD_STATE_NOTENOUGH)
               {
                  if(_loc8_.itemId == _loc2_.putDropId)
                  {
                     _loc12_ = this.getCollectItem(_loc8_.itemId,_loc8_.itemType);
                     if(_loc12_)
                     {
                        _loc12_.isActive = true;
                     }
                  }
               }
            }
         }
         if(_loc10_)
         {
         }
         this.block(false);
      }
      
      override public function dispose() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:BoardgameRewardItemComponent = null;
         var _loc3_:BoardgameStepItemComponent = null;
         var _loc4_:BoardgameCollectItemComponent = null;
         this.stopKaminSound();
         this.killAnimTweener();
         if(this._timerRefresher)
         {
            this._timerRefresher.pause();
            this._timerRefresher.kill();
            this._timerRefresher = null;
         }
         for each(_loc1_ in this._clickAreaComponents)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.onClickClickArea);
            _loc1_.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOverClickArea);
            _loc1_.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOutClickArea);
         }
         for each(_loc2_ in this._rewardItemComponents)
         {
            _loc2_.removeEventListener(BoardgameRewardItemComponent.ON_CLICK_REWARD_EVENT,this.onRewardClick);
            _loc2_.removeEventListener(BoardgameItemEvent.ITEM_OUT,this.onMouseRewardItemOut);
            _loc2_.removeEventListener(BoardgameItemEvent.ITEM_OVER,this.onMouseRewardItemOver);
            _loc2_.destroy();
         }
         for each(_loc3_ in this._stepItemComponents)
         {
            _loc3_.removeEventListener(BoardgameStepItemComponent.ON_CLICK_STEP_EVENT,this.onStepClick);
            _loc3_.removeEventListener(BoardgameItemEvent.ITEM_OUT,this.onStepMouseOut);
            _loc3_.removeEventListener(BoardgameItemEvent.ITEM_OVER,this.onStepMouseOver);
            _loc3_.destroy();
         }
         for each(_loc4_ in this._collectItemComponents)
         {
            _loc4_.removeEventListener(BoardgameCollectItemComponent.ON_CLICK_COLL_EVENT,this.onCollItemClick);
            _loc4_.destroy();
         }
         if(this.content)
         {
            this.content.removeEventListener("infoComicClick",this.handleInfoClick);
         }
         if(this._textBubble)
         {
            this._textBubble.destroy();
         }
         if(this._iconTweenEvent)
         {
            this._iconTweenEvent.destory();
         }
         this._rewardItemComponents = null;
         this._stepItemComponents = null;
         this._collectItemComponents = null;
      }
      
      private function onCollItemClick(param1:Event) : void
      {
         var _loc4_:BoardgameStepItemComponent = null;
         var _loc2_:String = this.boardgameProxy.proxyDataById(this._eventId).boardgameObj.stepStr;
         var _loc3_:Boolean = false;
         if(_loc2_)
         {
            _loc4_ = this.getStepItemComponentById(_loc2_);
            if(_loc4_)
            {
               this.stepCall(_loc4_);
            }
         }
      }
      
      private function itemCountByStepId(param1:String) : int
      {
         var _loc2_:BoardgameFieldVo = null;
         for each(_loc2_ in this.boardgameProxy.getCurrentFieldRound(this._eventId).fields)
         {
            if(_loc2_.stepStr == param1)
            {
               return this.collectablesProxy.getCollectableAmmount(_loc2_.putDropId);
            }
         }
         return 0;
      }
      
      private function onRewardClick(param1:Event) : void
      {
         var _loc2_:String = (param1.target as BoardgameRewardItemComponent).id;
         var _loc3_:BoardgameStepItemComponent = this.getStepItemComponentById(_loc2_);
         this.stepCall(_loc3_);
      }
      
      private function onStepClick(param1:Event) : void
      {
         var _loc2_:BoardgameStepItemComponent = param1.target as BoardgameStepItemComponent;
         this.stepCall(_loc2_);
      }
      
      private function stepCall(param1:BoardgameStepItemComponent) : void
      {
         var _loc2_:String = "";
         var _loc3_:* = false;
         _loc3_ = param1.state == GAMEBOARD.FIELD_STATE_INSTANTBUY;
         _loc2_ = param1.stepId;
         this.initPutCall(_loc2_,_loc3_);
      }
      
      public function initPutCall(param1:String, param2:Boolean) : void
      {
         var _loc3_:BoardgameStepItemComponent = null;
         var _loc4_:BoardgameRewardItemComponent = null;
         var _loc5_:Object = null;
         if(this.boardgameProxy.getFieldVoByFieldIdAndEventId(param1,this._eventId).state != GAMEBOARD.FIELD_STATE_NOTENOUGH)
         {
            _loc3_ = this.getStepItemComponentById(param1);
            _loc4_ = this.getRewardItemComponentById(param1);
            if(_loc4_.clickground_mc != null)
            {
               _loc4_.clickground_mc.filters = null;
            }
            if(param2)
            {
               _loc5_ = new Object();
               _loc5_.stepId = param1;
               _loc5_.money = this.boardgameProxy.getBoardgameVoById(this._eventId).boardgameObj.instantBuyReal;
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.boardgameProxy.getBoardgameVoById(this._eventId).boardgameObj.instantBuyReal),new WindowParams("",null,"",null,Note.BOARDGAME_BUY_REAL,_loc5_)));
            }
            else
            {
               this.startAnimation(param1);
               this.putCall(this._eventId,param1,false);
            }
         }
      }
      
      private function startAnimation(param1:String) : void
      {
         var _loc2_:BoardgameStepItemComponent = this.getStepItemComponentById(param1);
         _loc2_.externalAnimationRunning = true;
         var _loc3_:BoardgameCollectItemComponent = this.getCollectItem(_loc2_.fieldItemVo.putDropId,_loc2_.fieldItemVo.putDropType);
         var _loc4_:int = _loc2_.neededAmount;
         if(_loc3_.amount < _loc4_)
         {
            _loc4_ = _loc3_.amount;
         }
         if(_loc2_.fieldItemVo.state == GAMEBOARD.FIELD_STATE_DESPOSIT_ITEMS && _loc4_ > 0)
         {
            _loc3_.amount -= _loc4_;
            this._iconTweenEvent.tweenItems(_loc3_,this.getRewardItemComponentById(param1),_loc4_,this.content.collectionsTween);
            this._iconTweenEvent.addEventListener(IconTweenEvent.ICON_TWEEN_FINISHED,this.iconTweenEventFinished,false,0,true);
         }
      }
      
      protected function iconTweenEventFinished(param1:Event) : void
      {
         var _loc2_:IconTweenEvent = param1.target as IconTweenEvent;
         _loc2_.removeEventListener(IconTweenEvent.ICON_TWEEN_FINISHED,this.iconTweenEventFinished);
         var _loc3_:BoardgameStepItemComponent = this.getStepItemComponentById(_loc2_.boardReward.fieldId);
         var _loc4_:BoardgameRewardItemComponent = this.getRewardItemComponentById(_loc2_.boardReward.fieldId);
         if(_loc4_.clickground_mc != null)
         {
            _loc4_.clickground_mc.filters = null;
         }
         _loc3_.instantAmount = this.boardgameProxy.getBoardgameVoById(this._eventId).boardgameObj.instantBuyReal;
         var _loc5_:int = int(_loc3_.fieldItemVo.putAmount);
         var _loc6_:int = int(this.boardgameProxy.getBoardgameVoById(this._eventId).boardgameObj.progressAmount);
         var _loc7_:int = _loc5_ - _loc6_;
         _loc3_.neededAmount = _loc7_;
         _loc3_.externalAnimationRunning = false;
         while(this.content.collectionsTween.numChildren > 0)
         {
            this.content.collectionsTween.removeChildAt(0);
         }
      }
      
      private function playinsertSound() : void
      {
         var _loc1_:int = this.randomNr(1,3);
         var _loc2_:String = "summereventblender0" + String(_loc1_);
         SoundManager.getInstance().playSoundEffect(_loc2_);
      }
      
      private function playKaminSound() : void
      {
         var _loc1_:String = null;
         var _loc2_:SoundChannel = null;
         if(this._eventId == 68)
         {
            _loc1_ = "kamin";
            _loc2_ = SoundManager.getInstance().getSoundChannelById(_loc1_);
            if(_loc2_ == null)
            {
               SoundManager.getInstance().playSoundEffect(_loc1_,0.8,int.MAX_VALUE);
            }
         }
      }
      
      private function stopKaminSound() : void
      {
         var _loc1_:String = null;
         if(this._eventId == 68)
         {
            _loc1_ = "kamin";
            SoundManager.getInstance().stopChannelByName(_loc1_);
         }
      }
      
      private function randomNr(param1:int, param2:int) : int
      {
         return Math.floor(Math.random() * (1 + param2 - param1) + param1);
      }
      
      public function putCall(param1:int, param2:String, param3:Boolean, param4:int = 0) : void
      {
         this.block(true);
         if(param3 == false)
         {
            this.networkProxy.callServer(NET.BOARDGAME_PUT,[param1,param2,param3]).addCallbackIfTrue(Note.BOARDGAME_PUT_DROPICON).sendNow();
         }
         else
         {
            this.networkProxy.callServer(NET.BOARDGAME_PUT_INSTANT_BUY,[param1,param2,param3,param4]).addCallbackIfTrue(Note.BOARDGAME_PUT_DROPICON).sendNow();
         }
      }
      
      private function handleInfoClick(param1:Event) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.eventId = this._eventId;
         _loc2_.eventName = this.globalEventProxy.getGlobalEvent(this._eventId).eventName;
         _loc2_.pages = this.globalEventProxy.getGlobalEvent(this._eventId).helpComicPages;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GENERIC_COMIC_WINDOW,"",_loc2_));
      }
      
      private function getRewardItemComponentById(param1:String) : BoardgameRewardItemComponent
      {
         var _loc2_:BoardgameRewardItemComponent = null;
         for each(_loc2_ in this._rewardItemComponents)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function getStepItemComponentById(param1:String) : BoardgameStepItemComponent
      {
         var _loc2_:BoardgameStepItemComponent = null;
         for each(_loc2_ in this._stepItemComponents)
         {
            if(_loc2_.stepId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function get content() : BoardgameContent
      {
         return this.window.getContent() as BoardgameContent;
      }
      
      private function get window() : BoardgameWindow
      {
         return this.viewComponent as BoardgameWindow;
      }
   }
}

