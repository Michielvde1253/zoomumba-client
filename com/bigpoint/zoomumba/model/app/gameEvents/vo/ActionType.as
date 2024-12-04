package com.bigpoint.zoomumba.model.app.gameEvents.vo
{
   public class ActionType
   {
      private static var COUNTER:int = 0;
      
      public static const CUDDLE:int = ++COUNTER;
      
      public static const CLEAN:int = ++COUNTER;
      
      public static const WATER:int = ++COUNTER;
      
      public static const FEED:int = ++COUNTER;
      
      public static const SUPER_FEED:int = ++COUNTER;
      
      public static const POWER_FEED:int = ++COUNTER;
      
      public static const HEAL:int = ++COUNTER;
      
      public static const SUPER_HEAL:int = ++COUNTER;
      
      public static const TRASH_CLEAN:int = ++COUNTER;
      
      public static const BREED:int = ++COUNTER;
      
      public static const OCEAN_SUPER_FEED:int = ++COUNTER;
      
      public static const OCEAN_POWER_FEED:int = ++COUNTER;
      
      public function ActionType()
      {
         super();
      }
   }
}

