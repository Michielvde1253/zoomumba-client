package org.flintparticles.common.easing
{
   public class Circular
   {
      public function Circular()
      {
         super();
      }
      
      public static function easeIn(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return -param3 * (Math.sqrt(1 - (param1 = param1 / param4) * param1) - 1) + param2;
      }
      
      public static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 * Math.sqrt(1 - (param1 = param1 / param4 - 1) * param1) + param2;
      }
      
      public static function easeInOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = param1 / (param4 * 0.5);
         if(param1 < 1)
         {
            return -param3 * 0.5 * (Math.sqrt(1 - param1 * param1) - 1) + param2;
         }
         return param3 * 0.5 * (Math.sqrt(1 - (param1 = param1 - 2) * param1) + 1) + param2;
      }
   }
}
