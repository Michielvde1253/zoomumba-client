package com.bigpoint.zoomumba.constants
{
   public class UserResources
   {
      public static const MAX_RESOURCE_ID:int = 5;
      
      public static const UNDEFINED:int = -1;
      
      public static const VIRTUAL_MONEY:int = 0;
      
      public static const REAL_MONEY:int = 1;
      
      public static const EXPERIENCE:int = 2;
      
      public static const PET_POWNS:int = 3;
      
      public static const PEARLS:int = 4;
      
      public static const OCEAN_VIRTUAL_MONEY:int = 5;
      
      public static const VIRTUAL_MONEY_NAME:String = "buyVirtual";
      
      public static const REAL_MONEY_NAME:String = "buyReal";
      
      public function UserResources()
      {
         super();
      }
      
      public static function getName(param1:int) : String
      {
         switch(param1)
         {
            case VIRTUAL_MONEY:
               return "petPenny";
            case REAL_MONEY:
               return "zooDollar";
            case EXPERIENCE:
               return "xp";
            case PET_POWNS:
               return "petPaw";
            default:
               return "NOT DEFINED !";
         }
      }
   }
}

