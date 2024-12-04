package org.flintparticles.common.counters
{
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import org.flintparticles.common.emitters.Emitter;
   
   public class KeyDownCounter implements Counter
   {
      private var _counter:Counter;
      
      private var _keyCode:uint;
      
      private var _isDown:Boolean;
      
      private var _stop:Boolean;
      
      private var _stage:Stage;
      
      public function KeyDownCounter(param1:Counter = null, param2:uint = 0, param3:Stage = null)
      {
         super();
         this._stop = false;
         this._counter = param1;
         this._keyCode = param2;
         this._isDown = false;
         this._stage = param3;
         this.createListeners();
      }
      
      private function createListeners() : void
      {
         if(this.stage)
         {
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownListener,false,0,true);
            this.stage.addEventListener(KeyboardEvent.KEY_UP,this.keyUpListener,false,0,true);
         }
      }
      
      private function keyDownListener(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._keyCode)
         {
            this._isDown = true;
         }
      }
      
      private function keyUpListener(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._keyCode)
         {
            this._isDown = false;
         }
      }
      
      public function get counter() : Counter
      {
         return this._counter;
      }
      
      public function set counter(param1:Counter) : void
      {
         this._counter = param1;
      }
      
      public function get keyCode() : uint
      {
         return this._keyCode;
      }
      
      public function set keyCode(param1:uint) : void
      {
         this._keyCode = param1;
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function set stage(param1:Stage) : void
      {
         this._stage = param1;
         this.createListeners();
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         if(this._isDown && !this._stop)
         {
            return this._counter.startEmitter(param1);
         }
         this._counter.startEmitter(param1);
         return 0;
      }
      
      public function updateEmitter(param1:Emitter, param2:Number) : uint
      {
         if(this._isDown && !this._stop)
         {
            return this._counter.updateEmitter(param1,param2);
         }
         return 0;
      }
      
      public function stop() : void
      {
         this._stop = true;
      }
      
      public function resume() : void
      {
         this._stop = false;
      }
      
      public function get complete() : Boolean
      {
         return this._counter.complete;
      }
      
      public function get running() : Boolean
      {
         return this._counter.running;
      }
   }
}

