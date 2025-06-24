package com.bigpoint.zoomumba.model.features.dailyLogin
{
   import com.bigpoint.zoomumba.constants.DAILYLOGIN;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.features.dailyLogin.vo.DailyLoginRewardVo;
   import com.bigpoint.zoomumba.model.features.dailyLogin.vo.DailyLoginVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.greensock.TweenLite;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class DailyLoginProxy extends Proxy
   {
      public static const NAME:String = "DailyLoginProxy";
      
      private var delayShowWindow:TweenLite;
      
      public function DailyLoginProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         if(Boolean(this.proxyData) && Boolean(this.proxyData.currentReward))
         {
         }
      }
      
      public function setCurrentReward(param1:Object) : void
      {
         var _loc2_:DailyLoginVo = this.getOrCreateProxy();
         var _loc3_:DailyLoginRewardVo = new DailyLoginRewardVo();
         if(param1.amount)
         {
            _loc3_.amount = parseInt(String(param1.amount));
         }
         if(param1.id)
         {
            _loc3_.id = parseInt(String(param1.id));
         }
         if(param1.type)
         {
            _loc3_.type = String(param1.type);
         }
         _loc2_.currentReward = _loc3_;
         this.proxyData = _loc2_;
         this.initDailyLoginWindow();
      }
      
      public function get cookieProxy() : AppCookieProxy
      {
         return facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
      }
      
      public function initDailyLoginWindow() : void
      {
         if(this.delayShowWindow)
         {
            this.delayShowWindow.pause();
            this.delayShowWindow.kill();
            this.delayShowWindow = null;
         }
         this.delayShowWindow = TweenLite.delayedCall(DAILYLOGIN.DAILYLOGIN_DELAY_SEC,this.showDailyLoginWindow);
      }
      
      public function showDailyLoginWindow() : void
      {
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.DAILY_LOGIN_BONUS));
      }
      
      public function setDailyLoginData(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc2_:DailyLoginVo = this.getOrCreateProxy();
         var _loc3_:DailyLoginRewardVo = new DailyLoginRewardVo();
         if(param1)
         {
            if(param1.countLogin)
            {
               _loc2_.countLogin = param1.countLogin;
            }
            if(param1.lastBooking)
            {
               _loc2_.lastBooking = param1.lastBooking;
            }
            if(param1.rewards)
            {
               _loc2_.rewards = new Vector.<DailyLoginRewardVo>();
               for(_loc5_ in param1.rewards)
               {
                  _loc3_ = new DailyLoginRewardVo();
                  _loc4_ = param1.rewards[_loc5_];
                  _loc3_.step = parseInt(_loc5_);
                  if(_loc4_.amount)
                  {
                     _loc3_.amount = parseInt(String(_loc4_.amount));
                  }
                  if(_loc4_.id)
                  {
                     _loc3_.id = parseInt(String(_loc4_.id));
                  }
                  if(_loc4_.type)
                  {
                     _loc3_.type = String(_loc4_.type);
                  }
                  _loc2_.rewards.push(_loc3_);
               }
            }
         }
         if(_loc2_.countLogin > DAILYLOGIN.MAX_CARDS)
         {
            _loc2_.countLogin = DAILYLOGIN.MAX_CARDS;
         }
         this.proxyData = _loc2_;
      }
      
      public function getOrCreateProxy() : DailyLoginVo
      {
         if(this.proxyData != null)
         {
            return this.proxyData;
         }
         return new DailyLoginVo();
      }
      
      public function set proxyData(param1:DailyLoginVo) : void
      {
         super.data = param1;
      }
      
      public function get proxyData() : DailyLoginVo
      {
         return super.data as DailyLoginVo;
      }
   }
}

