package org.flintparticles.common.utils
{
   import flash.display.DisplayObject;
   
   public class DisplayObjectUtils
   {
      public function DisplayObjectUtils()
      {
         super();
      }
      
      public static function localToGlobalRotation(param1:DisplayObject, param2:Number) : Number
      {
         var _loc3_:Number = param2 + param1.rotation;
         var _loc4_:DisplayObject = param1.parent;
         while(Boolean(_loc4_) && _loc4_ != param1.stage)
         {
            _loc3_ += _loc4_.rotation;
            _loc4_ = _loc4_.parent;
         }
         return _loc3_;
      }
      
      public static function globalToLocalRotation(param1:DisplayObject, param2:Number) : Number
      {
         var _loc3_:Number = param2 - param1.rotation;
         var _loc4_:DisplayObject = param1.parent;
         while(Boolean(_loc4_) && _loc4_ != param1.stage)
         {
            _loc3_ -= _loc4_.rotation;
            _loc4_ = _loc4_.parent;
         }
         return _loc3_;
      }
   }
}

