package fr.kapit.skin.utils
{
   import flash.filters.BitmapFilterQuality;
   import flash.filters.DropShadowFilter;
   
   public class FilterUtils
   {
      public function FilterUtils()
      {
         super();
      }
      
      public static function getBoxShadow() : Array
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.distance = 1;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.alpha = 0.4;
         _loc1_.blurX = 2;
         _loc1_.blurY = 2;
         _loc1_.strength = 1;
         _loc1_.quality = BitmapFilterQuality.HIGH;
         return [_loc1_];
      }
   }
}

