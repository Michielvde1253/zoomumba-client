package com.bigpoint.zoomumba.model.app.core
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AppProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "AppProxy";
      
      private var _currentAppMode:String = "NORMAL_MODE";
      
      private var sessionId:String = "";
      
      public function AppProxy()
      {
         super(NAME);
      }
      
      public function setZooSessionId(param1:String) : void
      {
         this.sessionId = param1;
      }
      
      public function getZooSessionId() : String
      {
         return this.sessionId;
      }
      
      public function get currentAppMode() : String
      {
         return this._currentAppMode;
      }
      
      public function set currentAppMode(param1:String) : void
      {
         this._currentAppMode = param1;
         sendNotification(DataNote.APP_MODE_CHANGED,this._currentAppMode);
      }
   }
}

