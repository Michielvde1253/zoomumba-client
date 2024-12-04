package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class InitializerGroup extends InitializerBase
   {
      private var _initializers:Vector.<Initializer>;
      
      private var _emitter:Emitter;
      
      public function InitializerGroup(... rest)
      {
         var _loc2_:Initializer = null;
         super();
         this._initializers = new Vector.<Initializer>();
         for each(_loc2_ in rest)
         {
            this.addInitializer(_loc2_);
         }
      }
      
      public function get initializers() : Vector.<Initializer>
      {
         return this._initializers;
      }
      
      public function set initializers(param1:Vector.<Initializer>) : void
      {
         var _loc2_:Initializer = null;
         if(this._emitter)
         {
            for each(_loc2_ in this._initializers)
            {
               _loc2_.removedFromEmitter(this._emitter);
            }
         }
         this._initializers = param1.slice();
         this._initializers.sort(this.prioritySort);
         if(this._emitter)
         {
            for each(_loc2_ in this._initializers)
            {
               _loc2_.addedToEmitter(this._emitter);
            }
         }
      }
      
      public function addInitializer(param1:Initializer) : void
      {
         var _loc2_:uint = this._initializers.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._initializers[_loc3_].priority < param1.priority)
            {
               break;
            }
            _loc3_++;
         }
         this._initializers.splice(_loc3_,0,param1);
         if(this._emitter)
         {
            param1.addedToEmitter(this._emitter);
         }
      }
      
      public function removeInitializer(param1:Initializer) : void
      {
         var _loc2_:int = int(this._initializers.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._initializers.splice(_loc2_,1);
            if(this._emitter)
            {
               param1.removedFromEmitter(this._emitter);
            }
         }
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         this._emitter = param1;
         var _loc2_:uint = this._initializers.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this._initializers[_loc3_].addedToEmitter(param1);
            _loc3_++;
         }
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         var _loc2_:uint = this._initializers.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this._initializers[_loc3_].removedFromEmitter(param1);
            _loc3_++;
         }
         this._emitter = null;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:uint = this._initializers.length;
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            this._initializers[_loc4_].initialize(param1,param2);
            _loc4_++;
         }
      }
      
      private function prioritySort(param1:Initializer, param2:Initializer) : Number
      {
         return param1.priority - param2.priority;
      }
   }
}

