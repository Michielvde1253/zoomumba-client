package org.flintparticles.twoD.activities
{
   import flash.display.DisplayObject;
   import org.flintparticles.common.activities.ActivityBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.twoD.emitters.Emitter2D;
   
   public class FollowMouse extends ActivityBase
   {
      private var _renderer:DisplayObject;
      
      public function FollowMouse(param1:DisplayObject = null)
      {
         super();
         this.renderer = param1;
      }
      
      public function get renderer() : DisplayObject
      {
         return this._renderer;
      }
      
      public function set renderer(param1:DisplayObject) : void
      {
         this._renderer = param1;
      }
      
      override public function update(param1:Emitter, param2:Number) : void
      {
         var _loc3_:Emitter2D = Emitter2D(param1);
         _loc3_.x = this._renderer.mouseX;
         _loc3_.y = this._renderer.mouseY;
      }
   }
}

