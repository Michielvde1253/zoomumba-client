package org.flintparticles.common.counters
{
   import org.flintparticles.common.emitters.Emitter;
   
   public class Blast implements Counter
   {
      private var _startCount:uint;
      
      private var _done:Boolean = false;
      
      public function Blast(param1:uint = 0)
      {
         super();
         this._startCount = param1;
      }
      
      public function get startCount() : Number
      {
         return this._startCount;
      }
      
      public function set startCount(param1:Number) : void
      {
         this._startCount = param1;
      }
      
      public function stop() : void
      {
      }
      
      public function resume() : void
      {
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         this._done = true;
         param1.dispatchCounterComplete();
         return this._startCount;
      }
      
      public function updateEmitter(param1:Emitter, param2:Number) : uint
      {
         return 0;
      }
      
      public function get complete() : Boolean
      {
         return this._done;
      }
      
      public function get running() : Boolean
      {
         return false;
      }
   }
}

