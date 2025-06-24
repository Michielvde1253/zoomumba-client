package com.bigpoint.zoomumba.model.app.resources.events
{
   import flash.events.Event;
   
   public class ResourceCachedEvent extends Event
   {
      public static const CHANGE_CACHE_STATUS:String = "changeCacheStatus";
      
      public static const CACHE_STATUS_CHANGED:String = "cacheStatusChanged";
      
      private var _enabled:Boolean;
      
      public function ResourceCachedEvent(param1:String, param2:Boolean, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._enabled = param2;
      }
      
      override public function clone() : Event
      {
         return new ResourceCachedEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("ResourceCachedEvent","type","enabled","bubbles","cancelable","eventPhase");
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
   }
}

