package com.bigpoint.utils
{
   public class URLUtils
   {
      public function URLUtils()
      {
         super();
      }
      
      public static function getFileExtension(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = int(param1.lastIndexOf("."));
         if(_loc3_ > -1)
         {
            _loc2_ = param1.substring(_loc3_ + 1);
         }
         return _loc2_;
      }
      
      public static function getFileNameWithExtension(param1:String) : String
      {
         var _loc2_:int = int(param1.lastIndexOf("\\"));
         var _loc3_:int = int(param1.lastIndexOf("/"));
         var _loc4_:int = _loc3_ > _loc2_ ? _loc3_ : _loc2_;
         return param1.substring(_loc4_ + 1);
      }
      
      public static function getFileNameWithoutExtension(param1:String) : String
      {
         var _loc2_:String = getFileNameWithExtension(param1);
         var _loc3_:int = int(_loc2_.lastIndexOf("."));
         if(_loc3_ < 0)
         {
            _loc3_ = _loc2_.length;
         }
         return _loc2_.substring(0,_loc3_);
      }
   }
}

