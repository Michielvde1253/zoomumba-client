package org.flintparticles.twoD.renderers
{
   import flash.events.Event;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.EmitterEvent;
   import org.flintparticles.common.renderers.SpriteRendererBase;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class VectorLineRenderer extends SpriteRendererBase
   {
      public function VectorLineRenderer()
      {
         super();
      }
      
      override protected function renderParticles(param1:Array) : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = Particle2D(param1[_loc4_]);
            graphics.lineStyle(_loc2_.scale,_loc2_.color & 0xFFFFFF,_loc2_.color >>> 24);
            graphics.moveTo(_loc2_.previousX,_loc2_.previousY);
            graphics.lineTo(_loc2_.x,_loc2_.y);
            _loc4_++;
         }
      }
      
      override protected function emitterUpdated(param1:EmitterEvent) : void
      {
         this.renderParticles(Emitter(param1.target).particlesArray);
      }
      
      override protected function updateParticles(param1:Event) : void
      {
      }
   }
}

