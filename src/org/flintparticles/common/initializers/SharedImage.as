package org.flintparticles.common.initializers
{
   import flash.display.DisplayObject;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class SharedImage extends InitializerBase
   {
      private var _image:DisplayObject;
      
      public function SharedImage(param1:DisplayObject = null)
      {
         super();
         this._image = param1;
      }
      
      public function get image() : DisplayObject
      {
         return this._image;
      }
      
      public function set image(param1:DisplayObject) : void
      {
         this._image = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.image = this._image;
      }
   }
}

