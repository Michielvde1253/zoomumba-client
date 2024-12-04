package com.bigpoint.utils.timeManager
{
   public class TimeTrack
   {
      private static var trackCount:int = 0;
      
      private static var canInstantiate:Boolean = false;
      
      internal var trackId:int = trackCount++;
      
      internal var time:int = -1;
      
      public var callbackArgument:Object;
      
      internal var callBack:Function;
      
      internal var active:Boolean = false;
      
      internal var nextTrack:TimeTrack;
      
      public function TimeTrack(param1:Function, param2:int = -1, param3:Object = null)
      {
         super();
         if(!canInstantiate)
         {
            throw Error("You cant instantiate TimeTracks, Use TimeManager.creatEmptyTrack(), or timeManager.registerTimedCallBack() to create them.");
         }
         this.time = param2;
         this.callBack = param1;
         this.callbackArgument = param3;
      }
      
      internal static function createTrack(param1:Function, param2:int = -1, param3:Object = null) : TimeTrack
      {
         canInstantiate = true;
         var _loc4_:TimeTrack = new TimeTrack(param1,param2,param3);
         canInstantiate = false;
         return _loc4_;
      }
   }
}

