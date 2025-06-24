package com.bigpoint.zoomumba.model.core.cookies
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AppCookieProxy extends Proxy
   {
      public static const NAME:String = "AppCookieProxy";
      
      private var _cookies:Vector.<AppCookieVO> = new Vector.<AppCookieVO>();
      
      public function AppCookieProxy()
      {
         super(NAME);
      }
      
      public function get cookies() : Vector.<AppCookieVO>
      {
         return this._cookies;
      }
      
      public function setCookies(param1:Vector.<AppCookieVO>) : void
      {
         this._cookies = param1;
      }
      
      public function getCookie(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._cookies.length)
         {
            if(this._cookies[_loc3_].name == param1)
            {
               _loc2_ = this._cookies[_loc3_].timestamp;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setCookie(param1:String, param2:int) : void
      {
         var _loc3_:AppCookieVO = new AppCookieVO();
         _loc3_.name = param1;
         _loc3_.timestamp = param2;
         this.addCookie(_loc3_);
      }
      
      private function addCookie(param1:AppCookieVO) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this._cookies.length)
         {
            if(this._cookies[_loc3_].name == param1.name)
            {
               this._cookies[_loc3_].timestamp = param1.timestamp;
               _loc2_ = true;
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this._cookies.push(param1);
         }
         this.writeChanges();
      }
      
      private function writeChanges() : void
      {
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         while(_loc2_ < this._cookies.length)
         {
            _loc1_[this._cookies[_loc2_].name] = this._cookies[_loc2_];
            _loc2_++;
         }
         sendNotification(NET.SAVE_FLASH_COOKIE,[_loc1_]);
      }
   }
}

