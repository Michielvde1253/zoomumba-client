package com.bigpoint.zoomumba.model.playfield
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.greensock.TweenLite;
   import flash.utils.getTimer;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PlayFieldAnimationProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "PlayFieldAnimationProxy";
      
      private static var ANIMATION_RECHECK_INTERVALS:int = 1000;
      
      private var _maxPossibleAnimations:int = 20;
      
      private var lastAnimationRecheckTime:int = 0;
      
      private var isCheckPending:Boolean = false;
      
      private var _isPaused:Boolean = false;
      
      public function PlayFieldAnimationProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.lastAnimationRecheckTime = 0;
         super.onRegister();
      }
      
      public function forceAnimationRecheck() : void
      {
         var _loc1_:int = getTimer() - this.lastAnimationRecheckTime;
         if(_loc1_ > ANIMATION_RECHECK_INTERVALS)
         {
            this.handleAnimationCheck();
         }
         else if(!this.isCheckPending)
         {
            TweenLite.delayedCall(1,this.handleAnimationCheck);
            this.isCheckPending = true;
         }
      }
      
      private function handleAnimationCheck() : void
      {
         this.lastAnimationRecheckTime = getTimer();
         this.isCheckPending = false;
         sendNotification(Note.MANAGE_PLAYFIELD_ANIMATIONS);
      }
      
      public function getMaxPossibleAnimations() : int
      {
         return this._maxPossibleAnimations;
      }
      
      public function setMaxPossibleAnimations(param1:int) : void
      {
         this._maxPossibleAnimations = param1;
      }
      
      public function get isPaused() : Boolean
      {
         return this._isPaused;
      }
      
      public function set isPaused(param1:Boolean) : void
      {
         this._isPaused = param1;
         this.forceAnimationRecheck();
      }
   }
}

