package utils
{
   import flash.display.DisplayObject;
   import flash.filters.ColorMatrixFilter;
   
   public class Color
   {
      public static const PRICE_TXT_COLOR_ENABLE:uint = 0;
      
      public static const PRICE_TXT_COLOR_ENABLE_BROWN:uint = 3480321;
      
      public static const PRICE_TXT_COLOR_ENABLE_WHITE:uint = 16777215;
      
      public static const TOOLTIP_COLOR_BROWN:uint = 6108420;
      
      public static const TOOLTIP_NORMAL_TXT_COLOR:uint = 16704430;
      
      public static const BUBBLE_TXT_COLOR_BROWN:uint = 5451520;
      
      public static const NORMAL_TXT_COLOR_LIGHTER:uint = 5977346;
      
      public static const NORMAL_TXT_COLOR_BROWN:uint = 4466958;
      
      public static const NORMAL_TXT_COLOR_DARKER:uint = 3611392;
      
      public static const PRICE_TXT_COLOR_DISABLE:uint = 13382451;
      
      public static const RESOURCE_TXT_COLOR_AMMOUNT_GOOD:uint = 16761439;
      
      public static const RESOURCE_TXT_COLOR_AMMOUNT_BAD:uint = 16731983;
      
      public static const CRAFTING_COLOR_WHITEBLUE:uint = 16777215;
      
      public static const GRAYSCALE:Vector.<Number> = Vector.<Number>([0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0,0,0,1,0]);
      
      public static const GRAYSCALE_LIGHT:Vector.<Number> = Vector.<Number>([0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0,0,0,1,0]);
      
      public static const SEPIA:Vector.<Number> = Vector.<Number>([0.3930000066757202,0.7689999938011169,0.1889999955892563,0,0,0.3490000069141388,0.6859999895095825,0.1679999977350235,0,0,0.2720000147819519,0.5339999794960022,0.1309999972581863,0,0,0,0,0,1,0,0,0,0,0,1]);
      
      public function Color()
      {
         super();
      }
      
      public static function applyColor(param1:DisplayObject, param2:Vector.<Number>) : void
      {
         param1.filters = [getColorMatrixFilter(param2)];
      }
      
      public static function getColorMatrixFilter(param1:Vector.<Number>) : ColorMatrixFilter
      {
         var _loc2_:Array = [];
         _loc2_ = _loc2_.concat([param1[0],param1[1],param1[2],param1[3],param1[4]]);
         _loc2_ = _loc2_.concat([param1[5],param1[6],param1[7],param1[8],param1[9]]);
         _loc2_ = _loc2_.concat([param1[10],param1[11],param1[12],param1[13],param1[14]]);
         _loc2_ = _loc2_.concat([param1[15],param1[16],param1[17],param1[18],param1[19]]);
         return new ColorMatrixFilter(_loc2_);
      }
      
      public static function removeColor(param1:DisplayObject) : void
      {
         param1.filters = [new ColorMatrixFilter()];
      }
   }
}

