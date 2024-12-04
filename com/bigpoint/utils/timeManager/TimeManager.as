package com.bigpoint.utils.timeManager
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TimeManager
   {
      private static var instance:TimeManager;
      
      private static var serverTimeDiff:int;
      
      private static var _currentTime:int;
      
      public static const SECONDS_IN_MINUTE:int = 60;
      
      public static const SECONDS_IN_HOUR:int = 3600;
      
      public static const SECONDS_IN_DAY:int = 86400;
      
      private static var canInstantiate:Boolean = false;
      
      private static var activeTrackHead:TimeTrack = creatEmptyTrack(null);
      
      private static var timer:Timer = new Timer(1000);
      
      private static var tickListeners:Vector.<Function> = new Vector.<Function>();
      
      public function TimeManager()
      {
         super();
         if(!canInstantiate)
         {
            throw new Error("Error: Instantiation failed: Use TimeManager.getInstance() instead of new.");
         }
         activeTrackHead.time = 0;
         timer.addEventListener(TimerEvent.TIMER,handleTick);
         timer.start();
         handleTick();
      }
      
      public static function init() : void
      {
         if(instance == null)
         {
            canInstantiate = true;
            instance = new TimeManager();
            canInstantiate = false;
            return;
         }
         throw Error("Error: Use TimeManager.init() only once.");
      }
      
      public static function sincWithServerTime(param1:int) : void
      {
         serverTimeDiff = param1 - Math.round(new Date().time / 1000);
      }
      
      public static function creatEmptyTrack(param1:Function, param2:Object = null) : TimeTrack
      {
         return TimeTrack.createTrack(param1,-1,param2);
      }
      
      public static function updateTrackTime(param1:TimeTrack, param2:int) : void
      {
         if(param2 > 0)
         {
            param1.time = param2;
            activateTrack(param1);
         }
      }
      
      private static function activateTrack(param1:TimeTrack) : void
      {
         if(param1.active)
         {
            removeTrack(param1);
         }
         param1.active = true;
         var _loc2_:TimeTrack = activeTrackHead.nextTrack;
         var _loc3_:TimeTrack = activeTrackHead;
         var _loc4_:Boolean = false;
         while(Boolean(_loc2_) && !_loc4_)
         {
            if(param1.time < _loc2_.time)
            {
               _loc4_ = true;
            }
            else
            {
               _loc3_ = _loc2_;
               _loc2_ = _loc2_.nextTrack;
            }
         }
         _loc3_.nextTrack = param1;
         param1.nextTrack = _loc2_;
      }
      
      public static function removeTrack(param1:TimeTrack) : void
      {
         var _loc2_:TimeTrack = activeTrackHead.nextTrack;
         var _loc3_:TimeTrack = activeTrackHead;
         var _loc4_:Boolean = false;
         while(Boolean(_loc2_) && !_loc4_)
         {
            if(_loc2_ == param1)
            {
               _loc2_.active = false;
               _loc3_.nextTrack = _loc2_.nextTrack;
               _loc4_ = true;
            }
            _loc3_ = _loc2_;
            _loc2_ = _loc2_.nextTrack;
         }
      }
      
      private static function handleTick(param1:TimerEvent = null) : void
      {
         var _loc4_:Function = null;
         var _loc2_:TimeTrack = activeTrackHead.nextTrack;
         var _loc3_:Boolean = false;
         _currentTime = new Date().time / 1000 + serverTimeDiff;
         while(Boolean(_loc2_) && !_loc3_)
         {
            if(_loc2_.time < currentTime)
            {
               if(_loc2_.callbackArgument)
               {
                  _loc2_.callBack(_loc2_.callbackArgument);
               }
               else
               {
                  _loc2_.callBack();
               }
               activeTrackHead.nextTrack = _loc2_.nextTrack;
            }
            else
            {
               _loc3_ = true;
            }
            _loc2_ = activeTrackHead.nextTrack;
         }
         for each(_loc4_ in tickListeners)
         {
            _loc4_();
         }
      }
      
      public static function registerTickFunction(param1:Function) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < tickListeners.length)
         {
            if(tickListeners[_loc2_] == param1)
            {
               return;
            }
            _loc2_++;
         }
         tickListeners.push(param1);
      }
      
      public static function unregisterTickFunction(param1:Function) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < tickListeners.length)
         {
            if(tickListeners[_loc2_] == param1)
            {
               tickListeners.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public static function get currentTime() : int
      {
         return _currentTime;
      }
   }
}

