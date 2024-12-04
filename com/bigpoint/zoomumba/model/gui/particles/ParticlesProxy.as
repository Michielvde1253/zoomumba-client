package com.bigpoint.zoomumba.model.gui.particles
{
   import org.flintparticles.twoD.emitters.Emitter2D;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ParticlesProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "ParticlesProxy";
      
      public var particlesRunning:Boolean;
      
      public var particlesRunningSort:String;
      
      private var runningParticles:Vector.<String>;
      
      private var runningEmitters:Vector.<Emitter2D>;
      
      public function ParticlesProxy()
      {
         super(NAME);
         this.runningParticles = new Vector.<String>();
         this.runningEmitters = new Vector.<Emitter2D>();
      }
      
      public function enabled(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         if(_loc2_ >= this.runningParticles.length)
         {
            return false;
         }
         if(this.runningParticles[_loc2_] == param1)
         {
            return true;
         }
         return false;
      }
      
      public function enable(param1:String, param2:Emitter2D) : void
      {
         this.runningParticles.push(param1);
         this.runningEmitters.push(param2);
         this.particlesRunningSort = param1;
         this.particlesRunning = true;
      }
      
      public function get isParticlesRunning() : Boolean
      {
         return this.particlesRunning;
      }
      
      public function setParticlesRunning() : void
      {
         this.particlesRunning = false;
      }
      
      public function get whichParticlesRunning() : String
      {
         return this.particlesRunningSort;
      }
      
      public function getEmitterByType(param1:String) : Emitter2D
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.runningParticles.length)
         {
            if(this.runningParticles[_loc2_] == param1)
            {
               return this.runningEmitters[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getEmitterByPosition(param1:int) : Emitter2D
      {
         return this.runningEmitters[param1];
      }
      
      public function removeAllEmitters() : void
      {
         this.runningParticles = new Vector.<String>();
         this.runningEmitters = new Vector.<Emitter2D>();
      }
      
      public function removeEmitter(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.runningParticles.length)
         {
            if(this.runningParticles[_loc2_] == param1)
            {
               this.runningParticles.splice(_loc2_,1);
               this.runningEmitters.splice(_loc2_,1);
               this.particlesRunning = false;
               this.particlesRunningSort = "null";
            }
            _loc2_++;
         }
      }
      
      public function get emitterCount() : int
      {
         return this.runningEmitters.length;
      }
   }
}

