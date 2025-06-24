package org.flintparticles.common.initializers
{
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.ParticleEvent;
   import org.flintparticles.common.particles.Particle;
   
   public class MouseEventHandlers extends InitializerBase
   {
      private var _overHandler:Function;
      
      private var _outHandler:Function;
      
      private var _upHandler:Function;
      
      private var _downHandler:Function;
      
      private var _clickHandler:Function;
      
      public function MouseEventHandlers()
      {
         super();
      }
      
      public function get overHandler() : Function
      {
         return this._overHandler;
      }
      
      public function set overHandler(param1:Function) : void
      {
         this._overHandler = param1;
      }
      
      public function get outHandler() : Function
      {
         return this._outHandler;
      }
      
      public function set outHandler(param1:Function) : void
      {
         this._outHandler = param1;
      }
      
      public function get upHandler() : Function
      {
         return this._upHandler;
      }
      
      public function set upHandler(param1:Function) : void
      {
         this._upHandler = param1;
      }
      
      public function get downHandler() : Function
      {
         return this._downHandler;
      }
      
      public function set downHandler(param1:Function) : void
      {
         this._downHandler = param1;
      }
      
      public function get clickHandler() : Function
      {
         return this._clickHandler;
      }
      
      public function set clickHandler(param1:Function) : void
      {
         this._clickHandler = param1;
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         param1.addEventListener(ParticleEvent.PARTICLE_DEAD,this.removeListeners,false,0,true);
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         param1.removeEventListener(ParticleEvent.PARTICLE_DEAD,this.removeListeners);
      }
      
      private function removeListeners(param1:ParticleEvent) : void
      {
         var _loc2_:IEventDispatcher = null;
         if(param1.particle.image is IEventDispatcher)
         {
            _loc2_ = IEventDispatcher(param1.particle.image);
            if(this._overHandler != null)
            {
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this._overHandler);
            }
            if(this._outHandler != null)
            {
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this._outHandler);
            }
            if(this._upHandler != null)
            {
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this._upHandler);
            }
            if(this._downHandler != null)
            {
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this._downHandler);
            }
            if(this._clickHandler != null)
            {
               _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this._clickHandler);
            }
         }
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:IEventDispatcher = null;
         if(param2.image is IEventDispatcher)
         {
            _loc3_ = IEventDispatcher(param2.image);
            if(this._overHandler != null)
            {
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._overHandler,false,0,true);
            }
            if(this._outHandler != null)
            {
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._outHandler,false,0,true);
            }
            if(this._upHandler != null)
            {
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._upHandler,false,0,true);
            }
            if(this._downHandler != null)
            {
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._downHandler,false,0,true);
            }
            if(this._clickHandler != null)
            {
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._clickHandler,false,0,true);
            }
         }
      }
   }
}

