package com.bigpoint.zoomumba.controller.features.cheat
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoorama.Settings;
   import flash.events.AsyncErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AntiCheatProxy extends Proxy
   {
      public static var NAME:String = "AntiCheatProxy";
      
      private var appId:String;
      
      private var userId:int;
      
      private var sendingLC:LocalConnection;
      
      private var incomingLC:LocalConnection;
      
      public function AntiCheatProxy()
      {
         super(NAME);
      }
      
      public function start(param1:int) : void
      {
         this.userId = param1;
         this.appId = new Date().getTime().toString();
         this.initReceive();
         this.initSend();
         this.startSend();
      }
      
      private function startSend() : void
      {
         TimeManager.registerTickFunction(this.sendAppid);
      }
      
      private function sendAppid() : void
      {
         this.sendingLC.send("zoomumbachannel","clientDetect",this.appId,this.userId);
      }
      
      private function initReceive() : void
      {
         if(!this.incomingLC)
         {
            this.incomingLC = new LocalConnection();
            this.incomingLC.addEventListener(StatusEvent.STATUS,this.onStatusEvent);
            this.incomingLC.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.onAsyncError);
            this.incomingLC.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            try
            {
               this.incomingLC.client = this;
               this.incomingLC.connect("zoomumbachannel");
            }
            catch(error:ArgumentError)
            {
            }
         }
      }
      
      private function initSend() : void
      {
         if(!this.sendingLC)
         {
            this.sendingLC = new LocalConnection();
            this.sendingLC.addEventListener(StatusEvent.STATUS,this.onStatusEvent);
            this.sendingLC.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.onAsyncError);
            this.sendingLC.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         }
      }
      
      private function onStatusEvent(param1:StatusEvent) : void
      {
      }
      
      private function onAsyncError(param1:AsyncErrorEvent) : void
      {
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
      }
      
      public function clientDetect(param1:String, param2:int) : void
      {
         if(Settings.DEV_MODE)
         {
            return;
         }
         if(param1 != this.appId && param2 == this.userId)
         {
            this.sendingLC.send("zoomumbachannel","clientDetect",this.appId,this.userId);
            if(!Settings.DEV_MODE)
            {
               sendNotification(Note.FORCE_LOGOUT);
            }
         }
      }
   }
}

