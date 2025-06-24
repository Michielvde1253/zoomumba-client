package com.bigpoint.zoomumba.model.app.gameEvents
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.EVENT;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieType;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieVO;
   import com.bigpoint.zoomumba.model.events.ballonEvent.BallonEventProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.community.CommunityEventProxy;
   import com.bigpoint.zoomumba.model.events.gui.GenericGUIConfigHandler;
   import flash.utils.Dictionary;
   import mx.collections.ArrayCollection;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class GlobalEventProxy extends Proxy
   {
      public static const NAME:String = "GlobalEventProxy";
      
      public var genericGUIConfigHandler:GenericGUIConfigHandler = new GenericGUIConfigHandler();
      
      public function GlobalEventProxy()
      {
         super(NAME,new Dictionary());
      }
      
      override public function onRegister() : void
      {
         this.genericGUIConfigHandler.eventProxy = this;
      }
      
      public function clearEventCookieWindow() : void
      {
         var _loc1_:AppCookieProxy = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
         if(_loc1_)
         {
            _loc1_.setCookie(AppCookieType.DOUBLE_XP_EVENT,0);
            _loc1_.setCookie(AppCookieType.HAPPY_HOUR,0);
            _loc1_.setCookie(AppCookieType.NOW_IN_SHOP,0);
         }
      }
      
      public function storeGlobalEventData(param1:GlobalEventVO) : void
      {
         this.globalEventList[param1.eventId] = param1;
         sendNotification(DataNote.GLOBAL_EVENT_DATA_STORED,param1.eventId);
         if(param1.startDate > TimeManager.currentTime)
         {
            TimeManager.updateTrackTime(TimeManager.creatEmptyTrack(this._startEvent,param1.eventId),param1.startDate);
         }
         if(param1.endDate > TimeManager.currentTime)
         {
            TimeManager.updateTrackTime(TimeManager.creatEmptyTrack(this._finisheEvent,param1.eventId),param1.endDate);
         }
      }
      
      public function get boardgameProxy() : BoardgameProxy
      {
         return facade.getProxy(BoardgameProxy) as BoardgameProxy;
      }
      
      public function get communityProxy() : CommunityEventProxy
      {
         return facade.getProxy(CommunityEventProxy) as CommunityEventProxy;
      }
      
      public function getEventInformationByEventName() : void
      {
      }
      
      public function get ballonProxy() : BallonEventProxy
      {
         return facade.getProxy(BallonEventProxy) as BallonEventProxy;
      }
      
      public function saveEventCookies() : void
      {
         var _loc2_:GlobalEventVO = null;
         var _loc1_:AppCookieProxy = facade.getProxy(AppCookieProxy);
         for each(_loc2_ in this.globalEventList)
         {
            _loc1_.setCookie(AppCookieType.EVENT + _loc2_.eventId,_loc2_.endDate);
         }
      }
      
      public function checkCookieFinishedEvents() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:AppCookieVO = null;
         var _loc1_:AppCookieProxy = facade.getProxy(AppCookieProxy);
         for each(_loc7_ in _loc1_.cookies)
         {
            if(_loc7_.name.indexOf(AppCookieType.EVENT) > -1)
            {
               _loc6_ = int(_loc7_.name.substr(_loc7_.name.indexOf(AppCookieType.EVENT) + AppCookieType.EVENT.length));
               _loc2_ = this.isEventActive(_loc6_);
               _loc3_ = _loc1_.getCookie(AppCookieType.EVENT + _loc6_);
               _loc4_ = _loc3_ + 10 * TimeManager.SECONDS_IN_DAY;
               _loc5_ = _loc4_ - TimeManager.currentTime;
               if(!_loc2_ && _loc3_ != 0 && _loc5_ > 0)
               {
                  this._finisheEvent(_loc6_);
               }
            }
         }
      }
      
      private function _startEvent(param1:int) : void
      {
         var _loc2_:AppCookieProxy = facade.getProxy(AppCookieProxy);
         _loc2_.setCookie(AppCookieType.EVENT + param1,0);
         sendNotification(EVENT.START,param1);
      }
      
      private function _finisheEvent(param1:int) : void
      {
         var _loc2_:AppCookieProxy = facade.getProxy(AppCookieProxy);
         _loc2_.setCookie(AppCookieType.EVENT + param1,0);
         sendNotification(EVENT.END,param1);
      }
      
      public function getGlobalEvent(param1:int) : GlobalEventVO
      {
         var _loc2_:GlobalEventVO = null;
         if(this.globalEventList[param1])
         {
            return this.globalEventList[param1];
         }
         sendNotification(Note.WARNING_REPORT,"GLOBAL EVENT WITH ID " + param1 + " IS NOT REGISTERED");
         _loc2_ = new GlobalEventVO();
         _loc2_.startDate = 0;
         return _loc2_;
      }
      
      public function isEventActive(param1:int) : Boolean
      {
         var _loc2_:GlobalEventVO = this.globalEventList[param1];
         if(_loc2_)
         {
            return this.checkEventActive(_loc2_);
         }
         return false;
      }
      
      public function hasEventActive() : Boolean
      {
         var _loc2_:GlobalEventVO = null;
         var _loc1_:Boolean = false;
         for each(_loc2_ in this.globalEventList)
         {
            if(this.checkEventActive(_loc2_))
            {
               _loc1_ = true;
               break;
            }
         }
         return _loc1_;
      }
      
      public function getActiveEventsWithViewableTimers() : ArrayCollection
      {
         var _loc2_:GlobalEventVO = null;
         var _loc1_:ArrayCollection = new ArrayCollection();
         for each(_loc2_ in this.globalEventList)
         {
            if(this.checkEventActive(_loc2_) && _loc2_.displayTimer)
            {
               _loc1_.addItem(_loc2_);
            }
         }
         return _loc1_;
      }
      
      private function checkEventActive(param1:GlobalEventVO) : Boolean
      {
         var _loc2_:int = TimeManager.currentTime;
         if(param1.startDate < _loc2_ && param1.endDate > _loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function get globalEventList() : Dictionary
      {
         return data as Dictionary;
      }
   }
}

