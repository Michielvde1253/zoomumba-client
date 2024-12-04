package com.bigpoint.zoomumba.view.gui.event.ballons
{
   import com.bigpoint.zoomumba.constants.BALLONEVENT;
   import com.bigpoint.zoomumba.view.gui.event.events.BallonEvent;
   import com.bigpoint.zoomumba.view.gui.event.vo.BallonTypeVo;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.greensock.TweenLite;
   import com.greensock.easing.*;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class BallonItem extends MovieClip
   {
      private var _state:String;
      
      private var _flightTime:int;
      
      private var _flightTweens:Vector.<TweenLite>;
      
      private var _delayStartTween:TweenLite;
      
      private var _ballonTypeVo:BallonTypeVo;
      
      public function BallonItem(param1:BallonTypeVo)
      {
         super();
         this._ballonTypeVo = param1;
         this.displayBallon.stop();
         this.displayBallon.cacheAsBitmap = true;
         this.addChild(this.displayBallon);
         this.updateState(BALLONEVENT.BALLON_STATE_DEFAULT);
      }
      
      public function updateState(param1:String) : void
      {
         this._state = param1;
         switch(this._state)
         {
            case BALLONEVENT.BALLON_STATE_DEFAULT:
               this.displayBallon.gotoAndStop(BALLONEVENT.BALLON_STATE_DEFAULT);
               this.displayBallon.visible = false;
               this.deactiveClick();
               break;
            case BALLONEVENT.BALLON_STATE_FLIGHT:
               this.killFlightTweens();
               this.displayBallon.visible = true;
               this.startFlight();
               this.initClick();
               this.playSound();
               break;
            case BALLONEVENT.BALLON_STATE_CLICK:
               this.deactiveClick();
               this.displayBallon.visible = true;
               break;
            case BALLONEVENT.BALLON_STATE_TIMER:
               this.deactiveClick();
               this.startTimer();
               break;
            case BALLONEVENT.BALLON_STATE_EXPLODE:
               this.deactiveClick();
               this.delayExplode(param1);
               break;
            case BALLONEVENT.BALLON_STATE_FLIGHT_END:
               this.deactiveClick();
               this.displayBallon.visible = false;
               this.killFlightTweens();
         }
      }
      
      public function killDelayTimer() : void
      {
         if(this._delayStartTween)
         {
            this._delayStartTween.pause();
            this._delayStartTween.kill();
            this._delayStartTween = null;
         }
      }
      
      protected function delayExplode(param1:String) : void
      {
         this.displayBallon.gotoAndPlay(param1);
         this.displayBallon.visible = true;
      }
      
      public function killFlightTweens() : void
      {
         var _loc1_:TweenLite = null;
         for each(_loc1_ in this._flightTweens)
         {
            if(_loc1_)
            {
               _loc1_.pause();
               _loc1_.kill();
               _loc1_ = null;
            }
         }
         this._flightTweens = new Vector.<TweenLite>();
      }
      
      private function startTimer() : void
      {
         this._delayStartTween = TweenLite.delayedCall(this._ballonTypeVo.startinSeconds,this.updateState,[BALLONEVENT.BALLON_STATE_FLIGHT]);
         this.displayBallon.gotoAndStop(BALLONEVENT.BALLON_STATE_DEFAULT);
         this.displayBallon.visible = false;
      }
      
      protected function startFlight() : void
      {
         this.killFlightTweens();
         this.killDelayTimer();
      }
      
      private function ballonEndFlight() : void
      {
         this.killFlightTweens();
         this.killDelayTimer();
         this.deactiveClick();
         this.updateState(BALLONEVENT.BALLON_STATE_FLIGHT_END);
      }
      
      private function initClick() : void
      {
         this.displayBallon.mouseEnabled = true;
         this.displayBallon.addEventListener(MouseEvent.CLICK,this.onClickBallon,false,0,true);
      }
      
      private function onClickBallon(param1:MouseEvent) : void
      {
         this.deactiveClick();
         this.updateState(BALLONEVENT.BALLON_STATE_CLICK);
         dispatchEvent(new BallonEvent(BallonEvent.SHOOT_BALLON_EVENT));
      }
      
      protected function deactiveClick() : void
      {
         this.displayBallon.mouseEnabled = false;
         this.displayBallon.removeEventListener(MouseEvent.CLICK,this.onClickBallon);
      }
      
      public function destroy() : void
      {
         this.killFlightTweens();
         this.killDelayTimer();
         this.deactiveClick();
         this.removeChild(this.displayBallon);
      }
      
      public function playSound() : void
      {
         var _loc1_:String = null;
         if(this.ballonTypeVo.sounds.length != 0)
         {
            _loc1_ = this.ballonTypeVo.sounds[this.randomNr(0,this.ballonTypeVo.sounds.length - 1)];
            SoundManager.getInstance().playSoundEffect(_loc1_);
         }
      }
      
      public function get id() : String
      {
         return this._ballonTypeVo.id;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function set displayBallon(param1:MovieClip) : void
      {
         this._ballonTypeVo.displayObject = param1;
      }
      
      public function get displayBallon() : MovieClip
      {
         return this._ballonTypeVo.displayObject;
      }
      
      public function get ballonTypeVo() : BallonTypeVo
      {
         return this._ballonTypeVo;
      }
      
      public function set ballonTypeVo(param1:BallonTypeVo) : void
      {
         this._ballonTypeVo = param1;
      }
      
      public function get flightTweens() : Vector.<TweenLite>
      {
         return this._flightTweens;
      }
      
      public function set flightTweens(param1:Vector.<TweenLite>) : void
      {
         this._flightTweens = param1;
      }
      
      protected function randomNr(param1:int, param2:int) : int
      {
         return Math.floor(Math.random() * (1 + param2 - param1)) + param1;
      }
   }
}

