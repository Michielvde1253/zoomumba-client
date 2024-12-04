package com.bigpoint.utils.timeManager
{
   public class TimeFormat
   {
      public function TimeFormat()
      {
         super();
      }
      
      public static function secondsToTimeString(param1:int, param2:String = "hh:mm:ss") : String
      {
         var _loc3_:String = param2.toLowerCase();
         var _loc4_:int = Math.floor(param1 / 3600);
         var _loc5_:int = Math.floor(param1 / 60) % 60;
         var _loc6_:int = param1 % 60;
         _loc3_ = _loc3_.replace("hh",_loc4_);
         _loc3_ = _loc3_.replace("mm",getFullStringNumber(_loc5_,int(_loc5_ < 10)));
         return _loc3_.replace("ss",getFullStringNumber(_loc6_,int(_loc6_ < 10)));
      }
      
      public static function secondsToDays(param1:int) : int
      {
         return Math.floor(param1 / (3600 * 24));
      }
      
      public static function secondsToHours(param1:int) : int
      {
         return Math.floor(param1 / 3600);
      }
      
      public static function secondsToBigTimeString(param1:int, param2:String = "dd:hh:mm:ss") : String
      {
         var _loc3_:String = param2.toLowerCase();
         var _loc4_:int = secondsToDays(param1);
         if(_loc4_ <= 0)
         {
            return TimeFormat.secondsToTimeString(param1);
         }
         var _loc5_:int = Math.floor(param1 / 3600) % 24;
         var _loc6_:int = Math.floor(param1 / 60) % 60;
         var _loc7_:int = param1 % 60;
         _loc3_ = _loc3_.replace("dd",getFullStringNumber(_loc4_,int(_loc4_ < 10)));
         _loc3_ = _loc3_.replace("hh",getFullStringNumber(_loc5_,int(_loc5_ < 10)));
         _loc3_ = _loc3_.replace("mm",getFullStringNumber(_loc6_,int(_loc6_ < 10)));
         return _loc3_.replace("ss",getFullStringNumber(_loc7_,int(_loc7_ < 10)));
      }
      
      public static function getFullStringNumber(param1:Number, param2:int = 1) : String
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:String = param1.toString();
         if(param2 > 0)
         {
            _loc4_ = "";
            _loc5_ = 0;
            while(_loc5_ < param2)
            {
               _loc4_ += "0";
               _loc5_++;
            }
            _loc3_ = _loc4_ + _loc3_;
         }
         return _loc3_;
      }
   }
}

