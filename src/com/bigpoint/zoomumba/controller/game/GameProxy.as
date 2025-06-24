package com.bigpoint.zoomumba.controller.game
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class GameProxy extends Proxy
   {
      public static var NAME:String = "GameProxy";
      
      private var _serverTime:int = -1;
      
      public function GameProxy()
      {
         super(NAME);
      }
      
      public function get serverTime() : int
      {
         return this._serverTime;
      }
      
      public function set serverTime(param1:int) : void
      {
         this._serverTime = param1;
         TimeManager.sincWithServerTime(this._serverTime);
      }
   }
}

