package com.bigpoint.zoomumba.view.gui.custom
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import custom.components.CountDown;
   import org.puremvc.as3.patterns.facade.Facade;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   
   public class CountDownMediator extends Mediator
   {
      public static const NAME:String = "CountDownMediator";
      
      private var _viewComponent:CountDown = new CountDown();
      
      private var _eventId:int;
      
      private var _timeLeft:Number;
      
      private var _endTimestamp:int;
      
      private var _showTime:int;
      
      public function CountDownMediator(param1:Group, param2:int, param3:String = null)
      {
         this._eventId = param2;
         param1.addElement(this._viewComponent);
         super(!param3 ? NAME : param3,this._viewComponent);
         Facade.getInstance().registerMediator(this);
      }
      
      override public function onRegister() : void
      {
         this.setCounter();
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this._viewComponent.x = -23;
         this._viewComponent.y = 49;
         this._viewComponent.mouseChildren = false;
         this._viewComponent.mouseEnabled = false;
      }
      
      public function setCounter() : void
      {
         var _loc1_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc2_:GlobalEventVO = _loc1_.getGlobalEvent(this._eventId);
         this._timeLeft = _loc2_.endDate - 86400 - TimeManager.currentTime;
         this._endTimestamp = _loc2_.endDate;
         if(this._timeLeft > 0)
         {
            TimeManager.registerTickFunction(this.updateComponent);
         }
         else
         {
            this._viewComponent.countdownText.text = "00:00:00";
            this._viewComponent.countdownText.color = 10027008;
         }
      }
      
      public function updateComponent() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc3_:GlobalEventVO = _loc2_.getGlobalEvent(this._eventId);
         this._timeLeft = _loc3_.endDate - TimeManager.currentTime;
         this._showTime = _loc3_.endDate - 86400 - TimeManager.currentTime;
         if(this._showTime <= 0)
         {
            this._viewComponent.countdownText.text = "00:00:00";
            this._viewComponent.countdownText.color = 10027008;
         }
         else
         {
            this._viewComponent.countdownText.text = TimeFormat.secondsToTimeString(this._showTime);
         }
         if(this._timeLeft <= 0)
         {
            TimeManager.unregisterTickFunction(this.updateComponent);
            _loc2_ = facade.getProxy(GlobalEventProxy);
            if(_loc2_.isEventActive(_loc2_.genericGUIConfigHandler.runningBoardGameEvent))
            {
               this.setCounter();
            }
            else
            {
               sendNotification(Note.HIDE_EVENT_UI);
            }
         }
      }
      
      override public function onRemove() : void
      {
         TimeManager.unregisterTickFunction(this.updateComponent);
      }
   }
}

