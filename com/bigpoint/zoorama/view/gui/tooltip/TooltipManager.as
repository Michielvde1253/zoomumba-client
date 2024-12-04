package com.bigpoint.zoorama.view.gui.tooltip
{
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class TooltipManager extends Mediator
   {
      private static var _instance:TooltipManager;
      
      public static const NAME:String = "TooltipManager";
      
      private static const TOOLTIP_GAP_X:int = 17;
      
      private static const MOUSE_POINT_GAP_X:int = 6;
      
      private static const MOUSE_POINT_GAP_Y:int = 24;
      
      private var TOOLTIP_GAP_Y:int = 86;
      
      public var layer:Sprite;
      
      public var isToolTipVisible:Boolean = false;
      
      private var currentTooltip:Tooltip;
      
      private var showTimer:Timer;
      
      private var delayShowTimer:Timer;
      
      private var delayHideTimer:Timer;
      
      public var delayShowTime:int = 400;
      
      public var delayHideTime:int = 500;
      
      public var updateTime:int = 20;
      
      public var isEnable:Boolean = true;
      
      private var goBellowMainMenu:Boolean = false;
      
      public function TooltipManager()
      {
         super(NAME);
         this.initializeTimers();
         if(Settings.SCALE_TEST)
         {
         }
      }
      
      public static function getInstance() : TooltipManager
      {
         if(_instance == null)
         {
            _instance = new TooltipManager();
         }
         return _instance;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      private function initializeTimers() : void
      {
         this.delayShowTimer = new Timer(this.delayShowTime,1);
         this.delayShowTimer.addEventListener(TimerEvent.TIMER,this.handleDelayShowTimerEvent);
         this.delayShowTimer.stop();
         this.showTimer = new Timer(this.updateTime);
         this.showTimer.addEventListener(TimerEvent.TIMER,this.handleShowTimerEvent);
         this.showTimer.stop();
         this.delayHideTimer = new Timer(this.delayHideTime,1);
         this.delayHideTimer.addEventListener(TimerEvent.TIMER,this.handleDelayHideTimerEvent);
         this.delayHideTimer.stop();
      }
      
      private function setYLimit() : void
      {
         if(this.goBellowMainMenu)
         {
            this.TOOLTIP_GAP_Y = 20;
         }
         else
         {
            this.TOOLTIP_GAP_Y = 86;
         }
      }
      
      public function setTooltip(param1:Tooltip, param2:Boolean = false) : void
      {
         this.goBellowMainMenu = param2;
         this.setYLimit();
         if(this.isEnable)
         {
            if(this.currentTooltip)
            {
               this.delayHideTimer.stop();
               this.removeCurrentTooltip();
            }
            this.currentTooltip = param1;
            this.currentTooltip.hide();
            this.layer.addChild(this.currentTooltip);
            if(this.isToolTipVisible)
            {
               this.delayHideTimer.stop();
               this.show();
            }
            else
            {
               this.startDelayShowTimer();
            }
         }
         else
         {
            this.hide();
         }
      }
      
      public function removeTooltip(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.hide();
         }
         else
         {
            this.delayShowTimer.stop();
            this.startDelayHideTimer();
         }
      }
      
      private function startDelayShowTimer() : void
      {
         this.delayShowTimer.stop();
         this.delayShowTimer.start();
      }
      
      private function startDelayHideTimer() : void
      {
         this.delayHideTimer.stop();
         this.delayHideTimer.start();
      }
      
      private function removeCurrentTooltip() : void
      {
         if(this.currentTooltip)
         {
            this.layer.removeChild(this.currentTooltip);
         }
         this.currentTooltip = null;
      }
      
      private function handleShowTimerEvent(param1:TimerEvent) : void
      {
         if(this.currentTooltip)
         {
            if(this.currentTooltip.followMouse)
            {
               this.calculateTooltipPosition();
            }
         }
      }
      
      private function handleDelayShowTimerEvent(param1:TimerEvent) : void
      {
         this.delayShowTimer.stop();
         this.show();
      }
      
      private function handleDelayHideTimerEvent(param1:TimerEvent) : void
      {
         this.hide();
      }
      
      private function show() : void
      {
         this.isToolTipVisible = true;
         this.currentTooltip.show();
         this.showTimer.start();
         this.calculateTooltipPosition();
      }
      
      private function hide() : void
      {
         if(this.delayHideTimer.running)
         {
            this.delayHideTimer.stop();
         }
         this.delayShowTimer.stop();
         this.showTimer.stop();
         this.isToolTipVisible = false;
         if(this.currentTooltip)
         {
            this.currentTooltip.hide();
            this.removeCurrentTooltip();
         }
      }
      
      protected function calculateTooltipPosition() : void
      {
         var x:Number;
         var y:Number;
         var maxX:Number;
         var maxY:Number;
         var xtp:Number = NaN;
         var ytp:Number = NaN;
         var w:Number = NaN;
         var h:Number = NaN;
         var xs:Number = NaN;
         var ys:Number = NaN;
         var btn:Coreponent = null;
         var hit:MovieClip = null;
         var target:DisplayObject = this.currentTooltip.target;
         var lockMovement:Boolean = false;
         if(target)
         {
            xtp = target.mouseX;
            ytp = target.mouseY;
            w = target.width;
            h = target.height;
            xs = 0;
            ys = 0;
            try
            {
               btn = Coreponent(target);
               if(btn)
               {
                  hit = btn.getHit() as MovieClip;
                  if(hit)
                  {
                     xs = hit.x;
                     ys = hit.y;
                     h -= ys;
                     w -= xs;
                     xtp -= xs;
                     ytp -= ys;
                  }
               }
            }
            catch(error:Error)
            {
            }
            if(xtp < 0 || xtp > w)
            {
               lockMovement = true;
            }
            if(ytp < 0 || ytp > h)
            {
               lockMovement = true;
            }
         }
         x = this.layer.mouseX + MOUSE_POINT_GAP_X;
         y = this.layer.mouseY + MOUSE_POINT_GAP_Y;
         maxX = this.layer.width - this.currentTooltip.width - TOOLTIP_GAP_X;
         maxY = this.layer.height - this.currentTooltip.height - this.TOOLTIP_GAP_Y;
         if(!lockMovement)
         {
            if(Settings.SCALE_TEST)
            {
               this.currentTooltip.x = (x > maxX ? maxX : x) * 1.1;
               this.currentTooltip.y = (y > maxY ? maxY : y) * 1.1;
            }
            else
            {
               this.currentTooltip.x = x > maxX ? maxX : x;
               this.currentTooltip.y = y > maxY ? maxY : y;
            }
            this.currentTooltip.draw();
         }
      }
      
      public function enable() : void
      {
         this.isEnable = true;
      }
      
      public function disable() : void
      {
         this.isEnable = false;
      }
   }
}

