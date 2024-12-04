package com.bigpoint.zoomumba.constants
{
   public class Resources
   {
      public static const MAX_RESOURCE_ID:int = 23;
      
      public static const UNDEFINED:int = 0;
      
      public static const WATER:int = 1;
      
      public static const GRASS:int = 2;
      
      public static const MEAT:int = 3;
      
      public static const FISH:int = 4;
      
      public static const FRUIT:int = 5;
      
      public static const GRAINS:int = 6;
      
      public static const MEDICINE:int = 7;
      
      public static const SUPERFOOD:int = 8;
      
      public static const SUPERMEDICINE:int = 9;
      
      public static const POWERFOOD:int = 10;
      
      public static const ELIXIR:int = 11;
      
      public static const POTION:int = 12;
      
      public static const TRASH:int = 13;
      
      public static const RECYCLING_BOOSTER:int = 14;
      
      public static const CRAFTING_BOOSTER:int = 15;
      
      public static const ALGE:int = 16;
      
      public static const PLANKTON:int = 17;
      
      public static const SHRIMP:int = 18;
      
      public static const CLAMS:int = 19;
      
      public static const FILTER:int = 20;
      
      public static const SUPER_FISH_FOOD:int = 21;
      
      public static const POWER_FISH_FOOD:int = 22;
      
      public static const ALL_FOODS:int = 11;
      
      public function Resources()
      {
         super();
      }
      
      public static function getName(param1:int) : String
      {
         switch(param1)
         {
            case WATER:
               return "WATER";
            case GRASS:
               return "GRASS";
            case MEAT:
               return "MEAT";
            case FISH:
               return "FISH";
            case FRUIT:
               return "FRUIT";
            case GRAINS:
               return "GRAINS";
            case MEDICINE:
               return "MEDICINE";
            case SUPERFOOD:
               return "SUPERFOOD";
            case SUPERMEDICINE:
               return "SUPERMEDICINE";
            case ELIXIR:
               return "ELIXIR";
            case CLAMS:
               return "CLAMS";
            case SHRIMP:
               return "SHRIMP";
            case PLANKTON:
               return "PLANKTON";
            case ALGE:
               return "ALGE";
            case FILTER:
               return "FILTER";
            case POWER_FISH_FOOD:
               return "POWER_FISHFOOD";
            case SUPER_FISH_FOOD:
               return "SUPER_FISH_FOOD";
            default:
               return "NOT DEFINED !";
         }
      }
   }
}

