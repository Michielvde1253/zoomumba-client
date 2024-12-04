package com.bigpoint.utils
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class DebugView extends Sprite
   {
      private var ticks:int;
      
      private var FPS:TextField;
      
      private var format:TextFormat = new TextFormat();
      
      private var t1:Timer = new Timer(1000);
      
      private var camPos:TextField;
      
      private var socketByteCount:int = 0;
      
      public function DebugView(param1:int = 0, param2:int = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.createText();
         this.t1.addEventListener(TimerEvent.TIMER,this.updateFPS);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.t1.start();
      }
      
      private function createText() : void
      {
         this.format.font = "Verdana";
         this.format.size = 9;
         this.FPS = new TextField();
         this.FPS.defaultTextFormat = this.format;
         this.FPS.autoSize = TextFieldAutoSize.LEFT;
         this.FPS.textColor = 16777215;
         this.FPS.background = true;
         this.FPS.backgroundColor = 6710886;
         this.FPS.antiAliasType = "advanced";
         this.FPS.selectable = false;
         this.FPS.text = "FPS: ";
         this.camPos = new TextField();
         this.camPos.defaultTextFormat = this.format;
         this.camPos.autoSize = TextFieldAutoSize.LEFT;
         this.camPos.textColor = 16777215;
         this.camPos.background = true;
         this.camPos.backgroundColor = 6710886;
         this.camPos.antiAliasType = "advanced";
         this.camPos.selectable = false;
         this.camPos.text = "CamPos: ";
         this.camPos.y = -15;
         addChild(this.FPS);
         addChild(this.camPos);
      }
      
      private function updateFPS(param1:TimerEvent) : void
      {
         var _loc2_:* = Number(System.totalMemory / 1024 / 1024).toFixed(2) + "Mb";
         this.FPS.text = "FPS: " + this.ticks + " | MEM: " + _loc2_ + (!!stage.focus ? " | FOCUS: " + stage.focus : "");
         this.socketByteCount = 0;
         this.ticks = 0;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         ++this.ticks;
      }
   }
}

