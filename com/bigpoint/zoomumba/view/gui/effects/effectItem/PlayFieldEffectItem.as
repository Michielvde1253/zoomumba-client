package com.bigpoint.zoomumba.view.gui.effects.effectItem
{
   import com.bigpoint.zoomumba.constants.EFFECTCONST;
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectVo;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class PlayFieldEffectItem extends MovieClip
   {
      public static const EFFECT_ITEM_REMOVE:String = "EFFECT_ITEM_REMOVE";
      
      private var _displayItem:MovieClip;
      
      private var _state:String;
      
      private var _flightTween:TweenLite;
      
      private var _delayStartTween:TweenLite;
      
      private var _faceOutTween:TweenLite;
      
      private var _maxPos:Point;
      
      private var _playFieldEffectVo:PlayFieldEffectVo;
      
      private var _id:String;
      
      public function PlayFieldEffectItem(param1:String, param2:MovieClip, param3:PlayFieldEffectVo, param4:Point)
      {
         super();
         this._id = param1;
         this._displayItem = param2;
         this._displayItem.cacheAsBitmap = true;
         this._playFieldEffectVo = param3;
         this._maxPos = param4;
         this.addChild(this._displayItem);
         this.deactiveClick();
         this.updateState(EFFECTCONST.STATE_WAITING);
      }
      
      public function updateState(param1:String) : void
      {
         var _loc2_:int = 0;
         if(this._state == EFFECTCONST.STATE_KILL)
         {
            return;
         }
         switch(param1)
         {
            case EFFECTCONST.STATE_INIT:
               break;
            case EFFECTCONST.STATE_FLIGHT:
               this.startFlight();
               break;
            case EFFECTCONST.STATE_WAITING:
               _loc2_ = this.randomNr(this._playFieldEffectVo.delayMin,this._playFieldEffectVo.delayMax);
               this._delayStartTween = TweenLite.delayedCall(_loc2_,this.updateState,[EFFECTCONST.STATE_FLIGHT]);
               this._displayItem.visible = false;
               break;
            case EFFECTCONST.STATE_FLIGHT_END:
               this.itemEndFlight();
               this.updateState(EFFECTCONST.STATE_WAITING);
               break;
            case EFFECTCONST.STATE_KILL:
               this.unloadItem();
         }
         this._state = param1;
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
      
      private function killFlightTimer() : void
      {
         if(this._flightTween)
         {
            this._flightTween.pause();
            this._flightTween.kill();
            this._flightTween = null;
         }
      }
      
      public function startTimer() : void
      {
         this.updateState(EFFECTCONST.STATE_WAITING);
      }
      
      private function startFlight() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Point = this.calcStartPosition();
         var _loc2_:Point = this.calcEndPosition();
         _loc3_ = this.calcFlightTime();
         this.killFlightTimer();
         this.killDelayTimer();
         this._displayItem.visible = true;
         this._displayItem.x = _loc1_.x;
         this._displayItem.y = _loc1_.y;
         this._displayItem.scaleX = this.randomNr(this._playFieldEffectVo.assetMinScale,this._playFieldEffectVo.assetMaxScale) / 100;
         this._displayItem.scaleY = this._displayItem.scaleX;
         this._displayItem.alpha = this.randomNr(this._playFieldEffectVo.assetMinAlpha,this._playFieldEffectVo.assetMaxAlpha) / 100;
         this._flightTween = new TweenLite(this._displayItem,_loc3_,{
            "ease":Linear.easeNone,
            "x":_loc2_.x,
            "y":_loc2_.y,
            "onComplete":this.updateState,
            "onCompleteParams":[EFFECTCONST.STATE_FLIGHT_END]
         });
      }
      
      private function calcFlightTime() : int
      {
         var _loc1_:int = this.randomNr(this._playFieldEffectVo.speedMin,this._playFieldEffectVo.speedMax);
         switch(this._playFieldEffectVo.effectAction)
         {
            case EFFECTCONST.EFFECT_ACTION_ANI_RIGHT_TO_LEFT:
               _loc1_ = _loc1_ * this._maxPos.x / 1000;
         }
         return _loc1_;
      }
      
      private function calcStartPosition() : Point
      {
         var _loc1_:Point = new Point();
         switch(this._playFieldEffectVo.effectAction)
         {
            case EFFECTCONST.EFFECT_ACTION_ANI_RIGHT_TO_LEFT:
               _loc1_.y = this.randomNr(0,this._maxPos.y);
               _loc1_.x = this._maxPos.x;
         }
         return _loc1_;
      }
      
      private function calcEndPosition() : Point
      {
         var _loc1_:Point = new Point();
         switch(this._playFieldEffectVo.effectAction)
         {
            case EFFECTCONST.EFFECT_ACTION_ANI_RIGHT_TO_LEFT:
               _loc1_.y = this.randomNr(0,this._maxPos.y);
               _loc1_.x = this._displayItem.width * -1;
         }
         return _loc1_;
      }
      
      private function unloadItem() : void
      {
         this.killDelayTimer();
         if(this._flightTween != null)
         {
            if(this._flightTween.active == true)
            {
               this.faceOutItem();
            }
         }
      }
      
      private function faceOutItem() : void
      {
         this._faceOutTween = new TweenLite(this._displayItem,this.randomNr(1,5),{
            "alpha":0,
            "onComplete":this.dispatchDeactivate
         });
      }
      
      private function randomNr(param1:Number, param2:Number) : Number
      {
         return Math.random() * (1 + param2 - param1) + param1;
      }
      
      private function itemEndFlight() : void
      {
         this._displayItem.visible = false;
         this.killFlightTimer();
         this.killDelayTimer();
      }
      
      private function deactiveClick() : void
      {
         this._displayItem.mouseEnabled = false;
         this._displayItem.mouseChildren = false;
      }
      
      private function dispatchDeactivate() : void
      {
         dispatchEvent(new Event(Event.DEACTIVATE));
      }
      
      public function destroy() : void
      {
         this.killFlightTimer();
         this.killDelayTimer();
         if(this._faceOutTween)
         {
            this._faceOutTween.kill();
            this._faceOutTween = null;
         }
         this.deactiveClick();
         if(this.contains(this._displayItem))
         {
            this.removeChild(this._displayItem);
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function get displayItem() : MovieClip
      {
         return this._displayItem;
      }
      
      public function get maxPos() : Point
      {
         return this._maxPos;
      }
      
      public function set maxPos(param1:Point) : void
      {
         this._maxPos = param1;
      }
      
      public function get playFieldEffectVo() : PlayFieldEffectVo
      {
         return this._playFieldEffectVo;
      }
   }
}

