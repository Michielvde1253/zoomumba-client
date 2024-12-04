package com.bigpoint.zoorama.utils.configModules
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import flash.utils.Dictionary;
   
   public class TextResourceModule
   {
      private static var textLybrary:Dictionary = new Dictionary();
      
      public function TextResourceModule()
      {
         super();
      }
      
      public static function parseTextXML(param1:XML) : void
      {
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc2_:XMLList = param1.category;
         var _loc3_:int = int(_loc2_.length());
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            parseTextXML(_loc2_[_loc4_]);
            _loc4_++;
         }
         var _loc5_:XMLList = param1.item;
         var _loc6_:int = int(_loc5_.length());
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc7_]["name"];
            _loc9_ = _loc5_[_loc7_].text();
            textLybrary[_loc8_] = _loc9_;
            _loc7_++;
         }
      }
      
      public static function getText(param1:String) : String
      {
         if(textLybrary[param1])
         {
            return textLybrary[param1];
         }
         if(param1 == "zoo.news.text.161")
         {
            return "";
         }
         return param1;
      }
      
      public static function hasText(param1:String) : Boolean
      {
         return textLybrary[param1] != null;
      }
      
      public static function getTextReplaced(param1:String, param2:Vector.<TextReplace>) : String
      {
         var _loc3_:String = TextResourceModule.getText(param1);
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ = _loc3_.split(String(param2[_loc4_].searchText)).join(String(param2[_loc4_].replaceText));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function getNumberFormated(param1:int) : String
      {
         return StringHelper.numberFormater(param1,getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
      }
   }
}

