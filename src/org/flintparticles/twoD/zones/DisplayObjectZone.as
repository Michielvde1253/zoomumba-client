package org.flintparticles.twoD.zones
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class DisplayObjectZone implements Zone2D
   {
      private var _displayObject:DisplayObject;
      
      private var _renderer:DisplayObject;
      
      private var _area:Number;
      
      public function DisplayObjectZone(param1:DisplayObject = null, param2:DisplayObject = null)
      {
         super();
         this._displayObject = param1;
         this._renderer = param2;
         this.calculateArea();
      }
      
      private function calculateArea() : void
      {
         var _loc5_:int = 0;
         if(!this._displayObject)
         {
            return;
         }
         var _loc1_:Rectangle = this._displayObject.getBounds(this._displayObject.stage);
         this._area = 0;
         var _loc2_:Number = _loc1_.right;
         var _loc3_:Number = _loc1_.bottom;
         var _loc4_:int = _loc1_.left;
         while(_loc4_ <= _loc2_)
         {
            _loc5_ = _loc1_.top;
            while(_loc5_ <= _loc3_)
            {
               if(this._displayObject.hitTestPoint(_loc4_,_loc5_,true))
               {
                  ++this._area;
               }
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function set displayObject(param1:DisplayObject) : void
      {
         this._displayObject = param1;
         this.calculateArea();
      }
      
      public function get renderer() : DisplayObject
      {
         return this._renderer;
      }
      
      public function set renderer(param1:DisplayObject) : void
      {
         this._renderer = param1;
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Point = new Point(param1,param2);
         _loc3_ = this._renderer.localToGlobal(_loc3_);
         return this._displayObject.hitTestPoint(_loc3_.x,_loc3_.y,true);
      }
      
      public function getLocation() : Point
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Rectangle = this._displayObject.getBounds(this._displayObject.root);
         do
         {
            _loc3_ = _loc1_.left + Math.random() * _loc1_.width;
            _loc4_ = _loc1_.top + Math.random() * _loc1_.height;
         }
         while(!this._displayObject.hitTestPoint(_loc3_,_loc4_,true));
         
         var _loc2_:Point = new Point(_loc3_,_loc4_);
         return this._renderer.globalToLocal(this.displayObject.root.localToGlobal(_loc2_));
      }
      
      public function getArea() : Number
      {
         return this._area;
      }
      
      public function collideParticle(param1:Particle2D, param2:Number = 1) : Boolean
      {
         if(this.contains(param1.x,param1.y) != this.contains(param1.previousX,param1.previousY))
         {
            param1.x = param1.previousX;
            param1.y = param1.previousY;
            param1.velX = -param2 * param1.velX;
            param1.velY = -param2 * param1.velY;
            return true;
         }
         return false;
      }
   }
}

