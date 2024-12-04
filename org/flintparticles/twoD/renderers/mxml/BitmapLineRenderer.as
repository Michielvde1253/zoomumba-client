package org.flintparticles.twoD.renderers.mxml
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.EmitterEvent;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class BitmapLineRenderer extends BitmapRenderer
   {
      private var _shape:Shape;
      
      public function BitmapLineRenderer(param1:Rectangle = null, param2:Boolean = false)
      {
         super(param1,param2);
         _clearBetweenFrames = false;
         this._shape = new Shape();
      }
      
      override protected function drawParticle(param1:Particle2D) : void
      {
         this._shape.graphics.clear();
         this._shape.graphics.lineStyle(param1.scale,param1.color & 0xFFFFFF,param1.color >>> 24);
         this._shape.graphics.moveTo(param1.previousX,param1.previousY);
         this._shape.graphics.lineTo(param1.x,param1.y);
         _bitmapData.draw(this._shape);
      }
      
      override protected function emitterUpdated(param1:EmitterEvent) : void
      {
         renderParticles(Emitter(param1.target).particlesArray);
      }
      
      override protected function updateParticles(param1:Event) : void
      {
      }
   }
}

