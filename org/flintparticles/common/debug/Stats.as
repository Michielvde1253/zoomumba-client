package org.flintparticles.common.debug
{
   import flash.events.Event;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   
   public class Stats extends TextField
   {
      private const FACTOR:Number = 9.5367431640625e-7;
      
      private var timer:uint;
      
      private var fps:uint;
      
      private var next:uint;
      
      private var mem:Number;
      
      private var max:Number;
      
      public function Stats(param1:uint = 16777215, param2:uint = 0)
      {
         super();
         this.max = 0;
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.color = param1;
         _loc3_.font = "_sans";
         _loc3_.size = 9;
         _loc3_.leading = -1;
         backgroundColor = param2;
         background = true;
         defaultTextFormat = _loc3_;
         multiline = true;
         selectable = false;
         mouseEnabled = false;
         autoSize = TextFieldAutoSize.LEFT;
         addEventListener(Event.ADDED_TO_STAGE,this.start);
         addEventListener(Event.REMOVED_FROM_STAGE,this.stop);
      }
      
      private function start(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.update);
         text = "";
         this.next = this.timer + 1000;
      }
      
      private function stop(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function update(param1:Event) : void
      {
         this.timer = getTimer();
         if(this.timer > this.next)
         {
            this.next = this.timer + 1000;
            this.mem = Number((System.totalMemory * this.FACTOR).toFixed(3));
            if(this.max < this.mem)
            {
               this.max = this.mem;
            }
            text = "FPS: " + this.fps + " / " + stage.frameRate + "\nMEMORY: " + this.mem + "\nMAX MEM: " + this.max + "\nPARTICLES: " + ParticleFactoryStats.numParticles;
            this.fps = 0;
         }
         ++this.fps;
      }
   }
}

