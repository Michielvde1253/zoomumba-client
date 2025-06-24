package utils
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.filters.ColorMatrixFilter;
   
   public class GrayDisabler
   {
      public function GrayDisabler()
      {
         super();
      }
      
      public static function enableButton(param1:MovieClip, param2:Boolean, param3:Boolean = true, param4:Array = null) : void
      {
         if(param1)
         {
            if(param2)
            {
               unGrayscale(param1);
            }
            else
            {
               grayscale(param1,param4);
            }
            if(param3)
            {
               param1.buttonMode = !param3 || param2;
               param1.mouseEnabled = !param3 || param2;
            }
         }
      }
      
      public static function enableIcon(param1:DisplayObject, param2:Boolean, param3:Array = null) : void
      {
         if(param2)
         {
            unGrayscale(param1);
         }
         else
         {
            grayscale(param1,param3);
         }
      }
      
      private static function unGrayscale(param1:DisplayObject) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = param1.filters;
            if(!_loc2_)
            {
               _loc2_ = new Array();
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc2_[_loc3_] is ColorMatrixFilter)
               {
                  _loc2_.splice(_loc3_,1);
               }
               _loc3_++;
            }
            param1.filters = _loc2_;
         }
      }
      
      private static function getColorMatrix() : Array
      {
         var _loc1_:Number = 1 / 3;
         var _loc2_:Number = 1 - _loc1_ * 2;
         return [_loc2_,_loc1_,_loc1_,0,0,_loc1_,_loc2_,_loc1_,0,0,_loc1_,_loc1_,_loc2_,0,0,0,0,0,1,0];
      }
      
      private static function grayscale(param1:DisplayObject, param2:Array = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:ColorMatrixFilter = null;
         if(param1)
         {
            _loc3_ = false;
            _loc4_ = param1.filters;
            if(!_loc4_)
            {
               _loc4_ = new Array();
            }
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc4_[_loc5_] is ColorMatrixFilter)
               {
                  _loc3_ = true;
               }
               _loc5_++;
            }
            if(_loc3_ == false)
            {
               if(param2 == null)
               {
                  param2 = getColorMatrix();
               }
               _loc6_ = new ColorMatrixFilter(param2);
               _loc4_.push(_loc6_);
               param1.filters = _loc4_;
            }
         }
      }
   }
}

