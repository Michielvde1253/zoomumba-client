package org.flintparticles.common.counters
{
   import org.flintparticles.common.emitters.Emitter;
   
   public class Steady implements Counter
   {
      private var _timeToNext:Number;
      
      private var _rate:Number;
      
      private var _rateInv:Number;
      
      private var _running:Boolean;
      
      public function Steady(param1:Number = 0)
      {
         super();
         this._running = false;
         this.rate = param1;
      }
      
      public function stop() : void
      {
         this._running = false;
      }
      
      public function resume() : void
      {
         this._running = true;
      }
      
      public function get rate() : Number
      {
         return this._rate;
      }
      
      public function set rate(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(!param1 || param1 < 0)
         {
            param1 = 0;
         }
         if(this._rate != param1)
         {
            if(Boolean(this._rate) && Boolean(param1))
            {
               _loc2_ = this._rateInv - this._timeToNext;
               this._rate = param1;
               this._rateInv = !!param1 ? 1 / param1 : Number.MAX_VALUE;
               this._timeToNext = Math.max(this._rateInv - _loc2_,0);
            }
            else
            {
               this._rate = param1;
               this._rateInv = !!param1 ? 1 / param1 : Number.MAX_VALUE;
               this._timeToNext = this._rateInv;
            }
         }
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         this._running = true;
         this._timeToNext = this._rateInv;
         return 0;
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
            this._timeToNext += this._rateInv;
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

