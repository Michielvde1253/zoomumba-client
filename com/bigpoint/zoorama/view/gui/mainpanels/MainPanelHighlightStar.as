package com.bigpoint.zoorama.view.gui.mainpanels
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainPanelHighlightStar extends Sprite
   {
      public static var ANIMATION_FINISHED:String = "finished";
      
      public var currentTween:TweenLite;
      
      public var isAnimated:Boolean = false;
      
      public var delayTimer:Timer;
      
      public var xMax:int = 10;
      
      public var yMax:int = 10;
      
      public function MainPanelHighlightStar()
      {
         super();
         this.delayTimer = new Timer(100000);
         this.delayTimer.repeatCount = 1;
         this.delayTimer.addEventListener(TimerEvent.TIMER,this.handleTimerComplete);
         var _loc1_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_MAIN_MONEY_HIGHLIGHT);
         addChild(_loc1_);
      }
      
      public function init(param1:int = 0, param2:int = 0) : void
      {
         if(param1)
         {
            this.xMax = param1;
         }
         if(param2)
         {
            this.yMax = param2;
         }
         alpha = 0;
      }
      
      public function start(param1:Number = 0) : void
      {
         if(this.isAnimated != true)
         {
            if(!param1)
            {
               param1 = Math.random() * 5000;
            }
            this.x = Math.random() * this.xMax;
            this.y = Math.random() * this.yMax;
            this.delayTimer.delay = param1;
            this.delayTimer.start();
            this.isAnimated = true;
         }
      }
      
      public function stop() : void
      {
         this.isAnimated = false;
         this.delayTimer.stop();
         if(this.currentTween)
         {
            this.currentTween.kill();
         }
         this.init();
      }
      
      private function handleTimerComplete(param1:TimerEvent) : void
      {
         this.startAnimation();
      }
      
      private function startAnimation() : void
      {
         this.currentTween = TweenLite.to(this,0.6,{
            "alpha":1,
            "onComplete":this.fadeOutAnimation
         });
      }
      
      private function fadeOutAnimation() : void
      {
         this.currentTween = TweenLite.to(this,0.6,{
            "alpha":0,
            "onComplete":this.animationFinished
         });
      }
      
      private function animationFinished() : void
      {
         dispatchEvent(new Event(ANIMATION_FINISHED));
         if(this.isAnimated)
         {
            this.isAnimated = false;
            this.init();
            this.start();
         }
      }
   }
}

