package com.bigpoint.utils
{
   import flash.display.DisplayObject;
   import flash.filters.ColorMatrixFilter;
   
   public class ColorHelper
   {
      public static const GRAYSCALE:Vector.<Number> = Vector.<Number>([0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0,0,0,1,0]);
      
      public static const GRAYSCALE_LIGHT:Vector.<Number> = Vector.<Number>([0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0,0,0,1,0]);
      
      public static const SEPIA:Vector.<Number> = Vector.<Number>([0.3930000066757202,0.7689999938011169,0.1889999955892563,0,0,0.3490000069141388,0.6859999895095825,0.1679999977350235,0,0,0.2720000147819519,0.5339999794960022,0.1309999972581863,0,0,0,0,0,1,0,0,0,0,0,1]);
      
      public function ColorHelper()
      {
         super();
      }
      
      public static function applyColor(param1:DisplayObject, param2:Vector.<Number>) : void
      {
         var _loc3_:Array = [];
         _loc3_ = _loc3_.concat([param2[0],param2[1],param2[2],param2[3],param2[4]]);
         _loc3_ = _loc3_.concat([param2[5],param2[6],param2[7],param2[8],param2[9]]);
         _loc3_ = _loc3_.concat([param2[10],param2[11],param2[12],param2[13],param2[14]]);
         _loc3_ = _loc3_.concat([param2[15],param2[16],param2[17],param2[18],param2[19]]);
         param1.filters = [new ColorMatrixFilter(_loc3_)];
      }
      
      public static function removeColor(param1:DisplayObject) : void
      {
         param1.filters = [new ColorMatrixFilter()];
      }
   }
}

