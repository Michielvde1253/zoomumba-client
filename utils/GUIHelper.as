package utils
{
   public class GUIHelper
   {
      public static var numberFormatterFunction:Function = null;
      
      public function GUIHelper()
      {
         super();
      }
      
      public static function getStringFormattedValue(param1:int) : String
      {
         var _loc2_:String = "";
         if(numberFormatterFunction != null)
         {
            _loc2_ = numberFormatterFunction(param1);
         }
         else
         {
            _loc2_ = param1.toString();
         }
         return _loc2_;
      }
   }
}

