package org.flintparticles.common.counters
{
   import org.flintparticles.common.emitters.Emitter;
   
   public class SineCounter implements Counter
   {
      private var _emitted:Number;
      
      private var _rateMin:Number;
      
      private var _rateMax:Number;
      
      private var _period:Number;
      
      private var _running:Boolean;
      
      private var _timePassed:Number;
      
      private var _factor:Number;
      
      private var _scale:Number;
      
      public function SineCounter(param1:Number = 1, param2:Number = 0, param3:Number = 0)
      {
         super();
         this._running = false;
         this._period = param1;
         this._rateMin = param3;
         this._rateMax = param2;
         this._factor = 2 * Math.PI / param1;
         this._scale = 0.5 * (this._rateMax - this._rateMin);
      }
      
      public function stop() : void
      {
         this._running = false;
      }
      
      public function resume() : void
      {
         this._running = true;
         this._emitted = 0;
      }
      
      public function get rateMin() : Number
      {
         return this._rateMin;
      }
      
      public function set rateMin(param1:Number) : void
      {
         this._rateMin = param1;
         this._scale = 0.5 * (this._rateMax - this._rateMin);
      }
      
      public function get rateMax() : Number
      {
         return this._rateMax;
      }
      
      public function set rateMax(param1:Number) : void
      {
         this._rateMax = param1;
         this._scale = 0.5 * (this._rateMax - this._rateMin);
      }
      
      public function get period() : Number
      {
         return this._period;
      }
      
      public function set period(param1:Number) : void
      {
         this._period = param1;
         this._factor = 2 * Math.PI / this._period;
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         this._running = true;
         this._timePassed = 0;
         this._emitted = 0;
         return 0;
      }
      
      public function updateEmitter(param1:Emitter, param2:Number) : uint
      {
         if(!this._running)
         {
            return 0;
         }
         this._timePassed += param2;
         var _loc3_:uint = Math.floor(this._rateMax * this._timePassed + this._scale * (1 - Math.cos(this._timePassed * this._factor)) / this._factor);
         var _loc4_:uint = _loc3_ - this._emitted;
         this._emitted = _loc3_;
         return _loc4_;
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

