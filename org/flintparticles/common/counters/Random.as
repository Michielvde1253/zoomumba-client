package org.flintparticles.common.counters
{
   import org.flintparticles.common.emitters.Emitter;
   
   public class Random implements Counter
   {
      private var _timeToNext:Number;
      
      private var _minRate:Number;
      
      private var _maxRate:Number;
      
      private var _running:Boolean;
      
      public function Random(param1:Number = 0, param2:Number = 0)
      {
         super();
         this._running = false;
         this._minRate = param1;
         this._maxRate = param2;
      }
      
      public function stop() : void
      {
         this._running = false;
      }
      
      public function resume() : void
      {
         this._running = true;
      }
      
      public function get minRate() : Number
      {
         return this._minRate;
      }
      
      public function set minRate(param1:Number) : void
      {
         this._minRate = param1;
      }
      
      public function get maxRate() : Number
      {
         return this._maxRate;
      }
      
      public function set maxRate(param1:Number) : void
      {
         this._maxRate = param1;
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         this._running = true;
         this._timeToNext = this.newTimeToNext();
         return 0;
      }
      
      private function newTimeToNext() : Number
      {
         var _loc1_:Number = Math.random() * (this._maxRate - this._minRate) + this._maxRate;
         return 1 / _loc1_;
      }
      
      public function updateEmitter(param1:Emitter, param2:Number) : uint
      {
         if(!this._running)
         {
            return 0;
         }
         var _loc3_:uint = 0;
         this._timeToNext -= param2;
         while(this._timeToNext <= 0)
         {
            _loc3_++;
            this._timeToNext += this.newTimeToNext();
         }
         return _loc3_;
      }
      
      public function get complete() : Boolean
      {
         return false;
      }
      
      public function get running() : Boolean
      {
         return this._running;
      }
   }
}

