package org.flintparticles.twoD.actions
{
   import flash.display.DisplayObject;
   
   public class TurnAwayFromMouse extends TurnTowardsMouse
   {
      public function TurnAwayFromMouse(param1:Number = 0, param2:DisplayObject = null)
      {
         super(-param1,param2);
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

