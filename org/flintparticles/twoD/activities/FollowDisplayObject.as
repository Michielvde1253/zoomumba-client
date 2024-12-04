package org.flintparticles.twoD.activities
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import org.flintparticles.common.activities.ActivityBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.utils.DisplayObjectUtils;
   import org.flintparticles.twoD.emitters.Emitter2D;
   
   public class FollowDisplayObject extends ActivityBase
   {
      private var _renderer:DisplayObject;
      
      private var _displayObject:DisplayObject;
      
      public function FollowDisplayObject(param1:DisplayObject = null, param2:DisplayObject = null)
      {
         super();
         this.displayObject = param1;
         this.renderer = param2;
      }
      
      public function get renderer() : DisplayObject
      {
         return this._renderer;
      }
      
      public function set renderer(param1:DisplayObject) : void
      {
         this._renderer = param1;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function set displayObject(param1:DisplayObject) : void
      {
         this._displayObject = param1;
      }
      
      override public function update(param1:Emitter, param2:Number) : void
      {
         var _loc3_:Emitter2D = Emitter2D(param1);
         var _loc4_:Point = new Point(0,0);
         _loc4_ = this._displayObject.localToGlobal(_loc4_);
         _loc4_ = this._renderer.globalToLocal(_loc4_);
         var _loc5_:Number = 0;
         _loc5_ = DisplayObjectUtils.localToGlobalRotation(this._displayObject,_loc5_);
         _loc5_ = DisplayObjectUtils.globalToLocalRotation(this._renderer,_loc5_);
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.rotation = _loc5_;
      }
   }
}

