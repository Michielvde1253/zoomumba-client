package com.bigpoint.zoomumba
{
   import flash.display.Sprite;
   import flash.events.Event;
   import mx.events.FlexEvent;
   import mx.preloaders.DownloadProgressBar;
   
   public class ZooPreloader extends DownloadProgressBar
   {
      private var miniLoader:MiniLoaderSPR;
      
      public function ZooPreloader()
      {
         super();
         this.miniLoader = new MiniLoaderSPR();
         addChild(this.miniLoader);
      }
      
      override public function set preloader(param1:Sprite) : void
      {
         param1.addEventListener(FlexEvent.INIT_COMPLETE,this.onFlexInitComplete);
         this.centerPreloader();
      }
      
      private function centerPreloader() : void
      {
         x = stageWidth / 2;
         y = stageHeight / 2;
      }
      
      private function onFlexInitComplete(param1:FlexEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

