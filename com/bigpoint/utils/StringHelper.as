package com.bigpoint.utils
{
   import mx.formatters.NumberFormatter;
   
   public final class StringHelper
   {
      public function StringHelper()
      {
         super();
      }
      
      public static function numberFormater(param1:Number, param2:String, param3:uint = 4, param4:Array = null) : String
      {
         var _loc10_:String = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         new NumberFormatter();
         var _loc5_:* = param1 < 0;
         if(_loc5_)
         {
            param1 *= -1;
         }
         var _loc6_:String = "";
         if(param1 < 1)
         {
            _loc6_ = param1.toString();
         }
         else
         {
            _loc6_ = param1.toFixed().toString();
         }
         var _loc7_:String = _loc6_;
         var _loc8_:String = "";
         var _loc9_:Number = _loc6_.length;
         if(_loc9_ >= param3)
         {
            param2 = escape(param2.charAt(0)) == "%5C" ? String.fromCharCode(escape(param2.replace(/ /,"")).replace(/%5Cu/,"0x")) : param2;
            _loc10_ = param2;
            _loc11_ = -1;
            _loc12_ = _loc9_;
            while(_loc12_ > 0 && _loc9_ >= param3)
            {
               if(param4)
               {
                  if(param4.length > _loc11_)
                  {
                     _loc10_ = param4[_loc11_++] || param2;
                  }
                  else
                  {
                     _loc10_ = param2;
                  }
               }
               _loc8_ = _loc6_.substring(_loc12_,_loc12_ - 3) + (_loc12_ < _loc9_ ? _loc10_ : "") + _loc8_;
               _loc12_ -= 3;
            }
            _loc7_ = _loc8_;
         }
         if(_loc5_)
         {
            _loc7_ = "-" + _loc7_;
         }
         return _loc7_;
      }
      
      public static function numberFormaterOld(param1:Number, param2:String, param3:uint = 4, param4:Array = null) : String
      {
         var _loc5_:String = param1 < 1 ? param1.toString() : param1.toFixed().toString();
         var _loc6_:int = _loc5_.length;
         var _loc7_:String = "";
         param2 = escape(param2.charAt(0)) == "%5C" ? String.fromCharCode(escape(param2.replace(/ /,"")).replace(/%5Cu/,"0x")) : param2;
         var _loc8_:String = param2;
         var _loc9_:int = _loc6_;
         var _loc10_:int = -1;
         while(_loc9_ > 0 && _loc6_ >= param3)
         {
            if(param4)
            {
               if(param4.length > _loc10_)
               {
                  _loc8_ = param4[_loc10_++] || param2;
               }
               else
               {
                  _loc8_ = param2;
               }
            }
            _loc7_ = _loc5_.substring(_loc9_,_loc9_ - 3) + (_loc9_ < _loc6_ ? _loc8_ : "") + _loc7_;
            _loc9_ -= 3;
         }
         return _loc7_ || _loc5_;
      }
      
      public static function convertTimestampToFormatedHoursMinutesSecondsString(param1:Number) : String
      {
         var _loc2_:String = "";
         var _loc3_:Date = new Date(null,null,null,1,0,param1);
         var _loc4_:int = int(_loc3_.getUTCHours());
         var _loc5_:String = "";
         if(_loc4_ <= 9)
         {
            _loc5_ += "0" + _loc4_.toString();
         }
         else
         {
            _loc5_ += _loc4_.toString();
         }
         var _loc6_:int = int(_loc3_.getUTCMinutes());
         var _loc7_:String = "";
         if(_loc6_ <= 9)
         {
            _loc7_ += "0" + _loc6_.toString();
         }
         else
         {
            _loc7_ += _loc6_.toString();
         }
         var _loc8_:int = int(_loc3_.getUTCSeconds());
         var _loc9_:String = "";
         if(_loc8_ <= 9)
         {
            _loc9_ += "0" + _loc8_.toString();
         }
         else
         {
            _loc9_ += _loc8_.toString();
         }
         _loc2_ += _loc5_;
         _loc2_ += ":" + _loc7_;
         return _loc2_ + (":" + _loc9_);
      }
      
      public static function romanize(param1:int) : String
      {
         var _loc6_:int = 0;
         var _loc2_:Array = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
         var _loc3_:Array = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
         var _loc4_:Object = {
            "M":1000,
            "CM":900,
            "D":500,
            "CD":400,
            "C":100,
            "XC":90,
            "L":50,
            "XL":40,
            "X":10,
            "IX":9,
            "V":5,
            "IV":4,
            "I":1
         };
         var _loc5_:String = "";
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            while(param1 >= _loc3_[_loc6_])
            {
               _loc5_ += _loc2_[_loc6_];
               param1 -= _loc3_[_loc6_];
            }
            _loc6_++;
         }
         return _loc5_;
      }
   }
}

