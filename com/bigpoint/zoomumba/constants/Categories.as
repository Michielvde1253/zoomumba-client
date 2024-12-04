package com.bigpoint.zoomumba.constants
{
   public class Categories
   {
      public static const MAX_POSIBLE_ID:int = 28;
      
      public static const CATEGORY_UNDEFINED:int = -1;
      
      public static const CAGE:int = 1;
      
      public static const STORE:int = 2;
      
      public static const DECOR:int = 3;
      
      public static const TRASHBIN:int = 4;
      
      public static const SPECIALS:int = 5;
      
      public static const MATERIAL:int = 6;
      
      public static const SPECIAL:int = 7;
      
      public static const VISITOR:int = 9;
      
      public static const SPECIES:int = 10;
      
      public static const ANIMAL:int = 11;
      
      public static const TRASHROAD:int = 12;
      
      public static const RESOURCES:int = 13;
      
      public static const ROAD:int = 14;
      
      public static const ASSISTANCE:int = 15;
      
      public static const PREMIUM:int = 16;
      
      public static const COLLECTIBLE:int = 18;
      
      public static const USER:int = 19;
      
      public static const SAFARI_JOKER:int = 20;
      
      public static const CURRENCY:int = 21;
      
      public static const EVENTS:int = 22;
      
      public static const STORAGE:int = 23;
      
      public static const EXPANSION:int = 24;
      
      public static const BREEDING_LAB:int = 25;
      
      public static const NURSERY:int = 26;
      
      public static const SLEIGH:int = 27;
      
      public static const AVATAR:int = 28;
      
      public static const PAY_PREMIUM:int = 50;
      
      public static const POWERUP:int = 30;
      
      public static const EVENTITEM:int = 127;
      
      public static const PACK:int = 31;
      
      public static const MANAGEMENT_CENTER:int = 32;
      
      public static const SUPRISE_BOX:int = 33;
      
      public static const BLUEPRINT:int = 34;
      
      private static const categoryNaming:Vector.<String> = Vector.<String>(["","cage","store","decor","trashbin","","material","","","visitor","species","animal","trashroad","resource","road","assist","premium","","","user","safariJoker","currency","","","","","","","","","powerUps","pack","","surprisebox"]);
      
      public function Categories()
      {
         super();
      }
      
      public static function isValidCategoryId(param1:int) : Boolean
      {
         var _loc3_:String = null;
         var _loc2_:Boolean = false;
         for(_loc3_ in categoryNaming)
         {
            if(param1 == int(_loc3_))
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      public static function getCategoryIdFromName(param1:String) : int
      {
         var _loc2_:int = CATEGORY_UNDEFINED;
         var _loc3_:int = 0;
         while(_loc3_ < categoryNaming.length)
         {
            if(categoryNaming[_loc3_] == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

