package com.bigpoint.zoomumba.model.user.assistances.vo
{
   public class AssistantsVO
   {
      public static var ASSIST_COUNT:int = 12;
      
      public static const FEED_ASSIST:int = 1;
      
      public static const WATER_ASSIST:int = 2;
      
      public static const CLEAN_ASSIST:int = 3;
      
      public static const CUDDLE_ASSIST:int = 4;
      
      public static const TRASH_ASSIST:int = 5;
      
      public static const CASH_ASSIST:int = 6;
      
      public static const HEAL_ASSIST:int = 7;
      
      public static const OCEAN_FEED_ASSIST:int = 8;
      
      public static const OCEAN_WATER_ASSIST:int = 9;
      
      public static const OCEAN_CLEAN_ASSIST:int = 10;
      
      public static const OCEAN_CUDDLE_ASSIST:int = 11;
      
      public static const ZOO_DIRECTOR_ASSIST:int = 0;
      
      public static const ACTIVE_ASSISTANCES:Vector.<int> = Vector.<int>([FEED_ASSIST,WATER_ASSIST,CLEAN_ASSIST,CUDDLE_ASSIST,TRASH_ASSIST,CASH_ASSIST,HEAL_ASSIST,OCEAN_FEED_ASSIST,OCEAN_WATER_ASSIST,OCEAN_CLEAN_ASSIST,OCEAN_CUDDLE_ASSIST]);
      
      public function AssistantsVO()
      {
         super();
      }
   }
}

