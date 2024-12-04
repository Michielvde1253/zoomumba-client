package org.flintparticles.common.renderers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.EmitterEvent;
   import org.flintparticles.common.events.ParticleEvent;
   import org.flintparticles.common.particles.Particle;
   
   public class RendererBase implements Renderer
   {
      protected var _emitters:Vector.<Emitter>;
      
      public function RendererBase()
      {
         super();
         this._emitters = new Vector.<Emitter>();
      }
      
      public function addEmitter(param1:Emitter) : void
      {
         var _loc2_:Particle = null;
         this._emitters.push(param1);
         param1.addEventListener(EmitterEvent.EMITTER_UPDATED,this.emitterUpdated,false,0,true);
         param1.addEventListener(ParticleEvent.PARTICLE_CREATED,this.particleAdded,false,0,true);
         param1.addEventListener(ParticleEvent.PARTICLE_ADDED,this.particleAdded,false,0,true);
         param1.addEventListener(ParticleEvent.PARTICLE_DEAD,this.particleRemoved,false,0,true);
         for each(_loc2_ in param1.particlesArray)
         {
            this.addParticle(_loc2_);
         }
      }
      
      public function removeEmitter(param1:Emitter) : void
      {
         var _loc3_:Particle = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._emitters.length)
         {
            if(this._emitters[_loc2_] == param1)
            {
               this._emitters.splice(_loc2_,1);
               param1.removeEventListener(EmitterEvent.EMITTER_UPDATED,this.emitterUpdated);
               param1.removeEventListener(ParticleEvent.PARTICLE_CREATED,this.particleAdded);
               param1.removeEventListener(ParticleEvent.PARTICLE_ADDED,this.particleAdded);
               param1.removeEventListener(ParticleEvent.PARTICLE_DEAD,this.particleRemoved);
               for each(_loc3_ in param1.particlesArray)
               {
                  this.removeParticle(_loc3_);
               }
               return;
            }
            _loc2_++;
         }
      }
      
      private function particleAdded(param1:ParticleEvent) : void
      {
         this.addParticle(param1.particle);
      }
      
      private function particleRemoved(param1:ParticleEvent) : void
      {
         this.removeParticle(param1.particle);
      }
      
      private function emitterUpdated(param1:EmitterEvent) : void
      {
         this.renderParticles(Emitter(param1.target).particlesArray);
      }
      
      protected function addParticle(param1:Particle) : void
      {
      }
      
      protected function removeParticle(param1:Particle) : void
      {
      }
      
      protected function renderParticles(param1:Array) : void
      {
      }
      
      public function get emitters() : Vector.<Emitter>
      {
         return this._emitters;
      }
      
      public function set emitters(param1:Vector.<Emitter>) : void
      {
         var _loc2_:Emitter = null;
         for each(_loc2_ in this._emitters)
         {
            this.removeEmitter(_loc2_);
         }
         for each(_loc2_ in param1)
         {
            this.addEmitter(_loc2_);
         }
      }
   }
}

