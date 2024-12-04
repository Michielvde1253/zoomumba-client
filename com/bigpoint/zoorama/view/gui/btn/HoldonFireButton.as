package com.bigpoint.zoorama.view.gui.btn
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HoldonFireButton extends BasicButton
   {
      public static var EVENT_HOLDON_MOUSE_FIRE:String = "holdonMouseFireEvent";
      
      private var delayedFireEventTimer:Timer;
      
      private var fireEventTimer:Timer;
      
      public function HoldonFireButton(param1:Notifier = null, param2:Sprite = null)
      {
         super(param1,param2);
         this.delayedFireEventTimer = new Timer(400,1);
         this.delayedFireEventTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.handleDelayedFireEventTimerEvent);
         this.delayedFireEventTimer.stop();
         this.fireEventTimer = new Timer(100);
         this.fireEventTimer.addEventListener(TimerEvent.TIMER,this.handlFireEventTimerEvent);
         this.fireEventTimer.stop();
      }
      
      public function set fireInterval(param1:int) : void
      {
         this.fireEventTimer.delay = param1;
      }
      
      public function set delay(param1:int) : void
      {
         this.delayedFireEventTimer.delay = param1;
      }
      
      override protected function handleMouseDown(param1:MouseEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            super.handleMouseDown(param1);
            this.delayedFireEventTimer.start();
         }
      }
      
      override protected function handleMouseUp(param1:MouseEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            super.handleMouseUp(param1);
            this.delayedFireEventTimer.stop();
            this.fireEventTimer.stop();
         }
      }
      
      override protected function handleMouseOutHit(param1:MouseEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            super.handleMouseOutHit(param1);
            this.delayedFireEventTimer.stop();
            this.fireEventTimer.stop();
         }
      }
      
      private function handleDelayedFireEventTimerEvent(param1:TimerEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.fireEventTimer.stop();
            this.fireEventTimer.start();
         }
      }
      
      private function handlFireEventTimerEvent(param1:TimerEvent) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            dispatchEvent(new MouseEvent(EVENT_HOLDON_MOUSE_FIRE));
         }
      }
   }
}

