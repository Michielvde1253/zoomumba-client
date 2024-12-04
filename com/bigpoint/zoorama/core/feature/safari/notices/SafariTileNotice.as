package com.bigpoint.zoorama.core.feature.safari.notices
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class SafariTileNotice extends Notice
   {
      public static const EXPLORE_TILE:String = "safariExploreTile";
      
      public static const USE_JOKER_ONTILE:String = "useJokerOnTile";
      
      public var x:int;
      
      public var y:int;
      
      public var jokerId:int;
      
      public function SafariTileNotice(param1:String, param2:int, param3:int, param4:int = -1)
      {
         super(param1);
         this.x = param2;
         this.y = param3;
         this.jokerId = param4;
      }
   }
}

