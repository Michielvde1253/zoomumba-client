package org.flintparticles.twoD.renderers
{
   import flash.display.DisplayObject;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.renderers.SpriteRendererBase;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class DisplayObjectRenderer extends SpriteRendererBase
   {
      public function DisplayObjectRenderer()
      {
         super();
      }
      
      override protected function renderParticles(param1:Array) : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = Particle2D(param1[_loc5_]);
            _loc3_ = _loc2_.image;
            _loc3_.transform.colorTransform = _loc2_.colorTransform;
            _loc3_.transform.matrix = _loc2_.matrixTransform;
            _loc5_++;
         }
      }
      
      override protected function addParticle(param1:Particle) : void
      {
         super.addParticle(param1);
         var _loc2_:Particle2D = param1 as Particle2D;
         addChildAt(_loc2_.image,0);
         var _loc3_:DisplayObject = _loc2_.image;
         _loc3_.transform.colorTransform = _loc2_.colorTransform;
         _loc3_.transform.matrix = _loc2_.matrixTransform;
      }
      
      override protected function removeParticle(param1:Particle) : void
      {
         removeChild(param1.image);
         super.removeParticle(param1);
      }
   }
}

