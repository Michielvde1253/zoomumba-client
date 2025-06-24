package org.flintparticles.twoD.actions
{
   public class AntiGravity extends GravityWell
   {
      public function AntiGravity(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 1)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function get power() : Number
      {
         return -super.power;
      }
      
      override public function set power(param1:Number) : void
      {
         super.power = -param1;
      }
   }
}

