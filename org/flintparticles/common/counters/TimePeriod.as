package org.flintparticles.common.counters
{
   import org.flintparticles.common.easing.Linear;
   import org.flintparticles.common.emitters.Emitter;
   
   public class TimePeriod implements Counter
   {
      private var _particles:uint;
      
      private var _duration:Number;
      
      private var _particlesPassed:uint;
      
      private var _timePassed:Number;
      
      private var _easing:Function;
      
      private var _running:Boolean = false;
      
      public function TimePeriod(param1:uint = 0, param2:Number = 0, param3:Function = null)
      {
         super();
         this._particles = param1;
         this._duration = param2;
         if(param3 == null)
         {
            this._easing = Linear.easeNone;
         }
         else
         {
            this._easing = param3;
         }
      }
      
      public function get numParticles() : uint
      {
         return this._particles;
      }
      
      public function set numParticles(param1:uint) : void
      {
         this._particles = param1;
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
      
      public function set duration(param1:Number) : void
      {
         this._duration = param1;
      }
      
      public function get easing() : Function
      {
         return this._easing;
      }
      
      public function set easing(param1:Function) : void
      {
         this._easing = param1;
      }
      
      public function startEmitter(param1:Emitter) : uint
      {
         this._running = true;
         this._particlesPassed = 0;
         this._timePassed = 0;
         return 0;
      }
      
      public function updateEmitter(param1:Emitter, param2:Number) : uint
      {
         var _loc4_:uint = 0;
         if(!this._running || this._timePassed >= this._duration)
         {
            return 0;
         }
         this._timePassed += param2;
         if(this._timePassed >= this._duration)
         {
            param1.dispatchCounterComplete();
            _loc4_ = uint(this._particles - this._particlesPassed);
            this._particlesPassed = this._particles;
            return _loc4_;
         }
         var _loc3_:uint = this._particlesPassed;
         this._particlesPassed = Math.round(this._easing(this._timePassed,0,this._particles,this._duration));
         return this._particlesPassed - _loc3_;
      }
      
      public function stop() : void
      {
         this._running = false;
      }
      
      public function resume() : void
      {
         this._running = true;
      }
      
      public function get complete() : Boolean
      {
         return this._particlesPassed == this._particles;
      }
      
      public function get running() : Boolean
      {
         return this._running && this._timePassed < this._duration;
      }
   }
}

