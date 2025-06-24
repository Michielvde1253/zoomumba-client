package com.bigpoint.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BmpUtil
   {
      private var _bdMatrix:Matrix = new Matrix(1,0,0,1);
      
      public function BmpUtil()
      {
         super();
      }
      
      public function getFirstNonTransparentPixelFloodFill(param1:BitmapData, param2:uint = 4294967040) : Point
      {
         var _loc3_:BitmapData = null;
         var _loc6_:Rectangle = null;
         var _loc4_:Matrix = new Matrix();
         var _loc5_:int = 0;
         while(_loc5_ < param1.height)
         {
            _loc4_.ty = -_loc5_;
            _loc3_ = new BitmapData(param1.width,1,true,0);
            _loc3_.draw(param1,_loc4_);
            _loc3_.floodFill(0,0,param2);
            _loc6_ = _loc3_.getColorBoundsRect(4294967295,param2);
            if(_loc6_.width != param1.width)
            {
               return new Point(_loc5_,_loc6_.width);
            }
            _loc3_.dispose();
            _loc5_++;
         }
         return null;
      }
      
      public function toBitmapData(param1:DisplayObject, param2:Boolean = true) : BitmapData
      {
         var _loc3_:Rectangle = param1.getBounds(param1);
         var _loc4_:BitmapData = new BitmapData(int(_loc3_.width + 0.5),int(_loc3_.height + 0.5),param2,0);
         this._bdMatrix.tx = -_loc3_.x;
         this._bdMatrix.ty = -_loc3_.y;
         _loc4_.draw(param1,this._bdMatrix);
         return _loc4_;
      }
      
      public function toBitmap(param1:DisplayObject) : Bitmap
      {
         return new Bitmap(this.toBitmapData(param1));
      }
   }
}

