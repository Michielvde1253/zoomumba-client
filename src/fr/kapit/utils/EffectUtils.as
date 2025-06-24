package fr.kapit.utils
{
   import flash.display.Stage;
   import mx.effects.Glow;
   
   public class EffectUtils
   {
      public function EffectUtils()
      {
         super();
      }
      
      public static function glow(param1:Object) : void
      {
         if(!param1 || param1 is Stage)
         {
            return;
         }
         var _loc2_:Glow = new Glow(param1);
         _loc2_.color = 16758568;
         _loc2_.duration = 1250;
         _loc2_.strength = 7;
         _loc2_.play();
      }
   }
}

