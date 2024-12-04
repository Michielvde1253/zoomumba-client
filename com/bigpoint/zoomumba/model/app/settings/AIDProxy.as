package com.bigpoint.zoomumba.model.app.settings
{
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AIDProxy extends Proxy
   {
      public static const NAME:String = "AIDProxy";
      
      private var _userDataChange_enabled:Boolean = true;
      
      public function AIDProxy()
      {
         super(NAME);
      }
      
      public function get userDataChange_enabled() : Boolean
      {
         return this._userDataChange_enabled;
      }
      
      public function set userDataChange_enabled(param1:Boolean) : void
      {
         this._userDataChange_enabled = param1;
      }
   }
}

