package fr.kapit.utils
{
   public final class StringUtils
   {
      public function StringUtils()
      {
         super();
      }
      
      public static function isEmpty(param1:String) : Boolean
      {
         return param1 == null || param1.length == 0 || param1 == "null" || param1 == "undefined";
      }
      
      public static function numToChar(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1 > 47 && param1 < 58)
         {
            _loc2_ = "0123456789";
            return _loc2_.charAt(param1 - 48);
         }
         if(param1 > 64 && param1 < 91)
         {
            _loc3_ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            return _loc3_.charAt(param1 - 65);
         }
         if(param1 > 96 && param1 < 123)
         {
            _loc4_ = "abcdefghijklmnopqrstuvwxyz";
            return _loc4_.charAt(param1 - 97);
         }
         return param1.toString();
      }
   }
}

