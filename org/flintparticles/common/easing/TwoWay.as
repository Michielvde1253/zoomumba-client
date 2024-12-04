package org.flintparticles.common.easing
{
   public class TwoWay
   {
      public function TwoWay()
      {
         super();
      }
      
      public static function linear(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 2 * param1 / param4;
         if(param1 <= 1)
         {
            return (1 - param1) * param3 + param2;
         }
         return (param1 - 1) * param3 + param2;
      }
      
      public static function circular(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 1 - 2 * param1 / param4;
         return (1 - Math.sqrt(1 - param1 * param1)) * param3 + param2;
      }
      
      public static function sine(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - Math.sin(Math.PI * param1 / param4)) * param3 + param2;
      }
      
      public static function quadratic(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 1 - 2 * param1 / param4;
         return param1 * param1 * param3 + param2;
      }
      
      public static function cubic(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 1 - 2 * param1 / param4;
         if(param1 < 0)
         {
            param1 = -param1;
         }
         return param1 * param1 * param1 * param3 + param2;
      }
      
      public static function quartic(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 1 - 2 * param1 / param4;
         return param1 * param1 * param1 * param1 * param3 + param2;
      }
      
      public static function quintic(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         param1 = 1 - 2 * param1 / param4;
         if(param1 < 0)
         {
            param1 = -param1;
         }
         return param1 * param1 * param1 * param1 * param1 * param3 + param2;
      }
   }
}

