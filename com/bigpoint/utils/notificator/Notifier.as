package com.bigpoint.utils.notificator
{
   import flash.utils.Dictionary;
   
   public class Notifier
   {
      private static var rootNotifier:Notifier;
      
      private var parentNotifier:Notifier;
      
      internal var noticeListeners:Dictionary = new Dictionary();
      
      private var holderClassName:String;
      
      public function Notifier(param1:Notifier = null, param2:String = "")
      {
         super();
         this.holderClassName = param2;
         if(param1)
         {
            this.parentNotifier = param1;
         }
         else
         {
            if(rootNotifier)
            {
               throw Error("Notifier can have only one root point. all ather notifiers MUST pass parent Notifier. ");
            }
            rootNotifier = this;
         }
      }
      
      public function dispatchNotice(param1:Notice) : void
      {
         param1._sourceNotifier = this;
         this.handleNotice(param1);
      }
      
      internal function handleNotice(param1:Notice) : void
      {
         if(this.noticeListeners[param1.type])
         {
            this.noticeListeners[param1.type](param1);
         }
         if(this.parentNotifier)
         {
            this.parentNotifier.handleNotice(param1);
         }
      }
      
      public function dispatchNoticeToRoot(param1:Notice) : void
      {
         if(Notifier.rootNotifier.noticeListeners[param1.type])
         {
            Notifier.rootNotifier.noticeListeners[param1.type](param1);
         }
      }
      
      public function registerNoticeListener(param1:String, param2:Function) : void
      {
         this.noticeListeners[param1] = param2;
      }
   }
}

