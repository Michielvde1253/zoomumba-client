package com.bigpoint.utils
{
   import flash.geom.Point;
   
   public class AngleUtils
   {
      public function AngleUtils()
      {
         super();
      }
      
      public static function getCirclePosition(param1:int, param2:Number, param3:Number, param4:Number) : Point
      {
         var _loc5_:Number = getRadianRotation(param1,param2,param4);
         return new Point(Math.sin(_loc5_) * param3,-Math.cos(_loc5_) * param3);
      }
      
      private static function getRadianRotation(param1:int, param2:Number, param3:Number) : Number
      {
         return param2 + param3 * param1;
      }
      
      public static function getDegreeRotation(param1:int, param2:Number, param3:Number) : Number
      {
         return getRadianRotation(param1,param2,param3) * (180 / Math.PI);
      }
   }
}

