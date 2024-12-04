package com.bigpoint.zoomumba.view.gui.event
{
   import com.bigpoint.zoomumba.constants.BALLONEVENT;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.ballonEvent.BallonEventProxy;
   import com.bigpoint.zoomumba.view.gui.event.ballons.BallonItem;
   import com.bigpoint.zoomumba.view.gui.event.ballons.BallonItemType1;
   import com.bigpoint.zoomumba.view.gui.event.ballons.BallonItemType2;
   import com.bigpoint.zoomumba.view.gui.event.ballons.BallonItemType3;
   import com.bigpoint.zoomumba.view.gui.event.events.BallonEvent;
   import com.bigpoint.zoomumba.view.gui.event.vo.BallonTypeVo;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class BallonEventMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "BallonEventMediator";
      
      private var _assetOrg:SWFAsset;
      
      private var _ballonProxy:BallonEventProxy;
      
      private var _activeBallons:Vector.<BallonItem>;
      
      private var _delayBallonCall:TweenLite;
      
      private var _ballonNr:int = 0;
      
      private var _ballonTypeQuery:Vector.<int> = new Vector.<int>();
      
      private var _eventProxy:GlobalEventProxy;
      
      private var _eventName:String = "";
      
      public function BallonEventMediator(param1:UIComponent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.onInitBallons();
      }
      
      public function onInitBallons() : void
      {
         if(this._assetOrg == null)
         {
            AssetLibrary.sendAssetToFunction(BALLONEVENT.GHOST_ASSET,this.handleAssetsLoaded);
         }
      }
      
      private function generateBallonTypes() : Vector.<int>
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc3_:int = 0;
         while(_loc3_ < 5)
         {
            _loc4_ = 1;
            while(_loc4_ < BALLONEVENT.BALLON_MAX_TYPES + 1)
            {
               _loc1_.push(_loc4_);
               _loc4_++;
            }
            _loc3_++;
         }
         _loc4_ = 1;
         while(_loc4_ < BALLONEVENT.BALLON_MAX_TYPES + 1)
         {
            _loc3_ = int(_loc1_.length - 1);
            while(_loc3_ > 0)
            {
               _loc5_ = this.randomNr(0,_loc1_.length - 1);
               _loc6_ = _loc1_[_loc5_];
               _loc1_[_loc5_] = _loc1_[_loc3_];
               _loc1_[_loc3_] = _loc6_;
               _loc3_--;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function getBallonTypeFromQuery() : int
      {
         if(this._ballonTypeQuery.length <= 0)
         {
            this._ballonTypeQuery = this.generateBallonTypes();
         }
         return this._ballonTypeQuery.shift();
      }
      
      private function getRandomBallon() : MovieClip
      {
         var _loc1_:MovieClip = null;
         var _loc2_:int = 0;
         _loc1_ = this._assetOrg.getEmbededMovieClip("asset");
         if(_loc1_)
         {
            _loc2_ = _loc1_.totalFrames;
            _loc1_.gotoAndStop(this.randomNr(1,_loc2_));
         }
         return _loc1_["item_mc"];
      }
      
      private function getBallonByFrameId(param1:int) : MovieClip
      {
         var _loc2_:MovieClip = null;
         _loc2_ = this._assetOrg.getEmbededMovieClip("asset");
         _loc2_.gotoAndStop(param1);
         return _loc2_["item_mc"];
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.TOGGLE_FULLSCREEN_MODE,Note.EXIT_FULLSCREEN_MODE,Note.APP_RESIZED,Note.ON_EXPLODE_BALLON,DataNote.COLLECTABLE_UPDATED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               if(this._ballonProxy)
               {
                  this._ballonProxy.updateDartCount();
               }
               break;
            case Note.EXIT_FULLSCREEN_MODE:
            case Note.TOGGLE_FULLSCREEN_MODE:
            case Note.APP_RESIZED:
               this.setBallonPositions();
               break;
            case Note.ON_EXPLODE_BALLON:
               this.explodeBallon(param1.getBody() as String);
         }
      }
      
      private function explodeBallon(param1:String) : void
      {
         var _loc2_:BallonItem = null;
         for each(_loc2_ in this._activeBallons)
         {
            if(_loc2_.id == param1)
            {
               SoundManager.getInstance().playSoundEffect("ballonEvent" + this._ballonProxy.proxyData.eventId + "Shot");
               _loc2_.updateState(BALLONEVENT.BALLON_STATE_EXPLODE);
            }
         }
      }
      
      public function setBallonPositions() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:BallonItem = null;
         var _loc6_:int = 0;
         if(this._activeBallons)
         {
            _loc6_ = 0;
            while(_loc6_ < this._activeBallons.length)
            {
               _loc5_ = this._activeBallons[_loc6_] as BallonItem;
               _loc5_.ballonTypeVo.maxCoord.y = this.getMaxWindowHeight();
               _loc5_.ballonTypeVo.maxCoord.x = this.getMaxWindowWidth();
               this._activeBallons[_loc6_] = _loc5_;
               _loc6_++;
            }
         }
      }
      
      private function randomNr(param1:int, param2:int) : int
      {
         return Math.floor(Math.random() * (1 + param2 - param1) + param1);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:int = 0;
         this._assetOrg = param1;
         this.startBallonFlight();
      }
      
      private function startBallonFlight() : void
      {
         var _loc1_:BallonItem = null;
         var _loc2_:BallonTypeVo = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:Vector.<BallonItem> = null;
         var _loc11_:int = 0;
         var _loc8_:int = this.ballonProxy.proxyData.ballonsPerMinute;
         var _loc9_:int = this.ballonProxy.proxyData.dartCount;
         if(this._delayBallonCall)
         {
            this._delayBallonCall.kill();
            this._delayBallonCall = null;
         }
         if(this.ballonProxy.proxyData.ballonsPerMinute > 0)
         {
            if(this._activeBallons)
            {
               _loc10_ = this._activeBallons;
               this._activeBallons = new Vector.<BallonItem>();
               for each(_loc1_ in _loc10_)
               {
                  if(_loc1_.state == BALLONEVENT.BALLON_STATE_FLIGHT || _loc1_.state == BALLONEVENT.BALLON_STATE_CLICK)
                  {
                     this._activeBallons.push(_loc1_);
                  }
                  else
                  {
                     _loc1_.destroy();
                     if((viewComponent as UIComponent).getChildIndex(_loc1_) != -1)
                     {
                        (viewComponent as UIComponent).removeChild(_loc1_);
                     }
                  }
               }
            }
            if(_loc9_ <= 0)
            {
               _loc8_ = BALLONEVENT.BALLON_COUNT_ZERO_DARTS;
            }
            if(this._activeBallons == null)
            {
               this._activeBallons = new Vector.<BallonItem>();
            }
            _loc11_ = 0;
            while(_loc11_ < _loc8_)
            {
               _loc2_ = new BallonTypeVo();
               _loc2_.type = this.getBallonTypeFromQuery();
               _loc2_.startinSeconds = this.randomNr(1,60);
               _loc2_.displayObject = this.getBallonByFrameId(_loc2_.type);
               _loc2_.id = this._ballonNr.toString();
               if(this.randomNr(1,4) == 2)
               {
                  _loc2_.sounds = this.getSounds(_loc2_.type.toString());
               }
               switch(_loc2_.type)
               {
                  case BALLONEVENT.BALLON_TYPE_1:
                     _loc1_ = new BallonItemType1(_loc2_);
                     break;
                  case BALLONEVENT.BALLON_TYPE_2:
                     _loc1_ = new BallonItemType2(_loc2_);
                     break;
                  case BALLONEVENT.BALLON_TYPE_3:
                     _loc1_ = new BallonItemType3(_loc2_);
                     break;
               }
               _loc1_.addEventListener(BallonEvent.SHOOT_BALLON_EVENT,this.onShootBallon);
               _loc1_.updateState(BALLONEVENT.BALLON_STATE_TIMER);
               this._activeBallons.push(_loc1_);
               (viewComponent as UIComponent).addChild(_loc1_);
               ++this._ballonNr;
               _loc11_++;
            }
            this.setBallonPositions();
         }
         this._delayBallonCall = TweenLite.delayedCall(60,this.startBallonFlight);
      }
      
      public function getSounds(param1:String) : Vector.<String>
      {
         var _loc3_:String = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         for each(_loc3_ in SoundEffectNames.BALLON_FLY_SOUNDS)
         {
            if(_loc3_.indexOf("ballonEvent" + this._ballonProxy.proxyData.eventId + "Type" + param1) >= 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private function onShootBallon(param1:BallonEvent) : void
      {
         var _loc2_:BallonItem = param1.target as BallonItem;
         this._ballonProxy.shootBallon(_loc2_.id,_loc2_.ballonTypeVo.type);
      }
      
      private function getMaxWindowWidth() : int
      {
         if((viewComponent as UIComponent).stage)
         {
            return (viewComponent as UIComponent).stage.stageWidth;
         }
         return MainConfig.STAGE_DEFALT_WIDTH;
      }
      
      private function getMaxWindowHeight() : int
      {
         if((viewComponent as UIComponent).stage)
         {
            return (viewComponent as UIComponent).stage.stageHeight;
         }
         return MainConfig.STAGE_DEFALT_HEIGHT;
      }
      
      private function get ballonProxy() : BallonEventProxy
      {
         if(this._ballonProxy == null)
         {
            this._ballonProxy = facade.getProxy(BallonEventProxy) as BallonEventProxy;
         }
         return this._ballonProxy;
      }
      
      private function get eventName() : String
      {
         if(this._eventName == "")
         {
            this._eventName = this.globalEventProxy.getGlobalEvent(this.ballonProxy.proxyData.eventId).eventName;
         }
         return this._eventName;
      }
      
      private function get globalEventProxy() : GlobalEventProxy
      {
         if(this._eventProxy == null)
         {
            this._eventProxy = facade.getProxy(GlobalEventProxy) as GlobalEventProxy;
         }
         return this._eventProxy;
      }
   }
}

