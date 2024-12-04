package fr.kapit.util
{
   public class KapInspectFunctions
   {
      public function KapInspectFunctions()
      {
         super();
      }
      
      public static function byteConvert(param1:int) : String
      {
         var _loc2_:Number = 0;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = 1;
         var _loc6_:int = 1024;
         var _loc7_:int = 1048576;
         var _loc8_:int = 1073741824;
         if(param1 < 0)
         {
            return "Negative numbers not supported";
         }
         if(param1 < _loc6_)
         {
            _loc3_ = "bytes";
            _loc4_ = _loc5_;
         }
         else if(param1 < _loc7_)
         {
            _loc3_ = "KB";
            _loc4_ = _loc6_;
         }
         else if(param1 < _loc8_)
         {
            _loc3_ = "MB";
            _loc4_ = _loc7_;
         }
         else
         {
            _loc3_ = "GB";
            _loc4_ = _loc8_;
         }
         _loc2_ = param1 / _loc4_;
         if(_loc2_ < 10)
         {
            _loc2_ = Math.round(_loc2_ * 100) / 100;
         }
         else if(_loc2_ < 100)
         {
            _loc2_ = Math.round(_loc2_ * 10) / 10;
         }
         else
         {
            _loc2_ = Math.round(_loc2_);
         }
         return _loc2_.toString() + " " + _loc3_;
      }
   }
}

