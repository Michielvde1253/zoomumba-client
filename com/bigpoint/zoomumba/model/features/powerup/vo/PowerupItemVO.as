package com.bigpoint.zoomumba.model.features.powerup.vo
{
   public class PowerupItemVO
   {
      private var _id:int;
      
      private var _pid:int;
      
      private var _inUse:int;
      
      private var _lastActivated:int;
      
      private var _endTime:int;
      
      public function PowerupItemVO()
      {
         super();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get pid() : int
      {
         return this._pid;
      }
      
      public function set pId(param1:int) : void
      {
         this._pid = param1;
      }
      
      public function get inUse() : int
      {
         return this._inUse;
      }
      
      public function set inUse(param1:int) : void
      {
         this._inUse = param1;
      }
      
      public function get lastActivated() : int
      {
         return this._lastActivated;
      }
      
      public function set lastActivated(param1:int) : void
      {
         this._lastActivated = param1;
      }
      
      public function get endTime() : int
      {
         return this._endTime;
      }
      
      public function set endTime(param1:int) : void
      {
         this._endTime = param1;
      }
      
      public function set uId(param1:int) : void
      {
      }
   }
}

