package com.bigpoint.zoomumba.model.events.gui
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BallonEventVo;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameCollVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameVo;
   import com.bigpoint.zoomumba.model.events.community.CommunityEventProxy;
   import com.bigpoint.zoomumba.model.events.community.vo.CommunityEventVO;
   import com.bigpoint.zoomumba.model.events.gui.vo.CentralIconVo;
   import com.bigpoint.zoomumba.model.events.gui.vo.DisplayIconVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.gui.custom.CountDownMediator;
   import org.puremvc.as3.interfaces.IFacade;
   
   public class GenericGUIConfigHandler
   {
      public static const ASSET_TYPE_BOARDGAME:String = "boardgameIcon";
      
      public static const ASSET_TYPE_MULTIGAME:String = "multigameIcon";
      
      public static const ASSET_TYPE_COUNTER:String = "counter";
      
      public static const TYPE_COUNTER:String = "counter";
      
      public var top:int = 76;
      
      public var right:int = 80;
      
      public var left:int = 40;
      
      public var initialRotation:int = 0;
      
      public var eventProxy:GlobalEventProxy;
      
      public var _boardGameDisplayIcons:Array;
      
      private var _readOutBoardgameRunningEvent:int = 0;
      
      private var _readOutCommunityRunningEvent:int = 0;
      
      public function GenericGUIConfigHandler()
      {
         super();
      }
      
      public function centralIcon(param1:int = -1) : CentralIconVo
      {
         var _loc2_:BoardgameVo = null;
         var _loc3_:CommunityEventVO = null;
         var _loc4_:GlobalEventVO = null;
         var _loc5_:Vector.<BoardgameVo> = null;
         var _loc6_:CentralIconVo = new CentralIconVo();
         if(this.communityProxy != null)
         {
            _loc3_ = this.communityProxy.proxyData;
            this._readOutCommunityRunningEvent = _loc3_.eventId;
            _loc4_ = this.eventProxy.getGlobalEvent(this._readOutCommunityRunningEvent);
            _loc6_.actionVars = new WindowVars(WindowTypes.COMMUNITY_EVENT_WINDOW,"",this._readOutCommunityRunningEvent);
         }
         if(this.boardgameProxy != null)
         {
            _loc5_ = this.boardgameProxy.proxyData;
            if(param1 == -1)
            {
               if(_loc5_[0])
               {
                  _loc2_ = _loc5_[0];
               }
            }
            else
            {
               _loc2_ = this.boardgameProxy.proxyDataById(param1);
            }
            this._readOutBoardgameRunningEvent = _loc2_.eventId;
            _loc4_ = this.eventProxy.getGlobalEvent(this._readOutBoardgameRunningEvent);
            _loc6_.actionVars = new WindowVars(WindowTypes.BOARDGAME_WINDOW,"",this._readOutBoardgameRunningEvent);
         }
         _loc6_.eventName = _loc4_.eventName;
         _loc6_.iconType = "EventUIIcon";
         _loc6_.action = WinNote.OPEN_WINDOW;
         _loc6_.infoAction = "tooltip";
         _loc6_.infoMediator = CountDownMediator;
         _loc6_.eventId = _loc4_.eventId;
         return _loc6_;
      }
      
      public function displayIcons(param1:int = -1) : Vector.<DisplayIconVo>
      {
         var _loc3_:DisplayIconVo = null;
         var _loc4_:Vector.<BoardgameVo> = null;
         var _loc5_:BoardgameVo = null;
         var _loc6_:GlobalEventVO = null;
         var _loc7_:int = 0;
         var _loc8_:BoardgameCollVo = null;
         var _loc2_:Vector.<DisplayIconVo> = new Vector.<DisplayIconVo>();
         if(this.communityProxy != null)
         {
            _loc6_ = this.eventProxy.getGlobalEvent(this.communityProxy.proxyData.eventId);
            this._readOutCommunityRunningEvent = this.communityProxy.proxyData.eventId;
         }
         if(this.boardgameProxy != null)
         {
            _loc4_ = this.boardgameProxy.proxyData;
            if(param1 == -1)
            {
               if(_loc4_[0])
               {
                  _loc5_ = _loc4_[0];
               }
            }
            else
            {
               _loc5_ = this.boardgameProxy.proxyDataById(param1);
            }
            _loc6_ = this.eventProxy.getGlobalEvent(_loc5_.eventId);
            this._readOutBoardgameRunningEvent = _loc5_.eventId;
         }
         if(this.communityProxy != null)
         {
            _loc3_ = new DisplayIconVo();
            _loc3_.nr = "nr1";
            _loc3_.asset = _loc6_.eventName + "Icon";
            _loc3_.assetConfig = ASSET_TYPE_MULTIGAME;
            _loc3_.action = WinNote.OPEN_WINDOW;
            _loc3_.actionParams = new WindowVars(WindowTypes.COMMUNITY_EVENT_WINDOW,"",this._readOutCommunityRunningEvent);
            _loc2_.push(_loc3_);
         }
         if(this.boardgameProxy != null)
         {
            _loc3_ = new DisplayIconVo();
            _loc3_.nr = "nr2";
            _loc3_.asset = _loc6_.eventName + "Icon";
            _loc3_.assetConfig = ASSET_TYPE_BOARDGAME;
            _loc3_.action = WinNote.OPEN_WINDOW;
            _loc3_.actionParams = new WindowVars(WindowTypes.BOARDGAME_WINDOW,"",this._readOutBoardgameRunningEvent);
            _loc2_.push(_loc3_);
         }
         if(this.eventProxy.ballonProxy)
         {
            if(this.eventProxy.ballonProxy.proxyData.ballonsPerMinute > 0)
            {
               _loc3_ = new DisplayIconVo();
               _loc3_.nr = TYPE_COUNTER;
               _loc3_.action = WinNote.OPEN_WINDOW;
               _loc3_.assetConfig = ASSET_TYPE_COUNTER;
               _loc3_.itemId = this.eventProxy.ballonProxy.proxyData.dartId;
               if(this.ballonEventVoData.dropPack == null)
               {
                  _loc3_.actionParams = new WindowVars(WindowTypes.BOARDGAME_WINDOW,"",this._readOutBoardgameRunningEvent);
               }
               else
               {
                  _loc3_.actionParams = new WindowVars(WindowTypes.BALLONSELL_WINDOW,"",this._readOutBoardgameRunningEvent);
               }
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private function get ballonEventVoData() : BallonEventVo
      {
         return this.eventProxy.ballonProxy.proxyData as BallonEventVo;
      }
      
      public function shouldDisplayIcon() : Boolean
      {
         return true;
      }
      
      private function callBackDyn(param1:IFacade, param2:Object = null, param3:int = 0) : int
      {
         return (param1.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy).getCollectableAmmount(param3);
      }
      
      public function get runningBoardGameEvent() : int
      {
         var _loc1_:Vector.<BoardgameVo> = null;
         if(this.boardgameProxy)
         {
            _loc1_ = this.boardgameProxy.proxyData;
            if(this._readOutBoardgameRunningEvent == 0)
            {
               if(_loc1_[0])
               {
                  return _loc1_[0].eventId;
               }
            }
         }
         return this._readOutBoardgameRunningEvent;
      }
      
      public function get runningCommunityEvent() : int
      {
         var _loc1_:CommunityEventVO = null;
         if(this.communityProxy)
         {
            _loc1_ = this.communityProxy.proxyData;
            if(this._readOutCommunityRunningEvent == 0)
            {
               this._readOutCommunityRunningEvent = this.communityProxy.proxyData.eventId;
            }
         }
         return this._readOutCommunityRunningEvent;
      }
      
      public function get boardgameProxy() : BoardgameProxy
      {
         return this.eventProxy.boardgameProxy;
      }
      
      public function get communityProxy() : CommunityEventProxy
      {
         return this.eventProxy.communityProxy;
      }
   }
}

